package com.at.apcss.am.clcln.web;

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

import com.at.apcss.am.clcln.service.ClclnWkrptService;
import com.at.apcss.am.clcln.vo.ClclnNowInvntrVO;
import com.at.apcss.am.clcln.vo.ClclnWkrptVO;
import com.at.apcss.am.wgh.vo.WghPrfmncVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : ClclnWkrptController.java
 * @Description : 주간 입고출고 현황 대한 Controller 클래스
 * @author 김호
 * @since 2024.11.12
 * @version 1.0
 * @see
 *
 *      <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.11.12  김호        최초 생성
 *      </pre>
 */
@Controller
public class ClclnWkrptController extends BaseController {

	// 주간 입고출고 현황
	@Resource(name = "clclnWkrptService")
	private ClclnWkrptService clclnWkrptService;

	// 주간 입고출고 현환 목록 조회
	@PostMapping(value = "/am/clcln/selectWkrptList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectWkrptList(@RequestBody ClclnWkrptVO clclnWkrptVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<ClclnWkrptVO> resultList = new ArrayList<>();
		try {
			resultList = clclnWkrptService.selectWkrptList(clclnWkrptVO);
		} catch (Exception e) {
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

	// 주간 입고출고 현환 목록 조회
	@PostMapping(value = "/am/clcln/selectWkrptLastQnttList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectWkrptLastQnttList(@RequestBody ClclnWkrptVO clclnWkrptVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<ClclnWkrptVO> resultList = new ArrayList<>();
		try {
			resultList = clclnWkrptService.selectWkrptLastQnttList(clclnWkrptVO);
		} catch (Exception e) {
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


	@PostMapping(value = "/am/clcln/insertClclnNowInvntr.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertClclnNowInvntr(@RequestBody ClclnNowInvntrVO clclnNowInvntrVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			clclnNowInvntrVO.setSysFrstInptUserId(getUserId());
			clclnNowInvntrVO.setSysFrstInptPrgrmId(getPrgrmId());
			clclnNowInvntrVO.setSysLastChgUserId(getUserId());
			clclnNowInvntrVO.setSysLastChgPrgrmId(getPrgrmId());

			HashMap<String, Object> rtnObj = clclnWkrptService.insertClclnNowInvntr(clclnNowInvntrVO);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		return getSuccessResponseEntity(resultMap);
	}



	// 주간 입고출고 현환 목록 조회
		@PostMapping(value = "/am/clcln/selectClclnNowInvntrList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
		public ResponseEntity<HashMap<String, Object>> selectClclnNowInvntrList(@RequestBody ClclnNowInvntrVO clclnNowInvntrVO, HttpServletRequest request) throws Exception {

			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			List<ClclnNowInvntrVO> resultList = new ArrayList<>();
			try {
				resultList = clclnWkrptService.selectClclnNowInvntrList(clclnNowInvntrVO);
			} catch (Exception e) {
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

}

