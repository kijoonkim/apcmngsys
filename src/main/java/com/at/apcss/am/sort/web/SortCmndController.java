package com.at.apcss.am.sort.web;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

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
//	// 선별지시등록
//	@RequestMapping(value = "/am/sort/regSortCmnd.do")
//	public String doRegFormSortCmnd() {
//		return "apcss/am/sort/regSortCmnd";
//	}

	@PostMapping(value = "/am/sort/regSortCmnd.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertSortPrfmncList(@RequestBody List<SortCmndVO> sortCmndVOList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		int insertCnt = 0;

		try {

			for (SortCmndVO sortPrfmncVO : sortCmndVOList) {
				sortPrfmncVO.setSysFrstInptUserId(getUserId());
				sortPrfmncVO.setSysFrstInptPrgrmId(getPrgrmId());
				sortPrfmncVO.setSysLastChgUserId(getUserId());
				sortPrfmncVO.setSysLastChgPrgrmId(getPrgrmId());

				insertCnt += sortCmndService.insertSortCmnd(sortPrfmncVO);
			}

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertCnt);

		return getSuccessResponseEntity(resultMap);
	}
	// 선별지시조회
	@RequestMapping(value = "/am/sort/sortCmnd.do")
	public String doSortCmnd() {
		return "apcss/am/sort/sortCmnd";
	}

}
