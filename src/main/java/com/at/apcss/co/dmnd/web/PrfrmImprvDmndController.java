package com.at.apcss.co.dmnd.web;

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
import com.at.apcss.co.dmnd.service.PrfrmImprvDmndService;
import com.at.apcss.co.dmnd.vo.PrfrmImprvDmndVO;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : PrfrmImprvDmndController.java
 * @Description : 프로그램 개선요청 정보관리에 대한 Controller 클래스
 * @author 김호
 * @since 2023.09.20
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.09.20  김호        최초 생성
 * </pre>
 */
@Controller
public class PrfrmImprvDmndController extends BaseController{

	@Resource(name = "prfrmImprvDmndService")
	private PrfrmImprvDmndService prfrmImprvDmndService;

	// 프로그램개선요청 목록 조회
	@PostMapping(value = "/co/dmnd/selectPrfrmImprvDmndList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectPrfrmImprvDmndList(@RequestBody PrfrmImprvDmndVO prfrmImprvDmndVO, HttpServletRequest request) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		List<PrfrmImprvDmndVO> resultList = prfrmImprvDmndService.selectPrfrmImprvDmndList(prfrmImprvDmndVO);

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	// 프로그램개선요청 멀티 저장
	@PostMapping(value = "/co/dmnd/multiSavePrfrmImprvDmndList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> multiSavePrfrmImprvDmndList(@RequestBody List<PrfrmImprvDmndVO> prfrmImprvDmndList, HttpServletRequest request) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		int savedCnt = 0;

		for (PrfrmImprvDmndVO prfrmImprvDmndVO : prfrmImprvDmndList) {
			prfrmImprvDmndVO.setSysFrstInptPrgrmId(getPrgrmId());
			prfrmImprvDmndVO.setSysFrstInptUserId(getUserId());
			prfrmImprvDmndVO.setSysLastChgPrgrmId(getPrgrmId());
			prfrmImprvDmndVO.setSysLastChgUserId(getPrgrmId());
		}

		savedCnt = prfrmImprvDmndService.multiSavePrfrmImprvDmndList(prfrmImprvDmndList);

		resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// 프로그램개선요청 삭제
	@PostMapping(value = "/co/dmnd/deletePrfrmImprvDmnd.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deletePrfrmImprvDmnd(@RequestBody PrfrmImprvDmndVO prfrmImprvDmndVO, HttpServletRequest request) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		int deletedCnt = 0;

		deletedCnt = prfrmImprvDmndService.deletePrfrmImprvDmnd(prfrmImprvDmndVO);

		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);

		return getSuccessResponseEntity(resultMap);
	}


}
