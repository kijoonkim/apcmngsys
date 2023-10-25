package com.at.apcss.fm.farm.web;

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
import com.at.apcss.fm.farm.service.FarmLandInfoService;
import com.at.apcss.fm.farm.service.RestFulService;
import com.at.apcss.fm.farm.vo.FarmLandInfoVO;
import com.fasterxml.jackson.databind.ObjectMapper;



//import  org.w3c.dom.Document;
//import org.w3c.dom.Element;
//import org.w3c.dom.Node;
//import org.w3c.dom.NodeList;
//import org.xml.sax.SAXException;

//import org.w3c.dom.Document;


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



		//등록
		@PostMapping(value = "/fm/farm/insertFarmLandInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> insertFarmLandInfo(@RequestBody FarmLandInfoVO farmLandInfoVO, HttpServletRequest requset) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			// validation check

			// audit 항목
			farmLandInfoVO.setSysFrstInptUserId(getUserId());
			farmLandInfoVO.setSysFrstInptPrgrmId(getPrgrmId());
			farmLandInfoVO.setSysLastChgUserId(getUserId());
			farmLandInfoVO.setSysLastChgPrgrmId(getPrgrmId());

			int insertedCnt = 0;

			try {
				insertedCnt = farmLandInfoService.insertFarmLandInfo(farmLandInfoVO);

				String pFrmerSn = "AYTD23";
				String urlstr = "https://uni.agrix.go.kr/api/srvc/farmLandInfo?accessToken=eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE3MTk2NDcyOTI3NzMsImFwaU5tIjoiZmFybWVySW5mbyIsImlzcyI6IlNZU1RFTSJ9.f9oToC5zUynRzK5zCgu-zgvZNJ0bN-MSzA_FQxtaEPY&version=1.0&responseType=xml";
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

		@PostMapping(value = "/fm/farm/multiSaveReleyFarmLandInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> SaveFarmerSnList(@RequestBody FarmLandInfoVO farmLandInfoVO, HttpServletRequest request) throws Exception {
			logger.debug("/fm/farm/SavefarmerSnList >>> 농업인 번호 연계호출 >>> ");

			int savedCnt = 0;
			int result = 0;
			try {
				//result =+ farmLandInfoService.deletefarmLandInfo(farmLandInfoVO);

                String accessToken = "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE3MTk2NDcyOTI3NzMsImFwaU5tIjoiZmFybWVySW5mbyIsImlzcyI6IlNZU1RFTSJ9.f9oToC5zUynRzK5zCgu-zgvZNJ0bN-MSzA_FQxtaEPY";
                String version = "1.0";
                String responseType = "xml";
                String pFrmerSn =  farmLandInfoVO.getFrmerSn(); //AGUN47

				String urlstr = "https://uni.agrix.go.kr/api/srvc/farmLandInfo?accessToken="+accessToken+"&version="+version+"&responseType="+responseType+"&frmerSn="+pFrmerSn;
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
	                    farmLandInfoVO.setFrmerSn(frmerSn);
	                    farmLandInfoVO.setBzobRgno(bzobRgno);
	                    farmLandInfoVO.setMngerRelate(mngerRelate);
	                    farmLandInfoVO.setBzmCorpNm(bzmCorpNm);
	                    farmLandInfoVO.setAddr(addr);
	                    farmLandInfoVO.setRrsdAddr(rrsdAddr);
	                    farmLandInfoVO.setRdnmAddr(rdnmAddr);
	                    farmLandInfoVO.setPerCorpDvcdNm(perCorpDvcdNm);
	                    farmLandInfoVO.setNafoDvcdNm(nafoDvcdNm);
	                    farmLandInfoVO.setTelno(telno);
	                    farmLandInfoVO.setMblTelno(mblTelno);
	                    farmLandInfoVO.setFamgStrYmd(famgStrYmd);
	                    farmLandInfoVO.setFarmngBeginStleCdNm(farmngBeginStleCdNm);
	                    farmLandInfoVO.setReprAddr(reprAddr);
	                    farmLandInfoVO.setBrthdy(brthdy);
	                    farmLandInfoVO.setSexdstn(sexdstn);
	                    farmLandInfoVO.setRgsde(rgsde);
	                    farmLandInfoVO.setUpdde(updde);
	                    farmLandInfoVO.setSysFrstInptPrgrmId(getPrgrmId());
						farmLandInfoVO.setSysFrstInptUserId(getUserId());
						farmLandInfoVO.setSysLastChgPrgrmId(getPrgrmId());
						farmLandInfoVO.setSysLastChgUserId(getUserId());
						farmLandInfoVO.setSaveCd("AGRIX");
	                    savedCnt = farmLandInfoService.insertMegerFarmLandInfo(farmLandInfoVO);
	                    result = farmLandInfoService.insertMegerLogFarmLandInfo(farmLandInfoVO);
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





		@PostMapping(value = "/fm/farm/multiSaveReleyFarmLandInfoJsoneList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> multiSaveReleyfarmLandInfoJsoneList(@RequestBody FarmLandInfoVO farmLandInfoVO, HttpServletRequest request) throws Exception {

			logger.debug("/fm/farm/SaveFarmerSnList >>> 농업인 번호 연계호출 jsone >>> ");

			int savedCnt = 0;
			int result = 0;

			String url = "https://uni.agrix.go.kr/api/srvc/farmLandInfo?accessToken=eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE3MTk2NDcyOTI3NzMsImFwaU5tIjoiZmFybWVySW5mbyIsImlzcyI6IlNZU1RFTSJ9.f9oToC5zUynRzK5zCgu-zgvZNJ0bN-MSzA_FQxtaEPY&version=1.0&responseType=json&frmerSn=AGUN47";

			System.out.println("==========================11");

			System.out.println("==========================1");

			try {
				//result =+ farmLandInfoService.deletefarmLandInfo(farmLandInfoVO);

                String accessToken = "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE3MTk2NDcyOTI3NzMsImFwaU5tIjoiZmFybWVySW5mbyIsImlzcyI6IlNZU1RFTSJ9.f9oToC5zUynRzK5zCgu-zgvZNJ0bN-MSzA_FQxtaEPY";
                String version = "1.0";
                //String responseType = "xml";
                String responseType = "json";
                String pFrmerSn =  farmLandInfoVO.getFrmerSn(); //AGUN47

				String urlstr = "https://uni.agrix.go.kr/api/srvc/farmLandInfo?accessToken="+accessToken+"&version="+version+"&responseType="+responseType+"&frmerSn="+pFrmerSn;
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
//								  savedCnt = farmLandInfoService.insertMegerfarmLandInfoMap(mapItem);
//				                  result = farmLandInfoService.insertMegerLogfarmLandInfoMap(mapItem);
								//server.aaa(m)
								//mapper.insert
							//intser into aaa(a, b,c) values(#{brthdy}, #{brthdy2}, #{brthdy})
							}

							savedCnt = farmLandInfoService.insertMegerFarmLandInfoMap(mapItem);
			                 result = farmLandInfoService.insertMegerLogFarmLandInfoMap(mapItem);

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
