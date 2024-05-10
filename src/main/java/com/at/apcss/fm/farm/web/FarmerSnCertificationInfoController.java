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
import com.at.apcss.fm.farm.service.FarmerSnCertificationInfoService;
import com.at.apcss.fm.farm.vo.FarmerSnCertificationInfoVO;


@Controller
public class FarmerSnCertificationInfoController extends BaseController{

	@Resource(name= "farmerSnCertificationInfoService")
	private FarmerSnCertificationInfoService farmerSnCertificationInfoService;

	//화면이동
	@RequestMapping(value = "/fm/farm/farmerSnCertificationInfo.do")
	public String farmerSnCertificationInfo() {
		return "apcss/fm/farm/farmerSnCertificationInfo";
	}

	// 조회
	@PostMapping(value = "/fm/farm/selectFarmerSnCertificationInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectfarmerSnCertificationInfoList(Model model, @RequestBody FarmerSnCertificationInfoVO farmerSnCertificationInfoVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<FarmerSnCertificationInfoVO> resultList = new ArrayList<>();
		try {
			 resultList = farmerSnCertificationInfoService.selectFarmerSnCertificationInfoList(farmerSnCertificationInfoVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}


	//전제 농업인 번호로 친환경 인증 정보 연계 등록
	@PostMapping(value = "/fm/farm/insertFarmerSnCertificationInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertFarmerSnCertificationInfo(@RequestBody FarmerSnCertificationInfoVO FarmerSnCertificationInfoVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		int savedCnt = 0;
		int result = 0;

		List<FarmerSnCertificationInfoVO> resultList = new ArrayList<>();

		try {
			//전체 농업인 번호 조회
			resultList = farmerSnCertificationInfoService.selectFrmerSnList(FarmerSnCertificationInfoVO);

		} catch(Exception e) {
			return getErrorResponseEntity(e);
		}

		try {
			if (resultList.size() > 0) {
				for (FarmerSnCertificationInfoVO FarmerSnCertificationInfoVoResult : resultList) {

					String pFrmerSn = FarmerSnCertificationInfoVoResult.getFrmerno();

					logger.debug("@@@@@@@@@@@@@@@@@@@@@pFrmerSn@@@@@@@@@@@@@@@@@@@@@@@");
					logger.debug(pFrmerSn);

					if(!StringUtils.hasText(pFrmerSn)) {
						continue;
					}

					//String urlstr = "https://uni.agrix.go.kr/api/srvc/farmerSnCertificationInfo?accessToken=eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE3MTk2NDkzODg5MDgsImFwaU5tIjoiZmFybWVyU25DZXJ0aWZpY2F0aW9uSW5mbyIsImlzcyI6IlNZU1RFTSJ9.joIi1I6ViS3h4taFqPAp4psGkNHET2T0c6SfkNZI4nE&version=1.0&responseType=xml&frmerSn=AJ1B89";
					//String pParam = urlstr+"&frmerSn="+pFrmerSn;
					String urlstr = "https://uni.agrix.go.kr/api/srvc/farmerSnCertificationInfo";
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
					 * 친환경 인증 정보의 경우 중복 데이터를 구분할 방법이 없어서
					 * 해당 농업인 번호로 조회한 정보 제거후 다시 입력 받음
					 */
					if(nList.getLength() > 0 ) {
						farmerSnCertificationInfoService.deleteFarmerSnCertificationInfo(FarmerSnCertificationInfoVoResult);
					}

					for (int k = 0; k < nList.getLength(); k++) {

						Node node = nList.item(k);

						FarmerSnCertificationInfoVO nodeVo = new FarmerSnCertificationInfoVO();

						if(node.getNodeType() == Node.ELEMENT_NODE) { // 노드의 타입이 Element일 경우(공백이 아닌 경우)
							Element element = (Element) node;

							String certNo = getValue("conNum", element);
							String certBgngYmd = getValue("effectiveStartDt", element);
							String certEndYmd = getValue("effectiveEndDt", element);
							String certStts = getValue("stateNm", element);
							String ecfrdCertSeNm = getValue("congbNm", element);
							String ecfrdCertGroupSeNm = getValue("farmergbNm", element);
							String grpNm = getValue("groupreqerNm", element);
							String ownrNm = getValue("ownerNm", element);
							String certAddr = getValue("certAddr", element);
							String sfc = getValue("landQty", element);

							nodeVo.setFrmerno(pFrmerSn);
							nodeVo.setCertNo(certNo);
							nodeVo.setCertBgngYmd(certBgngYmd);
							nodeVo.setCertEndYmd(certEndYmd);
							nodeVo.setCertStts(certStts);
							nodeVo.setEcfrdCertSeNm(ecfrdCertSeNm);
							nodeVo.setEcfrdCertGroupSeNm(ecfrdCertGroupSeNm);
							nodeVo.setGrpNm(grpNm);
							nodeVo.setOwnrNm(ownrNm);
							nodeVo.setCertAddr(certAddr);
							nodeVo.setSfc(sfc);

							// audit 항목
							nodeVo.setSysFrstInptUserId(getUserId());
							nodeVo.setSysFrstInptPrgrmId(getPrgrmId());
							nodeVo.setSysLastChgUserId(getUserId());
							nodeVo.setSysLastChgPrgrmId(getPrgrmId());
							logger.debug("@@@@@@@@@@@@@@@@@@@@@nodeVo.toString()@@@@@@@@@@@@@@@@@@@@@@@");
							logger.debug(nodeVo.toString());

							savedCnt = farmerSnCertificationInfoService.insertFarmerSnCertificationInfo(nodeVo);
							result = farmerSnCertificationInfoService.insertLogFarmerSnCertificationInfo(nodeVo);
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


	@PostMapping(value = "/fm/farm/multiSaveFarmerSnCertificationInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> multiSaveFarmerSnCertificationInfoList(@RequestBody List<FarmerSnCertificationInfoVO> farmerSnCertificationInfoVOList, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		int savedCnt = 0;
		try {
			for (FarmerSnCertificationInfoVO farmerSnCertificationInfoVO : farmerSnCertificationInfoVOList) {
				farmerSnCertificationInfoVO.setSysFrstInptPrgrmId(getPrgrmId());
				farmerSnCertificationInfoVO.setSysFrstInptUserId(getUserId());
				farmerSnCertificationInfoVO.setSysLastChgPrgrmId(getPrgrmId());
				farmerSnCertificationInfoVO.setSysLastChgUserId(getUserId());
			}

			savedCnt = farmerSnCertificationInfoService.multiSaveFarmerSnCertificationInfoList(farmerSnCertificationInfoVOList);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
		return getSuccessResponseEntity(resultMap);
	}

	//업데이트
	@PostMapping(value = "/fm/farm/updateFarmerSnCertificationInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateFarmerSnCertificationInfo(@RequestBody FarmerSnCertificationInfoVO farmerSnCertificationInfoVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		logger.info("=============updateFarmerSnCertificationInfo=========start====");
		// validation check

		// audit 항목
		farmerSnCertificationInfoVO.setSysLastChgUserId(getUserId());
		farmerSnCertificationInfoVO.setSysLastChgPrgrmId(getPrgrmId());
		logger.info("");
		logger.info(farmerSnCertificationInfoVO.toString());

		int updatedCnt = 0;

		try {
			updatedCnt = farmerSnCertificationInfoService.updateFarmerSnCertificationInfo(farmerSnCertificationInfoVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_UPDATED_CNT, updatedCnt);
		logger.info("=============updateFarmerSnCertificationInfo======end=======");
		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/fm/farm/deleteFarmerSnCertificationInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteFarmerSnCertificationInfo(@RequestBody FarmerSnCertificationInfoVO farmerSnCertificationInfoVO, HttpServletRequest request) throws Exception {
		logger.debug("/fm/farm/deleteFarmerSnCertificationInfo >>> 호출 >>> ");

		int result = 0;
		try {
			result =+ farmerSnCertificationInfoService.deleteFarmerSnCertificationInfo(farmerSnCertificationInfoVO);
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
