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

import com.at.apcss.am.wrhs.service.PrdcrLandInfoService;
import com.at.apcss.am.wrhs.vo.PrdcrLandInfoVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
/**
 * @Class Name : FrmerInfoController.java
 * @Description : 영농관리 - 생산농지정보에 대한 Controller 클래스
 * @author 김  호
 * @since 2024.07.31
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.07.31  김  호        최초 생성
 * </pre>
 */
@Controller
public class PrdcrLandInfoController extends BaseController{

	@Resource(name = "prdcrLandInfoService")
	private PrdcrLandInfoService prdcrLandInfoService;


	/**
	 * 생산농지정보 목록 조회
	 * @param prdcrLandInfoVO
	 * @param request
	 * @return List<PrdcrLandInfoVO>
	 * @throws Exception
	 */
	@PostMapping(value = "/am/wrhs/selectPrdcrLandInfoList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectPrdcrLandInfoList(@RequestBody PrdcrLandInfoVO prdcrLandInfoVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<PrdcrLandInfoVO> resultList;
		try {

			resultList = prdcrLandInfoService.selectPrdcrLandInfoList(prdcrLandInfoVO);

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
	 * 생산농지정보 삭제
	 * @param prdcrLandInfoVO
	 * @param request
	 * @return HashMap<String, Object>
	 * @throws Exception
	 */
	@PostMapping(value = "/am/wrhs/deletePrdcrLandInfo.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deletePrdcrLandInfo(@RequestBody PrdcrLandInfoVO prdcrLandInfoVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {

			prdcrLandInfoVO.setSysFrstInptPrgrmId(getPrgrmId());
			prdcrLandInfoVO.setSysFrstInptUserId(getUserId());
			prdcrLandInfoVO.setSysLastChgPrgrmId(getPrgrmId());
			prdcrLandInfoVO.setSysLastChgUserId(getUserId());


			HashMap<String, Object> rtnObj = prdcrLandInfoService.deletePrdcrLandInfo(prdcrLandInfoVO);

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
	 * 생산농지정보 저장
	 * @param List<prdcrLandInfoVO>
	 * @param request
	 * @return HashMap<String, Object>
	 * @throws Exception
	 */
	@PostMapping(value = "/am/wrhs/multiPrdcrLandInfoList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> multiPrdcrLandInfoList(@RequestBody List<PrdcrLandInfoVO> prdcrLandInfoList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {


			for (PrdcrLandInfoVO prdcrLandInfoVO : prdcrLandInfoList) {

				prdcrLandInfoVO.setSysFrstInptPrgrmId(getPrgrmId());
				prdcrLandInfoVO.setSysFrstInptUserId(getUserId());
				prdcrLandInfoVO.setSysLastChgPrgrmId(getPrgrmId());
				prdcrLandInfoVO.setSysLastChgUserId(getUserId());
			}



			HashMap<String, Object> rtnObj = prdcrLandInfoService.multiPrdcrLandInfoList(prdcrLandInfoList);

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
