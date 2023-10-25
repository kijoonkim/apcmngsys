package com.at.apcss.am.trnsf.web;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.at.apcss.am.trnsf.service.TrnsfRawMtrInvntrService;
import com.at.apcss.am.trnsf.vo.TrnsfRawMtrInvntrVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : RawMtrInvntrController.java
 * @Description : 원물재고관리 대한 Controller 클래스
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
@Controller
public class TrnsfRawMtrInvntrController extends BaseController {

	@Resource(name = "TrnsfRawMtrInvntrService")
	private TrnsfRawMtrInvntrService trnsfRawMtrInvntrService;

	@PostMapping(value = "/am/trnsf/selectTrnsfRawMtrInvntrList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectTrnsfRawMtrInvntrList(@RequestBody TrnsfRawMtrInvntrVO trnsfRawMtrInvntrVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<TrnsfRawMtrInvntrVO> resultList;
		try {

			resultList = trnsfRawMtrInvntrService.selectTrnsfRawMtrInvntrList(trnsfRawMtrInvntrVO);

		} catch (Exception e) {
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/trnsf/saveTrnsfRawMtrInvntrList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> saveTrnsfRawMtrInvntrList(@RequestBody List<TrnsfRawMtrInvntrVO> trnsfRawMtrInvntrList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			for ( TrnsfRawMtrInvntrVO trnsfRawMtrInvntrVO : trnsfRawMtrInvntrList ) {
				trnsfRawMtrInvntrVO.setSysFrstInptPrgrmId(getPrgrmId());
				trnsfRawMtrInvntrVO.setSysFrstInptUserId(getUserId());
				trnsfRawMtrInvntrVO.setSysLastChgUserId(getUserId());
				trnsfRawMtrInvntrVO.setSysLastChgPrgrmId(getPrgrmId());
			}

			HashMap<String, Object> rtnObj = trnsfRawMtrInvntrService.insertTrnsfRawMtrInvntrList(trnsfRawMtrInvntrList); //updateRawMtrInvntrList
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

		} catch (Exception e) {
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		}

		return getSuccessResponseEntity(resultMap);
	}
}
