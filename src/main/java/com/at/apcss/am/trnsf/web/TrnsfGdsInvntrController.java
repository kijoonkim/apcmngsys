package com.at.apcss.am.trnsf.web;

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

import com.at.apcss.am.invntr.service.GdsInvntrService;
import com.at.apcss.am.invntr.vo.GdsInvntrVO;
import com.at.apcss.am.trnsf.service.TrnsfGdsInvntrService;
import com.at.apcss.am.trnsf.vo.TrnsfGdsInvntrVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : GdsInvntrController.java
 * @Description : 상품재고관리 대한 Controller 클래스
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
public class TrnsfGdsInvntrController extends BaseController {

	@Resource(name = "trnsfGdsInvntrService")
	private TrnsfGdsInvntrService trnsfGdsInvntrService;

	@PostMapping(value = "/am/invntr/selectUpdateTrnsfGdsInvntrList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectUpdateTrnsfGdsInvntrList(@RequestBody TrnsfGdsInvntrVO trnsfGdsInvntrVO, HttpServletRequest request) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<TrnsfGdsInvntrVO> resultList = new ArrayList<>();
		try {
			resultList = trnsfGdsInvntrService.selectUpdateTrnsfGdsInvntrList(trnsfGdsInvntrVO);			
		} catch (Exception e) {
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		}
		
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		
		return getSuccessResponseEntity(resultMap);
		
	}
	
	@PostMapping(value = "/am/invntr/updateTrnsfGdsInvntrList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> updateTrnsfGdsInvntrList(@RequestBody List<TrnsfGdsInvntrVO> trnsfGdsInvntrList, HttpServletRequest request) throws Exception {

		logger.debug("updateSortInvntrDsctnList 호출 <><><><> ");

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			for ( TrnsfGdsInvntrVO trnsfGdsInvntrVO : trnsfGdsInvntrList ) {
				trnsfGdsInvntrVO.setSysLastChgUserId(getUserId());
				trnsfGdsInvntrVO.setSysLastChgPrgrmId(getPrgrmId());
			}

			HashMap<String, Object> rtnObj = trnsfGdsInvntrService.updateTrnsfGdsInvntrList(trnsfGdsInvntrList); //updateSortInvntrDsctnList
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
