package com.at.apcss.am.ordr.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.NumberUtils;
import org.springframework.util.StringUtils;

import com.at.apcss.am.cmns.service.CmnsTaskNoService;
import com.at.apcss.am.cmns.service.CmnsValidationService;
import com.at.apcss.am.cmns.service.CnptService;
import com.at.apcss.am.cmns.vo.LgszMrktVO;
import com.at.apcss.am.constants.AmConstants;
import com.at.apcss.am.ordr.mapper.OrdrRcvMapper;
import com.at.apcss.am.ordr.service.OrdrRcvService;
import com.at.apcss.am.ordr.vo.OrdrHomeplusMVO;
import com.at.apcss.am.ordr.vo.OrdrHomeplusSVO;
import com.at.apcss.am.ordr.vo.OrdrRcvHomeplusVO;
import com.at.apcss.am.ordr.vo.OrdrRcvVO;
import com.at.apcss.am.ordr.vo.OrdrVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;

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

			ordrRcvVO.setCrtrYmdType("1");

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

		JSONParser jsonParser = new JSONParser();

		String originUrl = "http://gs.escm21.net/";
		String welcomeUrl = originUrl + "home/index.jsp";
		String indexUrl = originUrl + "home/index.jsp";

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

		Document welcomeDoc = Jsoup.parse(welcomeResponse.body());

		Element elKeyModulus = welcomeDoc.getElementById("rsaPublicKeyModulus");
		Element elKeyExponent = welcomeDoc.getElementById("rsaPublicKeyExponent");
		String rsaPublicKeyModulus = elKeyModulus.val();
		String rsaPublicKeyExponent = elKeyExponent.val();

		String uid = userId.toUpperCase();
		String empid = "ADMIN";
		/*
		ComRSACrypto encrypt

	    rsa.setPublic(rsaPublicKeyModulus, rsaPpublicKeyExponent);
	    // 사용자ID와 비밀번호를 RSA로 암호화한다.
	    var securedUsername = rsa.encrypt(username);
	    var securedEmpid = rsa.encrypt(empid);
	    var securedPassword = rsa.encrypt(password);
		*/
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
	public HashMap<String, Object> insertHanaroOrdr(OrdrRcvVO ordrRcvVO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}



}
