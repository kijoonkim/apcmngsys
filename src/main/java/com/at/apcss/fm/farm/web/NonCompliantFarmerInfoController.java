package com.at.apcss.fm.farm.web;

import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.fm.farm.service.NonCompliantFarmerInfoService;
import com.at.apcss.fm.farm.vo.NonCompliantFarmerInfoVO;



@Controller
public class NonCompliantFarmerInfoController extends BaseController{

	@Resource(name= "NonCompliantFarmerInfoService")
	private NonCompliantFarmerInfoService nonCompliantFarmerInfoRegService;

	//화면이동
	@RequestMapping(value = "/fm/farm/NonCompliantFarmerInfo.do")
	public String NonCompliantFarmerInfo() {
		return "apcss/fm/farm/NonCompliantFarmerInfo";
	}

	// 조회
	@PostMapping(value = "/fm/farm/selectNonCompliantFarmerInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectNonCompliantFarmerInfoList(Model model, @RequestBody NonCompliantFarmerInfoVO NonCompliantFarmerInfoVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<NonCompliantFarmerInfoVO> resultList = new ArrayList<>();
		try {
			 resultList = nonCompliantFarmerInfoRegService.selectNonCompliantFarmerInfoList(NonCompliantFarmerInfoVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}



	//전제 농업인 번호로 농업인 수혜 정보 연계 등록
	@PostMapping(value = "/fm/farm/insertNonCompliantFarmerInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertNonCompliantFarmerInfo(@RequestBody NonCompliantFarmerInfoVO NonCompliantFarmerInfoVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		int savedCnt = 0;
		int result = 0;

		List<NonCompliantFarmerInfoVO> resultList = new ArrayList<>();

		try {
			//전체 농업인 번호 조회
			resultList = nonCompliantFarmerInfoRegService.selectFrmerSnList(NonCompliantFarmerInfoVO);

		} catch(Exception e) {
			return getErrorResponseEntity(e);
		}

		try {
			if (resultList.size() > 0) {
				for (NonCompliantFarmerInfoVO NonCompliantFarmerInfoVoResult : resultList) {

					String pFrmerSn = NonCompliantFarmerInfoVoResult.getFrmerno();

					logger.debug("@@@@@@@@@@@@@@@@@@@@@pFrmerSn@@@@@@@@@@@@@@@@@@@@@@@");
					logger.debug(pFrmerSn);

					if(!StringUtils.hasText(pFrmerSn)) {
						continue;
					}

					//String urlstr = "https://uni.agrix.go.kr/api/srvc/NonCompliantFarmerInfo?accessToken=eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE3MTk2NDkzODg5MDgsImFwaU5tIjoiZmFybWVyU25DZXJ0aWZpY2F0aW9uSW5mbyIsImlzcyI6IlNZU1RFTSJ9.joIi1I6ViS3h4taFqPAp4psGkNHET2T0c6SfkNZI4nE&version=1.0&responseType=xml&frmerSn=AJ1B89";
					//String pParam = urlstr+"&frmerSn="+pFrmerSn;
					String urlstr = "https://uni.agrix.go.kr/api/srvc/NonCompliantFarmerInfo";
					String accessToken = "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE3MTk2NDkzODg5MDgsImFwaU5tIjoiZmFybWVyU25DZXJ0aWZpY2F0aW9uSW5mbyIsImlzcyI6IlNZU1RFTSJ9.joIi1I6ViS3h4taFqPAp4psGkNHET2T0c6SfkNZI4nE";
					String version = "1.0";
					String responseType = "xml";

					String pParam = urlstr
									+"?accessToken=" + accessToken
									+"&version=" + version
									+"&responseType=" + responseType
									+"&frmerSn=" + pFrmerSn;

					URL url = new URL(pParam);
					HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();

					// xml 파싱 빌드업
					DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
					DocumentBuilder builder = factory.newDocumentBuilder();

					// xml 파일을 document로 파싱하기
					//Document document = builder.parse("xml/sample.xml");
					Document document = builder.parse(urlconnection.getInputStream());

					NodeList nList = document.getElementsByTagName("item");
					/*
					 * 농업인 수혜 정보의 경우 중복 데이터를 구분할 방법이 없어서
					 * 해당 농업인 번호로 조회한 정보 제거후 다시 입력 받음
					 */
					if(nList.getLength() > 0 ) {
						nonCompliantFarmerInfoRegService.deleteNonCompliantFarmerInfo(NonCompliantFarmerInfoVoResult);
					}

					for (int k = 0; k < nList.getLength(); k++) {

						Node node = nList.item(k);

						NonCompliantFarmerInfoVO nodeVo = new NonCompliantFarmerInfoVO();

						if(node.getNodeType() == Node.ELEMENT_NODE) { // 노드의 타입이 Element일 경우(공백이 아닌 경우)
							Element element = (Element) node;

							String frmerno = getValue("FRMER_SN", element);
							String bizYr = getValue("BSNS_YEAR", element);
							String bizNm = getValue("BSNS_NM", element);
							String vltnCn = getValue("VIOLT_CN", element);
							String sncnsBgngYr = getValue("PUNSH_BEGIN_DT", element);
							String sncnsEndYr = getValue("PUNSH_END_DT", element);
							String rdmPrgrsCd = getValue("REDEMP_PROGRS_DTLS", element);
							String rdmTrgtPrncpl = getValue("REDEMP_TRGET_PRNCPAL", element);
							String rdmTrgtAmt = getValue("REDEMP_TRGET_AMOUNT", element);

							nodeVo.setFrmerno(frmerno);
							nodeVo.setBizYr(bizYr);
							nodeVo.setBizNm(bizNm);
							nodeVo.setVltnCn(vltnCn);
							nodeVo.setSncnsBgngYr(sncnsBgngYr);
							nodeVo.setSncnsEndYr(sncnsEndYr);
							nodeVo.setRdmPrgrsCd(rdmPrgrsCd);
							nodeVo.setRdmTrgtPrncpl(rdmTrgtPrncpl);
							nodeVo.setRdmTrgtAmt(rdmTrgtAmt);

							// audit 항목
							nodeVo.setSysFrstInptUserId(getUserId());
							nodeVo.setSysFrstInptPrgrmId(getPrgrmId());
							nodeVo.setSysLastChgUserId(getUserId());
							nodeVo.setSysLastChgPrgrmId(getPrgrmId());
							logger.debug("@@@@@@@@@@@@@@@@@@@@@nodeVo.toString()@@@@@@@@@@@@@@@@@@@@@@@");
							logger.debug(nodeVo.toString());

							savedCnt = nonCompliantFarmerInfoRegService.insertNonCompliantFarmerInfo(nodeVo);
							result = nonCompliantFarmerInfoRegService.insertLogNonCompliantFarmerInfo(nodeVo);
						} else {
							logger.debug("공백 입니다.@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
						}
					}
				}
			}

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, savedCnt);

		return getSuccessResponseEntity(resultMap);
	}


	@PostMapping(value = "/fm/farm/multiSaveNonCompliantFarmerInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> multiSaveNonCompliantFarmerInfoList(@RequestBody List<NonCompliantFarmerInfoVO> NonCompliantFarmerInfoVOList, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		int savedCnt = 0;
		try {
			for (NonCompliantFarmerInfoVO NonCompliantFarmerInfoVO : NonCompliantFarmerInfoVOList) {
				NonCompliantFarmerInfoVO.setSysFrstInptPrgrmId(getPrgrmId());
				NonCompliantFarmerInfoVO.setSysFrstInptUserId(getUserId());
				NonCompliantFarmerInfoVO.setSysLastChgPrgrmId(getPrgrmId());
				NonCompliantFarmerInfoVO.setSysLastChgUserId(getUserId());
			}

			savedCnt = nonCompliantFarmerInfoRegService.multiSaveNonCompliantFarmerInfoList(NonCompliantFarmerInfoVOList);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
		return getSuccessResponseEntity(resultMap);
	}

	//업데이트
	@PostMapping(value = "/fm/farm/updateNonCompliantFarmerInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateNonCompliantFarmerInfo(@RequestBody NonCompliantFarmerInfoVO NonCompliantFarmerInfoVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		logger.info("=============updateNonCompliantFarmerInfo=========start====");
		// validation check

		// audit 항목
		NonCompliantFarmerInfoVO.setSysLastChgUserId(getUserId());
		NonCompliantFarmerInfoVO.setSysLastChgPrgrmId(getPrgrmId());
		logger.info("");
		logger.info(NonCompliantFarmerInfoVO.toString());

		int updatedCnt = 0;

		try {
			updatedCnt = nonCompliantFarmerInfoRegService.updateNonCompliantFarmerInfo(NonCompliantFarmerInfoVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_UPDATED_CNT, updatedCnt);
		logger.info("=============updateNonCompliantFarmerInfo======end=======");
		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/fm/farm/deleteNonCompliantFarmerInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteNonCompliantFarmerInfo(@RequestBody NonCompliantFarmerInfoVO NonCompliantFarmerInfoVO, HttpServletRequest request) throws Exception {
		logger.debug("/fm/farm/deleteNonCompliantFarmerInfo >>> 호출 >>> ");

		int result = 0;
		try {
			result =+ nonCompliantFarmerInfoRegService.deleteNonCompliantFarmerInfo(NonCompliantFarmerInfoVO);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
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

}
