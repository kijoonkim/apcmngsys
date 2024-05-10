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
import com.at.apcss.fm.farm.service.FarmerEducationInfoService;
import com.at.apcss.fm.farm.vo.FarmerEducationInfoVO;

@Controller
public class FarmerEducationInfoController extends BaseController{

	@Resource(name= "farmerEducationInfoService")
	private FarmerEducationInfoService farmerEducationInfoService;

	//화면이동
	@RequestMapping(value = "/fm/farm/farmerEducationInfo.do")
	public String farmerEducationInfo() {
		return "apcss/fm/farm/farmerEducationInfo";
	}

	// 조회
	@PostMapping(value = "/fm/farm/selectFarmerEducationInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectFarmerEducationInfoList(Model model, @RequestBody FarmerEducationInfoVO farmerEducationInfoVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<FarmerEducationInfoVO> resultList = new ArrayList<>();
		try {
			 resultList = farmerEducationInfoService.selectFarmerEducationInfoList(farmerEducationInfoVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}



	//전제 농업인 번호로 농지 정보 연계 등록
	@PostMapping(value = "/fm/farm/insertFarmerEducationInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertFarmerEducationInfo(@RequestBody FarmerEducationInfoVO FarmerEducationInfoVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		int savedCnt = 0;
		int result = 0;

		List<FarmerEducationInfoVO> resultList = new ArrayList<>();

		try {
			//전체 농업인 번호 조회
			resultList = farmerEducationInfoService.selectFrmerSnList(FarmerEducationInfoVO);

		} catch(Exception e) {
			return getErrorResponseEntity(e);
		}

		try {
			if (resultList.size() > 0) {
				for (FarmerEducationInfoVO FarmerEducationInfoVoResult : resultList) {

					String pFrmerSn = FarmerEducationInfoVoResult.getFrmerno();

					logger.debug("@@@@@@@@@@@@@@@@@@@@@pFrmerSn@@@@@@@@@@@@@@@@@@@@@@@");
					logger.debug(pFrmerSn);

					if(!StringUtils.hasText(pFrmerSn)) {
						continue;
					}

					//String urlstr = "https://uni.agrix.go.kr/api/srvc/farmerEducationInfo?accessToken=eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE3MTk2NDkzODE5NjcsImFwaU5tIjoiZmFybWVyRWR1Y2F0aW9uSW5mbyIsImlzcyI6IlNZU1RFTSJ9.NhHVwTv01ypvvwO7fJMF2_iVqYiypArDgK0n1Q7qSUU&version=1.0&responseType=xml";
					//String pParam = urlstr+"&frmerSn="+pFrmerSn;
					String urlstr = "https://uni.agrix.go.kr/api/srvc/farmerEducationInfo";
					String accessToken = "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE3MTk2NDkzODE5NjcsImFwaU5tIjoiZmFybWVyRWR1Y2F0aW9uSW5mbyIsImlzcyI6IlNZU1RFTSJ9.NhHVwTv01ypvvwO7fJMF2_iVqYiypArDgK0n1Q7qSUU";
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

					for (int k = 0; k < nList.getLength(); k++) {

						Node node = nList.item(k);

						FarmerEducationInfoVO nodeVo = new FarmerEducationInfoVO();

						if(node.getNodeType() == Node.ELEMENT_NODE) { // 노드의 타입이 Element일 경우(공백이 아닌 경우)
							Element element = (Element) node;

							String frmerno = getValue("frmerSn", element);
							String mngmstRegno = getValue("bzobRgno", element);
							String crclmCd = getValue("eduCosCd", element);
							String flNm = getValue("name", element);
							String ednstNm = getValue("eduOrgNm", element);
							String crclmNm = getValue("eduCosNm", element);
							String eduBgngYmd = getValue("eduStrDt", element);
							String eduEndYmd = getValue("eduEndDt", element);
							String idntyYn = getValue("cnfmYn", element);

							nodeVo.setFrmerno(frmerno);
							nodeVo.setMngmstRegno(mngmstRegno);
							nodeVo.setCrclmCd(crclmCd);
							nodeVo.setFlNm(flNm);
							nodeVo.setEdnstNm(ednstNm);
							nodeVo.setCrclmNm(crclmNm);
							nodeVo.setEduBgngYmd(eduBgngYmd);
							nodeVo.setEduEndYmd(eduEndYmd);
							nodeVo.setIdntyYn(idntyYn);

							// audit 항목
							nodeVo.setSysFrstInptUserId(getUserId());
							nodeVo.setSysFrstInptPrgrmId(getPrgrmId());
							nodeVo.setSysLastChgUserId(getUserId());
							nodeVo.setSysLastChgPrgrmId(getPrgrmId());
							logger.debug("@@@@@@@@@@@@@@@@@@@@@nodeVo.toString()@@@@@@@@@@@@@@@@@@@@@@@");
							logger.debug(nodeVo.toString());

							savedCnt = farmerEducationInfoService.insertMergeFarmerEducationInfo(nodeVo);
							result = farmerEducationInfoService.insertLogFarmerEducationInfo(nodeVo);
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



	@PostMapping(value = "/fm/farm/multiSaveFarmerEducationInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> multiSaveFarmerEducationInfoList(@RequestBody List<FarmerEducationInfoVO> FarmerEducationInfoVOList, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		int savedCnt = 0;
		try {
			for (FarmerEducationInfoVO FarmerEducationInfoVO : FarmerEducationInfoVOList) {
				FarmerEducationInfoVO.setSysFrstInptPrgrmId(getPrgrmId());
				FarmerEducationInfoVO.setSysFrstInptUserId(getUserId());
				FarmerEducationInfoVO.setSysLastChgPrgrmId(getPrgrmId());
				FarmerEducationInfoVO.setSysLastChgUserId(getUserId());
			}

			savedCnt = farmerEducationInfoService.multiSaveFarmerEducationInfoList(FarmerEducationInfoVOList);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
		return getSuccessResponseEntity(resultMap);
	}

	//업데이트
	@PostMapping(value = "/fm/farm/updateFarmerEducationInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateFarmerEducationInfo(@RequestBody FarmerEducationInfoVO FarmerEducationInfoVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		logger.info("=============updateFarmerEducationInfo=========start====");
		// validation check

		// audit 항목
		FarmerEducationInfoVO.setSysLastChgUserId(getUserId());
		FarmerEducationInfoVO.setSysLastChgPrgrmId(getPrgrmId());
		logger.info("");
		logger.info(FarmerEducationInfoVO.toString());

		int updatedCnt = 0;

		try {
			updatedCnt = farmerEducationInfoService.updateFarmerEducationInfo(FarmerEducationInfoVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_UPDATED_CNT, updatedCnt);
		logger.info("=============updateFarmerEducationInfo======end=======");
		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/fm/farm/deleteFarmerEducationInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteFarmerEducationInfo(@RequestBody FarmerEducationInfoVO FarmerEducationInfoVO, HttpServletRequest request) throws Exception {
		logger.debug("/fm/farm/deleteFarmerEducationInfo >>> 호출 >>> ");

		int result = 0;
		try {
			result =+ farmerEducationInfoService.deleteFarmerEducationInfo(FarmerEducationInfoVO);
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
