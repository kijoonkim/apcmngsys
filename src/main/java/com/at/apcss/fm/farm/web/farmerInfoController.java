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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.at.apcss.am.apc.service.ApcEvrmntStngService;
import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.fm.dashboard.service.DashboardService;
import com.at.apcss.fm.dashboard.vo.DashboardVO;
import com.at.apcss.fm.fclt.service.FcltOperInfoClctAgreInfoService;
import com.at.apcss.fm.fclt.vo.FcltOperInfoClctAgreInfoVO;

import ch.qos.logback.core.pattern.parser.Node;

import com.at.apcss.fm.farm.service.farmerInfoService;
import com.at.apcss.fm.farm.vo.farmerInfoVO;



//import  org.w3c.dom.Document;
//import org.w3c.dom.Element;
//import org.w3c.dom.Node;
//import org.w3c.dom.NodeList;
//import org.xml.sax.SAXException;

//import org.w3c.dom.Document;


@Controller
public class farmerInfoController extends BaseController{

	@Resource(name= "farmerInfoService")
	private farmerInfoService farmerInfoService;

//화면이동
	@RequestMapping(value = "/fm/farm/farmerInfo.do")
	public String farmerInfo() {
		return "apcss/fm/farm/farmerInfo";
	}

// 조회
		@PostMapping(value = "/fm/farm/selectfarmerInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> selectfarmerInfoList(Model model, @RequestBody farmerInfoVO farmerInfoVO, HttpServletRequest request) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();
			List<farmerInfoVO> resultList = new ArrayList<>();
			try {
				 resultList = farmerInfoService.selectfarmerInfoList(farmerInfoVO);
			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}
			resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
			return getSuccessResponseEntity(resultMap);
		}



		//등록
		@PostMapping(value = "/fm/farm/insertfarmerInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> insertfarmerInfo(@RequestBody farmerInfoVO farmerInfoVO, HttpServletRequest requset) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			// validation check

			// audit 항목
			farmerInfoVO.setSysFrstInptUserId(getUserId());
			farmerInfoVO.setSysFrstInptPrgrmId(getPrgrmId());
			farmerInfoVO.setSysLastChgUserId(getUserId());
			farmerInfoVO.setSysLastChgPrgrmId(getPrgrmId());

			int insertedCnt = 0;

			try {
				insertedCnt = farmerInfoService.insertfarmerInfo(farmerInfoVO);

				String pFrmerSn = "AYTD23";
				String urlstr = "https://uni.agrix.go.kr/api/srvc/farmerInfo?accessToken=eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE3MTk2NDcyOTI3NzMsImFwaU5tIjoiZmFybWVySW5mbyIsImlzcyI6IlNZU1RFTSJ9.f9oToC5zUynRzK5zCgu-zgvZNJ0bN-MSzA_FQxtaEPY&version=1.0&responseType=xml";
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


		@PostMapping(value = "/fm/farm/multiSavefarmerInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> multiSavefarmerInfoList(@RequestBody List<farmerInfoVO> farmerInfoVOList, HttpServletRequest request) throws Exception {

			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			int savedCnt = 0;
			try {
				for (farmerInfoVO farmerInfoVO : farmerInfoVOList) {
					farmerInfoVO.setSysFrstInptPrgrmId(getPrgrmId());
					farmerInfoVO.setSysFrstInptUserId(getUserId());
					farmerInfoVO.setSysLastChgPrgrmId(getPrgrmId());
					farmerInfoVO.setSysLastChgUserId(getUserId());
				}

				savedCnt = farmerInfoService.multiSavefarmerInfoList(farmerInfoVOList);
			}catch (Exception e) {
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
			return getSuccessResponseEntity(resultMap);
		}

		@PostMapping(value = "/fm/farm/deletefarmerInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> deletefarmerInfo(@RequestBody farmerInfoVO farmerInfoVO, HttpServletRequest request) throws Exception {
			logger.debug("/fm/farm/deletefarmerInfo >>> 호출 >>> ");

			int result = 0;
			try {
				result =+ farmerInfoService.deletefarmerInfo(farmerInfoVO);
			}catch (Exception e) {
				return getErrorResponseEntity(e);
			}

			HashMap<String,Object> resultMap = new HashMap<String,Object>();
			resultMap.put("result", result);
			return getSuccessResponseEntity(resultMap);
		}

}
