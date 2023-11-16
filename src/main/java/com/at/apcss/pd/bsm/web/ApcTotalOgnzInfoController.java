package com.at.apcss.pd.bsm.web;

import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.pd.bsm.service.ApcTotalOgnzInfoService;
import com.at.apcss.pd.bsm.service.RestFulService;
import com.at.apcss.pd.bsm.vo.ApcTotalOgnzInfoVO;
import com.fasterxml.jackson.databind.ObjectMapper;



//import  org.w3c.dom.Document;
//import org.w3c.dom.Element;
//import org.w3c.dom.Node;
//import org.w3c.dom.NodeList;
//import org.xml.sax.SAXException;

//import org.w3c.dom.Document;


@Controller
public class ApcTotalOgnzInfoController extends BaseController{

	@Resource(name= "apcTotalOgnzInfoService")
	private ApcTotalOgnzInfoService apcTotalOgnzInfoService;

//화면이동
	@RequestMapping(value = "/pd/bsm/apcTotalOgnzInfo.do")
	public String apcTotalOgnzInfo() {
		return "apcss/pd/bsm/apcTotalOgnzInfo";
	}

// 조회
		@PostMapping(value = "/pd/bsm/selectApcTotalOgnzInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> selectapcTotalOgnzInfoList(Model model, @RequestBody ApcTotalOgnzInfoVO apcTotalOgnzInfoVO, HttpServletRequest request) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();
			List<ApcTotalOgnzInfoVO> resultList = new ArrayList<>();
			try {
				 resultList = apcTotalOgnzInfoService.selectApcTotalOgnzInfoList(apcTotalOgnzInfoVO);
			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}
			resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
			return getSuccessResponseEntity(resultMap);
		}



		//등록
		@PostMapping(value = "/pd/bsm/insertApcTotalOgnzInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> insertApcTotalOgnzInfo(@RequestBody ApcTotalOgnzInfoVO apcTotalOgnzInfoVO, HttpServletRequest requset) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			// validation check

			// audit 항목
			apcTotalOgnzInfoVO.setSysFrstInptUserId(getUserId());
			apcTotalOgnzInfoVO.setSysFrstInptPrgrmId(getPrgrmId());
			apcTotalOgnzInfoVO.setSysLastChgUserId(getUserId());
			apcTotalOgnzInfoVO.setSysLastChgPrgrmId(getPrgrmId());

			int insertedCnt = 0;

			try {
				insertedCnt = apcTotalOgnzInfoService.insertApcTotalOgnzInfo(apcTotalOgnzInfoVO);

				String pFrmerSn = "AYTD23";
				String urlstr = "https://uni.agrix.go.kr/api/srvc/apcTotalOgnzInfo?accessToken=eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE3MTk2NDcyOTI3NzMsImFwaU5tIjoiZmFybWVySW5mbyIsImlzcyI6IlNZU1RFTSJ9.f9oToC5zUynRzK5zCgu-zgvZNJ0bN-MSzA_FQxtaEPY&version=1.0&responseType=xml";
				String pParam = urlstr+"&frmerSn="+pFrmerSn;

				URL url = new URL(pParam);
				HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();


				// xml 파싱 빌드업
				DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
				DocumentBuilder builder = factory.newDocumentBuilder();

				// xml 파일을 document로 파싱하기
				//Document document = builder.parse("xml/sample.xml");




			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

			return getSuccessResponseEntity(resultMap);
		}


		@PostMapping(value = "/pd/bsm/multiSaveApcTotalOgnzInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> multiSaveApcTotalOgnzInfoList(@RequestBody List<ApcTotalOgnzInfoVO> apcTotalOgnzInfoVOList, HttpServletRequest request) throws Exception {

			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			int savedCnt = 0;
			try {
				for (ApcTotalOgnzInfoVO apcTotalOgnzInfoVO : apcTotalOgnzInfoVOList) {
					apcTotalOgnzInfoVO.setSysFrstInptPrgrmId(getPrgrmId());
					apcTotalOgnzInfoVO.setSysFrstInptUserId(getUserId());
					apcTotalOgnzInfoVO.setSysLastChgPrgrmId(getPrgrmId());
					apcTotalOgnzInfoVO.setSysLastChgUserId(getUserId());
				}

				savedCnt = apcTotalOgnzInfoService.multiSaveApcTotalOgnzInfoList(apcTotalOgnzInfoVOList);
			}catch (Exception e) {
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
			return getSuccessResponseEntity(resultMap);
		}

		//업데이트
		@PostMapping(value = "/pd/bsm/updateApcTotalOgnzInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> updateApcTotalOgnzInfo(@RequestBody ApcTotalOgnzInfoVO apcTotalOgnzInfoVO, HttpServletRequest requset) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();
			logger.info("=============updateApcTotalOgnzInfo=========start====");
			// validation check

			// audit 항목
			apcTotalOgnzInfoVO.setSysLastChgUserId(getUserId());
			apcTotalOgnzInfoVO.setSysLastChgPrgrmId(getPrgrmId());
			logger.info("");
			logger.info(apcTotalOgnzInfoVO.toString());

			int updatedCnt = 0;

			try {
				updatedCnt = apcTotalOgnzInfoService.updateApcTotalOgnzInfo(apcTotalOgnzInfoVO);
			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_UPDATED_CNT, updatedCnt);
			logger.info("=============updateApcTotalOgnzInfo======end=======");
			return getSuccessResponseEntity(resultMap);
		}

		@PostMapping(value = "/pd/bsm/deleteApcTotalOgnzInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> deleteApcTotalOgnzInfo(@RequestBody ApcTotalOgnzInfoVO apcTotalOgnzInfoVO, HttpServletRequest request) throws Exception {
			logger.debug("/pd/bsm/deleteApcTotalOgnzInfo >>> 호출 >>> ");

			int result = 0;
			try {
				result =+ apcTotalOgnzInfoService.deleteApcTotalOgnzInfo(apcTotalOgnzInfoVO);
			}catch (Exception e) {
				return getErrorResponseEntity(e);
			}

			HashMap<String,Object> resultMap = new HashMap<String,Object>();
			resultMap.put("result", result);
			return getSuccessResponseEntity(resultMap);
		}

		@PostMapping(value = "/pd/bsm/multiSaveReleyApcTotalOgnzInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> SaveFarmerSnList(@RequestBody ApcTotalOgnzInfoVO apcTotalOgnzInfoVO, HttpServletRequest request) throws Exception {
			logger.debug("/pd/bsm/SavefarmerSnList >>> 농업인 번호 연계호출 >>> ");

			int savedCnt = 0;
			int result = 0;
			try {
				//result =+ apcTotalOgnzInfoService.deleteapcTotalOgnzInfo(apcTotalOgnzInfoVO);

                String accessToken = "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE3MTk2NDcyOTI3NzMsImFwaU5tIjoiZmFybWVySW5mbyIsImlzcyI6IlNZU1RFTSJ9.f9oToC5zUynRzK5zCgu-zgvZNJ0bN-MSzA_FQxtaEPY";
                String version = "1.0";
                String responseType = "xml";
                String pFrmerSn =  apcTotalOgnzInfoVO.getFrmerSn(); //AGUN47

				String urlstr = "https://uni.agrix.go.kr/api/srvc/apcTotalOgnzInfo?accessToken="+accessToken+"&version="+version+"&responseType="+responseType+"&frmerSn="+pFrmerSn;
                System.out.println("urlstr============"+urlstr);
				URL url = new URL(urlstr);

				HttpURLConnection urlconnection  = (HttpURLConnection)url.openConnection();

				// xml 파싱 빌드업
				DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
				DocumentBuilder builder = factory.newDocumentBuilder();


				// xml 파일을 document로 파싱하기
				//Document document = builder.parse("xml/sample.xml");
				//Document document = builder.parse(urlconnection.getInputStream());
				Document doc = builder.parse(urlconnection.getInputStream());



				NodeList nList = doc.getElementsByTagName("item");

				for (int k = 0; k < nList.getLength(); k++) {
	                Node node = nList.item(k);

	                if (node.getNodeType() == Node.ELEMENT_NODE) {
	                    Element element = (Element) node;
	                    String ognzCd = getValue("ognzCd", element);
	                    String ognzNm = getValue("ognzNm", element);
	                    String ognzSeCd = getValue("ognzSeCd", element);
	                    String ognzSeNm = getValue("ognzSeNm", element);
	                    String brno = getValue("brno", element);
	                    String typeCd = getValue("typeCd", element);
	                    String typeNm = getValue("typeNm", element);
	                    String apcHldCnt = getValue("apcHldCnt", element);
	                    String delYn = getValue("delYn", element);
	                    apcTotalOgnzInfoVO.setOgnzCd(ognzCd);
	                    apcTotalOgnzInfoVO.setOgnzCd(ognzCd);
	                    apcTotalOgnzInfoVO.setOgnzSeCd(ognzSeCd);
	                    apcTotalOgnzInfoVO.setOgnzSeNm(ognzSeNm);
	                    apcTotalOgnzInfoVO.setBrno(brno);
	                    apcTotalOgnzInfoVO.setTypeCd(typeCd);
	                    apcTotalOgnzInfoVO.setTypeNm(typeNm);
	                    apcTotalOgnzInfoVO.setApcHldCnt(apcHldCnt);
	                    apcTotalOgnzInfoVO.setDelYn(delYn);
	                    savedCnt = apcTotalOgnzInfoService.insertMegerApcTotalOgnzInfo(apcTotalOgnzInfoVO);
	                    result = apcTotalOgnzInfoService.insertMegerLogApcTotalOgnzInfo(apcTotalOgnzInfoVO);
	                }
	            }
	        } catch (Exception ex) {
	            ex.printStackTrace();
	        }


			HashMap<String,Object> resultMap = new HashMap<String,Object>();
			resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
			resultMap.put("result", result);
			return getSuccessResponseEntity(resultMap);

}


		public  String getValue(String tag, Element element) {

			Node nValue=null;

	        NodeList x= element.getElementsByTagName(tag);
	        Node test=x.item(0);
	        NodeList t=null;
	        if(test!=null) {
	        	t= test.getChildNodes();
	        	if((Node)t.item(0)!=null) {nValue=(Node)t.item(0);}
	        }
	        if(nValue==null) return null;
	        return nValue.getNodeValue();

			/*
			 * NodeList nodes = element.getElementsByTagName(tag).item(0).getChildNodes();
			 * Node node = (Node) nodes.item(0); return node.getNodeValue();
			 */
		}





		@PostMapping(value = "/pd/bsm/multiSaveReleyApcTotalOgnzInfoJsoneList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> multiSaveReleyapcTotalOgnzInfoJsoneList(@RequestBody ApcTotalOgnzInfoVO apcTotalOgnzInfoVO, HttpServletRequest request) throws Exception {

			logger.debug("/pd/bsm/SaveFarmerSnList >>> 농업인 번호 연계호출 jsone >>> ");

			int savedCnt = 0;
			int result = 0;

			String url = "https://uni.agrix.go.kr/api/srvc/apcTotalOgnzInfo?accessToken=eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE3MTk2NDcyOTI3NzMsImFwaU5tIjoiZmFybWVySW5mbyIsImlzcyI6IlNZU1RFTSJ9.f9oToC5zUynRzK5zCgu-zgvZNJ0bN-MSzA_FQxtaEPY&version=1.0&responseType=json&frmerSn=AGUN47";

			System.out.println("==========================11");

			System.out.println("==========================1");

			try {
				//result =+ apcTotalOgnzInfoService.deleteapcTotalOgnzInfo(apcTotalOgnzInfoVO);

                String accessToken = "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE3MTk2NDcyOTI3NzMsImFwaU5tIjoiZmFybWVySW5mbyIsImlzcyI6IlNZU1RFTSJ9.f9oToC5zUynRzK5zCgu-zgvZNJ0bN-MSzA_FQxtaEPY";
                String version = "1.0";
                //String responseType = "xml";
                String responseType = "json";
                String pFrmerSn =  apcTotalOgnzInfoVO.getFrmerSn(); //AGUN47

				String urlstr = "https://uni.agrix.go.kr/api/srvc/apcTotalOgnzInfo?accessToken="+accessToken+"&version="+version+"&responseType="+responseType+"&frmerSn="+pFrmerSn;
                System.out.println("urlstr============"+urlstr);

			//HashMap<String, Object> hMap = new HashMap<>();
		//	hMap.put("frmerSn", "AGUN47");

			ObjectMapper objectMapper = new ObjectMapper();
			String jsonStr = "";
			//	jsonStr = objectMapper.writeValueAsString(hMap);
			RestFulService restFulService = new RestFulService();
				System.out.println("=====================");
				//Map rtnData = (Map) restFulService.clear().get().contentType(new MediaType(MediaType.APPLICATION_JSON)).baseUrl(url).body(jsonStr).execute().bodyToData(Map.class);

				Map rtnData = (Map) restFulService.clear().get().contentType(new MediaType(MediaType.APPLICATION_JSON)).baseUrl(urlstr).body(jsonStr).execute().bodyToData(Map.class);

				System.out.println(rtnData);
				Map<String, Object> mapItems = (Map<String, Object>) rtnData.get("items");

				for (String key : mapItems.keySet()) {
					System.out.println("key = " + key);
					System.out.println(mapItems.get(key));

					if ("item".equals(key)) {
						List<Map> list = (List<Map>) mapItems.get(key);

						for (Map<String, String> mapItem : list) {

							for (String key2 : mapItem.keySet()) {
								System.out.println("item key2 = " + key2);
								System.out.println(mapItem.get(key2));
//								  savedCnt = apcTotalOgnzInfoService.insertMegerapcTotalOgnzInfoMap(mapItem);
//				                  result = apcTotalOgnzInfoService.insertMegerLogapcTotalOgnzInfoMap(mapItem);
								//server.aaa(m)
								//mapper.insert
							//intser into aaa(a, b,c) values(#{brthdy}, #{brthdy2}, #{brthdy})
							}

							savedCnt = apcTotalOgnzInfoService.insertMegerApcTotalOgnzInfoMap(mapItem);
			                 result = apcTotalOgnzInfoService.insertMegerLogApcTotalOgnzInfoMap(mapItem);

						}
					}
				}

			 } catch (Exception ex) {
		            ex.printStackTrace();
		        }

				HashMap<String,Object> resultMap = new HashMap<String,Object>();
				resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
				resultMap.put("result", result);
				return getSuccessResponseEntity(resultMap);


         }




}
