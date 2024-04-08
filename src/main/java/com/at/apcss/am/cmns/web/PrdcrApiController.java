package com.at.apcss.am.cmns.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.at.apcss.am.cmns.service.PrdcrService;
import com.at.apcss.am.cmns.vo.PrdcrVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : PrdcrController.java
 * @Description : 생산자 정보관리에 대한 Controller 클래스
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
@RestController
public class PrdcrApiController extends BaseController {

	@Resource(name="prdcrService")
	private PrdcrService prdcrService;

	// APC 환경설정 - 품목 목록 조회
	@PostMapping(value = "/am/cmns/prdcrInfos", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectPrdcrList(@RequestBody PrdcrVO prdcrVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<PrdcrVO> resultList = new ArrayList<>();

		try {
			resultList = prdcrService.selectPrdcrList(prdcrVO);

		} catch (Exception e) {
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
	
	// APC 생산자 정보 업데이트
	@PostMapping(value = "/am/cmns/updatePrdcrList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> updatePrdcrList(@RequestBody List<PrdcrVO> prdcrList, HttpServletRequest request) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			for (PrdcrVO prdcrVO : prdcrList) {
				prdcrVO.setSysLastChgPrgrmId(getPrgrmId());
				prdcrVO.setSysLastChgUserId(getUserId());
			}
			
			HashMap<String, Object> rtnObj = prdcrService.updatePrdcrList(prdcrList);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
			
		} catch (Exception e) {
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
