package com.at.apcss.am.pckg.web;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.at.apcss.am.cmns.service.CmnsTaskNoService;
import com.at.apcss.am.pckg.service.PckgCmndService;
import com.at.apcss.am.pckg.vo.PckgCmndVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : PckgCmndController.java
 * @Description : 포장지시에 대한 Controller 클래스
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
public class PckgCmndController extends BaseController {

	@Resource(name = "pckgCmndService")
	private PckgCmndService pckgCmndService;

	@Resource(name = "cmnsTaskNoService")
	private CmnsTaskNoService cmnsTaskNoService;
	
	/**
	 * 포장지시 목록 조회
	 * 
	 * @param comAuthrtVO
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/am/pckg/selectPckgCmndList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectWghPrfmncList(@RequestBody PckgCmndVO pckgCmndVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<PckgCmndVO> resultList;

		try {
			resultList = pckgCmndService.selectPckgCmndList(pckgCmndVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/pckg/insertPckgCmndList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertWghPrfmnc(@RequestBody List<PckgCmndVO> insertList, HttpServletRequest request) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		int insertedCnt = 0;

		try {
			String pckgCmndno = cmnsTaskNoService.selectPckgCmndno(insertList.get(0).getApcCd(), insertList.get(0).getPckgCmndYmd());
			int sn = 1;
			for (PckgCmndVO pckgCmndVO : insertList) {
				pckgCmndVO.setSysFrstInptUserId(getUserId());
				pckgCmndVO.setSysFrstInptPrgrmId(getPrgrmId());
				pckgCmndVO.setSysLastChgUserId(getUserId());
				pckgCmndVO.setSysLastChgPrgrmId(getPrgrmId());
				pckgCmndVO.setPckgCmndno(pckgCmndno);
				pckgCmndVO.setPckgCmndSn(sn);
				sn++;
				insertedCnt += pckgCmndService.insertPckgCmnd(pckgCmndVO);
			}
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

		return getSuccessResponseEntity(resultMap);
	}
	
	@PostMapping(value = "/am/pckg/deletePckgCmndList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteWghPrfmncList(@RequestBody List<PckgCmndVO> pckgCmndList, HttpServletRequest request) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		int deletedCnt = 0;

		try {
			for (PckgCmndVO pckgCmndVO : pckgCmndList) {
				deletedCnt += pckgCmndService.deletePckgCmnd(pckgCmndVO);
			}

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);

		return getSuccessResponseEntity(resultMap);
	}
}
