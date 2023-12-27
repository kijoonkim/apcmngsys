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
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.fm.farm.service.FarmLandGrantsInfoLogService;
import com.at.apcss.fm.farm.vo.FarmLandGrantsInfoLogVO;



//import  org.w3c.dom.Document;
//import org.w3c.dom.Element;
//import org.w3c.dom.Node;
//import org.w3c.dom.NodeList;
//import org.xml.sax.SAXException;

//import org.w3c.dom.Document;


@Controller
public class FarmLandGrantsInfoLogController extends BaseController{

	@Resource(name= "farmLandGrantsInfoLogService")
	private FarmLandGrantsInfoLogService farmLandGrantsInfoLogService;

//화면이동
	@RequestMapping(value = "/fm/farm/farmLandGrantsInfoLog.do")
	public String farmLandGrantsInfoLog() {
		return "apcss/fm/farm/farmLandGrantsInfoLog";
	}

// 조회
		@PostMapping(value = "/fm/farm/selectFarmLandGrantsInfoLogList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> selectFarmLandGrantsInfoLogList(Model model, @RequestBody FarmLandGrantsInfoLogVO farmLandGrantsInfoLogVO, HttpServletRequest request) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();
			List<FarmLandGrantsInfoLogVO> resultList = new ArrayList<>();
			try {
				 resultList = farmLandGrantsInfoLogService.selectFarmLandGrantsInfoLogList(farmLandGrantsInfoLogVO);
			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}
			resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
			return getSuccessResponseEntity(resultMap);
		}



		//등록
		@PostMapping(value = "/fm/farm/insertFarmLandGrantsInfoLog.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> insertFarmLandGrantsInfoLog(@RequestBody FarmLandGrantsInfoLogVO farmLandGrantsInfoLogVO, HttpServletRequest requset) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			// validation check

			// audit 항목
			farmLandGrantsInfoLogVO.setSysFrstInptUserId(getUserId());
			farmLandGrantsInfoLogVO.setSysFrstInptPrgrmId(getPrgrmId());
			farmLandGrantsInfoLogVO.setSysLastChgUserId(getUserId());
			farmLandGrantsInfoLogVO.setSysLastChgPrgrmId(getPrgrmId());

			int insertedCnt = 0;

			try {
				insertedCnt = farmLandGrantsInfoLogService.insertFarmLandGrantsInfoLog(farmLandGrantsInfoLogVO);

				String pFrmerSn = "AYTD23";
				String urlstr = "https://uni.agrix.go.kr/api/srvc/farmLandGrantsInfoLog?accessToken=eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE3MTk2NDcyOTI3NzMsImFwaU5tIjoiZmFybWVySW5mbyIsImlzcyI6IlNZU1RFTSJ9.f9oToC5zUynRzK5zCgu-zgvZNJ0bN-MSzA_FQxtaEPY&version=1.0&responseType=xml";
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


		@PostMapping(value = "/fm/farm/multiSaveFarmLandGrantsInfoLogList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> multiSaveFarmLandGrantsInfoLogList(@RequestBody List<FarmLandGrantsInfoLogVO> farmLandGrantsInfoLogVOList, HttpServletRequest request) throws Exception {

			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			int savedCnt = 0;
			try {
				for (FarmLandGrantsInfoLogVO farmLandGrantsInfoLogVO : farmLandGrantsInfoLogVOList) {
					farmLandGrantsInfoLogVO.setSysFrstInptPrgrmId(getPrgrmId());
					farmLandGrantsInfoLogVO.setSysFrstInptUserId(getUserId());
					farmLandGrantsInfoLogVO.setSysLastChgPrgrmId(getPrgrmId());
					farmLandGrantsInfoLogVO.setSysLastChgUserId(getUserId());
				}

				savedCnt = farmLandGrantsInfoLogService.multiSaveFarmLandGrantsInfoLogList(farmLandGrantsInfoLogVOList);
			}catch (Exception e) {
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
			return getSuccessResponseEntity(resultMap);
		}

		@PostMapping(value = "/fm/farm/deleteFarmLandGrantsInfoLog.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> deleteFarmLandGrantsInfoLog(@RequestBody FarmLandGrantsInfoLogVO farmLandGrantsInfoLogVO, HttpServletRequest request) throws Exception {
			logger.debug("/fm/farm/deleteFarmLandGrantsInfoLog >>> 호출 >>> ");

			int result = 0;
			try {
				result =+ farmLandGrantsInfoLogService.deleteFarmLandGrantsInfoLog(farmLandGrantsInfoLogVO);
			}catch (Exception e) {
				return getErrorResponseEntity(e);
			}

			HashMap<String,Object> resultMap = new HashMap<String,Object>();
			resultMap.put("result", result);
			return getSuccessResponseEntity(resultMap);
		}

		@PostMapping(value = "/fm/farm/multiSaveReleyFarmLandGrantsInfoLogList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> multiSaveReleyFarmLandGrantsInfoLogList(@RequestBody FarmLandGrantsInfoLogVO farmLandGrantsInfoLogVO, HttpServletRequest request) throws Exception {
			logger.debug("/fm/farm/SaveFarmerSnList >>> 농업인 번호 연계호출 >>> ");

			int savedCnt = 0;
			int result = 0;
			try {
				//result =+ farmLandGrantsInfoLogService.deletefarmLandGrantsInfoLog(farmLandGrantsInfoLogVO);

                String accessToken = "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE3MTk2NDcyOTI3NzMsImFwaU5tIjoiZmFybWVySW5mbyIsImlzcyI6IlNZU1RFTSJ9.f9oToC5zUynRzK5zCgu-zgvZNJ0bN-MSzA_FQxtaEPY";
                String version = "1.0";
                String responseType = "xml";
                String pFrmerSn =  farmLandGrantsInfoLogVO.getFrmerSn(); //AGUN47

				String urlstr = "https://uni.agrix.go.kr/api/srvc/farmLandGrantsInfoLog?accessToken="+accessToken+"&version="+version+"&responseType="+responseType+"&frmerSn="+pFrmerSn;
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
	                    String frmerSn = getValue("frmerSn", element);
	                    String bzobRgno = getValue("bzobRgno", element);
	                    String mngerRelate = getValue("mngerRelate", element);
	                    String bzmCorpNm = getValue("bzmCorpNm", element);
	                    String addr = getValue("addr", element);
	                    String rrsdAddr = getValue("rrsdAddr", element);
	                    String rdnmAddr = getValue("rdnmAddr", element);
	                    String perCorpDvcdNm = getValue("perCorpDvcdNm", element);
	                    String nafoDvcdNm = getValue("nafoDvcdNm", element);
	                    String telno = getValue("telno", element);
	                    String mblTelno = getValue("mblTelno", element);
	                    String famgStrYmd = getValue("famgStrYmd", element);
	                    String farmngBeginStleCdNm = getValue("farmngBeginStleCdNm", element);
	                    String reprAddr = getValue("reprAddr", element);
	                    String brthdy = getValue("brthdy", element);
	                    String sexdstn = getValue("sexdstn", element);
	                    String rgsde = getValue("rgsde", element);
	                    String updde = getValue("updde", element);
	                    farmLandGrantsInfoLogVO.setFrmerSn(frmerSn);
	                    farmLandGrantsInfoLogVO.setBzobRgno(bzobRgno);
	                    farmLandGrantsInfoLogVO.setMngerRelate(mngerRelate);
	                    farmLandGrantsInfoLogVO.setBzmCorpNm(bzmCorpNm);
	                    farmLandGrantsInfoLogVO.setAddr(addr);
	                    farmLandGrantsInfoLogVO.setRrsdAddr(rrsdAddr);
	                    farmLandGrantsInfoLogVO.setRdnmAddr(rdnmAddr);
	                    farmLandGrantsInfoLogVO.setPerCorpDvcdNm(perCorpDvcdNm);
	                    farmLandGrantsInfoLogVO.setNafoDvcdNm(nafoDvcdNm);
	                    farmLandGrantsInfoLogVO.setTelno(telno);
	                    farmLandGrantsInfoLogVO.setMblTelno(mblTelno);
	                    farmLandGrantsInfoLogVO.setFamgStrYmd(famgStrYmd);
	                    farmLandGrantsInfoLogVO.setFarmngBeginStleCdNm(farmngBeginStleCdNm);
	                    farmLandGrantsInfoLogVO.setReprAddr(reprAddr);
	                    farmLandGrantsInfoLogVO.setBrthdy(brthdy);
	                    farmLandGrantsInfoLogVO.setSexdstn(sexdstn);
	                    farmLandGrantsInfoLogVO.setRgsde(rgsde);
	                    farmLandGrantsInfoLogVO.setUpdde(updde);
	                    farmLandGrantsInfoLogVO.setSysFrstInptPrgrmId(getPrgrmId());
						farmLandGrantsInfoLogVO.setSysFrstInptUserId(getUserId());
						farmLandGrantsInfoLogVO.setSysLastChgPrgrmId(getPrgrmId());
						farmLandGrantsInfoLogVO.setSysLastChgUserId(getUserId());
						farmLandGrantsInfoLogVO.setSaveCd("AGRIX");
	                    savedCnt = farmLandGrantsInfoLogService.insertMegerFarmLandGrantsInfoLog(farmLandGrantsInfoLogVO);
	                    result = farmLandGrantsInfoLogService.insertMegerLogFarmLandGrantsInfoLog(farmLandGrantsInfoLogVO);
	                }
	            }
			}catch (Exception e) {
				return getErrorResponseEntity(e);
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

}
