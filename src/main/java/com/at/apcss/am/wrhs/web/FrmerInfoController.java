package com.at.apcss.am.wrhs.web;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.at.apcss.am.wrhs.service.FrmerInfoService;
import com.at.apcss.am.wrhs.vo.CltvtnBscInfoVO;
import com.at.apcss.am.wrhs.vo.CltvtnFrmhsQltVO;
import com.at.apcss.am.wrhs.vo.CltvtnHstryVO;
import com.at.apcss.am.wrhs.vo.CltvtnListVO;
import com.at.apcss.am.wrhs.vo.FrmhsExpctWrhsDtlVO;
import com.at.apcss.am.wrhs.vo.FrmhsExpctWrhsVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
/**
 * @Class Name : FrmerInfoController.java
 * @Description : 영농관리에 대한 Controller 클래스
 * @author 김  호
 * @since 2024.06.25
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.06.25  김  호        최초 생성
 * </pre>
 */
@Controller
public class FrmerInfoController extends BaseController{

	@Resource(name = "frmerInfoService")
	private FrmerInfoService frmerInfoService;


	/**
	 * 재배기준정보 조회
	 * @param CltvtnBscInfoVO
	 * @param request
	 * @return List<CltvtnBscInfoVO>
	 * @throws Exception
	 */
	@PostMapping(value = "/am/wrhs/selectCltvtnBscInfoList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectCltvtnBscInfoList(@RequestBody CltvtnBscInfoVO cltvtnBscInfoVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<CltvtnBscInfoVO> resultList;
		try {

			resultList = frmerInfoService.selectCltvtnBscInfoList(cltvtnBscInfoVO);

		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	/**
	 * 재배이력 목록 조회
	 * @param cltvtnHstryVO
	 * @param request
	 * @return List<CltvtnHstryVO>
	 * @throws Exception
	 */
	@PostMapping(value = "/am/wrhs/selectCltvtnHstryList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectCltvtnHstryList(@RequestBody CltvtnHstryVO cltvtnHstryVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<CltvtnHstryVO> resultList;
		try {

			resultList = frmerInfoService.selectCltvtnHstryList(cltvtnHstryVO);

		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	/**
	 * 재배농가품질 목록 조회
	 * @param cltvtnFrmhsQltVO
	 * @param request
	 * @return List<CltvtnFrmhsQltVO>
	 * @throws Exception
	 */
	@PostMapping(value = "/am/wrhs/selectCltvtnFrmhsQltList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectCltvtnFrmhsQltList(@RequestBody CltvtnFrmhsQltVO cltvtnFrmhsQltVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<CltvtnFrmhsQltVO> resultList;
		try {

			resultList = frmerInfoService.selectCltvtnFrmhsQltList(cltvtnFrmhsQltVO);

		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	/**
	 * 영농관리 다중 저장
	 * @param cltvtnFrmhsQltVO
	 * @param request
	 * @return HashMap<String, Object>
	 * @throws Exception
	 */
	@PostMapping(value = "/am/wrhs/multiFrmerInfoList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> multiFrmerInfoList(@RequestBody CltvtnListVO cltvtnListVO, HttpServletRequest request) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {

			cltvtnListVO.setSysFrstInptPrgrmId(getPrgrmId());
			cltvtnListVO.setSysFrstInptUserId(getUserId());
			cltvtnListVO.setSysLastChgPrgrmId(getPrgrmId());
			cltvtnListVO.setSysLastChgUserId(getUserId());
			cltvtnListVO.setAtchflPath(getFilepathAm());


			HashMap<String, Object> rtnObj = frmerInfoService.multiFrmerInfoList(cltvtnListVO);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

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

	/**
	 * 영농관리 - 재배이력 삭제
	 * @param cltvtnHstryVO
	 * @param request
	 * @return HashMap<String, Object>
	 * @throws Exception
	 */
	@PostMapping(value = "/am/wrhs/deleteCltvtnHstry.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteCltvtnHstry(@RequestBody CltvtnHstryVO cltvtnHstryVO, HttpServletRequest request) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {

			cltvtnHstryVO.setSysFrstInptPrgrmId(getPrgrmId());
			cltvtnHstryVO.setSysFrstInptUserId(getUserId());
			cltvtnHstryVO.setSysLastChgPrgrmId(getPrgrmId());
			cltvtnHstryVO.setSysLastChgUserId(getUserId());

			HashMap<String, Object> rtnObj = frmerInfoService.deleteCltvtnHstry(cltvtnHstryVO);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

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

	/**
	 * 영농관리 - 재배농가품질 삭제
	 * @param cltvtnFrmhsQltVO
	 * @param request
	 * @return HashMap<String, Object>
	 * @throws Exception
	 */
	@PostMapping(value = "/am/wrhs/deleteCltvtnFrmhsQlt.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteCltvtnFrmhsQlt(@RequestBody CltvtnFrmhsQltVO cltvtnFrmhsQltVO, HttpServletRequest request) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {

			cltvtnFrmhsQltVO.setSysFrstInptPrgrmId(getPrgrmId());
			cltvtnFrmhsQltVO.setSysFrstInptUserId(getUserId());
			cltvtnFrmhsQltVO.setSysLastChgPrgrmId(getPrgrmId());
			cltvtnFrmhsQltVO.setSysLastChgUserId(getUserId());

			HashMap<String, Object> rtnObj = frmerInfoService.deleteCltvtnFrmhsQlt(cltvtnFrmhsQltVO);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

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

	/**
	 * 영농관리 - 재배농가품질 다중 저장
	 * @param List<CltvtnFrmhsQltVO>
	 * @param request
	 * @return HashMap<String, Object>
	 * @throws Exception
	 */
	@PostMapping(value = "/am/wrhs/multiCltvtnFrmhsQltList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> multiCltvtnFrmhsQltList(@RequestBody List<CltvtnFrmhsQltVO> cltvtnFrmhsQltList, HttpServletRequest request) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {

			for (CltvtnFrmhsQltVO cltvtnFrmhsQltVO : cltvtnFrmhsQltList) {
				cltvtnFrmhsQltVO.setSysFrstInptPrgrmId(getPrgrmId());
				cltvtnFrmhsQltVO.setSysFrstInptUserId(getUserId());
				cltvtnFrmhsQltVO.setSysLastChgPrgrmId(getPrgrmId());
				cltvtnFrmhsQltVO.setSysLastChgUserId(getUserId());
			}

			HashMap<String, Object> rtnObj = frmerInfoService.multiCltvtnFrmhsQltList(cltvtnFrmhsQltList);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

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

	/**
	 * 농가예상입고 목록 조회
	 * @param frmhsExpctWrhsVO
	 * @param request
	 * @return List<FrmhsExpctWrhsVO>
	 * @throws Exception
	 */
	@PostMapping(value = "/am/wrhs/selectFrmhsExpctWrhsList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectFrmhsExpctWrhsList(@RequestBody FrmhsExpctWrhsVO frmhsExpctWrhsVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<FrmhsExpctWrhsVO> resultList;
		try {

			resultList = frmerInfoService.selectFrmhsExpctWrhsList(frmhsExpctWrhsVO);

		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	/**
	 * 영농관리 다중 저장
	 * @param cltvtnFrmhsQltVO
	 * @param request
	 * @return HashMap<String, Object>
	 * @throws Exception
	 */
	@PostMapping(value = "/am/wrhs/multiFrmhsExpctWrhsList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> multiFrmhsExpctWrhsList(@RequestBody List<FrmhsExpctWrhsVO> frmhsExpctWrhsList, HttpServletRequest request) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {

			for (FrmhsExpctWrhsVO frmhsExpctWrhsVO : frmhsExpctWrhsList) {
				frmhsExpctWrhsVO.setSysFrstInptPrgrmId(getPrgrmId());
				frmhsExpctWrhsVO.setSysFrstInptUserId(getUserId());
				frmhsExpctWrhsVO.setSysLastChgPrgrmId(getPrgrmId());
				frmhsExpctWrhsVO.setSysLastChgUserId(getUserId());

				List<FrmhsExpctWrhsDtlVO> frmhsExpctWrhsDtlList = frmhsExpctWrhsVO.getFrmhsExpctWrhsDtlList();

				for (FrmhsExpctWrhsDtlVO frmhsExpctWrhsDtlVO : frmhsExpctWrhsDtlList) {

					frmhsExpctWrhsDtlVO.setSysFrstInptPrgrmId(getPrgrmId());
					frmhsExpctWrhsDtlVO.setSysFrstInptUserId(getUserId());
					frmhsExpctWrhsDtlVO.setSysLastChgPrgrmId(getPrgrmId());
					frmhsExpctWrhsDtlVO.setSysLastChgUserId(getUserId());
				}
			}

			HashMap<String, Object> rtnObj = frmerInfoService.multiFrmhsExpctWrhsList(frmhsExpctWrhsList);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

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

	/**
	 * 영농관리 - 재배농가품질 삭제
	 * @param CltvtnFrmhsQltVO
	 * @param request
	 * @return HashMap<String, Object>
	 * @throws Exception
	 */
	@PostMapping(value = "/am/wrhs/deleteFrmhsExpctWrhs.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteFrmhsExpctWrhs(@RequestBody FrmhsExpctWrhsVO frmhsExpctWrhsVO, HttpServletRequest request) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {

			frmhsExpctWrhsVO.setSysFrstInptPrgrmId(getPrgrmId());
			frmhsExpctWrhsVO.setSysFrstInptUserId(getUserId());
			frmhsExpctWrhsVO.setSysLastChgPrgrmId(getPrgrmId());
			frmhsExpctWrhsVO.setSysLastChgUserId(getUserId());

			HashMap<String, Object> rtnObj = frmerInfoService.deleteFrmhsExpct(frmhsExpctWrhsVO);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

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
