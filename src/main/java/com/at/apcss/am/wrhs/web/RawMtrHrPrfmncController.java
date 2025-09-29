package com.at.apcss.am.wrhs.web;




import com.at.apcss.am.wrhs.service.RawMtrHrPrfmncService;
import com.at.apcss.am.wrhs.vo.RawMtrHrPrfmncComVO;
import com.at.apcss.am.wrhs.vo.RawMtrHrPrfmncDtlVO;
import com.at.apcss.am.wrhs.vo.RawMtrWrhsIgiVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * @Class Name : RawMtrHrPrfmncController.java
 * @Description : 원물입고시간실적 대한 Controller 클래스
 * @author 김호
 * @since 2025.08.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2025.08.21  김호        최초 생성
 * </pre>
 */
@Controller
public class RawMtrHrPrfmncController extends BaseController {
	
	@Resource(name = "rawMtrHrPrfmncService")
	private RawMtrHrPrfmncService rawMtrHrPrfmncService;

	/**
	 * 원물입고시간실적 목록 조회
	 * @param rawMtrHrPrfmncDtlVO
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/am/wrhs/selectRawMtrHrPrfmncList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectRawMtrHrPrfmncList(@RequestBody RawMtrHrPrfmncDtlVO rawMtrHrPrfmncDtlVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		List<RawMtrHrPrfmncDtlVO> resultList;
		try {
			resultList = rawMtrHrPrfmncService.selectRawMtrHrPrfmncList(rawMtrHrPrfmncDtlVO);
		} catch (Exception e) {
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	/**
	 * 원물입고시간실적 토탈 조회
	 * @param rawMtrHrPrfmncDtlVO
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/am/wrhs/selectRawMtrHrPrfmncTot.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectRawMtrHrPrfmncTot(@RequestBody RawMtrHrPrfmncDtlVO rawMtrHrPrfmncDtlVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		List<RawMtrHrPrfmncDtlVO> resultList = new ArrayList<RawMtrHrPrfmncDtlVO>();
		try {
			resultList = rawMtrHrPrfmncService.selectRawMtrHrPrfmncTot(rawMtrHrPrfmncDtlVO);
		} catch (Exception e) {
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	/**
	 * 원물입고시간실적 멀티 저장
	 * @param rawMtrHrPrfmncComList
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/am/wrhs/multiSaveRawMtrHrPrfmncList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> multiSaveRawMtrHrPrfmncList(@RequestBody List<RawMtrHrPrfmncComVO> rawMtrHrPrfmncComList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			for (RawMtrHrPrfmncComVO rawMtrHrPrfmncComVO: rawMtrHrPrfmncComList) {
				rawMtrHrPrfmncComVO.setSysFrstInptPrgrmId(getPrgrmId());
				rawMtrHrPrfmncComVO.setSysFrstInptUserId(getUserId());
				rawMtrHrPrfmncComVO.setSysLastChgPrgrmId(getPrgrmId());
				rawMtrHrPrfmncComVO.setSysLastChgUserId(getUserId());

				List<RawMtrHrPrfmncDtlVO> rawMtrHrPrfmncDtlList = rawMtrHrPrfmncComVO.getRawMtrHrPrfmncDtlList();

				for (RawMtrHrPrfmncDtlVO rawMtrHrPrfmncDtlVO: rawMtrHrPrfmncDtlList) {
					rawMtrHrPrfmncDtlVO.setSysFrstInptPrgrmId(getPrgrmId());
					rawMtrHrPrfmncDtlVO.setSysFrstInptUserId(getUserId());
					rawMtrHrPrfmncDtlVO.setSysLastChgPrgrmId(getPrgrmId());
					rawMtrHrPrfmncDtlVO.setSysLastChgUserId(getUserId());
				}
			}

			HashMap<String, Object> rtnObj = rawMtrHrPrfmncService.multiSaveRawMtrHrPrfmncList(rawMtrHrPrfmncComList);

			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

		} catch (Exception e) {
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/wrhs/deleteRawMtrHrPrfmnc.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteRawMtrHrPrfmnc(@RequestBody RawMtrHrPrfmncDtlVO rawMtrHrPrfmncDtlVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {

			rawMtrHrPrfmncDtlVO.setSysLastChgPrgrmId(getPrgrmId());
			rawMtrHrPrfmncDtlVO.setSysLastChgUserId(getUserId());


			HashMap<String, Object> rtnObj = rawMtrHrPrfmncService.deleteRawMtrHrPrfmncDtl(rawMtrHrPrfmncDtlVO);

			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

		} catch (Exception e) {
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		return getSuccessResponseEntity(resultMap);
	}



}
