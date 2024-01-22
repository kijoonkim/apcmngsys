package com.at.apcss.pd.bsm.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.log.service.ComLogService;
import com.at.apcss.co.log.vo.ComLogVO;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.co.sys.vo.LoginVO;
import com.at.apcss.pd.bsm.service.PrdcrCrclOgnUsrMngService;
import com.at.apcss.pd.bsm.vo.PrdcrCrclOgnUsrMngVO;

@Controller
public class PrdcrCrclOgnUsrMngController extends BaseController{

	@Resource(name= "PrdcrCrclOgnUsrMngService")
	private PrdcrCrclOgnUsrMngService PrdcrCrclOgnUsrMngService;

	@Autowired
	ComLogService comLogService;

	//화면이동
	@RequestMapping(value = "/pd/bsm/PrdcrCrclOgnUsrMng.do")
	public String PrdcrCrclOgnUsrMng() {
		return "apcss/pd/bsm/PrdcrCrclOgnUsrMng";
	}

	// 조회
	@PostMapping(value = "/pd/bsm/selectPrdcrCrclOgnUsrMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectPrdcrCrclOgnUsrMngList(Model model, @RequestBody PrdcrCrclOgnUsrMngVO PrdcrCrclOgnUsrMngVO, HttpServletRequest request) throws Exception{
		System.out.println("==============selectPrdcrCrclOgnUsrMngList=======================");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<PrdcrCrclOgnUsrMngVO> resultList = new ArrayList<>();
		try {
			resultList = PrdcrCrclOgnUsrMngService.selectPrdcrCrclOgnUsrMngList(PrdcrCrclOgnUsrMngVO);
			System.out.println(resultList);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}



	//등록
	@PostMapping(value = "/pd/bsm/insertPrdcrCrclOgnUsrMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertPrdcrCrclOgnUsrMng(@RequestBody PrdcrCrclOgnUsrMngVO PrdcrCrclOgnUsrMngVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		PrdcrCrclOgnUsrMngVO.setSysFrstInptUserId(getUserId());
		PrdcrCrclOgnUsrMngVO.setSysFrstInptPrgrmId(getPrgrmId());
		PrdcrCrclOgnUsrMngVO.setSysLastChgUserId(getUserId());
		PrdcrCrclOgnUsrMngVO.setSysLastChgPrgrmId(getPrgrmId());

		int insertedCnt = 0;

		try {
			insertedCnt = PrdcrCrclOgnUsrMngService.insertPrdcrCrclOgnUsrMng(PrdcrCrclOgnUsrMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

		return getSuccessResponseEntity(resultMap);
	}


	//저장
	@PostMapping(value = "/pd/bsm/updatePrdcrCrclOgnUsrMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updatePrdcrCrclOgnUsrMng(@RequestBody PrdcrCrclOgnUsrMngVO PrdcrCrclOgnUsrMngVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		PrdcrCrclOgnUsrMngVO.setSysFrstInptPrgrmId(getPrgrmId());
		PrdcrCrclOgnUsrMngVO.setSysFrstInptUserId(getUserId());
		PrdcrCrclOgnUsrMngVO.setSysLastChgPrgrmId(getPrgrmId());
		PrdcrCrclOgnUsrMngVO.setSysLastChgUserId(getUserId());

		PrdcrCrclOgnUsrMngVO selectData = PrdcrCrclOgnUsrMngService.selectPrdcrCrclOgnUsrMng(PrdcrCrclOgnUsrMngVO);

		//승인 날짜 체크를 위해 값변경이 없으면 수정 없음
		if(selectData.getUserStts().equals(PrdcrCrclOgnUsrMngVO.getUserStts())) {
			PrdcrCrclOgnUsrMngVO.setUserStts("");
		}
		if(selectData.getCmptncInstAprvSe().equals(PrdcrCrclOgnUsrMngVO.getCmptncInstAprvSe())) {
			System.out.println("deletePrdcrCrclOgnUsrMng ");
			PrdcrCrclOgnUsrMngVO.setCmptncInstAprvSe("");
		}

		int savedCnt = 0;

		try {
			savedCnt = PrdcrCrclOgnUsrMngService.updatePrdcrCrclOgnUsrMng(PrdcrCrclOgnUsrMngVO);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
		return getSuccessResponseEntity(resultMap);
	}
	//사용자 삭제
	//apc 시스템과 평가등록 시스템이 다른데 잘못가입하는 사람들이 생겨 추가
	@PostMapping(value = "/pd/bsm/deleteUser.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deletePrdcrCrclOgnUsrMng(@RequestBody PrdcrCrclOgnUsrMngVO PrdcrCrclOgnUsrMngVO, HttpServletRequest request) throws Exception {
		logger.debug("/pd/bsm/deleteUser >>> 호출 >>> ");

		int result = 0;

		try {
			result =+ PrdcrCrclOgnUsrMngService.deleteUser(PrdcrCrclOgnUsrMngVO);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("result", result);
		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/userChange.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> userChange(@RequestBody PrdcrCrclOgnUsrMngVO loginVo, HttpServletRequest request) throws Exception {

		logger.debug("**************userChange************************");

		//로그인 이력 저장
		ComLogVO comLogVo = new ComLogVO();
		String userId = loginVo.getUserId();
		String brno = loginVo.getBrno();
		String userType = loginVo.getUserType();
		String menuId ="userChange";

		try{
			LoginVO sessionLoginVo =(LoginVO) request.getSession().getAttribute("loginVO");

			String orgUserId = sessionLoginVo.getId();

			sessionLoginVo.setUserId(userId);
			sessionLoginVo.setUserType(userType);
			sessionLoginVo.setBrno(brno);
			sessionLoginVo.setId(userId);
			request.getSession().setAttribute("loginVO", sessionLoginVo);

			comLogVo.setUserId(userId);
			comLogVo.setUserIp(getUserIp(request));
			comLogVo.setMenuId(menuId);
			comLogVo.setSysFrstInptUserId(orgUserId);
			comLogVo.setSysLastChgUserId(orgUserId);
			comLogVo.setSysFrstInptPrgrmId(menuId);
			comLogVo.setSysLastChgPrgrmId(menuId);
			comLogVo.setUserNm(sessionLoginVo.getName());
			comLogVo.setUserType(userType);
			comLogVo.setApcCd(sessionLoginVo.getApcCd());
			comLogVo.setLgnScsYn("Y");
			comLogVo.setPrslType("L1");
			comLogService.insertMenuHstry(comLogVo);
		}catch (Exception e){
			logger.debug("**************userChange***eeee*********************");
		}
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		//resultMap.put("result", result);
		return getSuccessResponseEntity(resultMap);
	}

}
