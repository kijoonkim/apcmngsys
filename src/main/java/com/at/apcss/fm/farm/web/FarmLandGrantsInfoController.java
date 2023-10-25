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
import com.at.apcss.fm.farm.service.FarmLandGrantsInfoService;
import com.at.apcss.fm.farm.service.RestFulService;
import com.at.apcss.fm.farm.vo.FarmLandGrantsInfoVO;
import com.fasterxml.jackson.databind.ObjectMapper;



//import  org.w3c.dom.Document;
//import org.w3c.dom.Element;
//import org.w3c.dom.Node;
//import org.w3c.dom.NodeList;
//import org.xml.sax.SAXException;

//import org.w3c.dom.Document;


@Controller
public class FarmLandGrantsInfoController extends BaseController{

	@Resource(name= "farmLandGrantsInfoService")
	private FarmLandGrantsInfoService farmLandGrantsInfoService;

//화면이동
	@RequestMapping(value = "/fm/farm/farmLandGrantsInfo.do")
	public String farmLandGrantsInfo() {
		return "apcss/fm/farm/farmLandGrantsInfo";
	}

// 조회
		@PostMapping(value = "/fm/farm/selectFarmLandGrantsInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> selectfarmLandGrantsInfoList(Model model, @RequestBody FarmLandGrantsInfoVO farmLandGrantsInfoVO, HttpServletRequest request) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();
			List<FarmLandGrantsInfoVO> resultList = new ArrayList<>();
			try {
				 resultList = farmLandGrantsInfoService.selectFarmLandGrantsInfoList(farmLandGrantsInfoVO);
			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}
			resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
			return getSuccessResponseEntity(resultMap);
		}



		//등록
		@PostMapping(value = "/fm/farm/insertFarmLandGrantsInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> insertFarmLandGrantsInfo(@RequestBody FarmLandGrantsInfoVO farmLandGrantsInfoVO, HttpServletRequest requset) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			// validation check

			// audit 항목
			farmLandGrantsInfoVO.setSysFrstInptUserId(getUserId());
			farmLandGrantsInfoVO.setSysFrstInptPrgrmId(getPrgrmId());
			farmLandGrantsInfoVO.setSysLastChgUserId(getUserId());
			farmLandGrantsInfoVO.setSysLastChgPrgrmId(getPrgrmId());

			int insertedCnt = 0;

			try {
				insertedCnt = farmLandGrantsInfoService.insertFarmLandGrantsInfo(farmLandGrantsInfoVO);

				String pFrmerSn = "AYTD23";
				String urlstr = "https://uni.agrix.go.kr/api/srvc/farmLandGrantsInfo?accessToken=eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE3MTk2NDcyOTI3NzMsImFwaU5tIjoiZmFybWVySW5mbyIsImlzcyI6IlNZU1RFTSJ9.f9oToC5zUynRzK5zCgu-zgvZNJ0bN-MSzA_FQxtaEPY&version=1.0&responseType=xml";
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


		@PostMapping(value = "/fm/farm/multiSaveFarmLandGrantsInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> multiSaveFarmLandGrantsInfoList(@RequestBody List<FarmLandGrantsInfoVO> farmLandGrantsInfoVOList, HttpServletRequest request) throws Exception {

			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			int savedCnt = 0;
			try {
				for (FarmLandGrantsInfoVO farmLandGrantsInfoVO : farmLandGrantsInfoVOList) {
					farmLandGrantsInfoVO.setSysFrstInptPrgrmId(getPrgrmId());
					farmLandGrantsInfoVO.setSysFrstInptUserId(getUserId());
					farmLandGrantsInfoVO.setSysLastChgPrgrmId(getPrgrmId());
					farmLandGrantsInfoVO.setSysLastChgUserId(getUserId());
				}

				savedCnt = farmLandGrantsInfoService.multiSaveFarmLandGrantsInfoList(farmLandGrantsInfoVOList);
			}catch (Exception e) {
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
			return getSuccessResponseEntity(resultMap);
		}

		//업데이트
		@PostMapping(value = "/fm/farm/updateFarmLandGrantsInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> updateFarmLandGrantsInfo(@RequestBody FarmLandGrantsInfoVO farmLandGrantsInfoVO, HttpServletRequest requset) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();
			logger.info("=============updateFarmLandGrantsInfo=========start====");
			// validation check

			// audit 항목
			farmLandGrantsInfoVO.setSysLastChgUserId(getUserId());
			farmLandGrantsInfoVO.setSysLastChgPrgrmId(getPrgrmId());
			logger.info("");
			logger.info(farmLandGrantsInfoVO.toString());

			int updatedCnt = 0;

			try {
				updatedCnt = farmLandGrantsInfoService.updateFarmLandGrantsInfo(farmLandGrantsInfoVO);
			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_UPDATED_CNT, updatedCnt);
			logger.info("=============updateFarmLandGrantsInfo======end=======");
			return getSuccessResponseEntity(resultMap);
		}

		@PostMapping(value = "/fm/farm/deleteFarmLandGrantsInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> deleteFarmLandGrantsInfo(@RequestBody FarmLandGrantsInfoVO farmLandGrantsInfoVO, HttpServletRequest request) throws Exception {
			logger.debug("/fm/farm/deleteFarmLandGrantsInfo >>> 호출 >>> ");

			int result = 0;
			try {
				result =+ farmLandGrantsInfoService.deleteFarmLandGrantsInfo(farmLandGrantsInfoVO);
			}catch (Exception e) {
				return getErrorResponseEntity(e);
			}

			HashMap<String,Object> resultMap = new HashMap<String,Object>();
			resultMap.put("result", result);
			return getSuccessResponseEntity(resultMap);
		}

		@PostMapping(value = "/fm/farm/multiSaveReleyFarmLandGrantsInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> SaveFarmerSnList(@RequestBody FarmLandGrantsInfoVO farmLandGrantsInfoVO, HttpServletRequest request) throws Exception {
			logger.debug("/fm/farm/SavefarmerSnList >>> 농업인 번호 연계호출 >>> ");

			int savedCnt = 0;
			int result = 0;
			try {
				//result =+ farmLandGrantsInfoService.deletefarmLandGrantsInfo(farmLandGrantsInfoVO);

                String accessToken = "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE3MTk2NDcyOTI3NzMsImFwaU5tIjoiZmFybWVySW5mbyIsImlzcyI6IlNZU1RFTSJ9.f9oToC5zUynRzK5zCgu-zgvZNJ0bN-MSzA_FQxtaEPY";
                String version = "1.0";
                String responseType = "xml";
                String pFrmerSn =  farmLandGrantsInfoVO.getFrmerSn(); //AGUN47

				String urlstr = "https://uni.agrix.go.kr/api/srvc/farmLandGrantsInfo?accessToken="+accessToken+"&version="+version+"&responseType="+responseType+"&frmerSn="+pFrmerSn;
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
	                    farmLandGrantsInfoVO.setFrmerSn(frmerSn);
	                    farmLandGrantsInfoVO.setBzobRgno(bzobRgno);
	                    farmLandGrantsInfoVO.setMngerRelate(mngerRelate);
	                    farmLandGrantsInfoVO.setBzmCorpNm(bzmCorpNm);
	                    farmLandGrantsInfoVO.setAddr(addr);
	                    farmLandGrantsInfoVO.setRrsdAddr(rrsdAddr);
	                    farmLandGrantsInfoVO.setRdnmAddr(rdnmAddr);
	                    farmLandGrantsInfoVO.setPerCorpDvcdNm(perCorpDvcdNm);
	                    farmLandGrantsInfoVO.setNafoDvcdNm(nafoDvcdNm);
	                    farmLandGrantsInfoVO.setTelno(telno);
	                    farmLandGrantsInfoVO.setMblTelno(mblTelno);
	                    farmLandGrantsInfoVO.setFamgStrYmd(famgStrYmd);
	                    farmLandGrantsInfoVO.setFarmngBeginStleCdNm(farmngBeginStleCdNm);
	                    farmLandGrantsInfoVO.setReprAddr(reprAddr);
	                    farmLandGrantsInfoVO.setBrthdy(brthdy);
	                    farmLandGrantsInfoVO.setSexdstn(sexdstn);
	                    farmLandGrantsInfoVO.setRgsde(rgsde);
	                    farmLandGrantsInfoVO.setUpdde(updde);
	                    farmLandGrantsInfoVO.setSysFrstInptPrgrmId(getPrgrmId());
						farmLandGrantsInfoVO.setSysFrstInptUserId(getUserId());
						farmLandGrantsInfoVO.setSysLastChgPrgrmId(getPrgrmId());
						farmLandGrantsInfoVO.setSysLastChgUserId(getUserId());
						farmLandGrantsInfoVO.setSaveCd("AGRIX");
	                    savedCnt = farmLandGrantsInfoService.insertMegerFarmLandGrantsInfo(farmLandGrantsInfoVO);
	                    result = farmLandGrantsInfoService.insertMegerLogFarmLandGrantsInfo(farmLandGrantsInfoVO);
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





		@PostMapping(value = "/fm/farm/multiSaveReleyFarmLandGrantsInfoJsoneList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> multiSaveReleyfarmLandGrantsInfoJsoneList(@RequestBody FarmLandGrantsInfoVO farmLandGrantsInfoVO, HttpServletRequest request) throws Exception {

			logger.debug("/fm/farm/SaveFarmerSnList >>> 농업인 번호 연계호출 jsone >>> ");

			int savedCnt = 0;
			int result = 0;

			String url = "https://uni.agrix.go.kr/api/srvc/farmLandGrantsInfo?accessToken=eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE3MTk2NDcyOTI3NzMsImFwaU5tIjoiZmFybWVySW5mbyIsImlzcyI6IlNZU1RFTSJ9.f9oToC5zUynRzK5zCgu-zgvZNJ0bN-MSzA_FQxtaEPY&version=1.0&responseType=json&frmerSn=AGUN47";

			System.out.println("==========================11");

			System.out.println("==========================1");

			try {
				//result =+ farmLandGrantsInfoService.deletefarmLandGrantsInfo(farmLandGrantsInfoVO);

                String accessToken = "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE3MTk2NDcyOTI3NzMsImFwaU5tIjoiZmFybWVySW5mbyIsImlzcyI6IlNZU1RFTSJ9.f9oToC5zUynRzK5zCgu-zgvZNJ0bN-MSzA_FQxtaEPY";
                String version = "1.0";
                //String responseType = "xml";
                String responseType = "json";
                String pFrmerSn =  farmLandGrantsInfoVO.getFrmerSn(); //AGUN47

				String urlstr = "https://uni.agrix.go.kr/api/srvc/farmLandGrantsInfo?accessToken="+accessToken+"&version="+version+"&responseType="+responseType+"&frmerSn="+pFrmerSn;
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
//								  savedCnt = farmLandGrantsInfoService.insertMegerfarmLandGrantsInfoMap(mapItem);
//				                  result = farmLandGrantsInfoService.insertMegerLogfarmLandGrantsInfoMap(mapItem);
								//server.aaa(m)
								//mapper.insert
							//intser into aaa(a, b,c) values(#{brthdy}, #{brthdy2}, #{brthdy})
							}

							savedCnt = farmLandGrantsInfoService.insertMegerFarmLandGrantsInfoMap(mapItem);
			                 result = farmLandGrantsInfoService.insertMegerLogFarmLandGrantsInfoMap(mapItem);

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
