package com.at.apcss.am.cmns.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.at.apcss.am.cmns.service.CmnsItemService;
import com.at.apcss.am.cmns.service.CmnsOprtrApcFcltService;
import com.at.apcss.am.cmns.vo.CmnsItemVO;
import com.at.apcss.am.cmns.vo.CmnsOprtrApcFcltVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : CmnsItemController.java
 * @Description : 품목 정보관리에 대한 Controller 클래스
 * @author 박승진
 * @since 2024.07.16
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.07.16  박승진        최초 생성
 * </pre>
 */
@Controller
public class CmnsOprtrApcFclt extends BaseController {

	@Resource(name = "cmnsOprtrApcFcltService")
	private CmnsOprtrApcFcltService cmnsOprtrApcFcltService;

	// APC 환경설정 - 품목 단건 조회
	@PostMapping(value = "/am/cmns/selectCmnsOprtrApcSortFcltList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectCmnsApcItem(@RequestBody CmnsOprtrApcFcltVO cmnsOprtrApcFcltVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<CmnsOprtrApcFcltVO> resultVO = new ArrayList<>();

		try {

			resultVO = cmnsOprtrApcFcltService.selectCmnsOprtrApcSortFcltList(cmnsOprtrApcFcltVO);

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		resultMap.put(ComConstants.PROP_RESULT_MAP, resultVO);

		return getSuccessResponseEntity(resultMap);
	}



}
