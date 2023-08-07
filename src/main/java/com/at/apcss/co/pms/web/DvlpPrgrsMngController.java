package com.at.apcss.co.pms.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.pms.service.DvlpPrgrsMngService;
import com.at.apcss.co.pms.vo.DfctMngVO;
import com.at.apcss.co.pms.vo.DvlpPrgrsMngVO;
import com.at.apcss.co.sys.controller.BaseController;
/**
 * 개발진행관리 처리하는 컨트롤러 클래스
 * @author SI개발부 김호
 * @since 2023.08.07
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개발진행관리(Modification Information) >>
 *
 *  수정일      	수정자      	수정내용
 *  ----------	----------	---------------------------
 *  2023.08.07  김호     	최초 생성
 *
 *  </pre>
 */
@Controller
public class DvlpPrgrsMngController extends BaseController {

	@Resource(name="dvlpPrgrsMngService")
	private DvlpPrgrsMngService dvlpPrgrsMngService;

	// 개발진행관리 목록 조회
	@PostMapping(value = "/co/pms/selectDvlpPrgrsMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectDvlpPrgrsMngList(Model model, @RequestBody DvlpPrgrsMngVO dvlpPrgrsMngVO, HttpServletRequest request) throws Exception{

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<DvlpPrgrsMngVO> resultList = new ArrayList<>();

		try {
			 resultList = dvlpPrgrsMngService.selectDvlpPrgrsMngList(dvlpPrgrsMngVO);

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}


	// 개발진행관리 수정
	@PostMapping(value = "/co/pms/updateDvlpPrgrsMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateDvlpPrgrsMngList(Model model, @RequestBody List<DvlpPrgrsMngVO> dvlpPrgrsMngList, HttpServletRequest request) throws Exception{

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		int updatedCnt = 0;

		try {
			for (DvlpPrgrsMngVO dvlpPrgrsMngVO : dvlpPrgrsMngList) {

				dvlpPrgrsMngVO.setSysLastChgPrgrmId(getPrgrmId());
				dvlpPrgrsMngVO.setSysLastChgUserId(getUserId());
				updatedCnt += dvlpPrgrsMngService.updateDvlpPrgrsMng(dvlpPrgrsMngVO);
			}

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_UPDATED_CNT, updatedCnt);

		return getSuccessResponseEntity(resultMap);
	}


	// 결함관리 목록 조회
	@PostMapping(value = "/co/pms/selectDfctMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectDfctMngList(Model model, @RequestBody DfctMngVO dfctMngVO, HttpServletRequest request) throws Exception{

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<DfctMngVO> resultList = new ArrayList<>();

		try {
			 resultList = dvlpPrgrsMngService.selectDfctMngList(dfctMngVO);

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	// 결함관리 저장
	@PostMapping(value = "/co/pms/multiDfctList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> multiDfctList(Model model, @RequestBody List<DfctMngVO> dfctMngList, HttpServletRequest request) throws Exception{

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		int updatedCnt = 0;
		int insertedCnt = 0;
		try {
			for (DfctMngVO dfctMngVO : dfctMngList) {
				dfctMngVO.setSysFrstInptPrgrmId(getPrgrmId());
				dfctMngVO.setSysFrstInptUserId(getPrgrmId());
				dfctMngVO.setSysLastChgPrgrmId(getPrgrmId());
				dfctMngVO.setSysLastChgUserId(getUserId());
				if(ComConstants.ROW_STS_INSERT.equals(dfctMngVO.getRowSts())) {
					insertedCnt += dvlpPrgrsMngService.insertDfctMng(dfctMngVO);
				}
				if(ComConstants.ROW_STS_UPDATE.equals(dfctMngVO.getRowSts())) {

					updatedCnt += dvlpPrgrsMngService.updateDfctMng(dfctMngVO);
				}
			}

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_UPDATED_CNT, updatedCnt);
		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// 결함관리 저장
	@PostMapping(value = "/co/pms/deleteDfct.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteDfct(Model model, @RequestBody DfctMngVO dfctMngVO, HttpServletRequest request) throws Exception{

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		int deletedCnt = 0;
		try {
			deletedCnt = dvlpPrgrsMngService.deleteDfctMng(dfctMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);

		return getSuccessResponseEntity(resultMap);
	}

}
