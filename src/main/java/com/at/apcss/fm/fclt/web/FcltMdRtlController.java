package com.at.apcss.fm.fclt.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.fm.fclt.service.FcltMdRtlService;
import com.at.apcss.fm.fclt.vo.FcltMdRtlVO;
/**
 * @Class Name : MdRtlFcltController.java
 * @Description : APC전수조사 대시보드 Controller 클래스
 * @author 김현호
 * @since 2023.11.15
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.11.15  김현호        최초 생성
 * </pre>
 */
@Controller
public class FcltMdRtlController extends BaseController {

	// APC전수조사 대시보드
	@Resource(name= "fcltMdRtlService")
	private FcltMdRtlService fcltMdRtlService;

	// 기준년도 목록 조회
	@PostMapping(value = "/am/fclt/crtrYr", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectCrtrYnList(@RequestBody FcltMdRtlVO fcltMdRtlVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<FcltMdRtlVO> resultList = new ArrayList<>();

		try {
			resultList = fcltMdRtlService.selectCrtrYnList(fcltMdRtlVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			setMenuComLog(request);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}
	// APC현황
	@PostMapping(value = "/fm/fclt/selectMapSttn.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectMapSttn(@RequestBody FcltMdRtlVO fcltMdRtlVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<FcltMdRtlVO> resultLsit = new ArrayList<>();
		try {
			resultLsit = fcltMdRtlService.selectMapSttn(fcltMdRtlVO);
		} catch (Exception e) {
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultLsit);
		return getSuccessResponseEntity(resultMap);
	}

	// 전수조사집계현황
	@PostMapping(value = "/fm/fclt/selectApcTotList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectApcTotList(@RequestBody FcltMdRtlVO fcltMdRtlVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<HashMap<String,Object>> resultLsit = new ArrayList<>();
		try {
			resultLsit = fcltMdRtlService.selectApcTotList(fcltMdRtlVO);
		} catch (Exception e) {
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultLsit);
		return getSuccessResponseEntity(resultMap);
	}
	// APC지역목록 조회
	@PostMapping(value = "/fm/fclt/selectCtpvAreaList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectCtpvAreaList(@RequestBody FcltMdRtlVO fcltMdRtlVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<FcltMdRtlVO> resultLsit = new ArrayList<>();
		try {
			resultLsit = fcltMdRtlService.selectCtpvAreaList(fcltMdRtlVO);
		} catch (Exception e) {
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultLsit);
		return getSuccessResponseEntity(resultMap);
	}

	// 산지유통시설현황 조회
	@PostMapping(value = "/fm/fclt/selectMdRtlOgnzNowGridList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectMdRtlOgnzNowGridList(@RequestBody FcltMdRtlVO fcltMdRtlVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			resultMap = fcltMdRtlService.selectMdRtlOgnzNowGridList(fcltMdRtlVO);
		} catch (Exception e) {
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			setMenuComLog(request);
		}
		return getSuccessResponseEntity(resultMap);
	}

	// 산지유통시설지역별현황 조회
	@PostMapping(value = "/fm/fclt/selectMdRtlFcltRgnNowGridList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectMdRtlFcltRgnNowGridList(@RequestBody FcltMdRtlVO fcltMdRtlVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			resultMap = fcltMdRtlService.selectMdRtlFcltRgnNowGridList(fcltMdRtlVO);
		} catch (Exception e) {
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			setMenuComLog(request);
		}
		return getSuccessResponseEntity(resultMap);
	}

	// 정부지원 산지유통시설 현황 조회
	@PostMapping(value = "/fm/fclt/selectGvrngmtSprtMdRtlFcltGridList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectGvrngmtSprtMdRtlFcltGridList(@RequestBody FcltMdRtlVO fcltMdRtlVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			resultMap = fcltMdRtlService.selectGvrngmtSprtMdRtlFcltGridList(fcltMdRtlVO);
		} catch (Exception e) {
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			setMenuComLog(request);
		}
		return getSuccessResponseEntity(resultMap);
	}

	// 정부지원 산지유통시설 현황 조회
	@PostMapping(value = "/fm/fclt/selectGvrngmtSprtMdRtlOgnzTypeGridList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectGvrngmtSprtMdRtlOgnzTypeGridList(@RequestBody FcltMdRtlVO fcltMdRtlVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			resultMap = fcltMdRtlService.selectGvrngmtSprtMdRtlOgnzTypeGridList(fcltMdRtlVO);
		} catch (Exception e) {
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			setMenuComLog(request);
		}
		return getSuccessResponseEntity(resultMap);
	}



	@PostMapping(value = "/fm/fclt/selectMdRtlFcltOperPrfmncGridList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectMdRtlFcltOperPrfmncGridList(@RequestBody FcltMdRtlVO fcltMdRtlVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			resultMap = fcltMdRtlService.selectMdRtlFcltOperPrfmncGridList(fcltMdRtlVO);
		} catch (Exception e) {
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			setMenuComLog(request);
		}
		return getSuccessResponseEntity(resultMap);
	}

	// 정부지원 지역별 운영실적
	@PostMapping(value = "/fm/fclt/selectGvrngmtSprtRgnOperPrfmncGridList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectGvrngmtSprtRgnOperPrfmncGridList(@RequestBody FcltMdRtlVO fcltMdRtlVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			resultMap = fcltMdRtlService.selectGvrngmtSprtRgnOperPrfmncGridList(fcltMdRtlVO);
		} catch (Exception e) {
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			setMenuComLog(request);
		}

		return getSuccessResponseEntity(resultMap);
	}


	/**
	 * 산지유통시설현황
	 * 산지유통시설 집계
	 * @param fcltMdRtlVO
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/fm/fclt/selectApcFcltTotListAll.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectApcFcltTotListAll(@RequestBody FcltMdRtlVO fcltMdRtlVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		List<FcltMdRtlVO> apcSpotList;					// 개소수 : 산지유통조직 유형	selectApcSpotTotList
		List<FcltMdRtlVO> apcSpotListByOwnerOper;		// 개소수:소유자 및 운영자	selectApcSpotTotListByOwnerOper
		List<FcltMdRtlVO> apcAreaSizeList;				// 면적		selectApcFcltAreaSizeTotList
		List<FcltMdRtlVO> apcInstalledEquipmentList;	// 설치장비	selectApcInstalledEquipmentTotList
		List<FcltMdRtlVO> apcInvestmentList;			// 투자금액	selectApcInvestmentTotList

		List<FcltMdRtlVO> apcSpotListByCtpv;				// 개소수 : 산지유통조직 유형	selectApcSpotTotListByCtpv
		List<FcltMdRtlVO> apcAreaSizeListByCtpv;			// 면적		selectApcFcltAreaSizeTotListByCtpv
		List<FcltMdRtlVO> apcInstalledEquipmentListByCtpv;	// 설치장비	selectApcInstalledEquipmentTotListByCtpv
		List<FcltMdRtlVO> apcInvestmentListByCtpv;			// 투자금액	selectApcInvestmentTotListByCtpv

		List<FcltMdRtlVO> apcOperPrfmncList;				// 운영실적
		List<FcltMdRtlVO> apcOperPrfmncListByCtpv;			// 운영실적 지역별

		try {
			apcSpotList = fcltMdRtlService.selectApcSpotTotList(fcltMdRtlVO);
			apcSpotListByOwnerOper = fcltMdRtlService.selectApcSpotTotListByOwnerOper(fcltMdRtlVO);
			apcAreaSizeList = fcltMdRtlService.selectApcFcltAreaSizeTotList(fcltMdRtlVO);
			apcInstalledEquipmentList = fcltMdRtlService.selectApcInstalledEquipmentTotList(fcltMdRtlVO);
			apcInvestmentList = fcltMdRtlService.selectApcInvestmentTotList(fcltMdRtlVO);

			apcSpotListByCtpv = fcltMdRtlService.selectApcSpotTotListByCtpv(fcltMdRtlVO);
			apcAreaSizeListByCtpv = fcltMdRtlService.selectApcFcltAreaSizeTotListByCtpv(fcltMdRtlVO);
			apcInstalledEquipmentListByCtpv = fcltMdRtlService.selectApcInstalledEquipmentTotListByCtpv(fcltMdRtlVO);
			apcInvestmentListByCtpv = fcltMdRtlService.selectApcInvestmentTotListByCtpv(fcltMdRtlVO);

			apcOperPrfmncList = fcltMdRtlService.selectApcOperPrfmncTotList(fcltMdRtlVO);
			apcOperPrfmncListByCtpv = fcltMdRtlService.selectApcOperPrfmncTotListByCtpv(fcltMdRtlVO);

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			setMenuComLog(request);
		}

		resultMap.put("apcSpotList", apcSpotList);
		resultMap.put("apcSpotListByOwnerOper", apcSpotListByOwnerOper);
		resultMap.put("apcAreaSizeList", apcAreaSizeList);
		resultMap.put("apcInstalledEquipmentList", apcInstalledEquipmentList);
		resultMap.put("apcInvestmentList", apcInvestmentList);

		resultMap.put("apcSpotListByCtpv", apcSpotListByCtpv);
		resultMap.put("apcAreaSizeListByCtpv", apcAreaSizeListByCtpv);
		resultMap.put("apcInstalledEquipmentListByCtpv", apcInstalledEquipmentListByCtpv);
		resultMap.put("apcInvestmentListByCtpv", apcInvestmentListByCtpv);

		resultMap.put("apcOperPrfmncList", apcOperPrfmncList);
		resultMap.put("apcOperPrfmncListByCtpv", apcOperPrfmncListByCtpv);

		return getSuccessResponseEntity(resultMap);
	}

	/**
	 * APC 집계요약
	 * @param fcltMdRtlVO
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/fm/fclt/selectApcTotSmmryList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectApcTotSmmryList(@RequestBody FcltMdRtlVO fcltMdRtlVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<FcltMdRtlVO> resultList;
		try {
			resultList = fcltMdRtlService.selectApcTotSmmryList(fcltMdRtlVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			setMenuComLog(request);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	/**
	 * APC 집계 요약 (지역별)
	 * @param fcltMdRtlVO
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/fm/fclt/selectApcTotSmmryListByCtpv.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectApcTotSmmryListByCtpv(@RequestBody FcltMdRtlVO fcltMdRtlVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<FcltMdRtlVO> resultList;
		try {
			resultList = fcltMdRtlService.selectApcTotSmmryListByCtpv(fcltMdRtlVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			setMenuComLog(request);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	/**
	 * 지역별 APC 목록 조회
	 * @param fcltMdRtlVO
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/fm/fclt/selectApcListByCtpv.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectApcListByCtpv(@RequestBody FcltMdRtlVO fcltMdRtlVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<FcltMdRtlVO> resultList;
		try {
			resultList = fcltMdRtlService.selectApcListByCtpv(fcltMdRtlVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			setMenuComLog(request);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	/**
	 * 1. 산지유통시설현황
	 * 산지유통시설 집계
	 * @param fcltMdRtlVO
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/fm/fclt/selectApcFcltTotList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectApcFcltTotList(@RequestBody FcltMdRtlVO fcltMdRtlVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		fcltMdRtlVO.setGvrmntSprtYn(null);
		List<FcltMdRtlVO> apcSpotList;					// 개소수 : 산지유통조직 유형	selectApcSpotTotList
		List<FcltMdRtlVO> apcSpotListByOwnerOper;		// 개소수:소유자 및 운영자	selectApcSpotTotListByOwnerOper
		List<FcltMdRtlVO> apcAreaSizeList;				// 면적		selectApcFcltAreaSizeTotList
		List<FcltMdRtlVO> apcInstalledEquipmentList;	// 설치장비	selectApcInstalledEquipmentTotList
		List<FcltMdRtlVO> apcInvestmentList;			// 투자금액	selectApcInvestmentTotList

		try {
			apcSpotList = fcltMdRtlService.selectApcSpotTotList(fcltMdRtlVO);
			apcSpotListByOwnerOper = fcltMdRtlService.selectApcSpotTotListByOwnerOper(fcltMdRtlVO);
			apcAreaSizeList = fcltMdRtlService.selectApcFcltAreaSizeTotList(fcltMdRtlVO);
			apcInstalledEquipmentList = fcltMdRtlService.selectApcInstalledEquipmentTotList(fcltMdRtlVO);
			apcInvestmentList = fcltMdRtlService.selectApcInvestmentTotList(fcltMdRtlVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			setMenuComLog(request);
		}

		resultMap.put("apcSpotList", apcSpotList);
		resultMap.put("apcSpotListByOwnerOper", apcSpotListByOwnerOper);
		resultMap.put("apcAreaSizeList", apcAreaSizeList);
		resultMap.put("apcInstalledEquipmentList", apcInstalledEquipmentList);
		resultMap.put("apcInvestmentList", apcInvestmentList);

		return getSuccessResponseEntity(resultMap);
	}

	/**
	 * 2. 지역별 산지유통시설현황
	 * 지역별 산지유통시설 집계
	 * @param fcltMdRtlVO
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/fm/fclt/selectApcFcltTotListByCtpv.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectApcFcltTotListByCtpv(@RequestBody FcltMdRtlVO fcltMdRtlVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		fcltMdRtlVO.setGvrmntSprtYn(null);
		List<FcltMdRtlVO> apcSpotListByCtpv;				// 개소수 : 산지유통조직 유형	selectApcSpotTotListByCtpv
		List<FcltMdRtlVO> apcAreaSizeListByCtpv;			// 면적		selectApcFcltAreaSizeTotListByCtpv
		List<FcltMdRtlVO> apcInstalledEquipmentListByCtpv;	// 설치장비	selectApcInstalledEquipmentTotListByCtpv
		List<FcltMdRtlVO> apcInvestmentListByCtpv;			// 투자금액	selectApcInvestmentTotListByCtpv

		try {
			apcSpotListByCtpv = fcltMdRtlService.selectApcSpotTotListByCtpv(fcltMdRtlVO);
			apcAreaSizeListByCtpv = fcltMdRtlService.selectApcFcltAreaSizeTotListByCtpv(fcltMdRtlVO);
			apcInstalledEquipmentListByCtpv = fcltMdRtlService.selectApcInstalledEquipmentTotListByCtpv(fcltMdRtlVO);
			apcInvestmentListByCtpv = fcltMdRtlService.selectApcInvestmentTotListByCtpv(fcltMdRtlVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			setMenuComLog(request);
		}

		resultMap.put("apcSpotListByCtpv", apcSpotListByCtpv);
		resultMap.put("apcAreaSizeListByCtpv", apcAreaSizeListByCtpv);
		resultMap.put("apcInstalledEquipmentListByCtpv", apcInstalledEquipmentListByCtpv);
		resultMap.put("apcInvestmentListByCtpv", apcInvestmentListByCtpv);

		return getSuccessResponseEntity(resultMap);
	}

	/**
	 * 3. 정부지원 산지유통시설현황
	 * 산지유통시설 집계
	 * @param fcltMdRtlVO
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/fm/fclt/selectGovApcFcltTotList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectGovApcFcltTotList(@RequestBody FcltMdRtlVO fcltMdRtlVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		fcltMdRtlVO.setGvrmntSprtYn(ComConstants.CON_YES);
		List<FcltMdRtlVO> apcSpotList;					// 개소수 : 산지유통조직 유형	selectApcSpotTotList
		List<FcltMdRtlVO> apcSpotListByOwnerOper;		// 개소수:소유자 및 운영자	selectApcSpotTotListByOwnerOper
		List<FcltMdRtlVO> apcAreaSizeList;				// 면적		selectApcFcltAreaSizeTotList
		List<FcltMdRtlVO> apcInstalledEquipmentList;	// 설치장비	selectApcInstalledEquipmentTotList
		List<FcltMdRtlVO> apcInvestmentList;			// 투자금액	selectApcInvestmentTotList

		try {
			apcSpotList = fcltMdRtlService.selectApcSpotTotList(fcltMdRtlVO);
			apcSpotListByOwnerOper = fcltMdRtlService.selectApcSpotTotListByOwnerOper(fcltMdRtlVO);
			apcAreaSizeList = fcltMdRtlService.selectApcFcltAreaSizeTotList(fcltMdRtlVO);
			apcInstalledEquipmentList = fcltMdRtlService.selectApcInstalledEquipmentTotList(fcltMdRtlVO);
			apcInvestmentList = fcltMdRtlService.selectApcInvestmentTotList(fcltMdRtlVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			setMenuComLog(request);
		}

		resultMap.put("apcSpotList", apcSpotList);
		resultMap.put("apcSpotListByOwnerOper", apcSpotListByOwnerOper);
		resultMap.put("apcAreaSizeList", apcAreaSizeList);
		resultMap.put("apcInstalledEquipmentList", apcInstalledEquipmentList);
		resultMap.put("apcInvestmentList", apcInvestmentList);

		return getSuccessResponseEntity(resultMap);
	}

	/**
	 * 4. 정부지원 지역별 산지유통시설현황
	 * 지역별 산지유통시설 집계
	 * @param fcltMdRtlVO
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/fm/fclt/selectGovApcFcltTotListByCtpv.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectGovApcFcltTotListByCtpv(@RequestBody FcltMdRtlVO fcltMdRtlVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		fcltMdRtlVO.setGvrmntSprtYn(ComConstants.CON_YES);
		List<FcltMdRtlVO> apcSpotListByCtpv;				// 개소수 : 산지유통조직 유형	selectApcSpotTotListByCtpv
		List<FcltMdRtlVO> apcAreaSizeListByCtpv;			// 면적		selectApcFcltAreaSizeTotListByCtpv
		List<FcltMdRtlVO> apcInstalledEquipmentListByCtpv;	// 설치장비	selectApcInstalledEquipmentTotListByCtpv
		List<FcltMdRtlVO> apcInvestmentListByCtpv;			// 투자금액	selectApcInvestmentTotListByCtpv

		try {
			apcSpotListByCtpv = fcltMdRtlService.selectApcSpotTotListByCtpv(fcltMdRtlVO);
			apcAreaSizeListByCtpv = fcltMdRtlService.selectApcFcltAreaSizeTotListByCtpv(fcltMdRtlVO);
			apcInstalledEquipmentListByCtpv = fcltMdRtlService.selectApcInstalledEquipmentTotListByCtpv(fcltMdRtlVO);
			apcInvestmentListByCtpv = fcltMdRtlService.selectApcInvestmentTotListByCtpv(fcltMdRtlVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			setMenuComLog(request);
		}

		resultMap.put("apcSpotListByCtpv", apcSpotListByCtpv);
		resultMap.put("apcAreaSizeListByCtpv", apcAreaSizeListByCtpv);
		resultMap.put("apcInstalledEquipmentListByCtpv", apcInstalledEquipmentListByCtpv);
		resultMap.put("apcInvestmentListByCtpv", apcInvestmentListByCtpv);

		return getSuccessResponseEntity(resultMap);
	}

	/**
	 * 5.산지유통시설 운영실적 조회
	 * @param fcltMdRtlVO
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/fm/fclt/selectOperOgnzTrmtTotList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectOperOgnzTrmtTotList(@RequestBody FcltMdRtlVO fcltMdRtlVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		fcltMdRtlVO.setGvrmntSprtYn(null);
		List<FcltMdRtlVO> operOgnzTrmtList;
		List<FcltMdRtlVO> operOgnzTrmtListByCtpv;

		try {
			operOgnzTrmtList = fcltMdRtlService.selectApcOperPrfmncTotList(fcltMdRtlVO);
			operOgnzTrmtListByCtpv = fcltMdRtlService.selectApcOperPrfmncTotListByCtpv(fcltMdRtlVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			setMenuComLog(request);
		}

		resultMap.put("operOgnzTrmtList", operOgnzTrmtList);
		resultMap.put("operOgnzTrmtListByCtpv", operOgnzTrmtListByCtpv);

		return getSuccessResponseEntity(resultMap);
	}

	/**
	 * 6. 정부지원 산지유통시설 운영실적 조회
	 * @param fcltMdRtlVO
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/fm/fclt/selectGovOperOgnzTrmtTotList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectGovOperOgnzTrmtTotList(@RequestBody FcltMdRtlVO fcltMdRtlVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		fcltMdRtlVO.setGvrmntSprtYn(ComConstants.CON_YES);
		List<FcltMdRtlVO> operOgnzTrmtList;
		List<FcltMdRtlVO> operOgnzTrmtListByCtpv;

		try {
			operOgnzTrmtList = fcltMdRtlService.selectApcOperPrfmncTotList(fcltMdRtlVO);
			operOgnzTrmtListByCtpv = fcltMdRtlService.selectApcOperPrfmncTotListByCtpv(fcltMdRtlVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			setMenuComLog(request);
		}

		resultMap.put("operOgnzTrmtList", operOgnzTrmtList);
		resultMap.put("operOgnzTrmtListByCtpv", operOgnzTrmtListByCtpv);

		return getSuccessResponseEntity(resultMap);
	}



}
