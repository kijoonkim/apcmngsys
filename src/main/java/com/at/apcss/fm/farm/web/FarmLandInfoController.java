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
import com.at.apcss.fm.farm.service.FarmLandInfoService;
import com.at.apcss.fm.farm.vo.FarmLandInfoVO;


@Controller
public class FarmLandInfoController extends BaseController{

	@Resource(name= "farmLandInfoService")
	private FarmLandInfoService farmLandInfoService;

	//화면이동
	@RequestMapping(value = "/fm/farm/farmLandInfo.do")
	public String farmLandInfo() {
		return "apcss/fm/farm/farmLandInfo";
	}

	// 조회
	@PostMapping(value = "/fm/farm/selectFarmLandInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectfarmLandInfoList(Model model, @RequestBody FarmLandInfoVO farmLandInfoVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<FarmLandInfoVO> resultList = new ArrayList<>();
		try {
			 resultList = farmLandInfoService.selectFarmLandInfoList(farmLandInfoVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}



	//전제 농업인 번호로 농지 정보 연계 등록
	@PostMapping(value = "/fm/farm/insertFarmLandInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertFarmLandInfo(@RequestBody FarmLandInfoVO farmLandInfoVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		int savedCnt = 0;
		int result = 0;

		List<FarmLandInfoVO> resultList = new ArrayList<>();

		try {
			//전체 농업인 번호 조회
			resultList = farmLandInfoService.selectFrmerSnList(farmLandInfoVO);

		} catch(Exception e) {
			return getErrorResponseEntity(e);
		}

		try {
			if (resultList.size() > 0) {
				for (FarmLandInfoVO farmLandInfoVoResult : resultList) {

					String pFrmerSn = farmLandInfoVoResult.getFrmerno();

					logger.debug("@@@@@@@@@@@@@@@@@@@@@pFrmerSn@@@@@@@@@@@@@@@@@@@@@@@");
					logger.debug(pFrmerSn);

					if(!StringUtils.hasText(pFrmerSn)) {
						continue;
					}

					//String urlstr = "https://uni.agrix.go.kr/api/srvc/farmLandInfo?accessToken=eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE3MTk2NDkzNzc1NDEsImFwaU5tIjoiZmFybUxhbmRJbmZvIiwiaXNzIjoiU1lTVEVNIn0.lt3lg3NfKgyj1prBbi5fTRhIfHvHXeV5FBLbAFCmqK8&version=1.0&responseType=xml";
					//String pParam = urlstr+"&frmerSn="+pFrmerSn;
					String urlstr = "https://uni.agrix.go.kr/api/srvc/farmLandInfo";
					String accessToken = "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE3MTk2NDkzNzc1NDEsImFwaU5tIjoiZmFybUxhbmRJbmZvIiwiaXNzIjoiU1lTVEVNIn0.lt3lg3NfKgyj1prBbi5fTRhIfHvHXeV5FBLbAFCmqK8";
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

						FarmLandInfoVO nodeVo = new FarmLandInfoVO();

						if(node.getNodeType() == Node.ELEMENT_NODE) { // 노드의 타입이 Element일 경우(공백이 아닌 경우)
							Element element = (Element) node;
							String frmerno = getValue("frmerSn", element);
							String mngmstRegno = getValue("bzobRgno", element);
							String frlnSn = getValue("frlndSn", element);
							String stdgcd = getValue("legaldongCode", element);
							String frlnAddr = getValue("frlndAdres", element);
							String frlnMno = getValue("frlndMnnm", element);

							String frlnSno = getValue("frlndSlno", element);
							String frlnType = getValue("clvtStle", element);
							String cprtnFrlnyn = getValue("copertnClvtAt", element);
							String frlnOwnrNm = getValue("frlndOwnerNm", element);
							String actlLdcg = getValue("ofactLndcgr", element);
							String poeLdcg = getValue("realLndcgr", element);

							String actlFrlnarea = getValue("ofactFrlndAr", element);//공부농지면적
							String poeFrlnarea = getValue("realFrlndAr", element);//실제농지면적
							String flwArea = getValue("nuseClmgAr", element);//휴경면적
							String ablFrlnarea = getValue("nuseQtmgAr", element);//폐경면적
							String itemCd = getValue("prdlstCode", element);
							String itemNm = getValue("predlstNm", element);

							String brgrndFcltSeCd = getValue("eqptFcltyse", element);
							String frlnarea = getValue("ctvtAr", element);
							String ldgrSeCd = getValue("ldgrDvcd", element);

							nodeVo.setMngmstRegno(mngmstRegno);
							nodeVo.setFrlnType(frlnType);
							nodeVo.setCprtnFrlnyn(cprtnFrlnyn);
							nodeVo.setFrlnarea(frlnarea);
							nodeVo.setBrgrndFcltSeCd(brgrndFcltSeCd);
							//nodeVo.setFcltKnd(fcltKnd);
							//nodeVo.setFcltSn(fcltSn);
							//nodeVo.setFcltShap(fcltShap);
							//nodeVo.setFcltArea(fcltArea);
							nodeVo.setFrlnAddr(frlnAddr);
							nodeVo.setFrlnMno(frlnMno);
							nodeVo.setFrlnOwnrNm(frlnOwnrNm);
							nodeVo.setFrlnSno(frlnSno);
							nodeVo.setFrlnSn(frlnSn);
							nodeVo.setFrmerno(frmerno);
							//nodeVo.setFcltInstallYr(fcltInstallYr);
							nodeVo.setLdgrSeCd(ldgrSeCd);
							nodeVo.setStdgcd(stdgcd);
							nodeVo.setFlwArea(flwArea);
							nodeVo.setAblFrlnarea(ablFrlnarea);
							nodeVo.setPoeFrlnarea(poeFrlnarea);
							nodeVo.setPoeLdcg(poeLdcg);
							nodeVo.setItemCd(itemCd);
							nodeVo.setItemNm(itemNm);
							nodeVo.setActlFrlnarea(actlFrlnarea);
							nodeVo.setActlLdcg(actlLdcg);

							// audit 항목
							nodeVo.setSysFrstInptUserId(getUserId());
							nodeVo.setSysFrstInptPrgrmId(getPrgrmId());
							nodeVo.setSysLastChgUserId(getUserId());
							nodeVo.setSysLastChgPrgrmId(getPrgrmId());
							logger.debug("@@@@@@@@@@@@@@@@@@@@@nodeVo.toString()@@@@@@@@@@@@@@@@@@@@@@@");
							logger.debug(nodeVo.toString());

							savedCnt = farmLandInfoService.insertMergeFarmLandInfo(nodeVo);
							result = farmLandInfoService.insertLogFarmLandInfo(nodeVo);
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



	@PostMapping(value = "/fm/farm/multiSaveFarmLandInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> multiSaveFarmLandInfoList(@RequestBody List<FarmLandInfoVO> farmLandInfoVOList, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		int savedCnt = 0;
		try {
			for (FarmLandInfoVO farmLandInfoVO : farmLandInfoVOList) {
				farmLandInfoVO.setSysFrstInptPrgrmId(getPrgrmId());
				farmLandInfoVO.setSysFrstInptUserId(getUserId());
				farmLandInfoVO.setSysLastChgPrgrmId(getPrgrmId());
				farmLandInfoVO.setSysLastChgUserId(getUserId());
			}

			savedCnt = farmLandInfoService.multiSaveFarmLandInfoList(farmLandInfoVOList);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
		return getSuccessResponseEntity(resultMap);
	}

	//업데이트
	@PostMapping(value = "/fm/farm/updateFarmLandInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateFarmLandInfo(@RequestBody FarmLandInfoVO farmLandInfoVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		logger.info("=============updateFarmLandInfo=========start====");
		// validation check

		// audit 항목
		farmLandInfoVO.setSysLastChgUserId(getUserId());
		farmLandInfoVO.setSysLastChgPrgrmId(getPrgrmId());
		logger.info("");
		logger.info(farmLandInfoVO.toString());

		int updatedCnt = 0;

		try {
			updatedCnt = farmLandInfoService.updateFarmLandInfo(farmLandInfoVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_UPDATED_CNT, updatedCnt);
		logger.info("=============updateFarmLandInfo======end=======");
		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/fm/farm/deleteFarmLandInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteFarmLandInfo(@RequestBody FarmLandInfoVO farmLandInfoVO, HttpServletRequest request) throws Exception {
		logger.debug("/fm/farm/deleteFarmLandInfo >>> 호출 >>> ");

		int result = 0;
		try {
			result =+ farmLandInfoService.deleteFarmLandInfo(farmLandInfoVO);
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
