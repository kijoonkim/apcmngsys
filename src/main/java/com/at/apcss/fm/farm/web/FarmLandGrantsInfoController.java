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
import com.at.apcss.fm.farm.service.FarmLandGrantsInfoService;
import com.at.apcss.fm.farm.vo.FarmLandGrantsInfoVO;

@Controller
public class FarmLandGrantsInfoController extends BaseController{

	@Resource(name= "FarmLandGrantsInfoService")
	private FarmLandGrantsInfoService farmLandGrantsInfoService;

	//화면이동
	@RequestMapping(value = "/fm/farm/farmLandGrantsInfo.do")
	public String farmLandGrantsInfo() {
		return "apcss/fm/farm/farmLandGrantsInfo";
	}

	// 조회
	@PostMapping(value = "/fm/farm/selectFarmLandGrantsInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectFarmLandGrantsInfoList(Model model, @RequestBody FarmLandGrantsInfoVO FarmLandGrantsInfoVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<FarmLandGrantsInfoVO> resultList = new ArrayList<>();
		try {
			 resultList = farmLandGrantsInfoService.selectFarmLandGrantsInfoList(FarmLandGrantsInfoVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}



	//전제 농업인 번호로 농지 수혜 정보 연계 등록
	@PostMapping(value = "/fm/farm/insertFarmLandGrantsInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertFarmLandGrantsInfo(@RequestBody FarmLandGrantsInfoVO FarmLandGrantsInfoVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		int savedCnt = 0;
		int result = 0;

		List<FarmLandGrantsInfoVO> resultList = new ArrayList<>();

		try {
			//전체 농업인 번호 조회
			resultList = farmLandGrantsInfoService.selectFrmerSnList(FarmLandGrantsInfoVO);

		} catch(Exception e) {
			return getErrorResponseEntity(e);
		}

		try {
			if (resultList.size() > 0) {
				for (FarmLandGrantsInfoVO FarmLandGrantsInfoVoResult : resultList) {

					String pFrmerSn = FarmLandGrantsInfoVoResult.getFrmerno();

					logger.debug("@@@@@@@@@@@@@@@@@@@@@pFrmerSn@@@@@@@@@@@@@@@@@@@@@@@");
					logger.debug(pFrmerSn);

					if(!StringUtils.hasText(pFrmerSn)) {
						continue;
					}

					//String urlstr = "https://uni.agrix.go.kr/api/srvc/FarmLandGrantsInfo?accessToken=eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE3MTk2NDkzODg5MDgsImFwaU5tIjoiZmFybWVyU25DZXJ0aWZpY2F0aW9uSW5mbyIsImlzcyI6IlNZU1RFTSJ9.joIi1I6ViS3h4taFqPAp4psGkNHET2T0c6SfkNZI4nE&version=1.0&responseType=xml&frmerSn=AJ1B89";
					//String pParam = urlstr+"&frmerSn="+pFrmerSn;
					String urlstr = "https://uni.agrix.go.kr/api/srvc/farmLandGrantsInfo";
					//현재 농지 수혜 토큰 값을 모르는 상태
					String accessToken = "";
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
						farmLandGrantsInfoService.deleteFarmLandGrantsInfo(FarmLandGrantsInfoVoResult);
					}

					for (int k = 0; k < nList.getLength(); k++) {

						Node node = nList.item(k);

						FarmLandGrantsInfoVO nodeVo = new FarmLandGrantsInfoVO();

						if(node.getNodeType() == Node.ELEMENT_NODE) { // 노드의 타입이 Element일 경우(공백이 아닌 경우)
							Element element = (Element) node;

							String frmerno = getValue("FRMER_SN", element);
							String pnuCd = getValue("PNU_CODE", element);
							String bizBgngYmd = getValue("BSNS_BGNDE", element);
							String bizEndYmd = getValue("BSNS_ENDDE", element);
							String bizCd = getValue("BSNS_CODE", element);
							String bizNm = getValue("BSNS_NM", element);
							String stts = getValue("STTUS", element);
							String aplcntNm = getValue("APPLCNT_NM", element);
							String ldgrSe = getValue("LDGRFL", element);
							String frlnAddr = getValue("FRLND_ADRES", element);
							String stdgCd = getValue("LEGALDONG_CODE", element);
							String mno = getValue("MNNM", element);
							String sno = getValue("SLNO", element);
							String aplySfc = getValue("REQST_AR", element);

							nodeVo.setFrmerno(frmerno);
							nodeVo.setPnuCd(pnuCd);
							nodeVo.setBizBgngYmd(bizBgngYmd);
							nodeVo.setBizEndYmd(bizEndYmd);
							nodeVo.setBizCd(bizCd);
							nodeVo.setBizNm(bizNm);
							nodeVo.setStts(stts);
							nodeVo.setAplcntNm(aplcntNm);
							nodeVo.setLdgrSe(ldgrSe);
							nodeVo.setFrlnAddr(frlnAddr);
							nodeVo.setStdgCd(stdgCd);
							nodeVo.setMno(mno);
							nodeVo.setSno(sno);
							nodeVo.setAplySfc(aplySfc);

							// audit 항목
							nodeVo.setSysFrstInptUserId(getUserId());
							nodeVo.setSysFrstInptPrgrmId(getPrgrmId());
							nodeVo.setSysLastChgUserId(getUserId());
							nodeVo.setSysLastChgPrgrmId(getPrgrmId());
							logger.debug("@@@@@@@@@@@@@@@@@@@@@nodeVo.toString()@@@@@@@@@@@@@@@@@@@@@@@");
							logger.debug(nodeVo.toString());

							savedCnt = farmLandGrantsInfoService.insertFarmLandGrantsInfo(nodeVo);
							result = farmLandGrantsInfoService.insertLogFarmLandGrantsInfo(nodeVo);
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


	@PostMapping(value = "/fm/farm/multiSaveFarmLandGrantsInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> multiSaveFarmLandGrantsInfoList(@RequestBody List<FarmLandGrantsInfoVO> FarmLandGrantsInfoVOList, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		int savedCnt = 0;
		try {
			for (FarmLandGrantsInfoVO FarmLandGrantsInfoVO : FarmLandGrantsInfoVOList) {
				FarmLandGrantsInfoVO.setSysFrstInptPrgrmId(getPrgrmId());
				FarmLandGrantsInfoVO.setSysFrstInptUserId(getUserId());
				FarmLandGrantsInfoVO.setSysLastChgPrgrmId(getPrgrmId());
				FarmLandGrantsInfoVO.setSysLastChgUserId(getUserId());
			}

			savedCnt = farmLandGrantsInfoService.multiSaveFarmLandGrantsInfoList(FarmLandGrantsInfoVOList);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
		return getSuccessResponseEntity(resultMap);
	}

	//업데이트
	@PostMapping(value = "/fm/farm/updateFarmLandGrantsInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateFarmLandGrantsInfo(@RequestBody FarmLandGrantsInfoVO FarmLandGrantsInfoVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		logger.info("=============updateFarmLandGrantsInfo=========start====");
		// validation check

		// audit 항목
		FarmLandGrantsInfoVO.setSysLastChgUserId(getUserId());
		FarmLandGrantsInfoVO.setSysLastChgPrgrmId(getPrgrmId());
		logger.info("");
		logger.info(FarmLandGrantsInfoVO.toString());

		int updatedCnt = 0;

		try {
			updatedCnt = farmLandGrantsInfoService.updateFarmLandGrantsInfo(FarmLandGrantsInfoVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_UPDATED_CNT, updatedCnt);
		logger.info("=============updateFarmLandGrantsInfo======end=======");
		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/fm/farm/deleteFarmLandGrantsInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteFarmLandGrantsInfo(@RequestBody FarmLandGrantsInfoVO FarmLandGrantsInfoVO, HttpServletRequest request) throws Exception {
		logger.debug("/fm/farm/deleteFarmLandGrantsInfo >>> 호출 >>> ");

		int result = 0;
		try {
			result =+ farmLandGrantsInfoService.deleteFarmLandGrantsInfo(FarmLandGrantsInfoVO);
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
