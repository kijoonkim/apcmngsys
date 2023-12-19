package com.at.apcss.pd.user.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.egovframe.rte.fdl.cmmn.trace.LeaveaTrace;
import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.co.user.service.ComUserService;
import com.at.apcss.co.user.vo.ComUserVO;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.jwt.config.EgovJwtTokenUtil;
import egovframework.let.utl.sim.service.EgovFileScrty;

/**
 * 사용자 정보를 관리하는 컨트롤러 클래스
 * @author 신정철
 * @since 2023.07.10
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일      수정자      수정내용
 *  -------            --------        ---------------------------
 *  2023.07.10  신정철     최초 생성
 *
 *  </pre>
 */
@Controller
public class ComUserApiPdController extends BaseController {

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



	/*
	 * 비밀번호 초기화
	 */
	@PostMapping(value = "/pd/user/updAllComUserPwd.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updComUserPwd(@RequestBody ComUserVO comUserVO, HttpServletRequest requset) throws Exception{


		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<ComUserVO> resultList = new ArrayList<>();
		List<ComUserVO> resultList2 = new ArrayList<>();

		try {
			comUserVO.setUserType("21");
			resultList = comUserService.selectComUserList(comUserVO);

			comUserVO.setUserType("22");
			resultList2 = comUserService.selectComUserList(comUserVO);

		} catch(Exception e) {
			return getErrorResponseEntity(e);
		}


//		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		logger.info("=============updComUserPwd=========start====");

		int updatedCnt = 0;
		if (resultList.size() > 0) {
					for (ComUserVO comUserVoResult : resultList) {
						comUserVoResult.setSysLastChgUserId(getUserId());
						comUserVoResult.setSysLastChgPrgrmId(getPrgrmId());
						String enpassword = EgovFileScrty.encryptPassword(comUserVoResult.getUserId(), comUserVoResult.getUserId());
						comUserVoResult.setPswd(enpassword);

						updatedCnt += updatedCnt;
						try {
							updatedCnt = comUserService.updComUserPwd(comUserVoResult);
						} catch (Exception e) {
							logger.debug(e.getMessage());
							return getErrorResponseEntity(e);
						}

					}
		}

		if (resultList2.size() > 0) {
			for (ComUserVO comUserVoResult : resultList2) {
				comUserVoResult.setSysLastChgUserId(getUserId());
				comUserVoResult.setSysLastChgPrgrmId(getPrgrmId());
				String enpassword = EgovFileScrty.encryptPassword(comUserVoResult.getUserId(), comUserVoResult.getUserId());
				comUserVoResult.setPswd(enpassword);

				updatedCnt += updatedCnt;
				try {
					updatedCnt = comUserService.updComUserPwd(comUserVoResult);
				} catch (Exception e) {
					logger.debug(e.getMessage());
					return getErrorResponseEntity(e);
				}

			}
		}

		resultMap.put(ComConstants.PROP_UPDATED_CNT, updatedCnt);
		logger.info("=============updComUserPwd======end=======");
		return getSuccessResponseEntity(resultMap);
	}
}