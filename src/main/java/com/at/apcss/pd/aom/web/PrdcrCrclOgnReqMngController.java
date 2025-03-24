package com.at.apcss.pd.aom.web;

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
import org.springframework.web.bind.annotation.RequestMapping;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.co.sys.vo.LoginVO;
import com.at.apcss.pd.aom.service.PrdcrCrclOgnReqMngService;
import com.at.apcss.pd.aom.vo.ApcInfoVO;
import com.at.apcss.pd.aom.vo.GpcVO;
import com.at.apcss.pd.aom.vo.LoanVO;
import com.at.apcss.pd.aom.vo.PrdcrCrclOgnReqMngVO;

@Controller
public class PrdcrCrclOgnReqMngController extends BaseController{

	@Resource(name= "PrdcrCrclOgnReqMngService")
	private PrdcrCrclOgnReqMngService PrdcrCrclOgnReqMngService;

	//화면이동
	@RequestMapping(value = "/pd/aom/PrdcrCrclOgnReqMng.do")
	public String PrdcrCrclOgnReqMng() {
		return "apcss/pd/aom/PrdcrCrclOgnReqMng";
	}

	// 조회
	@PostMapping(value = "/pd/aom/selectPrdcrCrclOgnReqMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectPrdcrCrclOgnReqMng(Model model, @RequestBody PrdcrCrclOgnReqMngVO PrdcrCrclOgnReqMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		PrdcrCrclOgnReqMngVO result = new PrdcrCrclOgnReqMngVO();
		//PrdcrCrclOgnReqMngVO.setUserType(getUserType());
		try {
			 result = PrdcrCrclOgnReqMngService.selectPrdcrCrclOgnReqMng(PrdcrCrclOgnReqMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_MAP, result);
		return getSuccessResponseEntity(resultMap);
	}

	// 조회
	@PostMapping(value = "/pd/aom/selectPrdcrCrclOgnReqMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectPrdcrCrclOgnReqMngList(Model model, @RequestBody PrdcrCrclOgnReqMngVO PrdcrCrclOgnReqMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<PrdcrCrclOgnReqMngVO> resultList = new ArrayList<>();
		//PrdcrCrclOgnReqMngVO.setUserType(getUserType());
		try {
			 resultList = PrdcrCrclOgnReqMngService.selectPrdcrCrclOgnReqMngList(PrdcrCrclOgnReqMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	//등록
	@PostMapping(value = "/pd/aom/insertPrdcrCrclOgnReqMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertPrdcrCrclOgnReqMng(@RequestBody PrdcrCrclOgnReqMngVO PrdcrCrclOgnReqMngVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		PrdcrCrclOgnReqMngVO.setSysFrstInptUserId(getUserId());
		PrdcrCrclOgnReqMngVO.setSysFrstInptPrgrmId(getPrgrmId());
		PrdcrCrclOgnReqMngVO.setSysLastChgUserId(getUserId());
		PrdcrCrclOgnReqMngVO.setSysLastChgPrgrmId(getPrgrmId());

		int insertedCnt = 0;

		try {
			insertedCnt = PrdcrCrclOgnReqMngService.insertPrdcrCrclOgnReqMng(PrdcrCrclOgnReqMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	//저장
	@PostMapping(value = "/pd/aom/updatePrdcrCrclOgnReqMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updatePrdcrCrclOgnReqMng(@RequestBody PrdcrCrclOgnReqMngVO PrdcrCrclOgnReqMngVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// audit 항목
		PrdcrCrclOgnReqMngVO.setSysFrstInptUserId(getUserId());
		PrdcrCrclOgnReqMngVO.setSysFrstInptPrgrmId(getPrgrmId());
		PrdcrCrclOgnReqMngVO.setSysLastChgUserId(getUserId());

		//System.out.println(PrdcrCrclOgnReqMngVO.toString());

		int insertedCnt = 0;

		try {
			insertedCnt = PrdcrCrclOgnReqMngService.updatePrdcrCrclOgnReqMng(PrdcrCrclOgnReqMngVO);

			if(insertedCnt > 0) {
				LoginVO sessionLoginVo =(LoginVO) requset.getSession().getAttribute("loginVO");
				String apoSe = sessionLoginVo.getApoSe();
				String mbrTypeCd = sessionLoginVo.getMbrTypeCd();
				if(apoSe == null && "1".equals(mbrTypeCd)) {
					sessionLoginVo.setApoSe("1");
					requset.getSession().setAttribute("loginVO", sessionLoginVo);
				}
			}

			List<GpcVO> GpcVoList = PrdcrCrclOgnReqMngVO.getGpcList();
			for (GpcVO gpcVO : GpcVoList) {
				gpcVO.setSysFrstInptPrgrmId(getPrgrmId());
				gpcVO.setSysFrstInptUserId(getUserId());
				gpcVO.setSysLastChgPrgrmId(getPrgrmId());
				gpcVO.setSysLastChgUserId(getUserId());
			}

			insertedCnt += PrdcrCrclOgnReqMngService.multiSaveGpcList(GpcVoList);


		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

		return getSuccessResponseEntity(resultMap);
	}


	/*
	@PostMapping(value = "/pd/aom/multiSavePrdcrCrclOgnReqMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> multiSavePrdcrCrclOgnReqMngList(@RequestBody List<PrdcrCrclOgnReqMngVO> PrdcrCrclOgnReqMngVOList, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		int savedCnt = 0;
		try {
			for (PrdcrCrclOgnReqMngVO PrdcrCrclOgnReqMngVO : PrdcrCrclOgnReqMngVOList) {
				PrdcrCrclOgnReqMngVO.setSysFrstInptPrgrmId(getPrgrmId());
				PrdcrCrclOgnReqMngVO.setSysFrstInptUserId(getUserId());
				PrdcrCrclOgnReqMngVO.setSysLastChgPrgrmId(getPrgrmId());
				PrdcrCrclOgnReqMngVO.setSysLastChgUserId(getUserId());
			}

			savedCnt = PrdcrCrclOgnReqMngService.multiSavePrdcrCrclOgnReqMngList(PrdcrCrclOgnReqMngVOList);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
		return getSuccessResponseEntity(resultMap);
	}
	*/

	//통합조직 신청 정보 삭제
	@PostMapping(value = "/pd/aom/deletePrdcrCrclOgnReqMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deletePrdcrCrclOgnReqMng(@RequestBody PrdcrCrclOgnReqMngVO PrdcrCrclOgnReqMngVO, HttpServletRequest request) throws Exception {
		logger.debug("/pd/aom/deletePrdcrCrclOgnReqMng >>> 호출 >>> ");

		int resultCnt = 0;
		try {
			resultCnt += PrdcrCrclOgnReqMngService.deleteUoAply(PrdcrCrclOgnReqMngVO);
			resultCnt += PrdcrCrclOgnReqMngService.deleteUoUoCd(PrdcrCrclOgnReqMngVO);
			resultCnt += PrdcrCrclOgnReqMngService.deleteUoItem(PrdcrCrclOgnReqMngVO);
			resultCnt += PrdcrCrclOgnReqMngService.updateUoApoSe(PrdcrCrclOgnReqMngVO);//조직구분 변경
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("resultCnt", resultCnt);
		return getSuccessResponseEntity(resultMap);
	}

	// 조회
	@PostMapping(value = "/pd/aom/selectGpcList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectGpcList(Model model, @RequestBody GpcVO gpcVO, HttpServletRequest request) throws Exception{
		System.out.println("==============selectGpcList===================");
		logger.debug("/pd/aom/selectGpcList >>> 호출 >>> ");
		System.out.println(gpcVO.toString());
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<GpcVO> resultList = new ArrayList<>();
		try {
			 resultList = PrdcrCrclOgnReqMngService.selectGpcList(gpcVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/pd/aom/deleteGpc.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteGpc(@RequestBody GpcVO gpcVO, HttpServletRequest request) throws Exception {
		logger.debug("/pd/aom/deleteGpc >>> 호출 >>> ");

		int result = 0;
		try {
			result = PrdcrCrclOgnReqMngService.deleteGpc(gpcVO);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("result", result);
		return getSuccessResponseEntity(resultMap);
	}

	//법인체 마감
	@PostMapping(value = "/pd/aom/updateCorpDdlnSeCd.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateCorpDdlnSeCd(@RequestBody PrdcrCrclOgnReqMngVO PrdcrCrclOgnReqMngVO, HttpServletRequest request) throws Exception {
		logger.debug("/pd/aom/updateCorpDdlnSeCd >>> 호출 >>> ");

		int result = 0;
		try {
			result = PrdcrCrclOgnReqMngService.updateCorpDdlnSeCd(PrdcrCrclOgnReqMngVO);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("result", result);
		return getSuccessResponseEntity(resultMap);
	}

	/* 로우데이터 요청 */
	@PostMapping(value = "/pd/aom/hiddenGrdUoSelectList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> hiddenGrdUoSelectList(Model model, @RequestBody PrdcrCrclOgnReqMngVO PrdcrCrclOgnReqMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<PrdcrCrclOgnReqMngVO> resultList = new ArrayList<>();

		try {
			 resultList = PrdcrCrclOgnReqMngService.hiddenGrdUoSelectList(PrdcrCrclOgnReqMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	/* 해당 조직에 속한 apc정보 확인  */
	@PostMapping(value = "/pd/aom/SelectApcInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> SelectApcInfoList(Model model, @RequestBody ApcInfoVO apcInfoVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<ApcInfoVO> resultList = new ArrayList<>();

		try {
			 resultList = PrdcrCrclOgnReqMngService.SelectApcInfoList(apcInfoVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}


	// 대출잔액 현황 조회
	@PostMapping(value = "/pd/aom/selectLoanList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectLoanList(Model model, @RequestBody LoanVO LoanVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<LoanVO> resultList = new ArrayList<>();
		//PrdcrCrclOgnReqMngVO.setUserType(getUserType());
		try {
			 resultList = PrdcrCrclOgnReqMngService.selectLoanList(LoanVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	// 대출잔액 현황 확인 여부 업데이트
	@PostMapping(value = "/pd/aom/updateLoanChk.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateLoanChk(@RequestBody LoanVO LoanVO, HttpServletRequest request) throws Exception {
		logger.debug("/pd/aom/updateLoanChk >>> 호출 >>> ");

		int result = 0;
		try {
			result = PrdcrCrclOgnReqMngService.updateLoanChk(LoanVO);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("resultCnt", result);
		return getSuccessResponseEntity(resultMap);
	}
}
