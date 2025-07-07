package com.at.apcss.am.wrhs.web;

import com.at.apcss.am.wrhs.service.PrchsService;
import com.at.apcss.am.wrhs.vo.*;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import org.springframework.beans.BeanUtils;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

/**
 * @Class Name : PrchsController.java
 * @Description : 수매집계에 대한 Controller 클래스
 * @author 김  호
 * @since 2025.06.23
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2025.06.23  김  호        최초 생성
 * </pre>
 */
@Controller
public class PrchsController extends BaseController{

	@Resource(name = "prchsService")
	private PrchsService prchsService;

	/**
	 * 수매집계 : 담당자별 조회
	 * @param frmhsExpctWrhsVO
	 * @param request
	 * @return List<FrmhsExpctWrhsVO>
	 * @throws Exception
	 */
	@PostMapping(value = "/am/wrhs/selectPrchsPicTotList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectPrchsPicTotList(@RequestBody FrmhsExpctWrhsVO frmhsExpctWrhsVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<FrmhsExpctWrhsVO> resultList;
		try {

			resultList = prchsService.selectPrchsPicTotList(frmhsExpctWrhsVO);

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
	 * 수매집계 : 담당자별 지역별 조회
	 * @param frmhsExpctWrhsVO
	 * @param request
	 * @return List<FrmhsExpctWrhsVO>
	 * @throws Exception
	 */
	@PostMapping(value = "/am/wrhs/selectPrchsPicCtpvTotList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectPrchsPicCtpvTotList(@RequestBody FrmhsExpctWrhsVO frmhsExpctWrhsVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<FrmhsExpctWrhsVO> resultList;
		try {

			resultList = prchsService.selectPrchsPicCtpvTotList(frmhsExpctWrhsVO);

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
	 * 수매집계 : 담당자별 지역별 조회
	 * @param frmhsExpctWrhsVO
	 * @param request
	 * @return List<FrmhsExpctWrhsVO>
	 * @throws Exception
	 */
	@PostMapping(value = "/am/wrhs/selectPrchsCtpvTotList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectPrchsCtpvTotList(@RequestBody FrmhsExpctWrhsVO frmhsExpctWrhsVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<FrmhsExpctWrhsVO> resultList;
		try {

			resultList = prchsService.selectPrchsCtpvTotList(frmhsExpctWrhsVO);

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


}
