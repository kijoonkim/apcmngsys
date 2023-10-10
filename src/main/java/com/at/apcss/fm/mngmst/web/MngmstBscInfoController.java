package com.at.apcss.fm.mngmst.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.fm.mngmst.service.MngmstBscInfoService;
import com.at.apcss.fm.mngmst.vo.MngmstBscInfoVO;


/**
 * @Class Name : MngmstBscInfoController.java
 * @Description : 경영체정보에 대한 Controller 클래스
 * @author 정연두
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21  정연두        최초 생성
 * </pre>
 */
@Controller
public class MngmstBscInfoController extends BaseController {


	// 경영체정보
	@Resource(name= "mngmstBscInfoService")
	private MngmstBscInfoService mngmstBscInfoService;

	// 경영체정보 화면이동
	@GetMapping("/fm/mngmst/mngmstBscInfo.do")
	public String doMngmstBscInfo() {
		return "apcss/fm/mngmst/mngmstBscInfo";
	}

	// 경영체정보 조회
	@PostMapping(value = "/fm/mngmst/selectMngmstBscInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectMenuList(Model model, @RequestBody MngmstBscInfoVO mngmstBscInfoVO, HttpServletRequest request) throws Exception{

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<MngmstBscInfoVO> resultList = new ArrayList<>();

		try {
			 resultList = mngmstBscInfoService.selectMngmstBscInfoList(mngmstBscInfoVO);

			 logger.debug("$$$$$$$$$$$$$$$$$$$$$");
			 for (MngmstBscInfoVO msg : resultList ) {
				 logger.debug("msgCn : {}", msg.getMsgCn());
			 }

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	// 경영체정보 등록
	@PostMapping(value = "/fm/mngmst/insertMngmstBscInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertMngmstBscInfo(@RequestBody MngmstBscInfoVO mngmstBscInfoVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		mngmstBscInfoVO.setSysFrstInptUserId(getUserId());
		mngmstBscInfoVO.setSysFrstInptPrgrmId(getPrgrmId());
		mngmstBscInfoVO.setSysLastChgUserId(getUserId());
		mngmstBscInfoVO.setSysLastChgPrgrmId(getPrgrmId());

		int insertedCnt = 0;

		try {
			insertedCnt = mngmstBscInfoService.insertMngmstBscInfo(mngmstBscInfoVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// 경영체정보 변경
	@PostMapping(value = "/fm/mngmst/updateMngmstBscInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateMngmstBscInfo(@RequestBody MngmstBscInfoVO mngmstBscInfoVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		mngmstBscInfoVO.setSysLastChgUserId(getUserId());
		mngmstBscInfoVO.setSysLastChgPrgrmId(getPrgrmId());

		int updatedCnt = 0;

		try {
			updatedCnt = mngmstBscInfoService.updateMngmstBscInfo(mngmstBscInfoVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_UPDATED_CNT, updatedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// 경영체정보 삭제
	@PostMapping(value = "/fm/mngmst/deleteMngmstBscInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteMngmstBscInfo(@RequestBody MngmstBscInfoVO mngmstBscInfoVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		mngmstBscInfoVO.setSysLastChgUserId(getUserId());
		mngmstBscInfoVO.setSysLastChgPrgrmId(getPrgrmId());

		int deletedCnt = 0;

		try {
			deletedCnt = mngmstBscInfoService.deleteMngmstBscInfo(mngmstBscInfoVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// 경영체정보 목록 삭제
	@PostMapping(value = "/fm/mngmst/deleteMngmstBscInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteMngmstBscInfoList(@RequestBody List<MngmstBscInfoVO> mngmstBscInfoList, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		for (MngmstBscInfoVO mngmstBscInfoVO : mngmstBscInfoList ) {
			mngmstBscInfoVO.setSysLastChgUserId(getUserId());
			mngmstBscInfoVO.setSysLastChgPrgrmId(getPrgrmId());
		}

		int deletedCnt = 0;

		try {
			deletedCnt = mngmstBscInfoService.deleteMngmstBscInfoList(mngmstBscInfoList);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);

		return getSuccessResponseEntity(resultMap);
	}
}