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
import com.at.apcss.fm.farm.service.FarmerEducationInfoLogService;
import com.at.apcss.fm.farm.vo.FarmerEducationInfoLogVO;



//import  org.w3c.dom.Document;
//import org.w3c.dom.Element;
//import org.w3c.dom.Node;
//import org.w3c.dom.NodeList;
//import org.xml.sax.SAXException;

//import org.w3c.dom.Document;


@Controller
public class FarmerEducationInfoLogController extends BaseController{

	@Resource(name= "farmerEducationInfoLogService")
	private FarmerEducationInfoLogService farmerEducationInfoLogService;

//화면이동
	@RequestMapping(value = "/fm/farm/farmerEducationInfoLog.do")
	public String farmerEducationInfoLog() {
		return "apcss/fm/farm/farmerEducationInfoLog";
	}

// 조회
		@PostMapping(value = "/fm/farm/selectfarmerEducationInfoLogList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> selectfarmerEducationInfoLogList(Model model, @RequestBody FarmerEducationInfoLogVO farmerEducationInfoLogVO, HttpServletRequest request) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();
			List<FarmerEducationInfoLogVO> resultList = new ArrayList<>();
			try {
				 resultList = farmerEducationInfoLogService.selectfarmerEducationInfoLogList(farmerEducationInfoLogVO);
			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}
			resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
			return getSuccessResponseEntity(resultMap);
		}



		//등록
		@PostMapping(value = "/fm/farm/insertfarmerEducationInfoLog.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> insertfarmerEducationInfoLog(@RequestBody FarmerEducationInfoLogVO farmerEducationInfoLogVO, HttpServletRequest requset) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			// validation check

			// audit 항목
			farmerEducationInfoLogVO.setSysFrstInptUserId(getUserId());
			farmerEducationInfoLogVO.setSysFrstInptPrgrmId(getPrgrmId());
			farmerEducationInfoLogVO.setSysLastChgUserId(getUserId());
			farmerEducationInfoLogVO.setSysLastChgPrgrmId(getPrgrmId());

			int insertedCnt = 0;

			try {
				insertedCnt = farmerEducationInfoLogService.insertfarmerEducationInfoLog(farmerEducationInfoLogVO);

				String pFrmerSn = "AYTD23";
				String urlstr = "https://uni.agrix.go.kr/api/srvc/farmerEducationInfoLog?accessToken=eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE3MTk2NDcyOTI3NzMsImFwaU5tIjoiZmFybWVySW5mbyIsImlzcyI6IlNZU1RFTSJ9.f9oToC5zUynRzK5zCgu-zgvZNJ0bN-MSzA_FQxtaEPY&version=1.0&responseType=xml";
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


		@PostMapping(value = "/fm/farm/multiSavefarmerEducationInfoLogList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> multiSavefarmerEducationInfoLogList(@RequestBody List<FarmerEducationInfoLogVO> farmerEducationInfoLogVOList, HttpServletRequest request) throws Exception {

			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			int savedCnt = 0;
			try {
				for (FarmerEducationInfoLogVO farmerEducationInfoLogVO : farmerEducationInfoLogVOList) {
					farmerEducationInfoLogVO.setSysFrstInptPrgrmId(getPrgrmId());
					farmerEducationInfoLogVO.setSysFrstInptUserId(getUserId());
					farmerEducationInfoLogVO.setSysLastChgPrgrmId(getPrgrmId());
					farmerEducationInfoLogVO.setSysLastChgUserId(getUserId());
				}

				savedCnt = farmerEducationInfoLogService.multiSavefarmerEducationInfoLogList(farmerEducationInfoLogVOList);
			}catch (Exception e) {
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
			return getSuccessResponseEntity(resultMap);
		}

		@PostMapping(value = "/fm/farm/deletefarmerEducationInfoLog.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> deletefarmerEducationInfoLog(@RequestBody FarmerEducationInfoLogVO farmerEducationInfoLogVO, HttpServletRequest request) throws Exception {
			logger.debug("/fm/farm/deletefarmerEducationInfoLog >>> 호출 >>> ");

			int result = 0;
			try {
				result =+ farmerEducationInfoLogService.deletefarmerEducationInfoLog(farmerEducationInfoLogVO);
			}catch (Exception e) {
				return getErrorResponseEntity(e);
			}

			HashMap<String,Object> resultMap = new HashMap<String,Object>();
			resultMap.put("result", result);
			return getSuccessResponseEntity(resultMap);
		}

		@PostMapping(value = "/fm/farm/multiSaveReleyfarmerEducationInfoLogList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> multiSaveReleyfarmerEducationInfoLogList(@RequestBody FarmerEducationInfoLogVO farmerEducationInfoLogVO, HttpServletRequest request) throws Exception {
			logger.debug("/fm/farm/SavefarmerSnList >>> 농업인 번호 연계호출 >>> ");

			int savedCnt = 0;
			int result = 0;
			try {
				//result =+ farmerEducationInfoLogService.deletefarmerEducationInfoLog(farmerEducationInfoLogVO);

                String accessToken = "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE3MTk2NDcyOTI3NzMsImFwaU5tIjoiZmFybWVySW5mbyIsImlzcyI6IlNZU1RFTSJ9.f9oToC5zUynRzK5zCgu-zgvZNJ0bN-MSzA_FQxtaEPY";
                String version = "1.0";
                String responseType = "xml";
                String pFrmerSn =  farmerEducationInfoLogVO.getFrmerSn(); //AGUN47

				String urlstr = "https://uni.agrix.go.kr/api/srvc/farmerEducationInfoLog?accessToken="+accessToken+"&version="+version+"&responseType="+responseType+"&frmerSn="+pFrmerSn;
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
	                    farmerEducationInfoLogVO.setFrmerSn(frmerSn);
	                    farmerEducationInfoLogVO.setBzobRgno(bzobRgno);
	                    farmerEducationInfoLogVO.setMngerRelate(mngerRelate);
	                    farmerEducationInfoLogVO.setBzmCorpNm(bzmCorpNm);
	                    farmerEducationInfoLogVO.setAddr(addr);
	                    farmerEducationInfoLogVO.setRrsdAddr(rrsdAddr);
	                    farmerEducationInfoLogVO.setRdnmAddr(rdnmAddr);
	                    farmerEducationInfoLogVO.setPerCorpDvcdNm(perCorpDvcdNm);
	                    farmerEducationInfoLogVO.setNafoDvcdNm(nafoDvcdNm);
	                    farmerEducationInfoLogVO.setTelno(telno);
	                    farmerEducationInfoLogVO.setMblTelno(mblTelno);
	                    farmerEducationInfoLogVO.setFamgStrYmd(famgStrYmd);
	                    farmerEducationInfoLogVO.setFarmngBeginStleCdNm(farmngBeginStleCdNm);
	                    farmerEducationInfoLogVO.setReprAddr(reprAddr);
	                    farmerEducationInfoLogVO.setBrthdy(brthdy);
	                    farmerEducationInfoLogVO.setSexdstn(sexdstn);
	                    farmerEducationInfoLogVO.setRgsde(rgsde);
	                    farmerEducationInfoLogVO.setUpdde(updde);
	                    farmerEducationInfoLogVO.setSysFrstInptPrgrmId(getPrgrmId());
						farmerEducationInfoLogVO.setSysFrstInptUserId(getUserId());
						farmerEducationInfoLogVO.setSysLastChgPrgrmId(getPrgrmId());
						farmerEducationInfoLogVO.setSysLastChgUserId(getUserId());
						farmerEducationInfoLogVO.setSaveCd("AGRIX");
	                    savedCnt = farmerEducationInfoLogService.insertMegerfarmerEducationInfoLog(farmerEducationInfoLogVO);
	                    result = farmerEducationInfoLogService.insertMegerLogfarmerEducationInfoLog(farmerEducationInfoLogVO);
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

}
