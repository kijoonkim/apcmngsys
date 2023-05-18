package com.at.apcss.co.user.web;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.egovframe.rte.fdl.cmmn.trace.LeaveaTrace;
import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.hsqldb.lib.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.co.user.service.ComUserService;
import com.at.apcss.co.user.vo.ComUserVO;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.jwt.config.EgovJwtTokenUtil;

/**
 * 일반 로그인을 처리하는 컨트롤러 클래스
 * @author 공통서비스 개발팀 박지욱
 * @since 2009.03.06
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일      수정자      수정내용
 *  -------            --------        ---------------------------
 *  2009.03.06  박지욱     최초 생성
 *  2011.08.31  JJY            경량환경 템플릿 커스터마이징버전 생성
 *
 *  </pre>
 */
@RestController
public class CoUserComUserApiController extends BaseController {

	@Resource(name = "comUserService")
	private ComUserService comUserService;
	
	/** EgovMessageSource */
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** TRACE */
	@Resource(name = "leaveaTrace")
	LeaveaTrace leaveaTrace;
	
	/** JWT */
	@Autowired
    private EgovJwtTokenUtil jwtTokenUtil;

	@PostMapping(value = "/co/user/selectComUser.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public HashMap<String, Object> selectComUser(@RequestBody ComUserVO comUserVO, HttpServletRequest request) throws Exception {
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		logger.debug("comUser info {} {}", comUserVO.getUserId(), comUserVO.getUserNm());
		
		ComUserVO comUserResultVO = comUserService.selectComUser(comUserVO);

		if (comUserResultVO != null && !StringUtil.isEmpty(comUserResultVO.getUserId())) {
			
			logger.debug("comUser info {} {}", comUserResultVO.getUserId(), comUserResultVO.getUserNm());
			logger.debug(comUserResultVO.toString());
			
			resultMap.put("resultVO", comUserResultVO);
			resultMap.put("resultCode", "200");
			resultMap.put("resultMessage", "성공 !!!");
		} else {
			resultMap.put("resultVO", comUserResultVO);
			resultMap.put("resultCode", "500");
			resultMap.put("resultMessage", "사용자정보없음");
			// resultMap.put("resultMessage", egovMessageSource.getMessage("fail.common.login"));
		}

		return resultMap;

	}

	@GetMapping(value = "/co/user/selectUserById/{id}")
	@ResponseBody
	public HashMap<String, Object> selectUserById(@PathVariable String id, HttpServletRequest request) throws Exception {
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		logger.debug("param ID: {}", id);
		
		ComUserVO comUserResultVO = comUserService.selectComUser(id);

		if (comUserResultVO != null && !StringUtil.isEmpty(comUserResultVO.getUserId())) {
			
			logger.debug("comUser info {} {}", comUserResultVO.getUserId(), comUserResultVO.getUserNm());
			logger.debug(comUserResultVO.toString());
			
			resultMap.put("resultVO", comUserResultVO);
			resultMap.put("resultCode", "200");
			resultMap.put("resultMessage", "성공 !!!");
		} else {
			resultMap.put("resultVO", comUserResultVO);
			resultMap.put("resultCode", "500");
			resultMap.put("resultMessage", "사용자정보없음");
			// resultMap.put("resultMessage", egovMessageSource.getMessage("fail.common.login"));
		}

		return resultMap;

	}
}