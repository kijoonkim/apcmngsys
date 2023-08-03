package com.at.apcss.co.user.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.egovframe.rte.fdl.cmmn.trace.LeaveaTrace;
import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.at.apcss.co.constants.ComConstants;
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
public class ComUserApiController extends BaseController {

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
	public ResponseEntity<HashMap<String, Object>> selectComUser(@RequestBody ComUserVO comUserVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		logger.debug("comUser info {} {}", comUserVO.getUserId(), comUserVO.getUserNm());

		ComUserVO resultVO;

		try {
			resultVO = comUserService.selectComUser(comUserVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_MAP, resultVO);

		return getSuccessResponseEntity(resultMap);

	}

	@GetMapping(value = "/co/user/users/{id}")
	@ResponseBody
	public ResponseEntity<HashMap<String, Object>> selectUserById(@PathVariable String id, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		ComUserVO resultVO;

		try {
			resultVO = comUserService.selectComUser(id);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_MAP, resultVO);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/co/user/users", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectComUserList(@RequestBody ComUserVO comUserVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<ComUserVO> resultList = new ArrayList<>();

		logger.debug("param info {}", comUserVO.toString());

		try {
			resultList = comUserService.selectComUserList(comUserVO);
		} catch(Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}
	
	@PostMapping(value = "/co/user/updateComUserAprv", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateComUserAprv(@RequestBody ComUserVO comUserVO, HttpServletRequest request) throws Exception {
		logger.debug("updateComUserAprv 호출 <><><><> ");
		
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		int result = 0;
		try {
			comUserVO.setSysLastChgUserId(getUserId());
			comUserVO.setSysLastChgPrgrmId(getPrgrmId());
			result = comUserService.updateComUserAprv(comUserVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}
		
		resultMap.put("result", result);
		
		return getSuccessResponseEntity(resultMap);
	}
							
	@PostMapping(value = "/co/user/compareComUserAprv.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> compareCnptList(@RequestBody Map<String, List<ComUserVO>> comUserVO, HttpServletRequest request) throws Exception {
		logger.debug("compareComUserAprv.do 호출 <><><><> ");
		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		int insertCnt = 0;
		try {
			List<ComUserVO> origin = comUserVO.get("origin").stream().collect(Collectors.toList());
			List<ComUserVO> modified = comUserVO.get("modified").stream().collect(Collectors.toList());

			List<String> originPk = origin.stream().filter(e -> e.getUserId() != null && e.getUserId().equals("") == false).map(e -> e.getUserId()).collect(Collectors.toCollection(ArrayList::new));
			List<String> modifiedPk = modified.stream().filter(e -> e.getUserId() != null && e.getUserId().equals("") == false).map(e -> e.getUserId()).collect(Collectors.toCollection(ArrayList::new));

			List<ComUserVO> updateList = new ArrayList<ComUserVO>();
			for (ComUserVO ei : origin) {
				for (ComUserVO ej : modified) {
					if (ei.getUserId().equals(ej.getUserId())) {
						if (ei.hashCode() != ej.hashCode() ) {
							updateList.add(ej);
						}
						break;
					}
				}
			}

			for (ComUserVO element : updateList) {
				
				element.setSysLastChgPrgrmId(getPrgrmId());
				element.setSysLastChgUserId(getUserId());
				comUserService.updateComUser(element);
			}
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertCnt);

		return getSuccessResponseEntity(resultMap);
	}
}