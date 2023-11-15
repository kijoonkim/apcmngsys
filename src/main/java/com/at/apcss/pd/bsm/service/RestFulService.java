package com.at.apcss.pd.bsm.service;

import java.net.URI;
import java.net.URISyntaxException;
import java.nio.charset.Charset;
import java.util.Arrays;
import java.util.Hashtable;
import java.util.function.Consumer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.lang.Nullable;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;
//import org.springframework.web.reactive.function.client.WebClientResponseException.InternalServerError;

import com.at.apcss.fm.farm.service.TypeUtil;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.MapperFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

/**
 * HTTP 요청시 사용, RestTemplate는 spring5.0이전, 이후나온 WebClient를 현재는 사용하기를 권고.
 * 비동기 안됨. 접속자수 많아지면 WebClient사용 권고(동접 1000명정도이상일시 차이가 남, https://alwayspr.tistory.com/44)
 *
 * @author ysyoon
 *
 */
//@Slf4j
public class RestFulService {

	@ExceptionHandler(Exception.class)
	public RestFulService exceptionHandler(HttpServletRequest request, HttpServletResponse response, Exception e) {

		response.setStatus(HttpStatus.BAD_REQUEST.value());
		this.responseData = this.jsonError;
		return this;
	}


	private final String jsonNoResult = "{ \"result\":false, \"message\":\"No Data..\"}";
	private final String jsonError = "{\"result\":false, \"message\":\"error\"}";

	private HttpMethod httpMethod;

	@Nullable
	private String url;

	@Nullable
	private HttpHeaders headers;

	@Nullable
	private Object body;

	@Nullable
	private RestTemplate restTemplate;



	@Nullable
	private String responseData;

	private HttpHeaders getHeaders() {
		if (this.headers == null) {
			this.headers = new HttpHeaders();
		}
		return this.headers;
	}

	public RestFulService() {

		if(this.restTemplate == null) {
			this.restTemplate = new RestTemplate();
		}

		//this.restTemplate.getMessageConverters().add(0, new StringHttpMessageConverter(StandardCharsets.UTF_8));
	}

	public RestFulService clear() {
		this.httpMethod = HttpMethod.POST;
		this.url = "";
		if (this.headers == null) {
			this.headers = new HttpHeaders();
		} else {
			this.headers.clear();
		}
		this.body = null;
		this.restTemplate = new RestTemplate();
		this.responseData = "";
		//this.restTemplate.getMessageConverters().add(0, new StringHttpMessageConverter(StandardCharsets.UTF_8));

		return this;
	}

	public RestFulService clearHeader() {
		this.headers = new HttpHeaders();
		return this;
	}


	public RestFulService baseUrl(String str) {
		this.url = str;
		return this;
	}

	public RestFulService get() {
		this.httpMethod = HttpMethod.GET;
		return this;
	}

	public RestFulService post() {
		this.httpMethod = HttpMethod.POST;
		return this;
	}

	public RestFulService header(String headerName, String... headerValues) {
		for (String headerValue : headerValues) {
			getHeaders().add(headerName, headerValue);
		}
		return this;
	}

	public RestFulService headers(Consumer<HttpHeaders> headersConsumer) {
		headersConsumer.accept(getHeaders());
		return this;
	}

	public RestFulService accept(MediaType... acceptableMediaTypes) {
		getHeaders().setAccept(Arrays.asList(acceptableMediaTypes));
		return this;
	}

	public RestFulService acceptCharset(Charset... acceptableCharsets) {
		getHeaders().setAcceptCharset(Arrays.asList(acceptableCharsets));
		return this;
	}

	public RestFulService contentType(MediaType contentType) {
		getHeaders().setContentType(contentType);
		return this;
	}

	public RestFulService contentLength(long contentLength) {
		getHeaders().setContentLength(contentLength);
		return this;
	}

	public RestFulService body(@Nullable Object body) {
		this.body = body;
		return this;
	}

	public RestFulService execute() throws Exception {
		try {
			Gson gs = new Gson();
			if (getHeaders().getContentType()==null) {
				getHeaders().setContentType(MediaType.APPLICATION_JSON);
//				getHeaders().setContentType(TypeUtil.mediaTypeDef);
			}

			URI uri = new URI(this.url);
			String reqData = this.body.toString();

			HttpEntity<String> entity = new HttpEntity<String>(reqData, getHeaders());

			ResponseEntity<byte[]> resEntity = this.restTemplate.exchange(uri, this.httpMethod, entity, byte[].class);
			String resBody = new String(resEntity.getBody(), TypeUtil.UTF_8);


			this.responseData = resBody;

		} catch (URISyntaxException e) {
			this.responseData = this.jsonNoResult;
			e.printStackTrace();
		} catch (HttpClientErrorException e) {
			   this.responseData = e.getResponseBodyAsString();
//		} catch ( InternalServerError e) {
//				this.responseData = e.getResponseBodyAsString();
		}

		return this;
	}

	public Object bodyToData(Class<?> elementClass) throws JsonMappingException, JsonProcessingException {
		Object oResult = null;
		Gson gs = new Gson();

		try {
			Assert.notNull(elementClass, "Class must not be null");


			if (elementClass.getName().equals(String.class.getName())) {
				oResult = this.responseData;	// String
			}
			else {
				if (JsonUtil.isJSONArray(this.responseData)) {
					oResult = (Object) gs.fromJson(this.responseData, elementClass);
				}
				else {
					//ObjectMapper oMapper = new ObjectMapper();
					/* 2023-08-17 로지스팟 JSON 파싱을 위한 변경 LS 이영록*/
					@SuppressWarnings("deprecation")
					ObjectMapper oMapper = new ObjectMapper().configure(MapperFeature.ACCEPT_CASE_INSENSITIVE_PROPERTIES, true);
					//oMapper.configure(DeserializationFeature.ACCEPT_SINGLE_VALUE_AS_ARRAY, true);
					if(this.responseData.length() > 0) {
						try {
							oResult = (Object) oMapper.readValue(this.responseData, elementClass);
						}catch(JsonMappingException e) {
							oResult = gs.fromJson(this.jsonNoResult, Hashtable.class);
							e.printStackTrace();
						}catch(JsonProcessingException e) {
							oResult = gs.fromJson(this.jsonNoResult, Hashtable.class);
							e.printStackTrace();
						}

					}else {
						oResult = null;
					}
				}
			}

			if(oResult!=null) {
			}else {
			}

		} catch (Exception e) {

			oResult = gs.fromJson(this.jsonNoResult, Hashtable.class);

			e.printStackTrace();
		}

		return oResult;
	}

}