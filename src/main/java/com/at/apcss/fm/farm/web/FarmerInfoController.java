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
import com.at.apcss.co.user.service.ComUserService;
import com.at.apcss.co.user.vo.ComUserVO;
import com.at.apcss.fm.farm.service.FarmerInfoService;
import com.at.apcss.fm.farm.service.RestFulService;
import com.at.apcss.fm.farm.vo.FarmerInfoVO;


@Controller
public class FarmerInfoController extends BaseController{

	@Resource(name= "farmerInfoService")
	private FarmerInfoService farmerInfoService;


	@Resource(name= "comUserService")
	private ComUserService comUserService;

	//화면이동
	@RequestMapping(value = "/fm/farm/farmerInfo.do")
	public String farmerInfo() {
		return "apcss/fm/farm/farmerInfo";
	}


	// 조회
	@PostMapping(value = "/fm/farm/selectFarmerInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectfarmerInfoList(Model model, @RequestBody FarmerInfoVO farmerInfoVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<FarmerInfoVO> resultList = new ArrayList<>();
		try {
			 resultList = farmerInfoService.selectFarmerInfoList(farmerInfoVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}



	//등록
	@PostMapping(value = "/fm/farm/insertFarmerInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertFarmerInfo(@RequestBody FarmerInfoVO farmerInfoVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		farmerInfoVO.setSysFrstInptUserId(getUserId());
		farmerInfoVO.setSysFrstInptPrgrmId(getPrgrmId());
		farmerInfoVO.setSysLastChgUserId(getUserId());
		farmerInfoVO.setSysLastChgPrgrmId(getPrgrmId());

		int insertedCnt = 0;

		try {
			insertedCnt = farmerInfoService.insertFarmerInfo(farmerInfoVO);

			String pFrmerSn = "AYTD23";
			String urlstr = "https://uni.agrix.go.kr/api/srvc/farmerInfo?accessToken=eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE3MTk2NDcyOTI3NzMsImFwaU5tIjoiZmFybWVySW5mbyIsImlzcyI6IlNZU1RFTSJ9.f9oToC5zUynRzK5zCgu-zgvZNJ0bN-MSzA_FQxtaEPY&version=1.0&responseType=xml";
			String pParam = urlstr+"&frmerSn="+pFrmerSn;

			URL url = new URL(pParam);
			//HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();


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


	@PostMapping(value = "/fm/farm/multiSaveFarmerInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> multiSaveFarmerInfoList(@RequestBody List<FarmerInfoVO> farmerInfoVOList, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		int savedCnt = 0;
		try {
			for (FarmerInfoVO farmerInfoVO : farmerInfoVOList) {
				farmerInfoVO.setSysFrstInptPrgrmId(getPrgrmId());
				farmerInfoVO.setSysFrstInptUserId(getUserId());
				farmerInfoVO.setSysLastChgPrgrmId(getPrgrmId());
				farmerInfoVO.setSysLastChgUserId(getUserId());
			}

			savedCnt = farmerInfoService.multiSaveFarmerInfoList(farmerInfoVOList);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
		return getSuccessResponseEntity(resultMap);
	}

	//업데이트
	@PostMapping(value = "/fm/farm/updateFarmerInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateFarmerInfo(@RequestBody FarmerInfoVO farmerInfoVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		logger.info("=============updateFarmerInfo=========start====");
		// validation check

		// audit 항목
		farmerInfoVO.setSysLastChgUserId(getUserId());
		farmerInfoVO.setSysLastChgPrgrmId(getPrgrmId());
		logger.info("");
		logger.info(farmerInfoVO.toString());

		int updatedCnt = 0;

		try {
			updatedCnt = farmerInfoService.updateFarmerInfo(farmerInfoVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_UPDATED_CNT, updatedCnt);
		logger.info("=============updateFarmerInfo======end=======");
		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/fm/farm/deleteFarmerInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteFarmerInfo(@RequestBody FarmerInfoVO farmerInfoVO, HttpServletRequest request) throws Exception {
		logger.debug("/fm/farm/deleteFarmerInfo >>> 호출 >>> ");

		int result = 0;
		try {
			result =+ farmerInfoService.deleteFarmerInfo(farmerInfoVO);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("result", result);
		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/fm/farm/multiSaveReleyFarmerInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> SaveFarmerSnList(@RequestBody FarmerInfoVO farmerInfoVO, HttpServletRequest request) throws Exception {
		logger.debug("/fm/farm/SavefarmerSnList >>> 농업인 번호 연계호출 >>> ");

		int savedCnt = 0;
		int result = 0;
		try {
			//result =+ farmerInfoService.deletefarmerInfo(farmerInfoVO);

			String accessToken = "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE3MTk2NDcyOTI3NzMsImFwaU5tIjoiZmFybWVySW5mbyIsImlzcyI6IlNZU1RFTSJ9.f9oToC5zUynRzK5zCgu-zgvZNJ0bN-MSzA_FQxtaEPY";
			String version = "1.0";
			String responseType = "xml";
			String pFrmerSn =  farmerInfoVO.getFrmerSn(); //AGUN47

			String urlstr = "https://uni.agrix.go.kr/api/srvc/farmerInfo?accessToken="+accessToken+"&version="+version+"&responseType="+responseType+"&frmerSn="+pFrmerSn;
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
					farmerInfoVO.setFrmerSn(frmerSn);
					farmerInfoVO.setBzobRgno(bzobRgno);
					farmerInfoVO.setMngerRelate(mngerRelate);
					farmerInfoVO.setBzmCorpNm(bzmCorpNm);
					farmerInfoVO.setAddr(addr);
					farmerInfoVO.setRrsdAddr(rrsdAddr);
					farmerInfoVO.setRdnmAddr(rdnmAddr);
					farmerInfoVO.setPerCorpDvcdNm(perCorpDvcdNm);
					farmerInfoVO.setNafoDvcdNm(nafoDvcdNm);
					farmerInfoVO.setTelno(telno);
					farmerInfoVO.setMblTelno(mblTelno);
					farmerInfoVO.setFamgStrYmd(famgStrYmd);
					farmerInfoVO.setFarmngBeginStleCdNm(farmngBeginStleCdNm);
					farmerInfoVO.setReprAddr(reprAddr);
					farmerInfoVO.setBrthdy(brthdy);
					farmerInfoVO.setSexdstn(sexdstn);
					farmerInfoVO.setRgsde(rgsde);
					farmerInfoVO.setUpdde(updde);
					farmerInfoVO.setSysFrstInptPrgrmId(getPrgrmId());
					farmerInfoVO.setSysFrstInptUserId(getUserId());
					farmerInfoVO.setSysLastChgPrgrmId(getPrgrmId());
					farmerInfoVO.setSysLastChgUserId(getUserId());
					farmerInfoVO.setSaveCd("AGRIX");
					savedCnt = farmerInfoService.insertMergeFarmerInfo(farmerInfoVO);
					result = farmerInfoService.insertMergeLogFarmerInfo(farmerInfoVO);
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





	@PostMapping(value = "/fm/farm/multiSaveReleyFarmerInfoJsoneList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> multiSaveReleyfarmerInfoJsoneList(@RequestBody FarmerInfoVO farmerInfoVO, HttpServletRequest request) throws Exception {

		logger.debug("/fm/farm/SaveFarmerSnList >>> 농업인 번호 연계호출 jsone >>> ");

		int savedCnt = 0;
		int result = 0;

		//String url = "https://uni.agrix.go.kr/api/srvc/farmerInfo?accessToken=eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE3MTk2NDcyOTI3NzMsImFwaU5tIjoiZmFybWVySW5mbyIsImlzcyI6IlNZU1RFTSJ9.f9oToC5zUynRzK5zCgu-zgvZNJ0bN-MSzA_FQxtaEPY&version=1.0&responseType=json&frmerSn=AGUN47";

		//System.out.println("==========================11");

		//System.out.println("==========================1");

		try {
			//result =+ farmerInfoService.deletefarmerInfo(farmerInfoVO);

			String accessToken = "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE3MTk2NDcyOTI3NzMsImFwaU5tIjoiZmFybWVySW5mbyIsImlzcyI6IlNZU1RFTSJ9.f9oToC5zUynRzK5zCgu-zgvZNJ0bN-MSzA_FQxtaEPY";
			String version = "1.0";
			//String responseType = "xml";
			String responseType = "json";
			String pFrmerSn =  farmerInfoVO.getFrmerSn(); //AGUN47

			String urlstr = "https://uni.agrix.go.kr/api/srvc/farmerInfo?accessToken="+accessToken+"&version="+version+"&responseType="+responseType+"&frmerSn="+pFrmerSn;
			//System.out.println("urlstr============"+urlstr);

			//HashMap<String, Object> hMap = new HashMap<>();
			//	hMap.put("frmerSn", "AGUN47");

			//ObjectMapper objectMapper = new ObjectMapper();
			String jsonStr = "";
			//jsonStr = objectMapper.writeValueAsString(hMap);
			RestFulService restFulService = new RestFulService();
			//System.out.println("=====================");
			//Map rtnData = (Map) restFulService.clear().get().contentType(new MediaType(MediaType.APPLICATION_JSON)).baseUrl(url).body(jsonStr).execute().bodyToData(Map.class);

			Map rtnData = (Map) restFulService.clear().get().contentType(new MediaType(MediaType.APPLICATION_JSON)).baseUrl(urlstr).body(jsonStr).execute().bodyToData(Map.class);

			//System.out.println(rtnData);
			Map<String, Object> mapItems = (Map<String, Object>) rtnData.get("items");

			for (String key : mapItems.keySet()) {
				//System.out.println("key = " + key);
				//System.out.println(mapItems.get(key));

				if ("item".equals(key)) {
					List<Map> list = (List<Map>) mapItems.get(key);

					for (Map<String, String> mapItem : list) {

						for (String key2 : mapItem.keySet()) {
							//System.out.println("item key2 = " + key2);
							//System.out.println(mapItem.get(key2));
							//savedCnt = farmerInfoService.insertMergefarmerInfoMap(mapItem);
							//result = farmerInfoService.insertMergeLogfarmerInfoMap(mapItem);
							//server.aaa(m)
							//mapper.insert
						//intser into aaa(a, b,c) values(#{brthdy}, #{brthdy2}, #{brthdy})
						}
						mapItem.put("sysFrstInptUserId", getUserId());
						mapItem.put("sysFrstInptPrgrmId", getPrgrmId());
						mapItem.put("sysLastChgUserId", getUserId());
						mapItem.put("sysLastChgPrgrmId", getPrgrmId());
						mapItem.put("saveCd", "AGRIX");
						savedCnt = farmerInfoService.insertMergeFarmerInfoMap(mapItem);
						result = farmerInfoService.insertMergeLogFarmerInfoMap(mapItem);

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











	@PostMapping(value = "/fm/farm/multiSaveReleyFarmerInfoJsoneBcnoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> multiSaveReleyFarmerInfoJsoneBcnoList(@RequestBody FarmerInfoVO farmerInfoVO, HttpServletRequest request) throws Exception {

		logger.debug("/fm/farm/SaveFarmerSnList >>> 농업인 번호 연계호출 jsone >>> ");

		int savedCnt = 0;
		int result = 0;

		String frmerSn = "";

		if(!farmerInfoVO.getCrno().equals("") && !farmerInfoVO.getCrno().equals(null)) {
			String accessTokenaCrno = "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE3MTk2NDkzOTQ2NjksImFwaU5tIjoic2VhcmNoQ29ycEZhcm1lck5vIiwiaXNzIjoiU1lTVEVNIn0.ODINmzO1q93pfyCvsB1r-en3ebWIPOLRfUpfcMGKcbA";
			String version = "1.0";
			//String responseType = "xml";
			String responseType = "json";
			String pCrno = farmerInfoVO.getCrno();

			String crnoUrlstr = "https://uni.agrix.go.kr/api/srvc/searchCorpFarmerNo?accessToken="+accessTokenaCrno+"&version="+version+"&responseType="+responseType+"&bzmCorpNo="+pCrno;



			//ObjectMapper objectMapper = new ObjectMapper();
			String jsonStr = "";
			//jsonStr = objectMapper.writeValueAsString(hMap);
			RestFulService restFulService = new RestFulService();
			//System.out.println("=====================");
			//Map rtnData = (Map) restFulService.clear().get().contentType(new MediaType(MediaType.APPLICATION_JSON)).baseUrl(url).body(jsonStr).execute().bodyToData(Map.class);

			Map rtnData = (Map) restFulService.clear().get().contentType(new MediaType(MediaType.APPLICATION_JSON)).baseUrl(crnoUrlstr).body(jsonStr).execute().bodyToData(Map.class);

			//System.out.println(rtnData);
			Map<String, Object> mapItems = (Map<String, Object>) rtnData.get("items");
			if(mapItems != null) {
				for (String key : mapItems.keySet()) {
					//System.out.println("key = " + key);
					//System.out.println(mapItems.get(key));

					if ("item".equals(key)) {
						List<Map> list = (List<Map>) mapItems.get(key);

						for (Map<String, String> mapItem : list) {

							for (String key2 : mapItem.keySet()) {
								//System.out.println("key2item key2 ===== " + key2);
								//System.out.println("mapItem.get(key2) ====  "+mapItem.get(key2));
								if(key2.equals("frmerSn")) {
									if(mapItem.get(key2) != null) {
										frmerSn = mapItem.get(key2);
									}
								}
								//savedCnt = apcFarmOgnzInfoService.insertMergeapcFarmOgnzInfoMap(mapItem);
								//result = apcFarmOgnzInfoService.insertMergeLogapcFarmOgnzInfoMap(mapItem);
								//server.aaa(m)
								//mapper.insert
								//intser into aaa(a, b,c) values(#{brthdy}, #{brthdy2}, #{brthdy})
							}

							//savedCnt = apcFarmOgnzInfoService.insertMergeApcFarmOgnzInfoMap(mapItem);
							//result = apcFarmOgnzInfoService.insertMergeLogApcFarmOgnzInfoMap(mapItem);

						}
					}
				}
			}

			//System.out.println("urlstr============"+crnoUrlstr);
		}


		String url = "https://uni.agrix.go.kr/api/srvc/farmerInfo?accessToken=eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE3MTk2NDcyOTI3NzMsImFwaU5tIjoiZmFybWVySW5mbyIsImlzcyI6IlNZU1RFTSJ9.f9oToC5zUynRzK5zCgu-zgvZNJ0bN-MSzA_FQxtaEPY&version=1.0&responseType=json&frmerSn=AGUN47";
		//System.out.println("==========================11");
		//System.out.println("==========================1");

		try {
			//result =+ farmerInfoService.deletefarmerInfo(farmerInfoVO);

			String accessToken = "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE3MTk2NDcyOTI3NzMsImFwaU5tIjoiZmFybWVySW5mbyIsImlzcyI6IlNZU1RFTSJ9.f9oToC5zUynRzK5zCgu-zgvZNJ0bN-MSzA_FQxtaEPY";
			String version = "1.0";
			//String responseType = "xml";
			String responseType = "json";
			//String pFrmerSn =  farmerInfoVO.getFrmerSn(); //AGUN47
			String pFrmerSn =   frmerSn ; //AGUN47

			String urlstr = "https://uni.agrix.go.kr/api/srvc/farmerInfo?accessToken="+accessToken+"&version="+version+"&responseType="+responseType+"&frmerSn="+pFrmerSn;
			//System.out.println("urlstr============"+urlstr);

			//HashMap<String, Object> hMap = new HashMap<>();
			//hMap.put("frmerSn", "AGUN47");

			//ObjectMapper objectMapper = new ObjectMapper();
			String jsonStr = "";
			//	jsonStr = objectMapper.writeValueAsString(hMap);
			RestFulService restFulService = new RestFulService();
			//System.out.println("=====================");
			//Map rtnData = (Map) restFulService.clear().get().contentType(new MediaType(MediaType.APPLICATION_JSON)).baseUrl(url).body(jsonStr).execute().bodyToData(Map.class);

			Map rtnData = (Map) restFulService.clear().get().contentType(new MediaType(MediaType.APPLICATION_JSON)).baseUrl(urlstr).body(jsonStr).execute().bodyToData(Map.class);

			//System.out.println(rtnData);
			Map<String, Object> mapItems = (Map<String, Object>) rtnData.get("items");

			for (String key : mapItems.keySet()) {
				//System.out.println("key = " + key);
				//System.out.println(mapItems.get(key));

				if ("item".equals(key)) {
					List<Map> list = (List<Map>) mapItems.get(key);

					for (Map<String, String> mapItem : list) {

						for (String key2 : mapItem.keySet()) {
							//System.out.println("item key2 = " + key2);
							//System.out.println(mapItem.get(key2));
							//savedCnt = farmerInfoService.insertMergefarmerInfoMap(mapItem);
							//result = farmerInfoService.insertMergeLogfarmerInfoMap(mapItem);
							//server.aaa(m)
							//mapper.insert
							//intser into aaa(a, b,c) values(#{brthdy}, #{brthdy2}, #{brthdy})
						}
						mapItem.put("sysFrstInptUserId", getUserId());
						mapItem.put("sysFrstInptPrgrmId", getPrgrmId());
						mapItem.put("sysLastChgUserId", getUserId());
						mapItem.put("sysLastChgPrgrmId", getPrgrmId());
						mapItem.put("saveCd", "AGRIX");
						savedCnt = farmerInfoService.insertMergeFarmerInfoMap(mapItem);
						result = farmerInfoService.insertMergeLogFarmerInfoMap(mapItem);

					}
				}
			}

		}catch (Exception ex) {
			ex.printStackTrace();
		}

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
		resultMap.put("result", result);
		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/fm/farm/multiSaveReleyFarmerInfoJsoneBrdtList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> multiSaveReleyFarmerInfoJsoneBrdtList(@RequestBody FarmerInfoVO farmerInfoVO, HttpServletRequest request) throws Exception {

		logger.debug("/fm/farm/multiSaveReleyFarmerInfoJsoneBrdtList >>> 농업인 번호 연계호출 jsone >>> ");

		int savedCnt = 0;
		int result = 0;
		String frmerSn = "";

		if(!farmerInfoVO.getBrthdy().equals("") && !farmerInfoVO.getBrthdy().equals(null)) {
			String accessTokenaBirth = "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE3MTk2NDkzODUyODQsImFwaU5tIjoic2VhcmNoRmFybWVyTm8iLCJpc3MiOiJTWVNURU0ifQ.O6g894gme_4SuYV1x9hyow-8v2X3zNCc6dzHeNIjP38";
			String version = "1.0";
			//String responseType = "xml";
			String responseType = "json";
			String pBirthDay = farmerInfoVO.getBrthdy();
			String pNm =  farmerInfoVO.getReprNm(); //AGUN47

			String birthUrlstr = "https://uni.agrix.go.kr/api/srvc/searchFarmerNo?accessToken="+accessTokenaBirth+"&version="+version+"&responseType="+responseType+"&birthDay="+pBirthDay+"&nm="+pNm;
			//System.out.println("birthUrlstr ======================"+birthUrlstr);
			//System.out.println("birthUrlstr ======================"+birthUrlstr);


			//ObjectMapper objectMapper = new ObjectMapper();
			String jsonStr = "";
			//jsonStr = objectMapper.writeValueAsString(hMap);
			RestFulService restFulService = new RestFulService();
			//System.out.println("=====================");
			//Map rtnData = (Map) restFulService.clear().get().contentType(new MediaType(MediaType.APPLICATION_JSON)).baseUrl(url).body(jsonStr).execute().bodyToData(Map.class);

			Map rtnData = (Map) restFulService.clear().get().contentType(new MediaType(MediaType.APPLICATION_JSON)).baseUrl(birthUrlstr).body(jsonStr).execute().bodyToData(Map.class);

			//System.out.println(rtnData);
			//System.out.println("rtnData======20240117=====: "+rtnData);
			Map<String, Object> mapItems = (Map<String, Object>) rtnData.get("items");
			if(mapItems != null) {
				for (String key : mapItems.keySet()) {
					//System.out.println("key = " + key);
					//System.out.println(mapItems.get(key));

					if ("item".equals(key)) {
						List<Map> list = (List<Map>) mapItems.get(key);
						for (Map<String, String> mapItem : list) {
							for (String key2 : mapItem.keySet()) {
								//System.out.println("key2item key2 ===== " + key2);
								//System.out.println("mapItem.get(key2) ====  "+mapItem.get(key2));
								//key2item key2 ===== frmerSn
								//mapItem.get(key2) ====  R5JR11
								if(key2.equals("frmerSn")) {
									if(mapItem.get(key2) != null) {
										frmerSn = mapItem.get(key2);
									}
								}
								//savedCnt = apcFarmOgnzInfoService.insertMergeapcFarmOgnzInfoMap(mapItem);
								//result = apcFarmOgnzInfoService.insertMergeLogapcFarmOgnzInfoMap(mapItem);
								//server.aaa(m)
								//mapper.insert
								//intser into aaa(a, b,c) values(#{brthdy}, #{brthdy2}, #{brthdy})
							}
							//savedCnt = apcFarmOgnzInfoService.insertMergeApcFarmOgnzInfoMap(mapItem);
							//result = apcFarmOgnzInfoService.insertMergeLogApcFarmOgnzInfoMap(mapItem);
						}
					}
				}
			}
			//System.out.println("urlstr============"+birthUrlstr);
		}

		String url = "https://uni.agrix.go.kr/api/srvc/farmerInfo?accessToken=eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE3MTk2NDcyOTI3NzMsImFwaU5tIjoiZmFybWVySW5mbyIsImlzcyI6IlNZU1RFTSJ9.f9oToC5zUynRzK5zCgu-zgvZNJ0bN-MSzA_FQxtaEPY&version=1.0&responseType=json&frmerSn=AGUN47";
		//System.out.println("==========================11");
		//System.out.println("==========================1");
		try {
			//result =+ farmerInfoService.deletefarmerInfo(farmerInfoVO);
			String accessToken = "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE3MTk2NDcyOTI3NzMsImFwaU5tIjoiZmFybWVySW5mbyIsImlzcyI6IlNZU1RFTSJ9.f9oToC5zUynRzK5zCgu-zgvZNJ0bN-MSzA_FQxtaEPY";
			String version = "1.0";
			//String responseType = "xml";
			String responseType = "json";
			//String pFrmerSn =  farmerInfoVO.getFrmerSn(); //AGUN47
			String pFrmerSn =  frmerSn; //AGUN47

			String urlstr = "https://uni.agrix.go.kr/api/srvc/farmerInfo?accessToken="+accessToken+"&version="+version+"&responseType="+responseType+"&frmerSn="+pFrmerSn;
			//System.out.println("urlstr============"+urlstr);

			//HashMap<String, Object> hMap = new HashMap<>();
			//hMap.put("frmerSn", "AGUN47");

			//ObjectMapper objectMapper = new ObjectMapper();
			String jsonStr = "";
			//jsonStr = objectMapper.writeValueAsString(hMap);
			RestFulService restFulService = new RestFulService();
			//System.out.println("=====================");
			//Map rtnData = (Map) restFulService.clear().get().contentType(new MediaType(MediaType.APPLICATION_JSON)).baseUrl(url).body(jsonStr).execute().bodyToData(Map.class);
			Map rtnData = (Map) restFulService.clear().get().contentType(new MediaType(MediaType.APPLICATION_JSON)).baseUrl(urlstr).body(jsonStr).execute().bodyToData(Map.class);
			//System.out.println(rtnData);
			Map<String, Object> mapItems = (Map<String, Object>) rtnData.get("items");
			for (String key : mapItems.keySet()) {
				//System.out.println("key = " + key);
				//System.out.println(mapItems.get(key));
				if ("item".equals(key)) {
					List<Map> list = (List<Map>) mapItems.get(key);
					for (Map<String, String> mapItem : list) {
						for (String key2 : mapItem.keySet()) {
							//System.out.println("item key2 = " + key2);
							//System.out.println(mapItem.get(key2));
							//savedCnt = farmerInfoService.insertMergefarmerInfoMap(mapItem);
							//result = farmerInfoService.insertMergeLogfarmerInfoMap(mapItem);
							//server.aaa(m)
							//mapper.insert
							//intser into aaa(a, b,c) values(#{brthdy}, #{brthdy2}, #{brthdy})
						}
						mapItem.put("sysFrstInptUserId", getUserId());
						mapItem.put("sysFrstInptPrgrmId", getPrgrmId());
						mapItem.put("sysLastChgUserId", getUserId());
						mapItem.put("sysLastChgPrgrmId", getPrgrmId());
						mapItem.put("saveCd", "AGRIX");
						savedCnt = farmerInfoService.insertMergeFarmerInfoMap(mapItem);
						result = farmerInfoService.insertMergeLogFarmerInfoMap(mapItem);
					}
				}
			}

		}catch (Exception ex) {
			ex.printStackTrace();
		}

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
		resultMap.put("result", result);
		return getSuccessResponseEntity(resultMap);
	}











	@PostMapping(value = "/fm/farm/multiSaveReleyFarmerInfoJsoneBcnoAllList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> multiSaveReleyFarmerInfoJsoneBcnoAllList(@RequestBody FarmerInfoVO farmerInfoVO, HttpServletRequest request) throws Exception {

		logger.debug("/fm/farm/multiSaveReleyFarmerInfoJsoneBcnoAllList >>> 농업인 번호 연계호출 jsone >>> ");

		int savedCnt = 0;
		int result = 0;
		String frmerSn = "";
		String crno = "";
		ComUserVO comUserVO = new ComUserVO();

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<ComUserVO> resultList = new ArrayList<>();
		List<ComUserVO> resultList2 = new ArrayList<>();

		try {
			comUserVO.setUserType("21");
			resultList = comUserService.selectComUserList(comUserVO);

			comUserVO.setUserType("22");
			resultList2 = comUserService.selectComUserList(comUserVO);

		} catch(Exception e) {
			return getErrorResponseEntity(e);
		}


		//HashMap<String,Object> resultMap = new HashMap<String,Object>();
		logger.info("=============multiSaveReleyFarmerInfoJsoneBcnoAllList=========start====");

		int updatedCnt = 0;
		if (resultList.size() > 0) {
			for (ComUserVO comUserVoResult : resultList) {
				//System.out.println("comUserVoResult.getCrno() ==================:"+comUserVoResult.getUserId());
				//System.out.println("comUserVoResult.getCrno() ==================:"+comUserVoResult.getCrno());
				//System.out.println("comUserVoResult.getCrno() ==================:"+comUserVoResult.getCrno());
				//System.out.println("comUserVoResult.getCrno() ==================:"+comUserVoResult.getCrno());
				if(!comUserVoResult.getCrno().equals("") && !comUserVoResult.getCrno().equals(null)) {

				crno = comUserVoResult.getCrno();
				}

				try {
					if(!crno.equals("") && !crno.equals(null)) {
						String accessTokenaCrno = "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE3MTk2NDkzOTQ2NjksImFwaU5tIjoic2VhcmNoQ29ycEZhcm1lck5vIiwiaXNzIjoiU1lTVEVNIn0.ODINmzO1q93pfyCvsB1r-en3ebWIPOLRfUpfcMGKcbA";
						String version = "1.0";
						//String responseType = "xml";
						String responseType = "json";
						//String pCrno = farmerInfoVO.getCrno();
						String pCrno = crno;
						String crnoUrlstr = "https://uni.agrix.go.kr/api/srvc/searchCorpFarmerNo?accessToken="+accessTokenaCrno+"&version="+version+"&responseType="+responseType+"&bzmCorpNo="+pCrno;
						//ObjectMapper objectMapper = new ObjectMapper();
						String jsonStr = "";
						//jsonStr = objectMapper.writeValueAsString(hMap);
						RestFulService restFulService = new RestFulService();
						//System.out.println("=====================");
						//Map rtnData = (Map) restFulService.clear().get().contentType(new MediaType(MediaType.APPLICATION_JSON)).baseUrl(url).body(jsonStr).execute().bodyToData(Map.class);
						Map rtnData = (Map) restFulService.clear().get().contentType(new MediaType(MediaType.APPLICATION_JSON)).baseUrl(crnoUrlstr).body(jsonStr).execute().bodyToData(Map.class);

						//System.out.println(rtnData);
						//System.out.println("rtnData======20240117=====: "+rtnData);
						Map<String, Object> mapItems = (Map<String, Object>) rtnData.get("items");
						if(mapItems != null) {
							for (String key : mapItems.keySet()) {
							//System.out.println("key = " + key);
							//System.out.println(mapItems.get(key));

								if ("item".equals(key)) {
									List<Map> list = (List<Map>) mapItems.get(key);

									for (Map<String, String> mapItem : list) {

										for (String key2 : mapItem.keySet()) {
											//System.out.println("key2item key2 ===== " + key2);
											//System.out.println("mapItem.get(key2) ====  "+mapItem.get(key2));

											//key2item key2 ===== frmerSn
											//mapItem.get(key2) ====  R5JR11
											if(key2.equals("frmerSn")) {
												if(mapItem.get(key2) != null) {
													frmerSn = mapItem.get(key2);
												}
											}
											//savedCnt = apcFarmOgnzInfoService.insertMergeapcFarmOgnzInfoMap(mapItem);
											//result = apcFarmOgnzInfoService.insertMergeLogapcFarmOgnzInfoMap(mapItem);
											//server.aaa(m)
											//mapper.insert
											//intser into aaa(a, b,c) values(#{brthdy}, #{brthdy2}, #{brthdy})
										}
										//savedCnt = apcFarmOgnzInfoService.insertMergeApcFarmOgnzInfoMap(mapItem);
										//result = apcFarmOgnzInfoService.insertMergeLogApcFarmOgnzInfoMap(mapItem);
									}
								}
							}
						}
					}


					if(!crno.equals("") && !crno.equals(null)) {

						String url = "https://uni.agrix.go.kr/api/srvc/farmerInfo?accessToken=eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE3MTk2NDcyOTI3NzMsImFwaU5tIjoiZmFybWVySW5mbyIsImlzcyI6IlNZU1RFTSJ9.f9oToC5zUynRzK5zCgu-zgvZNJ0bN-MSzA_FQxtaEPY&version=1.0&responseType=json&frmerSn=AGUN47";

						//System.out.println("==========================11");
						//System.out.println("==========================1");
						try {
							//result =+ farmerInfoService.deletefarmerInfo(farmerInfoVO);

							String accessToken = "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE3MTk2NDcyOTI3NzMsImFwaU5tIjoiZmFybWVySW5mbyIsImlzcyI6IlNZU1RFTSJ9.f9oToC5zUynRzK5zCgu-zgvZNJ0bN-MSzA_FQxtaEPY";
							String version = "1.0";
							//String responseType = "xml";
							String responseType = "json";
							//String pFrmerSn =  farmerInfoVO.getFrmerSn(); //AGUN47
							String pFrmerSn =  frmerSn; //AGUN47

							String urlstr = "https://uni.agrix.go.kr/api/srvc/farmerInfo?accessToken="+accessToken+"&version="+version+"&responseType="+responseType+"&frmerSn="+pFrmerSn;
							//System.out.println("urlstr============"+urlstr);

							//HashMap<String, Object> hMap = new HashMap<>();
							//	hMap.put("frmerSn", "AGUN47");

							//ObjectMapper objectMapper = new ObjectMapper();
							String jsonStr = "";
							//jsonStr = objectMapper.writeValueAsString(hMap);
							RestFulService restFulService = new RestFulService();
							//System.out.println("=====================");
							//Map rtnData = (Map) restFulService.clear().get().contentType(new MediaType(MediaType.APPLICATION_JSON)).baseUrl(url).body(jsonStr).execute().bodyToData(Map.class);

							Map rtnData = (Map) restFulService.clear().get().contentType(new MediaType(MediaType.APPLICATION_JSON)).baseUrl(urlstr).body(jsonStr).execute().bodyToData(Map.class);

							//System.out.println(rtnData);
							Map<String, Object> mapItems = (Map<String, Object>) rtnData.get("items");

							for (String key : mapItems.keySet()) {
								//System.out.println("key = " + key);
								//System.out.println(mapItems.get(key));
								if ("item".equals(key)) {

									List<Map> list = (List<Map>) mapItems.get(key);

									for (Map<String, String> mapItem : list) {
										for (String key2 : mapItem.keySet()) {
											//System.out.println("item key2 = " + key2);
											//System.out.println(mapItem.get(key2));
											//savedCnt = farmerInfoService.insertMergefarmerInfoMap(mapItem);
											//result = farmerInfoService.insertMergeLogfarmerInfoMap(mapItem);
											//server.aaa(m)
											//mapper.insert
											//intser into aaa(a, b,c) values(#{brthdy}, #{brthdy2}, #{brthdy})
										}
										mapItem.put("sysFrstInptUserId", getUserId());
										mapItem.put("sysFrstInptPrgrmId", getPrgrmId());
										mapItem.put("sysLastChgUserId", getUserId());
										mapItem.put("sysLastChgPrgrmId", getPrgrmId());
										mapItem.put("saveCd", "AGRIX");
										savedCnt = farmerInfoService.insertMergeFarmerInfoMap(mapItem);
										result = farmerInfoService.insertMergeLogFarmerInfoMap(mapItem);

									}
								}
							}

						} catch (Exception ex) {
							ex.printStackTrace();
						}
					}
				} catch (Exception e) {
					logger.debug(e.getMessage());
					return getErrorResponseEntity(e);
				}
			}
		}

		if (resultList2.size() > 0) {
			for (ComUserVO comUserVoResult : resultList) {
				//System.out.println("comUserVoResult.getCrno() ==================:"+comUserVoResult.getUserId());
				//System.out.println("comUserVoResult.getCrno() ==================:"+comUserVoResult.getCrno());
				//System.out.println("comUserVoResult.getCrno() ==================:"+comUserVoResult.getCrno());
				//System.out.println("comUserVoResult.getCrno() ==================:"+comUserVoResult.getCrno());
				if(!comUserVoResult.getCrno().equals("") && !comUserVoResult.getCrno().equals(null)) {
					crno = comUserVoResult.getCrno();
				}
				try {
					if(!crno.equals("") && !crno.equals(null)) {
						String accessTokenaCrno = "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE3MTk2NDkzOTQ2NjksImFwaU5tIjoic2VhcmNoQ29ycEZhcm1lck5vIiwiaXNzIjoiU1lTVEVNIn0.ODINmzO1q93pfyCvsB1r-en3ebWIPOLRfUpfcMGKcbA";
						String version = "1.0";
						//String responseType = "xml";
						String responseType = "json";
						//String pCrno = farmerInfoVO.getCrno();
						String pCrno = crno;
						String crnoUrlstr = "https://uni.agrix.go.kr/api/srvc/searchCorpFarmerNo?accessToken="+accessTokenaCrno+"&version="+version+"&responseType="+responseType+"&bzmCorpNo="+pCrno;

						//ObjectMapper objectMapper = new ObjectMapper();
						String jsonStr = "";
						//jsonStr = objectMapper.writeValueAsString(hMap);
						RestFulService restFulService = new RestFulService();
						//System.out.println("=====================");
						//Map rtnData = (Map) restFulService.clear().get().contentType(new MediaType(MediaType.APPLICATION_JSON)).baseUrl(url).body(jsonStr).execute().bodyToData(Map.class);

						Map rtnData = (Map) restFulService.clear().get().contentType(new MediaType(MediaType.APPLICATION_JSON)).baseUrl(crnoUrlstr).body(jsonStr).execute().bodyToData(Map.class);

						//System.out.println(rtnData);
						//System.out.println("rtnData======20240117=====: "+rtnData);
						Map<String, Object> mapItems = (Map<String, Object>) rtnData.get("items");
						if(mapItems != null) {
							for (String key : mapItems.keySet()) {
								//System.out.println("key = " + key);
								//System.out.println(mapItems.get(key));

								if ("item".equals(key)) {
									List<Map> list = (List<Map>) mapItems.get(key);

									for (Map<String, String> mapItem : list) {

										for (String key2 : mapItem.keySet()) {
											//System.out.println("key2item key2 ===== " + key2);
											//System.out.println("mapItem.get(key2) ====  "+mapItem.get(key2));

											        //key2item key2 ===== frmerSn
													//mapItem.get(key2) ====  R5JR11
											if(key2.equals("frmerSn")) {
												if(mapItem.get(key2) != null) {
													frmerSn = mapItem.get(key2);
												}
											}
											//savedCnt = apcFarmOgnzInfoService.insertMergeapcFarmOgnzInfoMap(mapItem);
											//result = apcFarmOgnzInfoService.insertMergeLogapcFarmOgnzInfoMap(mapItem);
											//server.aaa(m)
											//mapper.insert
											//intser into aaa(a, b,c) values(#{brthdy}, #{brthdy2}, #{brthdy})
										}
										//savedCnt = apcFarmOgnzInfoService.insertMergeApcFarmOgnzInfoMap(mapItem);
										//result = apcFarmOgnzInfoService.insertMergeLogApcFarmOgnzInfoMap(mapItem);
									}
								}
							}
						}
					}



					if(!crno.equals("") && !crno.equals(null)) {

						String url = "https://uni.agrix.go.kr/api/srvc/farmerInfo?accessToken=eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE3MTk2NDcyOTI3NzMsImFwaU5tIjoiZmFybWVySW5mbyIsImlzcyI6IlNZU1RFTSJ9.f9oToC5zUynRzK5zCgu-zgvZNJ0bN-MSzA_FQxtaEPY&version=1.0&responseType=json&frmerSn=AGUN47";

						//System.out.println("==========================11");
						//System.out.println("==========================1");

						try {
							//result =+ farmerInfoService.deletefarmerInfo(farmerInfoVO);

							String accessToken = "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE3MTk2NDcyOTI3NzMsImFwaU5tIjoiZmFybWVySW5mbyIsImlzcyI6IlNZU1RFTSJ9.f9oToC5zUynRzK5zCgu-zgvZNJ0bN-MSzA_FQxtaEPY";
							String version = "1.0";
							//String responseType = "xml";
							String responseType = "json";
							//String pFrmerSn =  farmerInfoVO.getFrmerSn(); //AGUN47
							String pFrmerSn =  frmerSn; //AGUN47

							String urlstr = "https://uni.agrix.go.kr/api/srvc/farmerInfo?accessToken="+accessToken+"&version="+version+"&responseType="+responseType+"&frmerSn="+pFrmerSn;
							//System.out.println("urlstr============"+urlstr);

							//HashMap<String, Object> hMap = new HashMap<>();
							//hMap.put("frmerSn", "AGUN47");

							//ObjectMapper objectMapper = new ObjectMapper();
							String jsonStr = "";
							//	jsonStr = objectMapper.writeValueAsString(hMap);
							RestFulService restFulService = new RestFulService();
							//System.out.println("=====================");
							//Map rtnData = (Map) restFulService.clear().get().contentType(new MediaType(MediaType.APPLICATION_JSON)).baseUrl(url).body(jsonStr).execute().bodyToData(Map.class);

							Map rtnData = (Map) restFulService.clear().get().contentType(new MediaType(MediaType.APPLICATION_JSON)).baseUrl(urlstr).body(jsonStr).execute().bodyToData(Map.class);

							//System.out.println(rtnData);
							Map<String, Object> mapItems = (Map<String, Object>) rtnData.get("items");

							for (String key : mapItems.keySet()) {
								//System.out.println("key = " + key);
								//System.out.println(mapItems.get(key));

								if ("item".equals(key)) {
									List<Map> list = (List<Map>) mapItems.get(key);

									for (Map<String, String> mapItem : list) {

										for (String key2 : mapItem.keySet()) {
											//System.out.println("item key2 = " + key2);
											//System.out.println(mapItem.get(key2));
											//savedCnt = farmerInfoService.insertMergefarmerInfoMap(mapItem);
											//result = farmerInfoService.insertMergeLogfarmerInfoMap(mapItem);
											//server.aaa(m)
											//mapper.insert
										//intser into aaa(a, b,c) values(#{brthdy}, #{brthdy2}, #{brthdy})
										}
										mapItem.put("sysFrstInptUserId", getUserId());
										mapItem.put("sysFrstInptPrgrmId", getPrgrmId());
										mapItem.put("sysLastChgUserId", getUserId());
										mapItem.put("sysLastChgPrgrmId", getPrgrmId());
										mapItem.put("saveCd", "AGRIX");
										savedCnt = farmerInfoService.insertMergeFarmerInfoMap(mapItem);
										result = farmerInfoService.insertMergeLogFarmerInfoMap(mapItem);
									}
								}
							}
						} catch (Exception ex) {
							 ex.printStackTrace();
						}
					}

				} catch (Exception e) {
					logger.debug(e.getMessage());
					return getErrorResponseEntity(e);
				}
			}
		}

		//HashMap<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
		resultMap.put("result", result);
		return getSuccessResponseEntity(resultMap);
	}


	@PostMapping(value = "/fm/farm/multiSaveReleyFarmerInfoJsoneBcnoDeptAllList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> multiSaveReleyFarmerInfoJsoneBcnoDeptAllList(@RequestBody FarmerInfoVO farmerInfoVO, HttpServletRequest request) throws Exception {
		logger.debug("/fm/farm/multiSaveReleyFarmerInfoJsoneBcnoDeptAllList >>> 농업인 번호 연계호출 jsone >>> ");
		int savedCnt = 0;
		int result = 0;
		String frmerSn = "";
		String crno = "";
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<FarmerInfoVO> resultList = new ArrayList<>();
		try {
			resultList =  farmerInfoService.selectFarmerInfoEvApoList(farmerInfoVO);
		} catch(Exception e) {
			return getErrorResponseEntity(e);
		}
		//HashMap<String,Object> resultMap = new HashMap<String,Object>();
		logger.info("=============multiSaveReleyFarmerInfoJsoneBcnoAllList=========start====");

		int updatedCnt = 0;
		if (resultList.size() > 0) {
			for (FarmerInfoVO farmerInfoVOResult : resultList) {
				if(!farmerInfoVOResult.getCrno().equals("") && !farmerInfoVOResult.getCrno().equals(null)) {
					crno = farmerInfoVOResult.getCrno();
				}
				try {
					if(!crno.equals("") && !crno.equals(null)) {
						String accessTokenaCrno = "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE3MTk2NDkzOTQ2NjksImFwaU5tIjoic2VhcmNoQ29ycEZhcm1lck5vIiwiaXNzIjoiU1lTVEVNIn0.ODINmzO1q93pfyCvsB1r-en3ebWIPOLRfUpfcMGKcbA";
						String version = "1.0";
						//String responseType = "xml";
						String responseType = "json";
						//String pCrno = farmerInfoVO.getCrno();
						String pCrno = crno;
						String crnoUrlstr = "https://uni.agrix.go.kr/api/srvc/searchCorpFarmerNo?accessToken="+accessTokenaCrno+"&version="+version+"&responseType="+responseType+"&bzmCorpNo="+pCrno;
						//ObjectMapper objectMapper = new ObjectMapper();
						String jsonStr = "";
						//jsonStr = objectMapper.writeValueAsString(hMap);
						RestFulService restFulService = new RestFulService();
						System.out.println("=====================");
						//Map rtnData = (Map) restFulService.clear().get().contentType(new MediaType(MediaType.APPLICATION_JSON)).baseUrl(url).body(jsonStr).execute().bodyToData(Map.class);
						Map rtnData = (Map) restFulService.clear().get().contentType(new MediaType(MediaType.APPLICATION_JSON)).baseUrl(crnoUrlstr).body(jsonStr).execute().bodyToData(Map.class);
						//System.out.println(rtnData);
						//System.out.println("rtnData======20240117=====: "+rtnData);
						Map<String, Object> mapItems = (Map<String, Object>) rtnData.get("items");

						if(mapItems != null) {
							for (String key : mapItems.keySet()) {
								//System.out.println("key = " + key);
								//System.out.println(mapItems.get(key));
								if ("item".equals(key)) {
									List<Map> list = (List<Map>) mapItems.get(key);
									for (Map<String, String> mapItem : list) {
										for (String key2 : mapItem.keySet()) {
											//System.out.println("key2item key2 ===== " + key2);
											//System.out.println("mapItem.get(key2) ====  "+mapItem.get(key2));
											//key2item key2 ===== frmerSn
											//mapItem.get(key2) ====  R5JR11
											if(key2.equals("frmerSn")) {
												if(mapItem.get(key2) != null) {
													frmerSn = mapItem.get(key2);
												}
											}
											//savedCnt = apcFarmOgnzInfoService.insertMergeapcFarmOgnzInfoMap(mapItem);
											//result = apcFarmOgnzInfoService.insertMergeLogapcFarmOgnzInfoMap(mapItem);
											//server.aaa(m)
											//mapper.insert
											//intser into aaa(a, b,c) values(#{brthdy}, #{brthdy2}, #{brthdy})
										}
										//savedCnt = apcFarmOgnzInfoService.insertMergeApcFarmOgnzInfoMap(mapItem);
										//result = apcFarmOgnzInfoService.insertMergeLogApcFarmOgnzInfoMap(mapItem);
									}
								}
							}
						}
					}

					if(!crno.equals("") && !crno.equals(null)) {
						String url = "https://uni.agrix.go.kr/api/srvc/farmerInfo?accessToken=eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE3MTk2NDcyOTI3NzMsImFwaU5tIjoiZmFybWVySW5mbyIsImlzcyI6IlNZU1RFTSJ9.f9oToC5zUynRzK5zCgu-zgvZNJ0bN-MSzA_FQxtaEPY&version=1.0&responseType=json&frmerSn=AGUN47";
						//System.out.println("==========================11");
						//System.out.println("==========================1");
						try {
							//result =+ farmerInfoService.deletefarmerInfo(farmerInfoVO);
							String accessToken = "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE3MTk2NDcyOTI3NzMsImFwaU5tIjoiZmFybWVySW5mbyIsImlzcyI6IlNZU1RFTSJ9.f9oToC5zUynRzK5zCgu-zgvZNJ0bN-MSzA_FQxtaEPY";
							String version = "1.0";
							//String responseType = "xml";
							String responseType = "json";
							//String pFrmerSn =  farmerInfoVO.getFrmerSn(); //AGUN47
							String pFrmerSn =  frmerSn; //AGUN47

							String urlstr = "https://uni.agrix.go.kr/api/srvc/farmerInfo?accessToken="+accessToken+"&version="+version+"&responseType="+responseType+"&frmerSn="+pFrmerSn;
							//System.out.println("urlstr============"+urlstr);

							//HashMap<String, Object> hMap = new HashMap<>();
							//hMap.put("frmerSn", "AGUN47");

							//ObjectMapper objectMapper = new ObjectMapper();
							String jsonStr = "";
							//jsonStr = objectMapper.writeValueAsString(hMap);
							RestFulService restFulService = new RestFulService();
							//System.out.println("=====================");
							//Map rtnData = (Map) restFulService.clear().get().contentType(new MediaType(MediaType.APPLICATION_JSON)).baseUrl(url).body(jsonStr).execute().bodyToData(Map.class);

							Map rtnData = (Map) restFulService.clear().get().contentType(new MediaType(MediaType.APPLICATION_JSON)).baseUrl(urlstr).body(jsonStr).execute().bodyToData(Map.class);

							//System.out.println(rtnData);
							Map<String, Object> mapItems = (Map<String, Object>) rtnData.get("items");

							for (String key : mapItems.keySet()) {
								//System.out.println("key = " + key);
								//System.out.println(mapItems.get(key));

								if ("item".equals(key)) {
									List<Map> list = (List<Map>) mapItems.get(key);

									for (Map<String, String> mapItem : list) {

										for (String key2 : mapItem.keySet()) {
											//System.out.println("item key2 = " + key2);
											//System.out.println(mapItem.get(key2));
											//savedCnt = farmerInfoService.insertMergefarmerInfoMap(mapItem);
											//result = farmerInfoService.insertMergeLogfarmerInfoMap(mapItem);
											//server.aaa(m)
											//mapper.insert
											//intser into aaa(a, b,c) values(#{brthdy}, #{brthdy2}, #{brthdy})
										}
										mapItem.put("sysFrstInptUserId", getUserId());
										mapItem.put("sysFrstInptPrgrmId", getPrgrmId());
										mapItem.put("sysLastChgUserId", getUserId());
										mapItem.put("sysLastChgPrgrmId", getPrgrmId());
										mapItem.put("saveCd", "AGRIX");
										savedCnt = farmerInfoService.insertMergeFarmerInfoMap(mapItem);
										result = farmerInfoService.insertMergeLogFarmerInfoMap(mapItem);

									}
								}
							}

						} catch (Exception ex) {
							ex.printStackTrace();
						}
					}
				}catch (Exception e) {
					logger.debug(e.getMessage());
					return getErrorResponseEntity(e);
				}
			}
		}
		//HashMap<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
		resultMap.put("result", result);
		return getSuccessResponseEntity(resultMap);
	}


	@PostMapping(value = "/fm/farm/multiSaveReleyFarmerInfoJsoneBrdtAllList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> multiSaveReleyFarmerInfoJsoneBrdtAllList(@RequestBody FarmerInfoVO farmerInfoVO, HttpServletRequest request) throws Exception {

		logger.debug("/fm/farm/multiSaveReleyFarmerInfoJsoneBrdtAllList >>> 농업인 번호 연계호출 jsone >>> ");

		int savedCnt = 0;
		int result = 0;
		String frmerSn = "";
		String crno = "";
		ComUserVO comUserVO = new ComUserVO();
		String ueserNm = "";
		String birth =  "";


		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<ComUserVO> resultList = new ArrayList<>();
		//List<ComUserVO> resultList2 = new ArrayList<>();

		try {
			resultList = comUserService.selectComUserList(comUserVO);

			//resultList2 = comUserService.selectComUserList(comUserVO);

		} catch(Exception e) {
			return getErrorResponseEntity(e);
		}


		//HashMap<String,Object> resultMap = new HashMap<String,Object>();
		logger.info("=============multiSaveReleyFarmerInfoJsoneBrdtAllList=========start====");

		int updatedCnt = 0;
		if (resultList.size() > 0) {
			for (ComUserVO comUserVoResult : resultList) {
				//System.out.println("comUserVoResult.getCrno() ==================:"+comUserVoResult.getUserId());
				//System.out.println("comUserVoResult.getCrno() ==================:"+comUserVoResult.getCrno());
				//System.out.println("comUserVoResult.getCrno() ==================:"+comUserVoResult.getCrno());
				//System.out.println("comUserVoResult.getCrno() ==================:"+comUserVoResult.getCrno());

				if(!comUserVoResult.getUserNm().equals("") && !comUserVoResult.getUserNm().equals(null)) {

					ueserNm = comUserVoResult.getUserNm();
					birth = comUserVoResult.getBrdt();
				}

				try {

					if(!ueserNm.equals("") && !ueserNm.equals(null)) {
						String accessTokenaBirth = "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE3MTk2NDkzODUyODQsImFwaU5tIjoic2VhcmNoRmFybWVyTm8iLCJpc3MiOiJTWVNURU0ifQ.O6g894gme_4SuYV1x9hyow-8v2X3zNCc6dzHeNIjP38";
						String version = "1.0";
						//String responseType = "xml";
						String responseType = "json";
						String pBirthDay = birth;
						String pNm =  ueserNm; //AGUN47

						String birthUrlstr = "https://uni.agrix.go.kr/api/srvc/searchFarmerNo?accessToken="+accessTokenaBirth+"&version="+version+"&responseType="+responseType+"&birthDay="+pBirthDay+"&nm="+pNm;
						//System.out.println("birthUrlstr ======================"+birthUrlstr);
						//System.out.println("birthUrlstr ======================"+birthUrlstr);


						//ObjectMapper objectMapper = new ObjectMapper();
						String jsonStr = "";
						//	jsonStr = objectMapper.writeValueAsString(hMap);
						RestFulService restFulService = new RestFulService();
						//System.out.println("=====================");
						//Map rtnData = (Map) restFulService.clear().get().contentType(new MediaType(MediaType.APPLICATION_JSON)).baseUrl(url).body(jsonStr).execute().bodyToData(Map.class);

						Map rtnData = (Map) restFulService.clear().get().contentType(new MediaType(MediaType.APPLICATION_JSON)).baseUrl(birthUrlstr).body(jsonStr).execute().bodyToData(Map.class);

						//System.out.println(rtnData);
						//System.out.println("rtnData======20240117=====: "+rtnData);
						Map<String, Object> mapItems = (Map<String, Object>) rtnData.get("items");
						if(mapItems != null) {
							for (String key : mapItems.keySet()) {
								//System.out.println("key = " + key);
								//System.out.println(mapItems.get(key));

								if ("item".equals(key)) {
									List<Map> list = (List<Map>) mapItems.get(key);

									for (Map<String, String> mapItem : list) {

										for (String key2 : mapItem.keySet()) {
											//System.out.println("key2item key2 ===== " + key2);
											//System.out.println("mapItem.get(key2) ====  "+mapItem.get(key2));

											//key2item key2 ===== frmerSn
											//mapItem.get(key2) ====  R5JR11
											if(key2.equals("frmerSn")) {
												if(mapItem.get(key2) != null) {
													frmerSn = mapItem.get(key2);
												}
											}
											//savedCnt = apcFarmOgnzInfoService.insertMergeapcFarmOgnzInfoMap(mapItem);
											//result = apcFarmOgnzInfoService.insertMergeLogapcFarmOgnzInfoMap(mapItem);
											//server.aaa(m)
											//mapper.insert
											//intser into aaa(a, b,c) values(#{brthdy}, #{brthdy2}, #{brthdy})
										}

										//savedCnt = apcFarmOgnzInfoService.insertMergeApcFarmOgnzInfoMap(mapItem);
										//result = apcFarmOgnzInfoService.insertMergeLogApcFarmOgnzInfoMap(mapItem);

									}
								}
							}
						}

						//System.out.println("urlstr============"+birthUrlstr);
					}


					if(!ueserNm.equals("") && !ueserNm.equals(null)) {

						String url = "https://uni.agrix.go.kr/api/srvc/farmerInfo?accessToken=eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE3MTk2NDcyOTI3NzMsImFwaU5tIjoiZmFybWVySW5mbyIsImlzcyI6IlNZU1RFTSJ9.f9oToC5zUynRzK5zCgu-zgvZNJ0bN-MSzA_FQxtaEPY&version=1.0&responseType=json&frmerSn=AGUN47";

						//System.out.println("==========================11");
						//System.out.println("==========================1");
						try {
							//result =+ farmerInfoService.deletefarmerInfo(farmerInfoVO);

							String accessToken = "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE3MTk2NDcyOTI3NzMsImFwaU5tIjoiZmFybWVySW5mbyIsImlzcyI6IlNZU1RFTSJ9.f9oToC5zUynRzK5zCgu-zgvZNJ0bN-MSzA_FQxtaEPY";
							String version = "1.0";
							//String responseType = "xml";
							String responseType = "json";
							//String pFrmerSn =  farmerInfoVO.getFrmerSn(); //AGUN47
							String pFrmerSn =  frmerSn; //AGUN47

							String urlstr = "https://uni.agrix.go.kr/api/srvc/farmerInfo?accessToken="+accessToken+"&version="+version+"&responseType="+responseType+"&frmerSn="+pFrmerSn;
							//System.out.println("urlstr============"+urlstr);

							//HashMap<String, Object> hMap = new HashMap<>();
							//hMap.put("frmerSn", "AGUN47");

							//ObjectMapper objectMapper = new ObjectMapper();
							String jsonStr = "";
							//jsonStr = objectMapper.writeValueAsString(hMap);
							RestFulService restFulService = new RestFulService();
							//System.out.println("=====================");
							//Map rtnData = (Map) restFulService.clear().get().contentType(new MediaType(MediaType.APPLICATION_JSON)).baseUrl(url).body(jsonStr).execute().bodyToData(Map.class);

							Map rtnData = (Map) restFulService.clear().get().contentType(new MediaType(MediaType.APPLICATION_JSON)).baseUrl(urlstr).body(jsonStr).execute().bodyToData(Map.class);

							//System.out.println(rtnData);
							Map<String, Object> mapItems = (Map<String, Object>) rtnData.get("items");

							for (String key : mapItems.keySet()) {
								//System.out.println("key = " + key);
								//System.out.println(mapItems.get(key));

								if ("item".equals(key)) {
									List<Map> list = (List<Map>) mapItems.get(key);

									for (Map<String, String> mapItem : list) {

										for (String key2 : mapItem.keySet()) {
											//System.out.println("item key2 = " + key2);
											//System.out.println(mapItem.get(key2));
											//savedCnt = farmerInfoService.insertMergefarmerInfoMap(mapItem);
											//result = farmerInfoService.insertMergeLogfarmerInfoMap(mapItem);
											//server.aaa(m)
											//mapper.insert
											//intser into aaa(a, b,c) values(#{brthdy}, #{brthdy2}, #{brthdy})
										}
										mapItem.put("sysFrstInptUserId", getUserId());
										mapItem.put("sysFrstInptPrgrmId", getPrgrmId());
										mapItem.put("sysLastChgUserId", getUserId());
										mapItem.put("sysLastChgPrgrmId", getPrgrmId());
										mapItem.put("saveCd", "AGRIX");
										savedCnt = farmerInfoService.insertMergeFarmerInfoMap(mapItem);
										result = farmerInfoService.insertMergeLogFarmerInfoMap(mapItem);

									}
								}
							}
						} catch (Exception ex) {
							ex.printStackTrace();
						}
					}
				} catch (Exception e) {
					logger.debug(e.getMessage());
					return getErrorResponseEntity(e);
				}
			}
		}

		//HashMap<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
		resultMap.put("result", result);
		return getSuccessResponseEntity(resultMap);
	}

}
