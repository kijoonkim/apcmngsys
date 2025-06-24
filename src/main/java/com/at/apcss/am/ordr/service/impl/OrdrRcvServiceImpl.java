package com.at.apcss.am.ordr.service.impl;

import com.at.apcss.am.cmns.service.CmnsTaskNoService;
import com.at.apcss.am.cmns.service.CmnsValidationService;
import com.at.apcss.am.cmns.service.CnptService;
import com.at.apcss.am.cmns.vo.LgszMrktVO;
import com.at.apcss.am.constants.AmConstants;
import com.at.apcss.am.ordr.mapper.OrdrRcvMapper;
import com.at.apcss.am.ordr.service.OrdrRcvService;
import com.at.apcss.am.ordr.vo.*;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComRSACrypto;
import com.at.apcss.co.sys.util.ComUtil;
import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.NumberUtils;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @Class Name : OrdrServiceImpl.java
 * @Description : 발주정보 서비스를 정의하기 위한 서비스 구현 클래스
 * @author 신정철
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21  신정철        최초 생성
 * </pre>
 */
@Service("ordrRcvService")
public class OrdrRcvServiceImpl extends BaseServiceImpl implements OrdrRcvService {

	@Autowired
	private OrdrRcvMapper ordrRcvMapper;

	@Resource(name = "cmnsTaskNoService")
	private CmnsTaskNoService cmnsTaskNoService;

	@Resource(name = "cmnsValidationService")
	private CmnsValidationService cmnsValidationService;

	@Resource(name = "cnptService")
	private CnptService cnptService;


	@Override
	public HashMap<String, Object> insertOrdrAuto(OrdrVO ordrVO) throws Exception {

		JSONParser jsonParser = new JSONParser();

		String originUrl = "https://activescm.co.kr/";
		String welcomeUrl = originUrl + "Homeplus/welcome.do";
		String indexUrl = originUrl + "Homeplus/index.do";

		String userType = "S";	// 공급자
		String userId = "";
		String userPw = "";
		String grDate = "20231016";
		String qryId = "po.itemOrderSql";
		String jsessionId = "";

		Connection.Response welcomeResponse = Jsoup.connect(welcomeUrl)
                .timeout(3000)
                .header("Origin", originUrl)
                .header("Referer", welcomeUrl)
                .header("Connection", "keep-alive")
                .header("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8")
                .header("Content-Type", "application/x-www-form-urlencoded")
                .header("Accept-Encoding", "gzip, deflate, br")
                .header("Accept-Language", "ko-KR,ko;q=0.8,en-US;q=0.6,en;q=0.4")
                .method(Connection.Method.GET)
                .execute();
		jsessionId = welcomeResponse.cookie("JSESSIONID");

		//login 처리 후 진행
		Map<String, String> params = new HashMap<>();
		params.put("USER_TYPE", userType);
		params.put("USER_ID", userId);
		params.put("PASSWORD", userPw);

		// 로그인 페이지 접속
		String loginUrl = originUrl + "Homeplus/login/checkUserIdPw.do;jsessionid=" + jsessionId;
		Connection.Response loginPageResponse = Jsoup.connect(loginUrl)
		                                                .timeout(3000)
		                                                .header("Origin", originUrl)
		                                                .header("Referer", loginUrl)
		                                                .header("Connection", "keep-alive")
		                                                .header("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8")
		                                                .header("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8")
		                                                .header("Accept-Encoding", "gzip, deflate, br")
		                                                .header("Accept-Language", "ko-KR,ko;q=0.8,en-US;q=0.6,en;q=0.4")
		                                                .cookie("JSESSIONID", jsessionId)
		                                                .data(params)
		                                                .method(Connection.Method.POST)
		                                                .execute();

		Object obj = jsonParser.parse(loginPageResponse.body());
		JSONObject jsonObj = (JSONObject) obj;

		Connection.Response indexResponse = Jsoup.connect(welcomeUrl)
                .timeout(3000)
                .header("Origin", originUrl)
                .header("Referer", welcomeUrl)
                .header("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8")
                .header("Content-Type", "application/x-www-form-urlencoded")
                .header("Accept-Encoding", "gzip, deflate, br")
                .header("Accept-Language", "ko-KR,ko;q=0.8,en-US;q=0.6,en;q=0.4")
                .cookie("JSESSIONID", jsessionId)
                //.cookie("isLogined", "true")
                .method(Connection.Method.GET)
                .execute();

		// 로그인 성공 시 진행
		// 상품별 발주정보 조회
		//login 처리 후 진행
		Map<String, String> gdsParams = new HashMap<>();
		gdsParams.put("mode", "search");
		gdsParams.put("HOUSE_CODE", "100");
		gdsParams.put("COMPANY_CODE", "100");
		gdsParams.put("WAREHOUSE_CODE", "");
		gdsParams.put("USER_ID", userId);
		gdsParams.put("GR_DATE", grDate);
		gdsParams.put("GR_TYPE", "");
		gdsParams.put("IbatisSelQryID", qryId);
		gdsParams.put("USE_MAP_YN", "Y");

		String gdsOrdrUrl = originUrl + "Homeplus/cmmn/command.do;jsessionid=" + jsessionId;
		Connection.Response gdsOrdrResponse = Jsoup.connect(gdsOrdrUrl)
	                                                .timeout(10000)
	                                                .header("Origin", originUrl)
	                                                .header("Referer", indexUrl)
	                                                .header("Accept", "application/json, text/javascript, */*; q=0.01")
	                                                .header("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8")
	                                                .header("Accept-Encoding", "gzip, deflate, br")
	                                                .header("Accept-Language", "ko-KR,ko;q=0.8,en-US;q=0.6,en;q=0.4")
	                                                .header("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36")
	                                                .cookie("JSESSIONID", jsessionId)
	                                                //.cookie("isLogined", "true")
	                                                .data(gdsParams)
	                                                .method(Connection.Method.POST)
	                                                .execute();

		Object objGds = jsonParser.parse(gdsOrdrResponse.body());
		JSONObject jsonObjGds = (JSONObject) objGds;

		JSONArray items = (JSONArray)jsonObjGds.get("items");

		if (items != null && !items.isEmpty()) {
			for ( int i = 0; i < items.size(); i++ ){
				JSONObject item = (JSONObject)items.get(i);

				String companyCode = (String)item.get("COMPANY_CODE");
				String houseCode = (String)item.get("HOUSE_CODE");
				String grType = (String)item.get("GR_TYPE");
				String grTypeNm = (String)item.get("GR_TYPE_NM");
				String itemCode = (String)item.get("ITEM_CODE");
				String itemNm = (String)item.get("ITEM_NM");
				String styleNo = (String)item.get("STYLE_NO");
				String diamondItem = (String)item.get("DIAMOND_ITEM");
				int poQty = Integer.parseInt(String.valueOf(item.get("PO_QTY")));
				String poUnit = (String)item.get("PO_UNIT");
				int poEaQty = Integer.parseInt(String.valueOf(item.get("PO_EA_QTY")));
				double poAmt = Double.parseDouble(String.valueOf(item.get("PO_AMT")));
				double poPrice = Double.parseDouble(String.valueOf(item.get("PO_PRICE")));
				int ibsuQty = Integer.parseInt(String.valueOf(item.get("IBSU_QTY")));
				int freeQty = Integer.parseInt(String.valueOf(item.get("FREE_QTY")));
				double priceTax = Double.parseDouble(String.valueOf(item.get("PRICE_TAX")));

				logger.debug("## line {}", i+1);
				logger.debug("companyCode: {}", companyCode);
				logger.debug("houseCode: {}", houseCode);
				logger.debug("grType: {}", grType);
				logger.debug("grTypeNm: {}", grTypeNm);
				logger.debug("itemCode: {}", itemCode);
				logger.debug("itemNm: {}", itemNm);
				logger.debug("styleNo: {}", styleNo);
				logger.debug("diamondItem: {}", diamondItem);
				logger.debug("poQty: {}", poQty);
				logger.debug("poUnit: {}", poUnit);
				logger.debug("poEaQty: {}", poEaQty);
				logger.debug("poAmt: {}", poAmt);
				logger.debug("poPrice: {}", poPrice);
				logger.debug("ibsuQty: {}", ibsuQty);
				logger.debug("freeQty: {}", freeQty);
				logger.debug("priceTax: {}", priceTax);
			}
		}

		// 상품별 발주정보 저장

		// 저장 후 로그아웃 처리
		//login 처리 후 진행
		Map<String, String> logoutParam = new HashMap<>();
		logoutParam.put("logout", "TRUE");

		// 로그인 페이지 접속
		String logoutUrl = originUrl + "Homeplus/logout.do";
		Connection.Response logoutResponse = Jsoup.connect(logoutUrl)
		                                                .timeout(3000)
		                                                .header("Origin", originUrl)
		                                                .header("Referer", indexUrl)
		                                                .header("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8")
		                                                .header("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8")
		                                                .header("Accept-Encoding", "gzip, deflate, br")
		                                                .header("Accept-Language", "ko-KR,ko;q=0.8,en-US;q=0.6,en;q=0.4")
		                                                .cookie("JSESSIONID", jsessionId)
		                                                .cookie("isLogined", "true")
		                                                .data(logoutParam)
		                                                .method(Connection.Method.POST)
		                                                .execute();
		/*
	    "resultCd": true,
	    "resultMsg": "조회가 완료되었습니다.",
	    "mode": "search"
    	"items": [
    	          {
    	              "PO_EA_QTY": "20",          // 낱개수량
    	              "PRICE_TAX": "0",           // 세액
    	              "IBSU_QTY": "20",           // 입수
    	              "GR_TYPE": "2",             // 입고유형
    	              "HOUSE_CODE": "100",        // 창고코드
    	              "DIAMOND_ITEM": null,
    	              "PO_AMT": "540000",         // 발주금액
    	              "FREE_QTY": "0",
    	              "ITEM_CODE": "050536563",   // 상품코드
    	              "ITEM_NM": "안면도농협_태양초_고춧가루_500g(봉)",   // 상품명
    	              "PO_QTY": "1",              // 발주수량
    	              "PO_UNIT": "EA",            // 발주단위
    	              "COMPANY_CODE": "100",      // 업체코드
    	              "STYLE_NO": "158083717",    // TPND
    	              "PO_PRICE": "540000",       // 발주가격
    	              "GR_TYPE_NM": "HYPER_FLOW"  // 입고유형 명칭
    	          },
	    	*/
		return null;
	}

	@Override
	public HashMap<String, Object> insertOutordrRcpt(OrdrRcvVO ordrRcvVO) throws Exception {

		//HashMap<String, Object> rtnObj = null;

		String apcCd = ordrRcvVO.getApcCd();
		String lgszMrktCd = ordrRcvVO.getLgszMrktCd();

		//String crtrYmdFrom = ordrRcvVO.getCrtrYmdFrom();
		//String crtrYmdTo = ordrRcvVO.getCrtrYmdTo();
		
		String crtrYmd = ordrRcvVO.getCrtrYmd();

		if (!StringUtils.hasText(apcCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "주문서정보");
		}

		if (!StringUtils.hasText(lgszMrktCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "대형마트구분");
		}

		if (!StringUtils.hasText(crtrYmd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "수신기준일자");
		}

		if (AmConstants.CON_LGSZ_MRKT_CD_EMART.equals(lgszMrktCd)) {
			//return insertHomplusOrdr(ordrRcvVO);
		} else if (AmConstants.CON_LGSZ_MRKT_CD_HOMEPLUS.equals(lgszMrktCd)) {
			return insertHomplusOrdr(ordrRcvVO);
			
		} else if (AmConstants.CON_LGSZ_MRKT_CD_LOTTEMART.equals(lgszMrktCd)) {
			//return insertHomplusOrdr(ordrRcvVO);
		} else if (AmConstants.CON_LGSZ_MRKT_CD_GSRETAIL.equals(lgszMrktCd)) {
			//return insertHomplusOrdr(ordrRcvVO);
		} else {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "대형마트구분");
		}


		return null;
	}

	@Override
	public HashMap<String, Object> insertHomplusOrdr(OrdrRcvVO ordrRcvVO) throws Exception {

		HashMap<String, Object> rtnObj = null;

		JSONParser jsonParser = new JSONParser();

		String originUrl = "https://activescm.co.kr/";
		String welcomeUrl = originUrl + "Homeplus/welcome.do";
		String indexUrl = originUrl + "Homeplus/index.do";

		// 홈플러스 접속정보를 가져온다
		LgszMrktVO lgszMrktVO = cnptService.selectLgszMrkt(ordrRcvVO.getApcCd(), ordrRcvVO.getLgszMrktCd());

		if (lgszMrktVO == null
				|| !StringUtils.hasText(lgszMrktVO.getLgszMrktCd())
				|| !StringUtils.hasText(lgszMrktVO.getUserId())
				|| !StringUtils.hasText(lgszMrktVO.getPswd())
				|| !ComConstants.CON_YES.equals(lgszMrktVO.getUseYn())
				) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "홈플러스 접속정보");
		}


		String pUserType = "S";	// 공급자
		String pUserId = lgszMrktVO.getUserId();
		String pUserPw = lgszMrktVO.getPswd();
		String jsessionId = "";

		
		Connection.Response welcomeResponse = Jsoup.connect(welcomeUrl)
                .timeout(30000)
                .header("Origin", originUrl)
                .header("Referer", welcomeUrl)
                .header("Connection", "keep-alive")
                .header("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8")
                .header("Content-Type", "application/x-www-form-urlencoded")
                .header("Accept-Encoding", "gzip, deflate, br")
                .header("Accept-Language", "ko-KR,ko;q=0.8,en-US;q=0.6,en;q=0.4")
                .method(Connection.Method.GET)
                .execute();
		jsessionId = welcomeResponse.cookie("JSESSIONID");

		Document welcomeDoc = Jsoup.parse(welcomeResponse.body());
		//logger.debug("@@@welcomeDoc");
		//logger.debug(welcomeDoc.toString());
		
		
		//login 처리 후 진행
		Map<String, String> params = new HashMap<>();
		params.put("USER_TYPE", pUserType);
		params.put("USER_ID", pUserId);
		params.put("PASSWORD", pUserPw);

		// 로그인 페이지 접속
		String loginUrl = originUrl + "Homeplus/login/checkUserIdPw.do;jsessionid=" + jsessionId;
		Connection.Response loginPageResponse = Jsoup.connect(loginUrl)
		                                                .timeout(3000)
		                                                .header("Origin", originUrl)
		                                                .header("Referer", loginUrl)
		                                                .header("Connection", "keep-alive")
		                                                .header("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8")
		                                                .header("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8")
		                                                .header("Accept-Encoding", "gzip, deflate, br")
		                                                .header("Accept-Language", "ko-KR,ko;q=0.8,en-US;q=0.6,en;q=0.4")
		                                                .cookie("JSESSIONID", jsessionId)
		                                                .data(params)
		                                                .method(Connection.Method.POST)
		                                                .execute();
		
		Document loginDoc = Jsoup.parse(loginPageResponse.body());
		//logger.debug("@@@loginDoc");
		//logger.debug(loginDoc.toString());
		
		Object obj = jsonParser.parse(loginPageResponse.body());
		JSONObject jsonObj = (JSONObject) obj;

		Connection.Response indexResponse = Jsoup.connect(welcomeUrl)
                .timeout(3000)
                .header("Origin", originUrl)
                .header("Referer", welcomeUrl)
                .header("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8")
                .header("Content-Type", "application/x-www-form-urlencoded")
                .header("Accept-Encoding", "gzip, deflate, br")
                .header("Accept-Language", "ko-KR,ko;q=0.8,en-US;q=0.6,en;q=0.4")
                .cookie("JSESSIONID", jsessionId)
                //.cookie("isLogined", "true")
                .method(Connection.Method.GET)
                .execute();

		//logger.debug("indexResponse {}", indexResponse.body());
		// 로그인 성공 시 진행

		// 조회 post url
		String cmndUrl = originUrl + "Homeplus/cmmn/command.do;jsessionid=" + jsessionId;

		String pMode = "search";		// 고정
		String pHouseCode = "100";		// 고정
		String pCompanyCode = "100";	// 고정

		String pQryIdOrdrList = "po.listOrderSql";				// 쿼리id: 주문서목록
		String pQryIdOrdrDtl = "po.getOrderDetailPopupGoodSql";	// 쿼리id: 주문상세

		String pYmdType = ordrRcvVO.getCrtrYmdType();	// "1";		// DATE_GUBUN		일자구분: 1 배달일자, 2 수신일자, 3 입고일자
//		String pYmdFrom = ordrRcvVO.getCrtrYmdFrom();	// "20231128";		// FROM_DATE
//		String pYmdTo = ordrRcvVO.getCrtrYmdTo();		// "20231128";			// TO_DATE
		
		String pYmdFrom = ordrRcvVO.getCrtrYmd();
		String pYmdTo = ordrRcvVO.getCrtrYmd();
		
		String pPoNo = "";			// PO_NO			구매번호
		String pRecvStatus = "";		// EDI_RECV_STATUS 	수신구분: NULL, Y, N
		String pVndrCd = "All";		// VENDOR_CODE		업체코드: 전체 ALL, 쉼표로 분리
		String pDocCd = "ALL";		// EDI_DOC_CODE		수신여부: 전체 ALL 주문서 ORDER, 주문변경서 ORDCHG

		String pUseMapYn = "Y";		// 고정

		// 주문서 조회
		Map<String, String> ordrParams = new HashMap<>();
		ordrParams.put("mode", 				pMode);
		ordrParams.put("HOUSE_CODE", 		pHouseCode);
		ordrParams.put("COMPANY_CODE", 		pCompanyCode);
		ordrParams.put("USER_ID", 			pUserId);
		ordrParams.put("DATE_GUBUN", 		pYmdType);
		ordrParams.put("FROM_DATE", 		pYmdFrom);
		ordrParams.put("TO_DATE", 			pYmdTo);
		ordrParams.put("PO_NO", 			pPoNo);
		ordrParams.put("EDI_RECV_STATUS", 	pRecvStatus);
		ordrParams.put("VENDOR_CODE", 		pVndrCd);
		ordrParams.put("EDI_DOC_CODE", 		pDocCd);
		ordrParams.put("IbatisSelQryID", 	pQryIdOrdrList);
		ordrParams.put("USE_MAP_YN", 		pUseMapYn);

		Connection.Response ordrResponse = Jsoup.connect(cmndUrl)
	                                                .timeout(10000)
	                                                .header("Origin", originUrl)
	                                                .header("Referer", indexUrl)
	                                                .header("Accept", "application/json, text/javascript, */*; q=0.01")
	                                                .header("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8")
	                                                .header("Accept-Encoding", "gzip, deflate, br")
	                                                .header("Accept-Language", "ko-KR,ko;q=0.8,en-US;q=0.6,en;q=0.4")
	                                                .header("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36")
	                                                .cookie("JSESSIONID", jsessionId)
	                                                .data(ordrParams)
	                                                .method(Connection.Method.POST)
	                                                .execute();

		Object objOrdr = jsonParser.parse(ordrResponse.body());
		JSONObject jsonObjOrdr = (JSONObject) objOrdr;

		boolean isSuccess = (Boolean)jsonObjOrdr.get("resultCd");
		String resultMsg = (String)jsonObjOrdr.get("resultMsg");

		if (!isSuccess) {
			rtnObj = ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, resultMsg);
		}

		String rcptnYmd = cmnsValidationService.selectNowDateString();

		if (rtnObj == null) {
			JSONArray ordrItems = (JSONArray)jsonObjOrdr.get("items");
			if (ordrItems == null || ordrItems.isEmpty()) {
				logger.debug("### 주문서정보 없음");
				rtnObj = ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "주문서정보");
			}

			if (rtnObj == null) {
				List<OrdrHomeplusMVO> ordrList = new ArrayList<>();

				for ( int i = 0; i < ordrItems.size(); i++ ){
					JSONObject ordr = (JSONObject)ordrItems.get(i);
					String buyerNm = (String)ordr.get("BUYER_NM");
					String canprint = (String)ordr.get("CANPRINT");
					String companyCode = (String)ordr.get("COMPANY_CODE");
					String companyNm = (String)ordr.get("COMPANY_NM");
					String docKindName = (String)ordr.get("DOC_KIND_NAME");
					String ediDocCode = (String)ordr.get("EDI_DOC_CODE");
					String ediDocFilename = (String)ordr.get("EDI_DOC_FILENAME");
					String ediDocSize = (String)ordr.get("EDI_DOC_SIZE");
					String ediRecvDate = (String)ordr.get("EDI_RECV_DATE");
					String ediRecvStatus = (String)ordr.get("EDI_RECV_STATUS");
					String ediRecvStatusNm = (String)ordr.get("EDI_RECV_STATUS_NM");
					String ediRecvTime = (String)ordr.get("EDI_RECV_TIME");
					String ediRefNo = (String)ordr.get("EDI_REF_NO");
					String ediSendDate = (String)ordr.get("EDI_SEND_DATE");
					String ediSendTime = (String)ordr.get("EDI_SEND_TIME");
					String goChg = (String)ordr.get("GO_CHG");
					String grDate = (String)ordr.get("GR_DATE");
					String grKind = (String)ordr.get("GR_KIND");
					String grType = (String)ordr.get("GR_TYPE");
					String houseCode = (String)ordr.get("HOUSE_CODE");
					String noticeFlag = (String)ordr.get("NOTICE_FLAG");
					String orderFlag = (String)ordr.get("ORDER_FLAG");
					String oriTbl = (String)ordr.get("ORI_TBL");
					String poAmtSum = (String)ordr.get("PO_AMT_SUM");
					String poDate = (String)ordr.get("PO_DATE");
					String poNo = (String)ordr.get("PO_NO");
					String rownum = (String)ordr.get("ROWNUM");
					String uniKey = (String)ordr.get("UNI_KEY");
					String userId = (String)ordr.get("USER_ID");
					String uuid = (String)ordr.get("UUID");
					String vendorCode = (String)ordr.get("VENDOR_CODE");
					String vendorNm = (String)ordr.get("VENDOR_NM");
					String virtualWarehouseCode = (String)ordr.get("VIRTUAL_WAREHOUSE_CODE");
					String virtualWarehouseNm = (String)ordr.get("VIRTUAL_WAREHOUSE_NM");
					String virtualWarehouseText = (String)ordr.get("VIRTUAL_WAREHOUSE_TEXT");
					String warehouseCode = (String)ordr.get("WAREHOUSE_CODE");
					String warehouseNm = (String)ordr.get("WAREHOUSE_NM");

					OrdrHomeplusMVO ordrVO = new OrdrHomeplusMVO();
					ordrVO.setBuyerNm(buyerNm);
					ordrVO.setCanprint(canprint);
					ordrVO.setCompanyCode(companyCode);
					ordrVO.setCompanyNm(companyNm);
					ordrVO.setDocKindName(docKindName);
					ordrVO.setEdiDocCode(ediDocCode);
					ordrVO.setEdiDocFilename(ediDocFilename);
					ordrVO.setEdiDocSize(ediDocSize);
					ordrVO.setEdiRecvDate(ediRecvDate);
					ordrVO.setEdiRecvStatus(ediRecvStatus);
					ordrVO.setEdiRecvStatusNm(ediRecvStatusNm);
					ordrVO.setEdiRecvTime(ediRecvTime);
					ordrVO.setEdiRefNo(ediRefNo);
					ordrVO.setEdiSendDate(ediSendDate);
					ordrVO.setEdiSendTime(ediSendTime);
					ordrVO.setGoChg(goChg);
					ordrVO.setGrDate(grDate);
					ordrVO.setGrKind(grKind);
					ordrVO.setGrType(grType);
					ordrVO.setHouseCode(houseCode);
					ordrVO.setNoticeFlag(noticeFlag);
					ordrVO.setOrderFlag(orderFlag);
					ordrVO.setOriTbl(oriTbl);
					ordrVO.setPoAmtSum(poAmtSum);
					ordrVO.setPoDate(poDate);
					ordrVO.setPoNo(poNo);
					ordrVO.setRownum(rownum);
					ordrVO.setUniKey(uniKey);
					ordrVO.setUserId(userId);
					ordrVO.setUuid(uuid);
					ordrVO.setVendorCode(vendorCode);
					ordrVO.setVendorNm(vendorNm);
					ordrVO.setVirtualWarehouseCode(virtualWarehouseCode);
					ordrVO.setVirtualWarehouseNm(virtualWarehouseNm);
					ordrVO.setVirtualWarehouseText(virtualWarehouseText);
					ordrVO.setWarehouseCode(warehouseCode);
					ordrVO.setWarehouseNm(warehouseNm);

					ordrList.add(ordrVO);
				}

				for ( OrdrHomeplusMVO ordr : ordrList ) {

					Thread.sleep(1000); 	//	1초 대기

					// 개별 주문에 대한 상세 정보 조회

					// 주문서 조회
					Map<String, String> dtlParams = new HashMap<>();
					dtlParams.put("mode", 				pMode);
					dtlParams.put("HOUSE_CODE", 		pHouseCode);
					dtlParams.put("COMPANY_CODE", 		pCompanyCode);
					dtlParams.put("USER_ID", 			ordr.getUserId());
					dtlParams.put("UNI_KEY", 			ordr.getUniKey());
					dtlParams.put("GR_DATE", 			ordr.getGrDate());
					dtlParams.put("WAREHOUSE_CODE", 	ordr.getWarehouseCode());
					dtlParams.put("IbatisSelQryID", 	pQryIdOrdrDtl);


					Connection.Response ordrDtlResponse = Jsoup.connect(cmndUrl)
		                    .timeout(10000)
		                    .header("Origin", originUrl)
		                    .header("Referer", indexUrl)
		                    .header("Accept", "application/json, text/javascript, */*; q=0.01")
		                    .header("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8")
		                    .header("Accept-Encoding", "gzip, deflate, br")
		                    .header("Accept-Language", "ko-KR,ko;q=0.8,en-US;q=0.6,en;q=0.4")
		                    .header("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36")
		                    .cookie("JSESSIONID", jsessionId)
		                    .data(dtlParams)
		                    .method(Connection.Method.POST)
		                    .execute();
					logger.debug("### ordrDtl body");

					Object objOrdrDtl = jsonParser.parse(ordrDtlResponse.body());
					JSONObject jsonObjOrdrDtl = (JSONObject) objOrdrDtl;

					isSuccess = (Boolean)jsonObjOrdrDtl.get("resultCd");
					resultMsg = (String)jsonObjOrdrDtl.get("resultMsg");

					if (!isSuccess) {
						//return ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, resultMsg);
						continue;
					}

					JSONArray ordrDtlItems = (JSONArray)jsonObjOrdrDtl.get("items");
					if (ordrDtlItems == null || ordrDtlItems.isEmpty()) {
						//return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "주문서정보");
						continue;
					}

					List<OrdrHomeplusSVO> ordrDtlList = new ArrayList<>();

					for ( int i = 0; i < ordrDtlItems.size(); i++ ){
						JSONObject dtl = (JSONObject)ordrDtlItems.get(i);
						String companyCode = (String)dtl.get("COMPANY_CODE");
						String diamondItem = (String)dtl.get("DIAMOND_ITEM");
						String freeQty = (String)dtl.get("FREE_QTY");
						String grQty = (String)dtl.get("GR_QTY");
						String grType = (String)dtl.get("GR_TYPE");
						String grTypeNm = (String)dtl.get("GR_TYPE_NM");
						String houseCode = (String)dtl.get("HOUSE_CODE");
						String ibsuQty = (String)dtl.get("IBSU_QTY");
						String itemCode = (String)dtl.get("ITEM_CODE");
						String itemNm = (String)dtl.get("ITEM_NM");
						String piecePrice = (String)dtl.get("PIECE_PRICE");
						String poAmt = (String)dtl.get("PO_AMT");
						String poEaQty = (String)dtl.get("PO_EA_QTY");
						String poNo = (String)dtl.get("PO_NO");
						String poPrice = (String)dtl.get("PO_PRICE");
						String poQty = (String)dtl.get("PO_QTY");
						String poUnit = (String)dtl.get("PO_UNIT");
						String priceTax = (String)dtl.get("PRICE_TAX");
						String seq = (String)dtl.get("SEQ");
						String storeCode = (String)dtl.get("STORE_CODE");
						String storeNm = (String)dtl.get("STORE_NM");

						OrdrHomeplusSVO dtlVO = new OrdrHomeplusSVO();
						dtlVO.setCompanyCode(companyCode);
						dtlVO.setDiamondItem(diamondItem);
						dtlVO.setFreeQty(freeQty);
						dtlVO.setGrQty(grQty);
						dtlVO.setGrType(grType);
						dtlVO.setGrTypeNm(grTypeNm);
						dtlVO.setHouseCode(houseCode);
						dtlVO.setIbsuQty(ibsuQty);
						dtlVO.setItemCode(itemCode);
						dtlVO.setItemNm(itemNm);
						dtlVO.setPiecePrice(piecePrice);
						dtlVO.setPoAmt(poAmt);
						dtlVO.setPoEaQty(poEaQty);
						dtlVO.setPoNo(poNo);
						dtlVO.setPoPrice(poPrice);
						dtlVO.setPoQty(poQty);
						dtlVO.setPoUnit(poUnit);
						dtlVO.setPriceTax(priceTax);
						dtlVO.setSeq(seq);
						dtlVO.setStoreCode(storeCode);
						dtlVO.setStoreNm(storeNm);

						ordrDtlList.add(dtlVO);
					}

					ordr.setOrdrDtlList(ordrDtlList);
				}

				if (ordrList == null || ordrList.isEmpty()) {
					rtnObj = ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "주문수신정보");
				}

				if (rtnObj == null) {
					String apcCd = ordrRcvVO.getApcCd();
					String sysUserId = ordrRcvVO.getSysFrstInptUserId();
					String sysPrgrmId = ordrRcvVO.getSysFrstInptPrgrmId();

					for ( OrdrHomeplusMVO ordr : ordrList ) {

						List<OrdrHomeplusSVO> ordrDtlList = ordr.getOrdrDtlList();

						if (ordrDtlList == null) {
							continue;
						}

						String dldtnYmd = ordr.getGrDate();
						String outordrno = ordr.getPoNo();
						String docNo = ordr.getEdiRefNo();
						String outordrYmd = ordr.getPoDate();
						String dlvgdsYmd = ordr.getGrDate();
						String ordrPrsn = ComUtil.nullToEmpty(ordr.getCompanyNm())
											+ ComConstants.CON_SPACE
											+ ComUtil.nullToEmpty(ordr.getBuyerNm());
						String ordrPrsnCd = ordr.getCompanyCode();
						String buyerNm = ordr.getBuyerNm();
						String dlvgdsCo = ComUtil.nullToEmpty(ordr.getWarehouseCode())
											+ ComConstants.CON_SPACE
											+ ComUtil.nullToEmpty(ordr.getWarehouseNm());
						String splyPrsn = ComUtil.nullToEmpty(ordr.getVendorCode())
											+ ComConstants.CON_SPACE
											+ ComUtil.nullToEmpty(ordr.getVendorNm());
						// 납품처명
						String dlvgdsNm = ordr.getVirtualWarehouseNm();
						// 납품처코드
						String dlvgdsCd = ordr.getVirtualWarehouseCode();
						// 센터구분
						String cntrSe = ordr.getVirtualWarehouseText();
						// 센터코드
						String cntrCd = ordr.getVirtualWarehouseCode();
						// 센터명
						String cntrNm = ordr.getVirtualWarehouseNm();


						for ( OrdrHomeplusSVO dtl : ordrDtlList ) {

							OrdrRcvHomeplusVO homeplusVO = new OrdrRcvHomeplusVO();

							homeplusVO.setSysFrstInptUserId(sysUserId);
							homeplusVO.setSysFrstInptPrgrmId(sysPrgrmId);
							homeplusVO.setSysLastChgUserId(sysUserId);
							homeplusVO.setSysLastChgPrgrmId(sysPrgrmId);

							homeplusVO.setApcCd(apcCd);
							// 수신일자
							homeplusVO.setRcptnYmd(rcptnYmd);
							// 처리구분코드
							homeplusVO.setPrcsSeCd(AmConstants.CON_PRCS_SE_CD_PENDING);
							// 배송일자
							homeplusVO.setDldtnYmd(dldtnYmd);
							// 발주번호
							homeplusVO.setOutordrno(outordrno);
							// 발주유형
							homeplusVO.setOutordrType(AmConstants.CON_OUTORDR_TYPE_MART);
							// 문서번호
							homeplusVO.setDocNo(docNo);
							// 발주일자
							homeplusVO.setOutordrYmd(outordrYmd);
							// 납품일자
							homeplusVO.setDlvgdsYmd(dlvgdsYmd);
							// 주문자
							homeplusVO.setOrdrPrsn(ordrPrsn);
							// 주문자코드
							homeplusVO.setOrdrPrsnCd(ordrPrsnCd);
							// 바이어명
							homeplusVO.setBuyerNm(buyerNm);
							// 납품처
							homeplusVO.setDlvgdsCo(dlvgdsCo);
							// 공급자
							homeplusVO.setSplyPrsn(splyPrsn);
							// 입고일자
							homeplusVO.setWrhsYmd(dlvgdsYmd);
							// 납품처명
							homeplusVO.setDlvgdsNm(dlvgdsNm);
							// 납품처코드
							homeplusVO.setDlvgdsCd(dlvgdsCd);
							// 센터구분
							homeplusVO.setCntrSe(cntrSe);
							// 센터코드
							homeplusVO.setCntrCd(cntrCd);
							// 센터명
							homeplusVO.setCntrNm(cntrNm);

							// detail
							// 입고유형
							homeplusVO.setWrhsType(dtl.getGrType());
							// 입고유형명
							homeplusVO.setWrhsTypeNm(dtl.getGrTypeNm());
							// 상품코드
							homeplusVO.setGdsCd(dtl.getItemCode());
							// 상품명
							homeplusVO.setGdsNm(dtl.getItemNm());
							// DiamondLine
							homeplusVO.setDiamondline(dtl.getDiamondItem());
							// 배송지
							homeplusVO.setDldtnCd(dtl.getStoreCode());
							// 배송지 코드
							homeplusVO.setDldtn(dtl.getStoreNm());
							// 입수
							int bxGdsQntt = NumberUtils.parseNumber(dtl.getIbsuQty(), Integer.class);
							homeplusVO.setBxGdsQntt(bxGdsQntt);
							// 발주수량
							int outordrQntt = NumberUtils.parseNumber(dtl.getPoQty(), Integer.class);
							homeplusVO.setOutordrQntt(outordrQntt);
							// 낱개수량
							int pieceQntt = NumberUtils.parseNumber(dtl.getPoEaQty(), Integer.class);
							homeplusVO.setPieceQntt(pieceQntt);
							// 단위
							homeplusVO.setUnitCd(dtl.getPoUnit());
							// 박스당 단가
							double bxUntprc = NumberUtils.parseNumber(dtl.getPoPrice(), Double.class);
							homeplusVO.setBxUntprc(bxUntprc);
							// 낱개당 단가
							double pieceUntprc = NumberUtils.parseNumber(dtl.getPiecePrice(), Double.class);
							homeplusVO.setPieceUntprc(pieceUntprc);
							// 세액
							double txAmt = NumberUtils.parseNumber(dtl.getPriceTax(), Double.class);
							homeplusVO.setTxAmt(txAmt);
							// 발주금액
							double outordrAmt = NumberUtils.parseNumber(dtl.getPoAmt(), Double.class);
							homeplusVO.setOutordrAmt(outordrAmt);

							ordrRcvMapper.insertOrdrRcvHomeplus(homeplusVO);
						}
					}
				}
			}
		}

		if (rtnObj != null) {

			Thread.sleep(2000); 	//	1초 대기
		}

		// 저장 후 로그아웃 처리
		//login 처리 후 진행
		Map<String, String> logoutParam = new HashMap<>();
		logoutParam.put("logout", "TRUE");

		// 로그아웃 페이지 접속
		String logoutUrl = originUrl + "Homeplus/logout.do";
		Connection.Response logoutResponse = Jsoup.connect(logoutUrl)
		                                                .timeout(3000)
		                                                .header("Origin", originUrl)
		                                                .header("Referer", indexUrl)
		                                                .header("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8")
		                                                .header("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8")
		                                                .header("Accept-Encoding", "gzip, deflate, br")
		                                                .header("Accept-Language", "ko-KR,ko;q=0.8,en-US;q=0.6,en;q=0.4")
		                                                .cookie("JSESSIONID", jsessionId)
		                                                .cookie("isLogined", "true")
		                                                .data(logoutParam)
		                                                .method(Connection.Method.POST)
		                                                .execute();

		if (rtnObj != null) {
			return rtnObj;
		}

		// I/F TB >> ORDR TB 처
		ordrRcvVO.setRcptnYmd(rcptnYmd);
		ordrRcvMapper.insertSpOrdrRcvHmpls(ordrRcvVO);

		if (StringUtils.hasText(ordrRcvVO.getRtnCd())) {
			rtnObj = ComUtil.getResultMap(ordrRcvVO.getRtnCd(), ordrRcvVO.getRtnMsg());
			throw new EgovBizException(getMessageForMap(rtnObj));
		}

		return null;
	}

	@Override
	public HashMap<String, Object> insertSSGOrdr(OrdrRcvVO ordrRcvVO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public HashMap<String, Object> insertLotteOrdr(OrdrRcvVO ordrRcvVO) throws Exception {
		JSONParser jsonParser = new JSONParser();


		String originUrl = "https://activescm.co.kr/";
		String welcomeUrl = originUrl + "Homeplus/welcome.do";
		String indexUrl = originUrl + "Homeplus/index.do";
		String userType = "S";	// 공급자
		String userId = "";
		String userPw = "";
		String grDate = "20231016";
		String qryId = "po.itemOrderSql";
		String jsessionId = "";

		Connection.Response welcomeResponse = Jsoup.connect(welcomeUrl)
                .timeout(3000)
                .header("Origin", originUrl)
                .header("Referer", welcomeUrl)
                .header("Connection", "keep-alive")
                .header("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8")
                .header("Content-Type", "application/x-www-form-urlencoded")
                .header("Accept-Encoding", "gzip, deflate, br")
                .header("Accept-Language", "ko-KR,ko;q=0.8,en-US;q=0.6,en;q=0.4")
                .method(Connection.Method.GET)
                .execute();
		jsessionId = welcomeResponse.cookie("JSESSIONID");

		//login 처리 후 진행
		Map<String, String> params = new HashMap<>();
		params.put("USER_TYPE", userType);
		params.put("USER_ID", userId);
		params.put("PASSWORD", userPw);

		// 로그인 페이지 접속
		String loginUrl = originUrl + "Homeplus/login/checkUserIdPw.do;jsessionid=" + jsessionId;
		Connection.Response loginPageResponse = Jsoup.connect(loginUrl)
		                                                .timeout(3000)
		                                                .header("Origin", originUrl)
		                                                .header("Referer", loginUrl)
		                                                .header("Connection", "keep-alive")
		                                                .header("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8")
		                                                .header("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8")
		                                                .header("Accept-Encoding", "gzip, deflate, br")
		                                                .header("Accept-Language", "ko-KR,ko;q=0.8,en-US;q=0.6,en;q=0.4")
		                                                .cookie("JSESSIONID", jsessionId)
		                                                .data(params)
		                                                .method(Connection.Method.POST)
		                                                .execute();

		Object obj = jsonParser.parse(loginPageResponse.body());
		JSONObject jsonObj = (JSONObject) obj;

		Connection.Response indexResponse = Jsoup.connect(welcomeUrl)
                .timeout(3000)
                .header("Origin", originUrl)
                .header("Referer", welcomeUrl)
                .header("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8")
                .header("Content-Type", "application/x-www-form-urlencoded")
                .header("Accept-Encoding", "gzip, deflate, br")
                .header("Accept-Language", "ko-KR,ko;q=0.8,en-US;q=0.6,en;q=0.4")
                .cookie("JSESSIONID", jsessionId)
                //.cookie("isLogined", "true")
                .method(Connection.Method.GET)
                .execute();

		// 로그인 성공 시 진행
		// 상품별 발주정보 조회
		//login 처리 후 진행
		Map<String, String> gdsParams = new HashMap<>();
		gdsParams.put("mode", "search");
		gdsParams.put("HOUSE_CODE", "100");
		gdsParams.put("COMPANY_CODE", "100");
		gdsParams.put("WAREHOUSE_CODE", "");
		gdsParams.put("USER_ID", userId);
		gdsParams.put("GR_DATE", grDate);
		gdsParams.put("GR_TYPE", "");
		gdsParams.put("IbatisSelQryID", qryId);
		gdsParams.put("USE_MAP_YN", "Y");

		String gdsOrdrUrl = originUrl + "Homeplus/cmmn/command.do;jsessionid=" + jsessionId;
		Connection.Response gdsOrdrResponse = Jsoup.connect(gdsOrdrUrl)
	                                                .timeout(10000)
	                                                .header("Origin", originUrl)
	                                                .header("Referer", indexUrl)
	                                                .header("Accept", "application/json, text/javascript, */*; q=0.01")
	                                                .header("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8")
	                                                .header("Accept-Encoding", "gzip, deflate, br")
	                                                .header("Accept-Language", "ko-KR,ko;q=0.8,en-US;q=0.6,en;q=0.4")
	                                                .header("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36")
	                                                .cookie("JSESSIONID", jsessionId)
	                                                //.cookie("isLogined", "true")
	                                                .data(gdsParams)
	                                                .method(Connection.Method.POST)
	                                                .execute();

		Object objGds = jsonParser.parse(gdsOrdrResponse.body());
		JSONObject jsonObjGds = (JSONObject) objGds;

		JSONArray items = (JSONArray)jsonObjGds.get("items");

		if (items != null && !items.isEmpty()) {
			for ( int i = 0; i < items.size(); i++ ){
				JSONObject item = (JSONObject)items.get(i);

				String companyCode = (String)item.get("COMPANY_CODE");
				String houseCode = (String)item.get("HOUSE_CODE");
				String grType = (String)item.get("GR_TYPE");
				String grTypeNm = (String)item.get("GR_TYPE_NM");
				String itemCode = (String)item.get("ITEM_CODE");
				String itemNm = (String)item.get("ITEM_NM");
				String styleNo = (String)item.get("STYLE_NO");
				String diamondItem = (String)item.get("DIAMOND_ITEM");
				int poQty = Integer.parseInt(String.valueOf(item.get("PO_QTY")));
				String poUnit = (String)item.get("PO_UNIT");
				int poEaQty = Integer.parseInt(String.valueOf(item.get("PO_EA_QTY")));
				double poAmt = Double.parseDouble(String.valueOf(item.get("PO_AMT")));
				double poPrice = Double.parseDouble(String.valueOf(item.get("PO_PRICE")));
				int ibsuQty = Integer.parseInt(String.valueOf(item.get("IBSU_QTY")));
				int freeQty = Integer.parseInt(String.valueOf(item.get("FREE_QTY")));
				double priceTax = Double.parseDouble(String.valueOf(item.get("PRICE_TAX")));

				logger.debug("## line {}", i+1);
				logger.debug("companyCode: {}", companyCode);
				logger.debug("houseCode: {}", houseCode);
				logger.debug("grType: {}", grType);
				logger.debug("grTypeNm: {}", grTypeNm);
				logger.debug("itemCode: {}", itemCode);
				logger.debug("itemNm: {}", itemNm);
				logger.debug("styleNo: {}", styleNo);
				logger.debug("diamondItem: {}", diamondItem);
				logger.debug("poQty: {}", poQty);
				logger.debug("poUnit: {}", poUnit);
				logger.debug("poEaQty: {}", poEaQty);
				logger.debug("poAmt: {}", poAmt);
				logger.debug("poPrice: {}", poPrice);
				logger.debug("ibsuQty: {}", ibsuQty);
				logger.debug("freeQty: {}", freeQty);
				logger.debug("priceTax: {}", priceTax);
			}
		}

		// 상품별 발주정보 저장

		// 저장 후 로그아웃 처리
		//login 처리 후 진행
		Map<String, String> logoutParam = new HashMap<>();
		logoutParam.put("logout", "TRUE");

		// 로그인 페이지 접속
		String logoutUrl = originUrl + "Homeplus/logout.do";
		Connection.Response logoutResponse = Jsoup.connect(logoutUrl)
		                                                .timeout(3000)
		                                                .header("Origin", originUrl)
		                                                .header("Referer", indexUrl)
		                                                .header("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8")
		                                                .header("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8")
		                                                .header("Accept-Encoding", "gzip, deflate, br")
		                                                .header("Accept-Language", "ko-KR,ko;q=0.8,en-US;q=0.6,en;q=0.4")
		                                                .cookie("JSESSIONID", jsessionId)
		                                                .cookie("isLogined", "true")
		                                                .data(logoutParam)
		                                                .method(Connection.Method.POST)
		                                                .execute();
		/*
	    "resultCd": true,
	    "resultMsg": "조회가 완료되었습니다.",
	    "mode": "search"
    	"items": [
    	          {
    	              "PO_EA_QTY": "20",          // 낱개수량
    	              "PRICE_TAX": "0",           // 세액
    	              "IBSU_QTY": "20",           // 입수
    	              "GR_TYPE": "2",             // 입고유형
    	              "HOUSE_CODE": "100",        // 창고코드
    	              "DIAMOND_ITEM": null,
    	              "PO_AMT": "540000",         // 발주금액
    	              "FREE_QTY": "0",
    	              "ITEM_CODE": "050536563",   // 상품코드
    	              "ITEM_NM": "안면도농협_태양초_고춧가루_500g(봉)",   // 상품명
    	              "PO_QTY": "1",              // 발주수량
    	              "PO_UNIT": "EA",            // 발주단위
    	              "COMPANY_CODE": "100",      // 업체코드
    	              "STYLE_NO": "158083717",    // TPND
    	              "PO_PRICE": "540000",       // 발주가격
    	              "GR_TYPE_NM": "HYPER_FLOW"  // 입고유형 명칭
    	          },
	    	*/
		return null;
	}

	@Override
	public HashMap<String, Object> insertGSRetailOrdr(OrdrRcvVO ordrRcvVO) throws Exception {

		// GS리테일
		// http://gs.escm21.net/escm21/home/index.jsp
		JSONParser jsonParser = new JSONParser();

		String originUrl = "http://gs.escm21.net/";
		String indexUrl = originUrl + "escm21/home/index.jsp";
		String userId = "mnohy01";
		String password = "2222";
		
		String uid = userId.toUpperCase();
		String empid = "ADMIN";
		String jsessionId = "";
		
		Connection.Response indexResponse = Jsoup.connect(indexUrl)
                .timeout(3000)
                .header("Origin", originUrl)
                .header("Referer", indexUrl)
                .header("Connection", "keep-alive")
                .header("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8")
                .header("Content-Type", "application/x-www-form-urlencoded")
                .header("Accept-Encoding", "gzip, deflate, br")
                .header("Accept-Language", "ko-KR,ko;q=0.8,en-US;q=0.6,en;q=0.4")
                .method(Connection.Method.GET)
                .execute();
		
		jsessionId = indexResponse.cookie("JSESSIONID");
		logger.debug("jsessionId {}", jsessionId);
		
		Document indexDoc = Jsoup.parse(indexResponse.body());
		Element elKeyModulus = indexDoc.getElementById("rsaPublicKeyModulus");
		Element elKeyExponent = indexDoc.getElementById("rsaPublicKeyExponent");
		String rsaPublicKeyModulus = elKeyModulus.val();
		String rsaPublicKeyExponent = elKeyExponent.val();
		logger.debug("rsaPublicKeyModulus {}", rsaPublicKeyModulus);
		logger.debug("rsaPublicKeyExponent {}", rsaPublicKeyExponent);
		
		
		String securedUid = ComRSACrypto.encryptRSA(uid, rsaPublicKeyModulus, rsaPublicKeyExponent);
		String securedEmpid = ComRSACrypto.encryptRSA(empid, rsaPublicKeyModulus, rsaPublicKeyExponent);
		String securedBmbh = ComRSACrypto.encryptRSA(password, rsaPublicKeyModulus, rsaPublicKeyExponent);		
		
		Map<String, String> loginParam = new HashMap<>();
		loginParam.put("securedUid", securedUid);
		loginParam.put("securedEmpid", securedEmpid);
		loginParam.put("securedBmbh", securedBmbh);
		
		// 로그인 페이지 접속
		String loginUrl = originUrl + "escm21/usr/login.do?method=login";
		Connection.Response loginResponse = Jsoup.connect(loginUrl)
		                                                .timeout(3000)
		                                                .header("Origin", originUrl)
		                                                .header("Referer", indexUrl)
		                                                .header("Connection", "keep-alive")
		                                                .header("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8")
		                                                .header("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8")
		                                                .header("Accept-Encoding", "gzip, deflate, br")
		                                                .header("Accept-Language", "ko-KR,ko;q=0.8,en-US;q=0.6,en;q=0.4")
		                                                .cookie("JSESSIONID", jsessionId)
		                                                .data(loginParam)
		                                                .method(Connection.Method.POST)
		                                                .execute();

		Document loginDoc = Jsoup.parse(loginResponse.body());
		//logger.debug("@@@loginDoc");
		//logger.debug(loginDoc.toString());
		

		//http://gs.escm21.net/escm21/ord/pod.do?method=list
		Map<String, String> listParam = new HashMap<>();
		listParam.put("send_flag", "RCV");
		listParam.put("linePerPage", "1000");
		listParam.put("i_curPage", "1");
		listParam.put("sortkey", "dlv_tm");
		listParam.put("descasc", "desc");
		listParam.put("radio_sendflag", "RCV");
		listParam.put("doc_name", "ALL");
		listParam.put("rslt", "ALL");
		listParam.put("balju_type", "ALL");
		listParam.put("buy_id", "UGSSM01");
		listParam.put("ipgo_code", "ALL");
		listParam.put("balju_num", "ALL");
		listParam.put("time_gb", "dlv_tm");
		listParam.put("from_date", "20240206");
		listParam.put("to_date", "20240207");
		
		// 로그인 페이지 접속
		String ordUrl = originUrl + "escm21/ord/pod.do";
		String ordSearchUrl = ordUrl + "?method=search";
		String ordListUrl = ordUrl + "?method=list";
		
		//jsessionId = "CED32DFBF114302AC6A3AE4CBEE7BBE2.gs2";
		Connection.Response ordListResponse = Jsoup.connect(ordListUrl)
		                                                .timeout(3000)
		                                                .header("Origin", originUrl)
		                                                .header("Referer", ordSearchUrl)
		                                                .header("Connection", "keep-alive")
		                                                .header("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8")
		                                                .header("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8")
		                                                .header("Accept-Encoding", "gzip, deflate, br")
		                                                .header("Accept-Language", "ko-KR,ko;q=0.8,en-US;q=0.6,en;q=0.4")
		                                                .cookie("JSESSIONID", jsessionId)
		                                                .data(listParam)
		                                                .method(Connection.Method.GET)
		                                                .execute();

		Document ordListDoc = Jsoup.parse(ordListResponse.body());
		//logger.debug("@@@@@@@@@@@@@ordListDoc");
		//logger.debug(ordListDoc.toString());


		Elements mtsidEls = ordListDoc.select("[name='mtsid']");
		Elements docCountEls = ordListDoc.select("[name='doc_count']");
		Elements tmpRcptEls = ordListDoc.select("[name='tmp_rcpt']");
		Elements tmpOrgtEls = ordListDoc.select("[name='tmp_orgt']");
		Elements sndSizeEls = ordListDoc.select("[name='sndsize']");
		Elements rcvSizeEls = ordListDoc.select("[name='rcvsize']");
		Elements rsltEls = ordListDoc.select("[name='rslt']");
		Elements docNameEls = ordListDoc.select("[name='docname']");
		
		//logger.debug("mtsidEls size: {}", mtsidEls.size());
		//logger.debug("docCountEls size: {}", docCountEls.size());
		//logger.debug("tmpRcptEls size: {}", tmpRcptEls.size());
		//logger.debug("tmpOrgtEls size: {}", tmpOrgtEls.size());
		//logger.debug("sndSizeEls size: {}", sndSizeEls.size());
		//logger.debug("rcvSizeEls size: {}", rcvSizeEls.size());
		//logger.debug("rsltEls size: {}", rsltEls.size());
		//logger.debug("docNameEls size: {}", docNameEls.size());
		
		
		Elements elements = ordListDoc.select("[name='mtsid']");
		for( Element element : elements ) {
			//logger.debug("mtsid: {}", element.val());
		} // for end
		
		
		//logger.debug("@@@@@@@@@@@@@ordExcel");
//		
//		// 주문목록 excel download
//		//http://gs.escm21.net/escm21/ord/pod.do?method=list&job=exc
//		Map<String, String> ordExcelParam = new HashMap<>();
//		ordExcelParam.put("send_flag", "RCV");
//		ordExcelParam.put("linePerPage", "1000");
//		ordExcelParam.put("i_curPage", "1");
//		ordExcelParam.put("sortkey", "dlv_tm");
//		ordExcelParam.put("descasc", "desc");
//		ordExcelParam.put("radio_sendflag", "RCV");
//		ordExcelParam.put("doc_name", "ALL");
//		ordExcelParam.put("rslt", "ALL");
//		ordExcelParam.put("balju_type", "ALL");
//		ordExcelParam.put("buy_id", "UGSSM01");
//		ordExcelParam.put("ipgo_code", "ALL");
//		ordExcelParam.put("balju_num", "ALL");
//		ordExcelParam.put("time_gb", "dlv_tm");
//		ordExcelParam.put("from_date", "20240206");
//		ordExcelParam.put("to_date", "20240207");
//		
//		
//		
//		String ordExcelUrl = ordUrl + "?method=list&job=exc";
//		
//		URL url = new URL(ordExcelUrl);
//		HttpURLConnection conn = (HttpURLConnection)url.openConnection();
//		
//		conn.setDoInput(true);
//		conn.setDoOutput(true);
//		conn.setUseCaches(false);
//		conn.setRequestMethod("POST");
//		conn.setConnectTimeout(10000);
//		conn.setAllowUserInteraction(true);
//		//https://lonelycat.tistory.com/314
//		
//		
//		int responseCode = conn.getResponseCode();
//		
//		Connection.Response ordExcelResponse = Jsoup.connect(ordExcelUrl)
//				.timeout(3000)
//                .header("Origin", originUrl)
//                .header("Referer", ordSearchUrl)
//                .header("Connection", "keep-alive")
//                .header("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8")
//                .header("Content-Type", "application/x-www-form-urlencoded")
//                .header("Accept-Encoding", "gzip, deflate, br")
//                .header("Accept-Language", "ko-KR,ko;q=0.8,en-US;q=0.6,en;q=0.4")
//                .cookie("JSESSIONID", jsessionId)
//                .data(ordExcelParam)
//                .method(Connection.Method.POST)
//                .followRedirects(true)
//                .ignoreContentType(true)
//                .execute();
//		
//		logger.debug("@@@@@@@@@@@@@ordExcelResponse");
//		//File tempFile = File.createTempFile("tempfile", "html");
//        //tempFile.deleteOnExit();
//		File file = new File("C:\\DATA\\apcss\\", "test.html");
//        BufferedInputStream inputStream = ordExcelResponse.bodyStream();
//        FileOutputStream fos = new FileOutputStream(file);
//        fos.write(ordExcelResponse.bodyAsBytes());
//        fos.close();
//        
//        byte[] buffer = new byte[1024];
//        int len;
//        while ((len = inputStream.read(buffer)) != -1) {
//            fos.write(buffer, 0, len);
//        }
//        inputStream.close();
//        fos.close();
//		
		
		
		//Document ordExcelDoc = ordExcelResponse.parse();
		
		//logger.debug(ordExcelDoc.toString());
		/*
		BufferedInputStream is = ordExcelResponse.bodyStream();
		
		FileOutputStream os = null;
		os = new FileOutputStream(new File("C:\\DATA\\apcss\\", "test.html"));
		
		final int BUFFER_SIZE = 4096;
        int bytesRead;
        byte[] buffer = new byte[BUFFER_SIZE];
        
        while((bytesRead = is.read(buffer)) != -1){
        	os.write(buffer, 0, bytesRead);
        }
		
        os.close();
        is.close();
		*/
		/*
		Workbook workbook = null;
		

        try {
            
			workbook = new HSSFWorkbook(buffer);
			
			 // 엑셀파일에서 첫번째 시트 불러오기
	        Sheet worksheet = workbook.getSheetAt(0);
	        
	        // getPhysicalNumberOfRow 는 행의 갯수를 불러오는 매소드
	        for (int i = 3; i < worksheet.getPhysicalNumberOfRows(); i++) {
	            
	            // i번째 행 정보 가져오기
	            Row row = worksheet.getRow(i);	            
	            // 날짜포맷
	            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

	            if (row != null) {
	            	// 12
	                for (int j = 1; j <= 12; j++) {
	                	
	                	if (j != 12) {
	                		continue;
	                	}
	                	
	                    // i번째 행의 j번째 셀 정보 가져오기
	                	Cell cell = row.getCell(j);
	                    String value = "";
	                    
	                    if (cell == null) {
	                        continue;
	                    } else {
	                        // 타입별로 내용 읽기
	                        switch (cell.getCellType()) {
	                           case Cell.CELL_TYPE_FORMULA:
	                              value = cell.getCellFormula();
	                              break;
	                           case Cell.CELL_TYPE_NUMERIC:
	                              if (HSSFDateUtil.isCellDateFormatted(cell)) { // 숫자- 날짜 타입이다.
	                                   value = formatter.format(cell.getDateCellValue());
	                              } else {
	                                   double numericCellValue = cell.getNumericCellValue();
	                                   value = String.valueOf(numericCellValue);
	                                   if (numericCellValue == Math.rint(numericCellValue)) {
	                                       value = String.valueOf((int) numericCellValue);
	                                   } else {
	                                       value = String.valueOf(numericCellValue);
	                                   }
	                              }
	                              break;
	                           case Cell.CELL_TYPE_STRING:
	                              value = cell.getStringCellValue() + "";
	                              break;
	                           case Cell.CELL_TYPE_BLANK:
	                              value = cell.getBooleanCellValue() + "";
	                              break;
	                           case Cell.CELL_TYPE_ERROR:
	                              value = cell.getErrorCellValue() + "";
	                              break;
	                           default:
	                              value = cell.getStringCellValue();
	                              break;
	                        }                                  
	                    }
	                    
	                    if (value != null) {
	                    	logger.debug("@@@[GSRetail] {} 행 - 발주번호 {})", i, value); 
	                    }
	                }
	            }
	        }
	        
	        workbook.close();
	        
    	} catch (Exception e) {
    		logger.error("error : {}", e.getMessage());
    		HashMap<String, Object> rtnObj = ComUtil.getResultMap(ComConstants.MSGCD_ERR_PARAM_ONE, "주문서수신");	// E0003 {0} 시 오류가 발생하였습니다.    		
    		throw new EgovBizException(getMessageForMap(rtnObj));
    	}
    	*/
		return null;
	}

	@Override
	public HashMap<String, Object> insertHanaroOrdr(OrdrRcvVO ordrRcvVO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public HashMap<String, Object> insertMrktOrdrRcpt(OrdrRcvVO ordrRcvVO) throws Exception {

		String apcCd = ordrRcvVO.getApcCd();
		String lgszMrktCd = ordrRcvVO.getLgszMrktCd();

		String crtrYmdFrom = ordrRcvVO.getCrtrYmdFrom();
		String crtrYmdTo = ordrRcvVO.getCrtrYmdTo();
		String crtrYmd = ordrRcvVO.getCrtrYmd();

		//logger.debug("@@@lgszMrktCd {}", lgszMrktCd);
		//logger.debug("@@@crtrYmdFrom {}", crtrYmdFrom);
		//logger.debug("@@@crtrYmdTo {}", crtrYmdTo);


		if (!StringUtils.hasText(crtrYmdFrom)) {
			crtrYmdFrom = crtrYmd;			
			ordrRcvVO.setCrtrYmdFrom(crtrYmdFrom);
		}
		
		if (!StringUtils.hasText(crtrYmdTo)) {
			crtrYmdTo = crtrYmd;
			ordrRcvVO.setCrtrYmdTo(crtrYmdTo);
		}
		
		if (!StringUtils.hasText(apcCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드");
		}

		if (!StringUtils.hasText(lgszMrktCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "대형마트구분");
		}

		if (!StringUtils.hasText(crtrYmdFrom)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "시작일자");
		}
		
		if (!StringUtils.hasText(crtrYmdTo)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "종료일자");
		}

		if (AmConstants.CON_LGSZ_MRKT_CD_EMART.equals(lgszMrktCd)) {

		} else if (AmConstants.CON_LGSZ_MRKT_CD_HOMEPLUS.equals(lgszMrktCd)) {
			
			//return insertHomplusOrdr(ordrRcvVO);
			// 홈플러스
			return insertMrktOrdrRcptHomeplus(ordrRcvVO);			
			
		} else if (AmConstants.CON_LGSZ_MRKT_CD_LOTTEMART.equals(lgszMrktCd)) {

			return insertMrktOrdrRcptLotteSuper(ordrRcvVO);
			
		} else if (AmConstants.CON_LGSZ_MRKT_CD_LOTTESUPER.equals(lgszMrktCd)) {
			
			// 롯데슈퍼
			return insertMrktOrdrRcptLotteSuper(ordrRcvVO);
			
		} else if (AmConstants.CON_LGSZ_MRKT_CD_GSRETAIL.equals(lgszMrktCd)) {
			
			
		} else {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "대형마트구분");
		}

		return null;
		
	}

	@Override
	public HashMap<String, Object> insertMrktOrdrRcptHomeplus(OrdrRcvVO ordrRcvVO) throws Exception {
		
		HashMap<String, Object> rtnObj = null;

		JSONParser jsonParser = new JSONParser();

		String runOnceYn = ordrRcvVO.getRunOnceYn();
		
		
		String originUrl = "https://activescm.co.kr/";
		String welcomeUrl = originUrl + "Homeplus/welcome.do";
		String indexUrl = originUrl + "Homeplus/index.do";

		// 홈플러스 접속정보를 가져온다
		LgszMrktVO lgszMrktVO = cnptService.selectLgszMrkt(ordrRcvVO.getApcCd(), ordrRcvVO.getLgszMrktCd());

		if (lgszMrktVO == null
				|| !StringUtils.hasText(lgszMrktVO.getLgszMrktCd())
				|| !StringUtils.hasText(lgszMrktVO.getUserId())
				|| !StringUtils.hasText(lgszMrktVO.getPswd())
				|| !ComConstants.CON_YES.equals(lgszMrktVO.getUseYn())
				) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "홈플러스 접속정보");
		}


		String pUserType = "S";	// 공급자
		String pUserId = lgszMrktVO.getUserId();
		String pUserPw = lgszMrktVO.getPswd();
		String jsessionId = "";
		
		// 페이지 접속, 세션ID 취득
		Connection.Response welcomeResponse = Jsoup.connect(welcomeUrl)
                .timeout(30000)
                .header("Origin", originUrl)
                .header("Referer", welcomeUrl)
                .header("Connection", "keep-alive")
                .header("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8")
                .header("Content-Type", "application/x-www-form-urlencoded")
                .header("Accept-Encoding", "gzip, deflate, br")
                .header("Accept-Language", "ko-KR,ko;q=0.8,en-US;q=0.6,en;q=0.4")
                .method(Connection.Method.GET)
                .execute();
		jsessionId = welcomeResponse.cookie("JSESSIONID");

		Document welcomeDoc = Jsoup.parse(welcomeResponse.body());
		logger.debug("@@@welcomeDoc");
		logger.debug(welcomeDoc.toString());
		
		// login 처리 후 진행
		// 취득한 SESSION ID 로 로그인 처리
		Map<String, String> params = new HashMap<>();
		params.put("USER_TYPE", pUserType);
		params.put("USER_ID", pUserId);
		params.put("PASSWORD", pUserPw);

		// 로그인 페이지 접속
		String loginUrl = originUrl + "Homeplus/login/checkUserIdPw.do;jsessionid=" + jsessionId;
		Connection.Response loginPageResponse = Jsoup.connect(loginUrl)
		                                                .timeout(3000)
		                                                .header("Origin", originUrl)
		                                                .header("Referer", loginUrl)
		                                                .header("Connection", "keep-alive")
		                                                .header("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8")
		                                                .header("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8")
		                                                .header("Accept-Encoding", "gzip, deflate, br")
		                                                .header("Accept-Language", "ko-KR,ko;q=0.8,en-US;q=0.6,en;q=0.4")
		                                                .cookie("JSESSIONID", jsessionId)
		                                                .data(params)
		                                                .method(Connection.Method.POST)
		                                                .execute();
		
		Document loginDoc = Jsoup.parse(loginPageResponse.body());
		//logger.debug("@@@loginDoc");
		//logger.debug(loginDoc.toString());
		
		//Object obj = jsonParser.parse(loginPageResponse.body());
		//JSONObject jsonObj = (JSONObject) obj;

		// 로그인 성공여부 확인
		

		Connection.Response indexResponse = Jsoup.connect(welcomeUrl)
                .timeout(3000)
                .header("Origin", originUrl)
                .header("Referer", welcomeUrl)
                .header("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8")
                .header("Content-Type", "application/x-www-form-urlencoded")
                .header("Accept-Encoding", "gzip, deflate, br")
                .header("Accept-Language", "ko-KR,ko;q=0.8,en-US;q=0.6,en;q=0.4")
                .cookie("JSESSIONID", jsessionId)
                //.cookie("isLogined", "true")
                .method(Connection.Method.GET)
                .execute();

		//logger.debug("indexResponse {}", indexResponse.body());
		// 로그인 성공 시 진행


                
		// 주문서 목록 조회 post url
		String cmndUrl = originUrl + "Homeplus/cmmn/command.do;jsessionid=" + jsessionId;

		String pMode = "search";		// 고정
		String pHouseCode = "100";		// 고정
		String pCompanyCode = "100";	// 고정

		String pQryIdOrdrList = "po.listOrderSql";				// 쿼리id: 주문서목록
		String pQryIdOrdrDtl = "po.getOrderDetailPopupGoodSql";	// 쿼리id: 주문상세

		String pYmdType = ordrRcvVO.getCrtrYmdType();	// "1";		// DATE_GUBUN		일자구분: 1 배달일자, 2 수신일자, 3 입고일자
//		String pYmdFrom = ordrRcvVO.getCrtrYmdFrom();	// "20231128";		// FROM_DATE
//		String pYmdTo = ordrRcvVO.getCrtrYmdTo();		// "20231128";			// TO_DATE
		
		String pYmdFrom = ordrRcvVO.getCrtrYmdFrom();
		String pYmdTo = ordrRcvVO.getCrtrYmdTo();
		
		String pPoNo = "";			// PO_NO			구매번호
		String pRecvStatus = "";	// EDI_RECV_STATUS 	수신구분: NULL, Y, N
		String pVndrCd = "All";		// VENDOR_CODE		업체코드: 전체 ALL, 쉼표로 분리
		String pDocCd = "ALL";		// EDI_DOC_CODE		수신여부: 전체 ALL 주문서 ORDER, 주문변경서 ORDCHG
		String pUseMapYn = "Y";		// 고정

		// 주문서 조회
		Map<String, String> ordrParams = new HashMap<>();
		ordrParams.put("mode", 				pMode);
		ordrParams.put("HOUSE_CODE", 		pHouseCode);
		ordrParams.put("COMPANY_CODE", 		pCompanyCode);
		ordrParams.put("USER_ID", 			pUserId);
		ordrParams.put("DATE_GUBUN", 		pYmdType);
		ordrParams.put("FROM_DATE", 		pYmdFrom);
		ordrParams.put("TO_DATE", 			pYmdTo);
		ordrParams.put("PO_NO", 			pPoNo);
		ordrParams.put("EDI_RECV_STATUS", 	pRecvStatus);
		ordrParams.put("VENDOR_CODE", 		pVndrCd);
		ordrParams.put("EDI_DOC_CODE", 		pDocCd);
		ordrParams.put("IbatisSelQryID", 	pQryIdOrdrList);
		ordrParams.put("USE_MAP_YN", 		pUseMapYn);

		Connection.Response ordrResponse = Jsoup.connect(cmndUrl)
	                                                .timeout(10000)
	                                                .header("Origin", originUrl)
	                                                .header("Referer", indexUrl)
	                                                .header("Accept", "application/json, text/javascript, */*; q=0.01")
	                                                .header("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8")
	                                                .header("Accept-Encoding", "gzip, deflate, br")
	                                                .header("Accept-Language", "ko-KR,ko;q=0.8,en-US;q=0.6,en;q=0.4")
	                                                .header("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36")
	                                                .cookie("JSESSIONID", jsessionId)
	                                                .data(ordrParams)
	                                                .method(Connection.Method.POST)
	                                                .execute();

		//logger.debug("@@@ordrResponse");
		Object objOrdr = jsonParser.parse(ordrResponse.body());
		JSONObject jsonObjOrdr = (JSONObject) objOrdr;

		boolean isSuccess = (Boolean)jsonObjOrdr.get("resultCd");
		String resultMsg = (String)jsonObjOrdr.get("resultMsg");

		if (!isSuccess) {
			rtnObj = ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, resultMsg);
			
			// 로그아웃
			logoutHomeplus(jsessionId);
			
			return rtnObj;
		}

		// 입고일자
		String ordrApcCd = ordrRcvVO.getApcCd();

		JSONArray ordrItems = (JSONArray)jsonObjOrdr.get("items");
		if (ordrItems == null || ordrItems.isEmpty()) {
			logger.debug("### 주문서정보 없음");
			rtnObj = ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "주문서정보");
			
			// 로그아웃
			logoutHomeplus(jsessionId);
			
			return rtnObj;
		}


		List<MrktOrdrVO> ordrList = new ArrayList<>();

		for ( int i = 0; i < ordrItems.size(); i++ ){
			
			JSONObject ordr = (JSONObject)ordrItems.get(i);

			String wrhsYmd = (String)ordr.get("GR_DATE");
			
			if (!StringUtils.hasText(wrhsYmd)) {
				rtnObj = ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "입고일자");
			}
			
			String uniKey = (String)ordr.get("UNI_KEY");
			String outordrno = (String)ordr.get("PO_NO");
			long outordrAmt = NumberUtils.parseNumber((String)ordr.get("PO_AMT_SUM"), Long.class);
			String outordrYmd = (String)ordr.get("PO_DATE");
			String mrktWrhsKnd = (String)ordr.get("GR_KIND");
			String mrktWrhsType = (String)ordr.get("GR_TYPE");
			String trsmYmd = (String)ordr.get("EDI_SEND_DATE");
			if (StringUtils.hasText(trsmYmd)) {
				trsmYmd = trsmYmd.replace("/", "").substring(0, 8);
			}					
			String trsmTm = (String)ordr.get("EDI_SEND_TIME");
			String rcptnYmd = (String)ordr.get("EDI_RECV_DATE");
			if (StringUtils.hasText(rcptnYmd)) {
				rcptnYmd = rcptnYmd.replace("/", "").substring(0, 8);
			}
			String rcptnTm = (String)ordr.get("EDI_RECV_TIME");
			String rcptnYn = (String)ordr.get("EDI_RECV_STATUS");
			String ordrr = (String)ordr.get("BUYER_NM");
			String cntrCd = (String)ordr.get("WAREHOUSE_CODE");
			String cntrNm = (String)ordr.get("WAREHOUSE_NM");
			String splrCd = (String)ordr.get("VENDOR_CODE");
			String splrNm = (String)ordr.get("VENDOR_NM");
			String userId = (String)ordr.get("USER_ID");
			String bplcCd = (String)ordr.get("HOUSE_CODE");
			String coCd = (String)ordr.get("COMPANY_CODE");
			String coNm = (String)ordr.get("COMPANY_NM");
			String vrWarehouseCd = (String)ordr.get("VIRTUAL_WAREHOUSE_CODE");
			String vrWarehouseTxt = (String)ordr.get("VIRTUAL_WAREHOUSE_TEXT");
			String vrWarehouseNm = (String)ordr.get("VIRTUAL_WAREHOUSE_NM");
			
			MrktOrdrVO ordrVO = new MrktOrdrVO();
			
			ordrVO.setOrdrApcCd(ordrApcCd);				// 주문APC코드
			ordrVO.setWrhsYmd(wrhsYmd);
			
			ordrVO.setUniKey(uniKey);
			ordrVO.setOutordrno(outordrno);
			ordrVO.setOutordrAmt(outordrAmt);
			ordrVO.setOutordrYmd(outordrYmd);
			ordrVO.setMrktWrhsKnd(mrktWrhsKnd);
			ordrVO.setMrktWrhsType(mrktWrhsType);
			ordrVO.setTrsmYmd(trsmYmd);
			ordrVO.setTrsmTm(trsmTm);
			ordrVO.setRcptnYmd(rcptnYmd);
			ordrVO.setRcptnTm(rcptnTm);
			ordrVO.setRcptnYn(rcptnYn);
			ordrVO.setOrdrr(ordrr);
			ordrVO.setCntrCd(cntrCd);
			ordrVO.setCntrNm(cntrNm);
			ordrVO.setSplrCd(splrCd);
			ordrVO.setSplrNm(splrNm);
			ordrVO.setUserId(userId);
			ordrVO.setBplcCd(bplcCd);
			ordrVO.setCoCd(coCd);
			ordrVO.setCoNm(coNm);
			ordrVO.setVrWarehouseCd(vrWarehouseCd);
			ordrVO.setVrWarehouseTxt(vrWarehouseTxt);
			ordrVO.setVrWarehouseNm(vrWarehouseNm);
			
			if (ComConstants.CON_YES.equals(runOnceYn)) {
				// 주문정보 수신확인
				MrktOrdrVO resultVO = ordrRcvMapper.selectMrktHomeplus(ordrVO);
				
				if (resultVO != null && StringUtils.hasText(resultVO.getOutordrno())) {
					continue;
				}
			}
			
			ordrList.add(ordrVO);
		}

		if (rtnObj != null) {			
			// 로그아웃
			logoutHomeplus(jsessionId);
			
			return rtnObj;
		}
		
		if (ordrList == null || ordrList.isEmpty()) {
			
			if (ComConstants.CON_YES.equals(runOnceYn)) {
				return null;
			}
			
			rtnObj = ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "주문수신정보");
		}
		
		for ( MrktOrdrVO ordr : ordrList ) {

			Thread.sleep(1000); 	//	1초 대기

			// 개별 주문에 대한 상세 정보 조회

			// 주문서 조회
			Map<String, String> dtlParams = new HashMap<>();
			dtlParams.put("mode", 				pMode);
			dtlParams.put("HOUSE_CODE", 		pHouseCode);
			dtlParams.put("COMPANY_CODE", 		pCompanyCode);
			dtlParams.put("USER_ID", 			ordr.getUserId());
			dtlParams.put("UNI_KEY", 			ordr.getUniKey());
			dtlParams.put("GR_DATE", 			ordr.getWrhsYmd());
			dtlParams.put("WAREHOUSE_CODE", 	ordr.getCntrCd());
			dtlParams.put("IbatisSelQryID", 	pQryIdOrdrDtl);

			Connection.Response ordrDtlResponse = Jsoup.connect(cmndUrl)
                    .timeout(10000)
                    .header("Origin", originUrl)
                    .header("Referer", indexUrl)
                    .header("Accept", "application/json, text/javascript, */*; q=0.01")
                    .header("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8")
                    .header("Accept-Encoding", "gzip, deflate, br")
                    .header("Accept-Language", "ko-KR,ko;q=0.8,en-US;q=0.6,en;q=0.4")
                    .header("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36")
                    .cookie("JSESSIONID", jsessionId)
                    .data(dtlParams)
                    .method(Connection.Method.POST)
                    .execute();
			logger.debug("### ordrDtl body");

			Object objOrdrDtl = jsonParser.parse(ordrDtlResponse.body());
			JSONObject jsonObjOrdrDtl = (JSONObject) objOrdrDtl;

			isSuccess = (Boolean)jsonObjOrdrDtl.get("resultCd");
			resultMsg = (String)jsonObjOrdrDtl.get("resultMsg");

			if (!isSuccess) {
				continue;
			}

			JSONArray ordrDtlItems = (JSONArray)jsonObjOrdrDtl.get("items");
			
			if (ordrDtlItems == null || ordrDtlItems.isEmpty()) {
				continue;
			}

			List<MrktOrdrDtlVO> dtlList = new ArrayList<>();

			String outordrno = ordr.getOutordrno();
			String wrhsYmd = ordr.getWrhsYmd();
			
			for ( int i = 0; i < ordrDtlItems.size(); i++ ){
				
				JSONObject dtl = (JSONObject)ordrDtlItems.get(i);
				
				int dtlSeq = NumberUtils.parseNumber((String)dtl.get("SEQ"), Integer.class);
				String mrktGdsCd = (String)dtl.get("ITEM_CODE");
				String mrktGdsNm = (String)dtl.get("ITEM_NM");
				String storCd = (String)dtl.get("STORE_CODE");
				String storNm = (String)dtl.get("STORE_NM");
				String mrktWrhsType = (String)dtl.get("GR_TYPE");
				String mrktWrhsTypeNm = (String)dtl.get("GR_TYPE_NM");
				String upGrdItem = (String)dtl.get("DIAMOND_ITEM");
				int bxGdsQntt = NumberUtils.parseNumber((String)dtl.get("IBSU_QTY"), Integer.class);
				int outordrQntt = NumberUtils.parseNumber((String)dtl.get("PO_QTY"), Integer.class);
				String outordrUnit = (String)dtl.get("PO_UNIT");
				int pieceQntt = NumberUtils.parseNumber((String)dtl.get("PO_EA_QTY"), Integer.class);
				int zcstQntt = NumberUtils.parseNumber((String)dtl.get("FREE_QTY"), Integer.class);
				double pieceUntprc = NumberUtils.parseNumber((String)dtl.get("PIECE_PRICE"), Double.class);
				long txamt = NumberUtils.parseNumber((String)dtl.get("PRICE_TAX"), Long.class);
				long outordrAmt = NumberUtils.parseNumber((String)dtl.get("PO_AMT"), Long.class);
				double outordrUntprc = NumberUtils.parseNumber((String)dtl.get("PO_PRICE"), Double.class);
				int wrhsQntt = NumberUtils.parseNumber((String)dtl.get("GR_QTY"), Integer.class);
				
				MrktOrdrDtlVO dtlVO = new MrktOrdrDtlVO();
				
				dtlVO.setOrdrApcCd(ordrApcCd);
				dtlVO.setWrhsYmd(wrhsYmd);
				dtlVO.setOutordrno(outordrno);	
				dtlVO.setDtlSeq(dtlSeq);
				dtlVO.setMrktGdsCd(mrktGdsCd);
				dtlVO.setMrktGdsNm(mrktGdsNm);
				dtlVO.setStorCd(storCd);
				dtlVO.setStorNm(storNm);
				dtlVO.setMrktWrhsType(mrktWrhsType);
				dtlVO.setMrktWrhsTypeNm(mrktWrhsTypeNm);
				dtlVO.setUpGrdItem(upGrdItem);
				dtlVO.setBxGdsQntt(bxGdsQntt);
				dtlVO.setOutordrQntt(outordrQntt);
				dtlVO.setOutordrUnit(outordrUnit);
				dtlVO.setPieceQntt(pieceQntt);
				dtlVO.setZcstQntt(zcstQntt);
				dtlVO.setPieceUntprc(pieceUntprc);
				dtlVO.setTxamt(txamt);
				dtlVO.setOutordrAmt(outordrAmt);
				dtlVO.setOutordrUntprc(outordrUntprc);
				dtlVO.setWrhsQntt(wrhsQntt);
				
				dtlList.add(dtlVO);
			}

			ordr.setDtlList(dtlList);
		}

		
		Thread.sleep(2000); 	//	2초 대기

		logoutHomeplus(jsessionId);
		
		
		String sysUserId = ordrRcvVO.getSysLastChgUserId();
		String sysPrgrmId = ordrRcvVO.getSysLastChgPrgrmId();

		// insert
		for ( MrktOrdrVO ordrVO : ordrList ) {
			
			List<MrktOrdrDtlVO> dtlList = ordrVO.getDtlList();
			
			// insert ordr
			ordrRcvMapper.insertSpMrktOrdrHpReg(ordrVO);
			
			if (StringUtils.hasText(ordrVO.getRtnCd())) {
				rtnObj = ComUtil.getResultMap(ordrVO.getRtnCd(), ordrVO.getRtnMsg());
				throw new EgovBizException(getMessageForMap(rtnObj));
			}
			
			long ordrSeq = ordrVO.getOrdrSeq();
			
			// insert ordr dtl
			for ( MrktOrdrDtlVO dtlVO : dtlList ) {
				
				dtlVO.setOrdrSeq(ordrSeq);
				
				ordrRcvMapper.insertSpMrktOrdrHpDtlReg(dtlVO);				
				if (StringUtils.hasText(dtlVO.getRtnCd())) {
					rtnObj = ComUtil.getResultMap(dtlVO.getRtnCd(), dtlVO.getRtnMsg());
					throw new EgovBizException(getMessageForMap(rtnObj));
				}
			}
			
			ordrVO.setSysUserId(sysUserId);
			ordrVO.setSysPrgrmId(sysPrgrmId);
			
			// ordr >> 발주정보
			ordrRcvMapper.insertSpMrktOrdrRcvHmpls(ordrVO);
			
			if (StringUtils.hasText(ordrVO.getRtnCd())) {
				rtnObj = ComUtil.getResultMap(ordrVO.getRtnCd(), ordrVO.getRtnMsg());
				throw new EgovBizException(getMessageForMap(rtnObj));
			}
		}


		/*
		// I/F TB >> ORDR TB 처
		ordrRcvVO.setRcptnYmd(rcptnYmd);
		ordrRcvMapper.insertSpOrdrRcvHmpls(ordrRcvVO);

		if (StringUtils.hasText(ordrRcvVO.getRtnCd())) {
			rtnObj = ComUtil.getResultMap(ordrRcvVO.getRtnCd(), ordrRcvVO.getRtnMsg());
			throw new EgovBizException(getMessageForMap(rtnObj));
		}
		 */
		return null;
	}

	private void logoutHomeplus (String jsessionId) throws Exception {
		
		String originUrl = "https://activescm.co.kr/";
		String indexUrl = originUrl + "Homeplus/index.do";
		String logoutUrl = originUrl + "Homeplus/logout.do";
		
		Map<String, String> logoutParam = new HashMap<>();
		logoutParam.put("logout", "TRUE");
		
		Connection.Response logoutResponse = Jsoup.connect(logoutUrl)
                .timeout(3000)
                .header("Origin", originUrl)
                .header("Referer", indexUrl)
                .header("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8")
                .header("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8")
                .header("Accept-Encoding", "gzip, deflate, br")
                .header("Accept-Language", "ko-KR,ko;q=0.8,en-US;q=0.6,en;q=0.4")
                .cookie("JSESSIONID", jsessionId)
                .cookie("isLogined", "true")
                .data(logoutParam)
                .method(Connection.Method.POST)
                .execute();
		
		Document logoutDoc = Jsoup.parse(logoutResponse.body());
		//logger.debug("@@@logoutDoc");
		//logger.debug(logoutDoc.toString());
	}

	@Override
	public List<MrktHomeplusVO> selectOrdrListForHomeplus(MrktHomeplusVO mrktHomeplusVO) throws Exception {
		
		MrktHomeplusDtlVO param = new MrktHomeplusDtlVO();
		
		param.setOrdrApcCd(mrktHomeplusVO.getOrdrApcCd());
		param.setWrhsYmd(mrktHomeplusVO.getWrhsYmd());
		
		//List<MrktHomeplusVO> ordrList = 
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<HashMap<String, Object>> selectOrdrListForHomeplus(MrktOrdrDtlVO mrktOrdrDtlVO) throws Exception {

		List<HashMap<String, Object>> ordrList = new ArrayList<>();

		List<MrktOrdrDtlVO> ordrDtlList = ordrRcvMapper.selectOrglnOrdrHomeplusDtl(mrktOrdrDtlVO);

		String outordrno = "";

		HashMap<String, Object> ordr = new HashMap<>();
		List<HashMap<String, Object>> dtlList = new ArrayList<>();

		String ordrApcCd = mrktOrdrDtlVO.getOrdrApcCd();
		String wrhsYmd = "";
		String receiptYn = mrktOrdrDtlVO.getReceiptYn();

		for ( MrktOrdrDtlVO dtlVO : ordrDtlList ) {

			HashMap<String, Object> dtl = new HashMap<>();

			if (!ComUtil.nullToEmpty(outordrno).equals(dtlVO.getOutordrno())) {

				if (ComConstants.CON_YES.equals(receiptYn)) {
					ordrRcvMapper.updateMrktLinkPrcsHomeplus(dtlVO);
				}

				if (dtlList.size() > 0) {
					ordr.put("DTL_LIST", dtlList);
					ordrList.add(ordr);
				}

				ordr = new HashMap<>();
				ordr.put("APC_CD", ordrApcCd);
				ordr.put("GR_DATE", dtlVO.getWrhsYmd());
				ordr.put("UNI_KEY", dtlVO.getOutordrno());
				ordr.put("PO_NO", dtlVO.getOutordrno());
				ordr.put("PO_AMT_SUM", dtlVO.getTotOutordrAmt());
				ordr.put("PO_DATE", dtlVO.getOutordrYmd());
				ordr.put("GR_KIND", dtlVO.getMrktWrhsKnd());
				ordr.put("GR_TYPE", dtlVO.getMrktWrhsType());
				ordr.put("EDI_SEND_DATE", dtlVO.getTrsmYmd());
				ordr.put("EDI_SEND_TIME", dtlVO.getTrsmTm());
				ordr.put("EDI_RECV_DATE", dtlVO.getRcptnYmd());
				ordr.put("EDI_RECV_TIME", dtlVO.getRcptnTm());
				ordr.put("EDI_RECV_STATUS", dtlVO.getRcptnYn());
				ordr.put("BUYER_NM", dtlVO.getOrdrr());
				ordr.put("WAREHOUSE_CODE", dtlVO.getCntrCd());
				ordr.put("WAREHOUSE_NM", dtlVO.getCntrNm());
				ordr.put("VENDOR_CODE", dtlVO.getSplrCd());
				ordr.put("VENDOR_NM", dtlVO.getSplrNm());
				ordr.put("USER_ID", dtlVO.getUserId());
				ordr.put("HOUSE_CODE", dtlVO.getBplcCd());
				ordr.put("COMPANY_CODE", dtlVO.getCoCd());
				ordr.put("COMPANY_NM", dtlVO.getCoNm());
				ordr.put("VIRTUAL_WAREHOUSE_CODE", dtlVO.getVrWarehouseCd());
				ordr.put("VIRTUAL_WAREHOUSE_TEXT", dtlVO.getVrWarehouseTxt());
				ordr.put("VIRTUAL_WAREHOUSE_NM", dtlVO.getVrWarehouseNm());

				dtlList = new ArrayList<>();
			}

			dtl.put("PO_NO", dtlVO.getOutordrno());
			dtl.put("SEQ", dtlVO.getDtlSeq());
			dtl.put("GR_DATE", dtlVO.getWrhsYmd());
			dtl.put("ITEM_CODE", dtlVO.getMrktGdsCd());
			dtl.put("ITEM_NM", dtlVO.getMrktGdsNm());
			dtl.put("STORE_CODE", dtlVO.getStorCd());
			dtl.put("STORE_NM", dtlVO.getStorNm());
			dtl.put("GR_TYPE", dtlVO.getMrktWrhsType());
			dtl.put("GR_TYPE_NM", dtlVO.getMrktWrhsTypeNm());
			dtl.put("DIAMOND_ITEM", dtlVO.getUpGrdItem());
			dtl.put("IBSU_QTY", dtlVO.getBxGdsQntt());
			dtl.put("PO_QTY", dtlVO.getOutordrQntt());
			dtl.put("PO_UNIT", dtlVO.getOutordrUnit());
			dtl.put("PO_EA_QTY", dtlVO.getPieceQntt());
			dtl.put("FREE_QTY", dtlVO.getZcstQntt());
			dtl.put("PIECE_PRICE", dtlVO.getPieceUntprc());
			dtl.put("PRICE_TAX", dtlVO.getPieceUntprc());
			dtl.put("PO_AMT", dtlVO.getOutordrAmt());
			dtl.put("PO_PRICE", dtlVO.getOutordrUntprc());
			dtl.put("GR_QTY", dtlVO.getWrhsQntt());

			dtlList.add(dtl);

			outordrno = dtlVO.getOutordrno();
		}

		if (dtlList.size() > 0) {
			ordr.put("DTL_LIST", dtlList);
			ordrList.add(ordr);
		}

		return ordrList;
	}

	@Override
	public List<HashMap<String, Object>> selectOrdrListForHomeplus(String ordrApcCd, String wrhsYmd) throws Exception {

		MrktOrdrDtlVO param = new MrktOrdrDtlVO();
		param.setOrdrApcCd(ordrApcCd);
		param.setWrhsYmd(wrhsYmd);

		return selectOrdrListForHomeplus(param);
	}

	@Override
	public List<HashMap<String, Object>> selectOrdrListForHomeplus(String ordrApcCd, String wrhsYmd, String receiptYn) throws Exception {
		MrktOrdrDtlVO param = new MrktOrdrDtlVO();
		param.setOrdrApcCd(ordrApcCd);
		param.setWrhsYmd(wrhsYmd);
		param.setReceiptYn(receiptYn);

		return selectOrdrListForHomeplus(param);
	}

	@Override
	public HashMap<String, Object> insertMrktOrdrRcptLotteSuper(OrdrRcvVO ordrRcvVO) throws Exception {
		
		HashMap<String, Object> rtnObj = null;

		String ordrApcCd = ordrRcvVO.getApcCd();
		String wrhsYmd = ordrRcvVO.getCrtrYmd();
		String wrhsYmdFrom = ordrRcvVO.getCrtrYmdFrom();
		String wrhsYmdTo = ordrRcvVO.getCrtrYmdTo();
		String lgszMrktCd = ordrRcvVO.getLgszMrktCd();

		//logger.debug("@@@@ordrApcCd {}", ordrApcCd);
		//logger.debug("@@@@wrhsYmd {}", wrhsYmd);
		//logger.debug("@@@@lgszMrktCd {}", lgszMrktCd);

	    SimpleDateFormat frmtYmd = new SimpleDateFormat("yyyyMMdd");
	    SimpleDateFormat frmtYmdDash = new SimpleDateFormat("yyyy-MM-dd");

	    //Date frmtDate = frmtYmd.parse(wrhsYmd);
	    //String wrhsYmdDash =  frmtYmdDash.format(frmtDate);
		String wrhsYmdFromDash =  frmtYmdDash.format(frmtYmd.parse(wrhsYmdFrom));
		String wrhsYmdToDash =  frmtYmdDash.format(frmtYmd.parse(wrhsYmdTo));


		//logger.debug("@@@@wrhsYmdFromDash {}", wrhsYmdFromDash);
		//logger.debug("@@@@wrhsYmdToDash {}", wrhsYmdToDash);

		JSONParser jsonParser = new JSONParser();

		String runOnceYn = ordrRcvVO.getRunOnceYn();
		long currentUnixTime = System.currentTimeMillis() / 1000; // 초 단위로 변환
		
		String originUrl = "https://www.lcn.co.kr/";
		String indexUrl = originUrl + "session/login";
		
		String url = "";
		Map<String, String> params;
		
		// 롯데슈퍼 접속정보를 가져온다
		LgszMrktVO lgszMrktVO = cnptService.selectLgszMrkt(ordrRcvVO.getApcCd(), ordrRcvVO.getLgszMrktCd());

		if (lgszMrktVO == null
				|| !StringUtils.hasText(lgszMrktVO.getLgszMrktCd())
				|| !StringUtils.hasText(lgszMrktVO.getUserId())
				|| !StringUtils.hasText(lgszMrktVO.getPswd())
				|| !ComConstants.CON_YES.equals(lgszMrktVO.getUseYn())
				) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "롯데슈퍼 접속정보");
		}

		String jsessionId = "";
		String jsessionId2 = "";
		String jsessionId3 = "";
		
		String wmonId = "";
		

		String xGroupId = lgszMrktVO.getGroupId();
		String xUserId = lgszMrktVO.getUserId();
		String xPassword = lgszMrktVO.getPswd();
		String xTimezoneKey = "GMT+9:00";	//GMT+9:00	GMT%2B9%3A00
		
		// 페이지 접속, 세션ID 취득
		Connection.Response indexResponse = Jsoup.connect(indexUrl)
                .timeout(30000)
                .header("Origin", originUrl)
                .header("Referer", indexUrl)
                .header("Connection", "keep-alive")
                .header("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8")
                .header("Content-Type", "application/x-www-form-urlencoded")
                .header("Accept-Encoding", "gzip, deflate, br")
                .header("Accept-Language", "ko-KR,ko;q=0.8,en-US;q=0.6,en;q=0.4")
                .method(Connection.Method.GET)
                .execute();
		jsessionId = indexResponse.cookie("JSESSIONID");
		//logger.debug("@@@jsessionId {}", jsessionId);
		
		wmonId = indexResponse.cookie("WMONID");
		//logger.debug("@@@jsessionId", jsessionId);
		
		Document indexDoc = Jsoup.parse(indexResponse.body());
		//logger.debug("@@@indexDoc");
		//logger.debug(indexDoc.toString());

		
		
		params = new HashMap<>();
		params.put("userId", xGroupId	 + "@" + xUserId);
		params.put("password", xPassword);
		params.put("TIMEZONE_KEY", xTimezoneKey);
		
		// 로그인 페이지 접속
		String loginUrl = originUrl + "j_spring_security_check";
		Connection.Response loginPageResponse = Jsoup.connect(loginUrl)
		                                                .timeout(3000)
		                                                .header("Origin", originUrl)
		                                                .header("Referer", indexUrl)
		                                                .header("Connection", "keep-alive")
		                                                .header("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8")
		                                                .header("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8")
		                                                .header("Accept-Encoding", "gzip, deflate, br")
		                                                .header("Accept-Language", "ko-KR,ko;q=0.8,en-US;q=0.6,en;q=0.4")
		                                                .cookie("JSESSIONID", jsessionId)
		                                                .cookie("WMONID", wmonId)
		                                                .ignoreContentType(true)
		                                                .data(params)
		                                                .method(Connection.Method.POST)
		                                                .execute();
		
		jsessionId2 = loginPageResponse.cookie("JSESSIONID");
		
		//logger.debug("@@@jsessionId2 : {}", jsessionId2);
		Document loginDoc = Jsoup.parse(loginPageResponse.body());
		//logger.debug("@@@loginDoc");
		//logger.debug(loginDoc.toString());
		
		Object obj = jsonParser.parse(loginPageResponse.body());
		JSONObject jsonObj = (JSONObject) obj;

		//logger.debug("@@@jsonObj", jsonObj.toJSONString());
		
		
		params = new HashMap<>();
		params.put("groupId", xGroupId);
		params.put("userId", xUserId);
		
		url = originUrl + "rest/user/otpCreate";
		
		Connection.Response otpResponse = Jsoup.connect(url)
		                                                .timeout(3000)
		                                                .header("Origin", originUrl)
		                                                .header("Referer", "https://www.lcn.co.kr/main/main")
		                                                .header("Connection", "keep-alive")
		                                                .header("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8")
		                                                .header("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8")
		                                                .header("Accept-Encoding", "gzip, deflate, br")
		                                                .header("Accept-Language", "ko-KR,ko;q=0.8,en-US;q=0.6,en;q=0.4")
		                                                .cookie("JSESSIONID", jsessionId2)
		                                                .cookie("WMONID", wmonId)
		                                                .ignoreContentType(true)
		                                                .data(params)
		                                                .method(Connection.Method.POST)
		                                                .execute();
		obj = jsonParser.parse(otpResponse.body());
		jsonObj = (JSONObject) obj;
		//logger.debug("@@@otpObj");
		//logger.debug(jsonObj.toString());
		
		String otpKey = (String)jsonObj.get("data");
		//logger.debug("@@@otpKey {}", otpKey);
		//logger.debug("@@@otp jess {}", otpResponse.cookie("JSESSIONID"));
		
		if (!StringUtils.hasText(otpKey)) {
			// 
		}
		
		
		
		// 
		url = originUrl + "scm/session/loginSSO";
		params = new HashMap<>();
		params.put("seq", "");
		params.put("type", "");
		params.put("islogin", "TRUE");
		params.put("companyid", xGroupId);
		params.put("statusNum", "");
		params.put("groupId", xGroupId);
		params.put("userId", xUserId);
		params.put("userid", xUserId);
		params.put("reJoinCheck", "Y");
		params.put("otp", otpKey);
		params.put("message", "");
		
		Connection.Response ssoResponse = Jsoup.connect(url)
		                                                .timeout(3000)
		                                                .header("Origin", originUrl)
		                                                .header("Referer", "https://www.lcn.co.kr/main/main")
		                                                .header("Connection", "keep-alive")
		                                                .header("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8")
		                                                .header("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8")
		                                                .header("Accept-Encoding", "gzip, deflate, br")
		                                                .header("Accept-Language", "ko-KR,ko;q=0.8,en-US;q=0.6,en;q=0.4")
		                                                .cookie("JSESSIONID", jsessionId2)
		                                                .cookie("WMONID", wmonId)
		                                                .ignoreContentType(true)
		                                                .data(params)
		                                                .method(Connection.Method.POST)
		                                                .execute();
		
		Document ssoDoc = ssoResponse.parse();
		//logger.debug("@@@ssoDoc");
		//logger.debug(ssoDoc.toString());
		
		Element ssoEl = ssoDoc.select("input").first();
		//Element ssoEl = ssoDoc.select("input[name='_'").first();
		String ssoKey = ssoEl.attr("value");
		
		//logger.debug("@@@ssoKey {}", ssoKey);
		//logger.debug("@@@ssoKey jess {}", ssoResponse.cookie("JSESSIONID"));
		
		
		
		currentUnixTime = System.currentTimeMillis() / 1000; // 초 단위로 변환
		
		url = originUrl + "scm/sso_security_check?_=" + Long.toString(currentUnixTime);
		params = new HashMap<>();
		params.put("loginId", (xUserId + "@" + xGroupId).toLowerCase());
		params.put("otp", otpKey);
		params.put("LOCALE_KEY", "");
		params.put("TIMEZONE_KEY", xTimezoneKey);
		
		Connection.Response ssoChkResponse = Jsoup.connect(url)
		                                                .timeout(3000)
		                                                .header("Origin", originUrl)
		                                                .header("Referer", "https://www.lcn.co.kr/scm/session/loginSSO")
		                                                .header("Connection", "keep-alive")
		                                                .header("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8")
		                                                .header("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8")
		                                                .header("Accept-Encoding", "gzip, deflate, br")
		                                                .header("Accept-Language", "ko-KR,ko;q=0.8,en-US;q=0.6,en;q=0.4")
		                                                .cookie("JSESSIONID", jsessionId2)
		                                                .cookie("WMONID", wmonId)
		                                                .ignoreContentType(true)
		                                                .data(params)
		                                                .method(Connection.Method.POST)
		                                                .execute();
		obj = jsonParser.parse(ssoChkResponse.body());
		jsonObj = (JSONObject) obj;
		//logger.debug("@@@ssoChk");
		//logger.debug(jsonObj.toString());
		jsessionId3 = ssoChkResponse.cookie("JSESSIONID");
		//logger.debug("@@@ssoChk jsessionId3 {}", ssoChkResponse.cookie("JSESSIONID"));
		
		// main/main
		
		currentUnixTime = System.currentTimeMillis() / 1000; // 초 단위로 변환
		
		url = originUrl + "scm/main/main";
		//logger.debug("@@@mainResponse {}", url);
		params = new HashMap<>();
		params.put("_", Long.toString(currentUnixTime));
		//logger.debug("@@@_ {}", Long.toString(currentUnixTime));

		Connection.Response mainResponse = Jsoup.connect(url)
										                .timeout(3000)
										                .header("Origin", originUrl)
										                .header("Referer", "https://www.lcn.co.kr/scm/session/loginSSO")
										                .header("Connection", "keep-alive")
										                .header("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8")
										                .header("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8")
										                .header("Accept-Encoding", "gzip, deflate, br")
										                .header("Accept-Language", "ko-KR,ko;q=0.8,en-US;q=0.6,en;q=0.4")
										                .cookie("JSESSIONID", jsessionId3)
										                .cookie("WMONID", wmonId)
										                //.ignoreContentType(true)
										                .data(params)
										                .method(Connection.Method.POST)
										                .execute();
		
		//logger.debug("@@@mainResponse {}", mainResponse.toString());
		//logger.debug("@@@mainResponse.body() {}", mainResponse.body());
		
		
		currentUnixTime = System.currentTimeMillis() / 1000; // 초 단위로 변환
		
		url = originUrl + "scm/main/main?_=" + Long.toString(currentUnixTime);
		params = new HashMap<>();		
		params.put("MAIN_VENDOR_TP_ID", "");
		params.put("MAIN_BUYER_CODE", "LOSH01");
		
		Connection.Response main2Response = Jsoup.connect(url)
                .timeout(3000)
                .header("Origin", originUrl)
                .header("Referer", "https://www.lcn.co.kr/scm/main/main")
                .header("Connection", "keep-alive")
                .header("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8")
                .header("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8")
                .header("Accept-Encoding", "gzip, deflate, br")
                .header("Accept-Language", "ko-KR,ko;q=0.8,en-US;q=0.6,en;q=0.4")
                .cookie("JSESSIONID", jsessionId3)
                .cookie("WMONID", wmonId)
                .ignoreContentType(true)
                .data(params)
                .method(Connection.Method.POST)
                .execute();
		
		//logger.debug("@@@main2Response {}", main2Response.toString());
		//logger.debug("@@@main2Response.body() {}", main2Response.body());
		
		// ordr list
		
		currentUnixTime = System.currentTimeMillis() / 1000; // 초 단위로 변환
		
		url = originUrl + "scm/rest/ediDoc/receive/docReceive";
		params = new HashMap<>();
		params.put("_dc", Long.toString(currentUnixTime));
		params.put("sender", "");
		params.put("startDt", wrhsYmdFromDash);
		params.put("endDt", wrhsYmdToDash);
		params.put("docNm", "ORDERS");
		params.put("searchDoc", "all");
		params.put("orderGubn", "all");
		params.put("vendorCd", "all");
		params.put("dateGubn", "ip");
		params.put("buBjjCd", "all");
		params.put("dlvBjjCd", "all");
		params.put("page", "1");
		params.put("start", "NaN");
		
		// 페이지 접속, 세션ID 취득
		Connection.Response ordrResponse = Jsoup.connect(url)
                .timeout(30000)
                .header("Origin", originUrl)
                .header("Referer", "https://www.lcn.co.kr/scm/ediDoc/receive/orderReceive")
                .header("Connection", "keep-alive")
                .header("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8")
                .header("Content-Type", "application/x-www-form-urlencoded")
                .header("Accept-Encoding", "gzip, deflate, br")
                .header("Accept-Language", "ko-KR,ko;q=0.8,en-US;q=0.6,en;q=0.4")
                .cookie("JSESSIONID", jsessionId3)
                .cookie("WMONID", wmonId)
                .ignoreContentType(true)
                .data(params)
                .method(Connection.Method.GET)
                .execute();
		
		//logger.debug("@@@ordrDoc sid", ordrResponse.cookie("JSESSIONID"));
		
		//logger.debug("@@@ordrResponse {}", ordrResponse.toString());
		//logger.debug("@@@ordrResponse.body() {}", ordrResponse.body());
		
		Object objOrdr = jsonParser.parse(ordrResponse.body());
		JSONObject jsonObjOrdr = (JSONObject) objOrdr;
		
		boolean hasError = (long)jsonObjOrdr.get("code") != 0;
		
		if (hasError) {
			
			String errorMessage = (String)jsonObjOrdr.get("message");
			//logger.debug("@@@ errorMessage : {}", errorMessage);
			
			rtnObj = ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, errorMessage);
			
			// logout 처리
			
			return rtnObj;
		}
		
		//"totalCount": 0
		
		JSONArray ordrItems = (JSONArray)jsonObjOrdr.get("data");
		
		if (ordrItems == null || ordrItems.isEmpty()) {
			logger.debug("### 주문서정보 없음");
			rtnObj = ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "주문서정보");
			
			// 로그아웃
			logoutLotte(jsessionId3);
			
			return rtnObj;
		}
		
		
		String[] ordrCol = {
				"OUTORDRNO", 			// 주문번호
				"MRKT_WRHS_TYPE_NM",		// 배송구분
				"OUTORDR_YMD",			// 주문일자
				"WRHS_YMD",				// 납품요청일
				"CNTR_NM",				// 주문처
				"WAREHOUSE_NM",			// 입고처
				"SPLR_NM",				// 공급처
				"OUTORDR_AMT",			// 공급가액
				"TXAMT",				// 세액
				"TOT_AMT",				// 합계
			};
		
		String[] dtlCol = {
				"SEQ", 					// 번호
				"MRKT_GDS_NM",			// 상품명
				"MRKT_GDS_CD",			// 상품코드
				"MRKT_NTSL_CD",			// 판매코드
				"STOR_TXT",				// 최종납품장소
				"BX_GDS_QNTT",			// 입수
				"OUTORDR_QNTT_TXT",		// 주문수
				"PIECE_QNTT",			// 주문수량
				"PIECE_UNTPRC",			// 단가
				"OUTORDR_AMT",			// 금액
			};
		
		List<HashMap<String, String>> ordrMaps = new ArrayList<>();
		
		List<List<HashMap<String, String>>> dtlMapList = new ArrayList<>();
		
		for ( int i = 0; i < ordrItems.size(); i++ ){
		

			HashMap<String, String> ordrMap = new HashMap<>();
			List<HashMap<String, String>> dtlMaps = new ArrayList<>();
			
			Thread.sleep(500); 	//	0.5초 대기
			JSONObject ordr = (JSONObject)ordrItems.get(i);
			String docNo = (String)ordr.get("docNo");
			
			String cntrCd = (String)ordr.get("buBjjCd");
			//String cntrNm = (String)ordr.get("buBjjNm");
			String ordrDsctn = (String)ordr.get("orderDescA");
			String ordrr = (String)ordr.get("buyerNm");
			String warehouseCd = (String)ordr.get("dlvBjjCd");
			String warehouseNm = (String)ordr.get("dlvBjjNm");
			//String coNm = (String)ordr.get("sender");
			String coCd = (String)ordr.get("senderTpId");
			String trsmDt = (String)ordr.get("docSearchDt");
			
			/*
			long ordDt = (long)ordr.get("ordDt");
			long reqDlvDt = (long)ordr.get("reqDlvDt");
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd"); 
			Date dt = new Date();
			
			dt.setTime(ordDt); 
			String outordrYmd = sdf.format(dt);
			
			dt.setTime(reqDlvDt);
			String dlvYmd = sdf.format(dt);
			 */
			
			String trsmYmd = "";
			String trsmTm = "";
			if (StringUtils.hasText(trsmDt)) {
				trsmYmd = trsmDt.substring(0, 8);
				trsmTm = trsmDt.substring(8);
			}
			
			
			/*
			"ordDt": 1730041200000,             // 주문일시 : unix
            "reqDlvDt": 1730214000000,          // 요청일시 : unix
            "refNo": null,                      // 참조번호
            "docNm": "ORDERS",                  // 문서명
            "recverTpId": "m0037701",           // 수신자유형id
            "docSearchDt": "20241028162832",    // 문서조회일시
            "docNo": "241028C1110211514516",    // 문서번호
            "linItemCnt": "4",                  // count
            "docSearchGb": "W",                 // 조회구분
            "buBjjCd": "C11102",                // 주문처코드
            "logTime": "20241028162004284",     // 
            "orderDescA": "통상",               // 비고
            "buyerNm": "롯데슈퍼",              // 주문자
            "buBjjNm": "광릉WET센터",           // 주문처명
            "dlvBjjCd": "C11102",               // 납품처코드
            "docStatCd": "1",                   // 
            "sender": "롯데슈퍼",               // 발송자
            "dlvBjjNm": "광릉WET센터",          // 납품처명
            "docDiv": null,                     // 
            "senderTpId": "LOSH01",             // 발송자유형ID
			 */
			
			if (ComConstants.CON_YES.equals(runOnceYn)) {
				
				MrktOrdrVO param = new MrktOrdrVO();
				param.setOrdrApcCd(ordrApcCd);
				param.setWrhsYmd(wrhsYmd);
				param.setOutordrno(docNo);
				
				// 주문정보 수신확인
				MrktOrdrVO resultVO = ordrRcvMapper.selectMrktLotte(param);
				
				if (resultVO != null && StringUtils.hasText(resultVO.getOutordrno())) {
					continue;
				}
			}
			
			url = originUrl + "scm/ediDoc/receive/orderReceiveDetailPop?docNo=" + docNo;
			// 페이지 접속, 세션ID 취득
			Connection.Response dtlPopResponse = Jsoup.connect(url)
	                .timeout(30000)
	                .header("Origin", originUrl)
	                //.header("Referer", "https://www.lcn.co.kr/scm/ediDoc/receive/orderReceive")
	                .header("Connection", "keep-alive")
	                .header("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8")
	                .header("Content-Type", "application/x-www-form-urlencoded")
	                .header("Accept-Encoding", "gzip, deflate, br")
	                .header("Accept-Language", "ko-KR,ko;q=0.8,en-US;q=0.6,en;q=0.4")
	                .cookie("JSESSIONID", jsessionId3)
	                .cookie("WMONID", wmonId)
	                //.ignoreContentType(true)
	                //.data(params)
	                .method(Connection.Method.GET)
	                .execute();
			
			Document dtlPopDoc = dtlPopResponse.parse();
			//logger.debug("@@@dtlPopDoc");
			//logger.debug(dtlPopDoc.toString());
						
			Elements ordrEls = dtlPopDoc.select(".basic_table_area table tr td");
			//logger.debug("@@@ordrEls");
			//logger.debug(ordrEls.toString());
			
			int iOrdr = -1;
			for( Element ordrEl : ordrEls ) {
				iOrdr++;
				ordrMap.put(ordrCol[iOrdr], ordrEl.text());
				//logger.debug("iOrdr {}, text {}", iOrdr, ordrEl.text());
			}
			
			ordrMap.put("TRSM_YMD", trsmYmd);
			ordrMap.put("TRSM_TM", trsmTm);
			ordrMap.put("ORDRR", ordrr);
			ordrMap.put("CNTR_CD", cntrCd);
			ordrMap.put("CO_CD", coCd);
			ordrMap.put("WAREHOUSE_CD", warehouseCd);
			ordrMap.put("WAREHOUSE_NM", warehouseNm);
			ordrMap.put("ORDR_DSCTN", ordrDsctn);
			
			Element dtlDiv = dtlPopDoc.selectFirst(".basic_list_area");
			Elements listEls = dtlDiv.select("table tbody tr");
			
			
			for( Element listEl : listEls ) {
				
				HashMap<String, String> dtlMap = new HashMap<>();
				logger.debug("dtl tr ####");
				
				Elements dtls = listEl.select("td");
				int iTd = -1;
				for ( Element dtl : dtls ) {
					iTd++;
					dtlMap.put(dtlCol[iTd], dtl.text());
					logger.debug("iTd {}, text {}", iTd, dtl.text());
				}

				dtlMaps.add(dtlMap);
			}
			
			ordrMaps.add(ordrMap);
			dtlMapList.add(dtlMaps);
		}
		
		// logout
		logoutLotte(jsessionId3);
		
		// map >> vo, insert
		
		List<MrktOrdrVO> ordrList = new ArrayList<>();
		
		for (int i=0; i<ordrMaps.size(); i++) {
			
			if (dtlMapList.size() < i + 1) {
				break;
			}
			
			HashMap<String, String> ordr = ordrMaps.get(i);
			List<HashMap<String, String>> dtlMaps = dtlMapList.get(i);
			
			String outordrno = ordr.get("OUTORDRNO");
			long totOutordrAmt = NumberUtils.parseNumber(
					ComUtil
						.nullToEmpty(ordr.get("OUTORDR_AMT"))
						.replace(",", ""),
						Long.class);
			
			String outordrYmd = ordr.get("OUTORDR_YMD");
			if (StringUtils.hasText(outordrYmd)) {
				outordrYmd = outordrYmd.replace("-", "");
			}
			String mrktWrhsTypeNm = ordr.get("MRKT_WRHS_TYPE_NM");
			String trsmYmd = ordr.get("TRSM_YMD");
			String trsmTm = ordr.get("TRSM_TM");
			String ordrr = ordr.get("ORDRR");
			String cntrCd = ordr.get("CNTR_CD");
			String cntrNm = ordr.get("CNTR_NM");
			//String splrCd = (String)ordr.get("SPLR_CD");
			String splrNm = ordr.get("SPLR_NM");
			String bplcCd = ordr.get("CO_CD");
			String coCd = ordr.get("CO_CD");
			String coNm = ordr.get("CO_NM");
			String warehouseCd = ordr.get("WAREHOUSE_CD");
			String warehouseNm = ordr.get("WAREHOUSE_NM");
			String ordrDsctn = ordr.get("ORDR_DSCTN");
			String ymd = ComUtil.nullToEmpty(ordr.get("WRHS_YMD")).replace("-", "");
			MrktOrdrVO ordrVO = new MrktOrdrVO();
			List<MrktOrdrDtlVO> dtlList = new ArrayList<>();
			
			ordrVO.setOrdrApcCd(ordrApcCd);				// 주문APC코드
			ordrVO.setWrhsYmd(ymd);
			
			ordrVO.setLgszMrktCd(lgszMrktCd);
			
			ordrVO.setOutordrno(outordrno);
			ordrVO.setOutordrAmt(totOutordrAmt);
			ordrVO.setOutordrYmd(outordrYmd);
			ordrVO.setTrsmYmd(trsmYmd);
			ordrVO.setTrsmTm(trsmTm);
			ordrVO.setOrdrr(ordrr);
			ordrVO.setCntrCd(cntrCd);
			ordrVO.setCntrNm(cntrNm);
			ordrVO.setSplrNm(splrNm);
			ordrVO.setBplcCd(bplcCd);
			ordrVO.setCoCd(coCd);
			ordrVO.setCoNm(coNm);
			ordrVO.setWarehouseCd(warehouseCd);
			ordrVO.setWarehouseNm(warehouseNm);
			ordrVO.setOrdrDsctn(ordrDsctn);
			
			for ( HashMap<String, String> dtl : dtlMaps ) {
				int dtlSeq = NumberUtils.parseNumber(
							ComUtil
								.nullToEmpty(dtl.get("SEQ"))
								.replace(",", ""),
								Integer.class);
				String mrktGdsCd = (String)dtl.get("MRKT_GDS_CD");
				String mrktGdsNm = (String)dtl.get("MRKT_GDS_NM");
				String mrktNtslCd = (String)dtl.get("MRKT_NTSL_CD");
				String storCd = "";
				String storNm = "";
				String storTxt = dtl.get("STOR_TXT");
				if (StringUtils.hasText(storTxt)) {
					int leftP = storTxt.indexOf("(");
					int rightP = storTxt.indexOf(")");
					
					if (leftP >= 0 && rightP >= 0 && leftP > rightP) {
						storCd = storTxt.substring(0, leftP);
						storNm = storTxt.substring(leftP + 1, rightP);
					}
				}
				
				int bxGdsQntt = NumberUtils.parseNumber(
						ComUtil
						.nullToEmpty(dtl.get("BX_GDS_QNTT"))
						.replace(",", ""),
						Integer.class);
				
				int outordrQntt = 0;
				String outordrUnit = "";
				String qnttTxt = dtl.get("OUTORDR_QNTT_TXT");
				
				if (StringUtils.hasText(qnttTxt)) {
					int leftP = qnttTxt.indexOf("(");
					int rightP = qnttTxt.indexOf(")");
					if (leftP >= 0) {;
						outordrQntt = NumberUtils.parseNumber(
										ComUtil
										.nullToEmpty(qnttTxt.substring(0, leftP))
										.replace(",", ""),
										Integer.class);
					}
					
					if (leftP >= 0 && rightP >= 0 && leftP > rightP) {
						outordrUnit = qnttTxt.substring(leftP + 1, rightP);
					}
				}
				
				int pieceQntt = NumberUtils.parseNumber(
									ComUtil
									.nullToEmpty(dtl.get("PIECE_QNTT"))
									.replace(",", ""),
									Integer.class);
				double pieceUntprc = NumberUtils.parseNumber(
									ComUtil
									.nullToEmpty(dtl.get("PIECE_UNTPRC"))
									.replace(",", ""),
									Double.class);
				
				long outordrAmt = NumberUtils.parseNumber(
									ComUtil
									.nullToEmpty(dtl.get("OUTORDR_AMT"))
									.replace(",", ""),
									Long.class);
				double outordrUntprc = bxGdsQntt * pieceUntprc;
				
				MrktOrdrDtlVO dtlVO = new MrktOrdrDtlVO();
				
				dtlVO.setOrdrApcCd(ordrApcCd);
				//dtlVO.setWrhsYmd(wrhsYmd);
				dtlVO.setWrhsYmd(ymd);
				dtlVO.setOutordrno(outordrno);
				dtlVO.setDtlSeq(dtlSeq);
				dtlVO.setMrktGdsCd(mrktGdsCd);
				dtlVO.setMrktGdsNm(mrktGdsNm);
				dtlVO.setMrktNtslCd(mrktNtslCd);
				dtlVO.setStorCd(storCd);
				dtlVO.setStorNm(storNm);
				dtlVO.setMrktWrhsTypeNm(mrktWrhsTypeNm);
				dtlVO.setBxGdsQntt(bxGdsQntt);
				dtlVO.setOutordrQntt(outordrQntt);
				dtlVO.setOutordrUnit(outordrUnit);
				dtlVO.setPieceQntt(pieceQntt);
				dtlVO.setPieceUntprc(pieceUntprc);
				dtlVO.setOutordrAmt(outordrAmt);
				dtlVO.setOutordrUntprc(outordrUntprc);
				
				dtlList.add(dtlVO);
			}
			
			
			ordrVO.setDtlList(dtlList);
			
			ordrList.add(ordrVO);
			
		}
		
		// 등록
		
		String sysUserId = ordrRcvVO.getSysLastChgUserId();
		String sysPrgrmId = ordrRcvVO.getSysLastChgPrgrmId();
		
		for ( MrktOrdrVO ordrVO : ordrList ) {
			
			List<MrktOrdrDtlVO> dtlList = ordrVO.getDtlList();
			
			// insert ordr
			ordrRcvMapper.insertSpMrktOrdrLtReg(ordrVO);
			
			if (StringUtils.hasText(ordrVO.getRtnCd())) {
				rtnObj = ComUtil.getResultMap(ordrVO.getRtnCd(), ordrVO.getRtnMsg());
				throw new EgovBizException(getMessageForMap(rtnObj));
			}
			
			long ordrSeq = ordrVO.getOrdrSeq();
			
			// insert ordr dtl
			for ( MrktOrdrDtlVO dtlVO : dtlList ) {
				
				dtlVO.setOrdrSeq(ordrSeq);
				
				ordrRcvMapper.insertSpMrktOrdrLtDtlReg(dtlVO);				
				if (StringUtils.hasText(dtlVO.getRtnCd())) {
					rtnObj = ComUtil.getResultMap(dtlVO.getRtnCd(), dtlVO.getRtnMsg());
					throw new EgovBizException(getMessageForMap(rtnObj));
				}
			}
			
			ordrVO.setSysUserId(sysUserId);
			ordrVO.setSysPrgrmId(sysPrgrmId);
			
			// ordr >> 발주정보
			ordrRcvMapper.insertSpMrktOrdrRcvLotte(ordrVO);
			
			if (StringUtils.hasText(ordrVO.getRtnCd())) {
				rtnObj = ComUtil.getResultMap(ordrVO.getRtnCd(), ordrVO.getRtnMsg());
				throw new EgovBizException(getMessageForMap(rtnObj));
			}
		}

		return null;
	}
	
	private void logoutLotte (String jsessionId) throws Exception {
		
		
		String originUrl = "https://www.lcn.co.kr/";
		String logoutUrl = originUrl + "scm/j_spring_security_logout";
		
		long currentUnixTime = System.currentTimeMillis() / 1000; // 초 단위로 변환
		Map<String, String> logoutParam = new HashMap<>();
		logoutParam.put("_", Long.toString(currentUnixTime));
		
		Connection.Response logoutResponse = Jsoup.connect(logoutUrl)
                .timeout(3000)
                .header("Origin", originUrl)
                .header("Referer", "https://www.lcn.co.kr/scm/main/main")
                .header("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8")
                .header("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8")
                .header("Accept-Encoding", "gzip, deflate, br")
                .header("Accept-Language", "ko-KR,ko;q=0.8,en-US;q=0.6,en;q=0.4")
                .cookie("JSESSIONID", jsessionId)
                .cookie("isLogined", "true")
                .data(logoutParam)
                .method(Connection.Method.POST)
                .execute();
		
		Document logoutDoc = Jsoup.parse(logoutResponse.body());
		//logger.debug("@@@logoutDoc");
		//logger.debug(logoutDoc.toString());
	}

	@Override
	public List<MrktOrdrVO> selectOrdrListForLotte(MrktOrdrVO mrktHomeplusVO) throws Exception {
		return null;
	}

	@Override
	public List<HashMap<String, Object>> selectOrdrListForLottesuper(MrktOrdrDtlVO mrktOrdrDtlVO) throws Exception {

		List<HashMap<String, Object>> ordrList = new ArrayList<>();

		String ordrApcCd = mrktOrdrDtlVO.getOrdrApcCd();
		String wrhsYmd = mrktOrdrDtlVO.getWrhsYmd();
		String receiptYn = mrktOrdrDtlVO.getReceiptYn();

		List<MrktOrdrDtlVO> ordrDtlList = ordrRcvMapper.selectOrglnOrdrLotteDtl(mrktOrdrDtlVO);

		String outordrno = "";

		HashMap<String, Object> ordr = new HashMap<>();
		List<HashMap<String, Object>> dtlList = new ArrayList<>();

		for ( MrktOrdrDtlVO dtlVO : ordrDtlList ) {

			HashMap<String, Object> dtl = new HashMap<>();

			if (!ComUtil.nullToEmpty(outordrno).equals(dtlVO.getOutordrno())) {

				if (ComConstants.CON_YES.equals(receiptYn)) {
					ordrRcvMapper.updateMrktLinkPrcsLotte(dtlVO);
				}

				if (dtlList.size() > 0) {
					ordr.put("DTL_LIST", dtlList);
					ordrList.add(ordr);
				}

				ordr = new HashMap<>();
				ordr.put("APC_CD", ordrApcCd);
				ordr.put("WRHS_YMD", dtlVO.getWrhsYmd());
				ordr.put("DOC_NO", dtlVO.getOutordrno());
				ordr.put("OUTORDR_AMT", dtlVO.getTotOutordrAmt());
				ordr.put("OUTORDR_YMD", dtlVO.getOutordrYmd());
				ordr.put("WRHS_KND", dtlVO.getMrktWrhsKnd());
				ordr.put("WRHS_TYPE", dtlVO.getMrktWrhsType());
				ordr.put("TRSM_YMD", dtlVO.getTrsmYmd());
				ordr.put("TRSM_TM", dtlVO.getTrsmTm());
				ordr.put("RCPTN_YMD", dtlVO.getRcptnYmd());
				ordr.put("RCPTN_TM", dtlVO.getRcptnTm());
				ordr.put("RCPTN_YN", dtlVO.getRcptnYn());
				ordr.put("BUYER_NM", dtlVO.getOrdrr());
				ordr.put("CNTR_CD", dtlVO.getCntrCd());
				ordr.put("CNTR_NM", dtlVO.getCntrNm());
				ordr.put("SPLR_CD", dtlVO.getSplrCd());
				ordr.put("SPLR_NM", dtlVO.getSplrNm());
				ordr.put("BPLC_CD", dtlVO.getBplcCd());
				ordr.put("CO_CD", dtlVO.getCoCd());
				ordr.put("CO_NM", dtlVO.getCoNm());
				ordr.put("WAREHOUSE_CD", dtlVO.getWarehouseCd());
				ordr.put("WAREHOUSE_NM", dtlVO.getWarehouseTxt());
				ordr.put("ORDR_DSCTN", dtlVO.getOrdrDsctn());

				dtlList = new ArrayList<>();
			}

			dtl.put("DOC_NO", dtlVO.getOutordrno());
			dtl.put("SEQ", dtlVO.getDtlSeq());
			dtl.put("WRHS_YMD", dtlVO.getWrhsYmd());
			dtl.put("GDS_CD", dtlVO.getMrktGdsCd());
			dtl.put("GDS_NM", dtlVO.getMrktGdsNm());
			dtl.put("NTSL_CD", dtlVO.getMrktNtslCd());
			dtl.put("STOR_CD", dtlVO.getStorCd());
			dtl.put("STOR_NM", dtlVO.getStorNm());
			dtl.put("WRHS_TYPE", dtlVO.getMrktWrhsType());
			dtl.put("WRHS_TYPE_NM", dtlVO.getMrktWrhsTypeNm());
			dtl.put("BX_GDS_QNTT", dtlVO.getBxGdsQntt());
			dtl.put("OUTORDR_QNTT", dtlVO.getOutordrQntt());
			dtl.put("OUTORDR_UNIT", dtlVO.getOutordrUnit());
			dtl.put("PIECE_QNTT", dtlVO.getPieceQntt());
			dtl.put("PIECE_PRICE", dtlVO.getPieceUntprc());
			dtl.put("PIECE_UNTPRC", dtlVO.getPieceUntprc());
			dtl.put("OUTORDR_AMT", dtlVO.getOutordrAmt());
			dtl.put("OUTORDR_UNTPR", dtlVO.getOutordrUntprc());
			dtl.put("WRHS_QNTT", dtlVO.getWrhsQntt());

			dtlList.add(dtl);

			outordrno = dtlVO.getOutordrno();
		}

		if (dtlList.size() > 0) {
			ordr.put("DTL_LIST", dtlList);
			ordrList.add(ordr);
		}

		return ordrList;
	}

	@Override
	public List<HashMap<String, Object>> selectOrdrListForLottesuper(String ordrApcCd, String wrhsYmd) throws Exception {
		MrktOrdrDtlVO param = new MrktOrdrDtlVO();
		param.setOrdrApcCd(ordrApcCd);
		param.setWrhsYmd(wrhsYmd);

		return selectOrdrListForLottesuper(param);
	}

	@Override
	public List<HashMap<String, Object>> selectOrdrListForLottesuper(String ordrApcCd, String wrhsYmd, String receiptYn) throws Exception {
		MrktOrdrDtlVO param = new MrktOrdrDtlVO();
		param.setOrdrApcCd(ordrApcCd);
		param.setWrhsYmd(wrhsYmd);
		param.setReceiptYn(receiptYn);

		return selectOrdrListForLottesuper(param);
	}


}
