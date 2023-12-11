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

import com.at.apcss.am.trnsf.service.InvntrTrnsfService;
import com.at.apcss.am.trnsf.vo.InvntrTrnsfVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : InvntrTrnsfController.java
 * @Description : 재고이송에 대한 Controller 클래스
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
public class InvntrTrnsfController extends BaseController {

	@Resource(name = "invntrTrnsfService")
	private InvntrTrnsfService invntrTrnsfService;


	@PostMapping(value = "/am/trnsf/selectTrnsfInvntrList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectUpdateTrnsfGdsInvntrList(@RequestBody InvntrTrnsfVO invntrTrnsfVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<InvntrTrnsfVO> resultList = new ArrayList<>();
		try {
			resultList = invntrTrnsfService.selectInvntrTrnsfList(invntrTrnsfVO);
		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);

	}

	@PostMapping(value = "/am/trnsf/deleteTrnsfInvntrList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteTrnsfInvntrList(@RequestBody List<InvntrTrnsfVO> invntrTrnsfList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			for (InvntrTrnsfVO invntrTrnsfVO : invntrTrnsfList) {
				invntrTrnsfVO.setSysFrstInptPrgrmId(getPrgrmId());
				invntrTrnsfVO.setSysFrstInptUserId(getUserId());
				invntrTrnsfVO.setSysLastChgPrgrmId(getPrgrmId());
				invntrTrnsfVO.setSysLastChgUserId(getPrgrmId());
			}
			resultMap = invntrTrnsfService.deleteInvntrTrnsfList(invntrTrnsfList);
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

}
