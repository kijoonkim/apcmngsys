package com.at.apcss.am.sort.web;

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

import com.at.apcss.am.cmns.service.CmnsTaskNoService;
import com.at.apcss.am.sort.service.SortCmndService;
import com.at.apcss.am.sort.vo.SortCmndVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : SortCmndController.java
 * @Description : 선별지시정보관리에 대한 Controller 클래스
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
public class SortCmndController extends BaseController {

	@Resource(name = "sortCmndService")
	private SortCmndService sortCmndService;

	@Resource(name= "cmnsTaskNoService")
	private CmnsTaskNoService cmnsTaskNoService;

	@PostMapping(value = "/am/sort/selectSortCmndList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectSortCmndList(@RequestBody SortCmndVO sortCmndVO, HttpServletRequest request) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<SortCmndVO> resultList = new ArrayList<>();
		try {
			resultList = sortCmndService.selectSortCmndList(sortCmndVO);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST,  resultList);

		return getSuccessResponseEntity(resultMap);
	}


	@PostMapping(value = "/am/sort/insertSortCmndList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertSortCmndList(@RequestBody List<SortCmndVO> sortCmndList, HttpServletRequest request) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		int insertedCnt=0;
		try {
			String sortCmndno = cmnsTaskNoService.selectSortCmndno(sortCmndList.get(0).getApcCd(), sortCmndList.get(0).getSortCmndYmd());
			int sn=1;
			for (SortCmndVO sortCmndVO : sortCmndList) {
				sortCmndVO.setSysFrstInptPrgrmId(getPrgrmId());
				sortCmndVO.setSysFrstInptUserId(getPrgrmId());
				sortCmndVO.setSysLastChgPrgrmId(getPrgrmId());
				sortCmndVO.setSysLastChgUserId(getUserId());
				sortCmndVO.setSortCmndSn(sn);
				sortCmndVO.setSortCmndno(sortCmndno);
				insertedCnt += sortCmndService.insertSortCmnd(sortCmndVO);
	
				sn++;
			}
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT,  insertedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/sort/deleteSortCmndList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteSortCmndList(@RequestBody List<SortCmndVO> sortCmndList, HttpServletRequest request) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		int deletedCnt=0;
		try {
			for (SortCmndVO sortCmndVO : sortCmndList) {
				deletedCnt += sortCmndService.deleteSortCmnd(sortCmndVO);
			}
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_DELETED_CNT,  deletedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/sort/selectPckgCmndTrgetList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectPckgCmndTrgetList(@RequestBody SortCmndVO sortCmndVO, HttpServletRequest request) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<SortCmndVO> resultList = new ArrayList<>();
		try {
			resultList = sortCmndService.selectPckgCmndTrgetList(sortCmndVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

}
