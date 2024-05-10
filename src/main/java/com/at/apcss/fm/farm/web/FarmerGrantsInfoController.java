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
import com.at.apcss.fm.farm.service.FarmerGrantsInfoService;
import com.at.apcss.fm.farm.vo.FarmerGrantsInfoVO;



@Controller
public class FarmerGrantsInfoController extends BaseController{

	@Resource(name= "farmerGrantsInfoService")
	private FarmerGrantsInfoService farmerGrantsInfoService;

	//화면이동
	@RequestMapping(value = "/fm/farm/farmerGrantsInfo.do")
	public String farmerGrantsInfo() {
		return "apcss/fm/farm/farmerGrantsInfo";
	}

	// 조회
	@PostMapping(value = "/fm/farm/selectFarmerGrantsInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectfarmerGrantsInfoList(Model model, @RequestBody FarmerGrantsInfoVO farmerGrantsInfoVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<FarmerGrantsInfoVO> resultList = new ArrayList<>();
		try {
			 resultList = farmerGrantsInfoService.selectFarmerGrantsInfoList(farmerGrantsInfoVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}



	//전제 농업인 번호로 농업인 수혜 정보 연계 등록
	@PostMapping(value = "/fm/farm/insertFarmerGrantsInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertFarmerGrantsInfo(@RequestBody FarmerGrantsInfoVO FarmerGrantsInfoVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		int savedCnt = 0;
		int result = 0;

		List<FarmerGrantsInfoVO> resultList = new ArrayList<>();

		try {
			//전체 농업인 번호 조회
			resultList = farmerGrantsInfoService.selectFrmerSnList(FarmerGrantsInfoVO);

		} catch(Exception e) {
			return getErrorResponseEntity(e);
		}

		try {
			if (resultList.size() > 0) {
				for (FarmerGrantsInfoVO FarmerGrantsInfoVoResult : resultList) {

					String pFrmerSn = FarmerGrantsInfoVoResult.getFrmerno();

					logger.debug("@@@@@@@@@@@@@@@@@@@@@pFrmerSn@@@@@@@@@@@@@@@@@@@@@@@");
					logger.debug(pFrmerSn);

					if(!StringUtils.hasText(pFrmerSn)) {
						continue;
					}

					//String urlstr = "https://uni.agrix.go.kr/api/srvc/FarmerGrantsInfo?accessToken=eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE3MTk2NDkzODg5MDgsImFwaU5tIjoiZmFybWVyU25DZXJ0aWZpY2F0aW9uSW5mbyIsImlzcyI6IlNZU1RFTSJ9.joIi1I6ViS3h4taFqPAp4psGkNHET2T0c6SfkNZI4nE&version=1.0&responseType=xml&frmerSn=AJ1B89";
					//String pParam = urlstr+"&frmerSn="+pFrmerSn;
					String urlstr = "https://uni.agrix.go.kr/api/srvc/farmerGrantsInfo";
					String accessToken = "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE3NjA2ODczMjAwOTAsImFwaU5tIjoiZmFybWVyR3JhbnRzSW5mbyIsImlzcyI6IlNZU1RFTSJ9.x-Ro2djzoXwzxEbjRDtZfVjLxVYBdhnC30aIWgf0vIU";
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
						farmerGrantsInfoService.deleteFarmerGrantsInfo(FarmerGrantsInfoVoResult);
					}

					for (int k = 0; k < nList.getLength(); k++) {

						Node node = nList.item(k);

						FarmerGrantsInfoVO nodeVo = new FarmerGrantsInfoVO();

						if(node.getNodeType() == Node.ELEMENT_NODE) { // 노드의 타입이 Element일 경우(공백이 아닌 경우)
							Element element = (Element) node;

							String bizBgngYmd = getValue("bsnsBgnde", element);
							String bizEndYmd = getValue("bsnsEndde", element);
							String cmptncInst = getValue("cmptinst", element);
							String bizCd = getValue("bsnsCode", element);
							String bizNm = getValue("bsnsNm", element);
							String rcfvrsNm = getValue("rcvfverNm", element);
							String govFnncng = getValue("ntnrsFinanc", element);
							String lcLtExpndFnncng = getValue("llxFinanc", element);
							String govSbsds = getValue("govsuby", element);
							String lcltExpndSbsds = getValue("llxSbsidy", element);
							String prcsSys = getValue("processSys", element);

							nodeVo.setFrmerno(pFrmerSn);
							nodeVo.setBizBgngYmd(bizBgngYmd);
							nodeVo.setBizEndYmd(bizEndYmd);
							nodeVo.setCmptncInst(cmptncInst);
							nodeVo.setBizCd(bizCd);
							nodeVo.setBizNm(bizNm);
							nodeVo.setRcfvrsNm(rcfvrsNm);
							nodeVo.setGovFnncng(govFnncng);
							nodeVo.setLcLtExpndFnncng(lcLtExpndFnncng);
							nodeVo.setGovSbsds(govSbsds);
							nodeVo.setLcltExpndSbsds(lcltExpndSbsds);
							nodeVo.setPrcsSys(prcsSys);

							// audit 항목
							nodeVo.setSysFrstInptUserId(getUserId());
							nodeVo.setSysFrstInptPrgrmId(getPrgrmId());
							nodeVo.setSysLastChgUserId(getUserId());
							nodeVo.setSysLastChgPrgrmId(getPrgrmId());
							logger.debug("@@@@@@@@@@@@@@@@@@@@@nodeVo.toString()@@@@@@@@@@@@@@@@@@@@@@@");
							logger.debug(nodeVo.toString());

							savedCnt = farmerGrantsInfoService.insertFarmerGrantsInfo(nodeVo);
							result = farmerGrantsInfoService.insertLogFarmerGrantsInfo(nodeVo);
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


	@PostMapping(value = "/fm/farm/multiSaveFarmerGrantsInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> multiSaveFarmerGrantsInfoList(@RequestBody List<FarmerGrantsInfoVO> farmerGrantsInfoVOList, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		int savedCnt = 0;
		try {
			for (FarmerGrantsInfoVO farmerGrantsInfoVO : farmerGrantsInfoVOList) {
				farmerGrantsInfoVO.setSysFrstInptPrgrmId(getPrgrmId());
				farmerGrantsInfoVO.setSysFrstInptUserId(getUserId());
				farmerGrantsInfoVO.setSysLastChgPrgrmId(getPrgrmId());
				farmerGrantsInfoVO.setSysLastChgUserId(getUserId());
			}

			savedCnt = farmerGrantsInfoService.multiSaveFarmerGrantsInfoList(farmerGrantsInfoVOList);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
		return getSuccessResponseEntity(resultMap);
	}

	//업데이트
	@PostMapping(value = "/fm/farm/updateFarmerGrantsInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateFarmerGrantsInfo(@RequestBody FarmerGrantsInfoVO farmerGrantsInfoVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		logger.info("=============updateFarmerGrantsInfo=========start====");
		// validation check

		// audit 항목
		farmerGrantsInfoVO.setSysLastChgUserId(getUserId());
		farmerGrantsInfoVO.setSysLastChgPrgrmId(getPrgrmId());
		logger.info("");
		logger.info(farmerGrantsInfoVO.toString());

		int updatedCnt = 0;

		try {
			updatedCnt = farmerGrantsInfoService.updateFarmerGrantsInfo(farmerGrantsInfoVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_UPDATED_CNT, updatedCnt);
		logger.info("=============updateFarmerGrantsInfo======end=======");
		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/fm/farm/deleteFarmerGrantsInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteFarmerGrantsInfo(@RequestBody FarmerGrantsInfoVO farmerGrantsInfoVO, HttpServletRequest request) throws Exception {
		logger.debug("/fm/farm/deleteFarmerGrantsInfo >>> 호출 >>> ");

		int result = 0;
		try {
			result =+ farmerGrantsInfoService.deleteFarmerGrantsInfo(farmerGrantsInfoVO);
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
