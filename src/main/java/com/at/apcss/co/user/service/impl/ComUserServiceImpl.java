package com.at.apcss.co.user.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import com.at.apcss.co.sys.service.LoginService;
import com.at.apcss.co.sys.vo.LoginVO;
import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.at.apcss.am.apc.service.ApcEvrmntStngService;
import com.at.apcss.am.apc.vo.ApcEvrmntStngVO;
import com.at.apcss.co.authrt.service.ComAuthrtService;
import com.at.apcss.co.authrt.vo.ComAuthrtVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;
import com.at.apcss.co.user.mapper.ComUserMapper;
import com.at.apcss.co.user.service.ComUserService;
import com.at.apcss.co.user.vo.ComUserVO;

/**
 * 사용자정보에 대한 서비스 구현 클래스를 정의한다
 * @author 신정철
 * @since 2023.05.16
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일      	수정자          수정내용
 *  ----------  ----------    ---------------------------
 *  2023.05.16  신정철          최초 생성
 *
 * </pre>
 */
@Service("comUserService")
public class ComUserServiceImpl extends BaseServiceImpl implements ComUserService {

	@Autowired
	private ComUserMapper comUserMapper;
	@Autowired
	private LoginService loginService;

	@Resource(name = "comAuthrtService")
	private ComAuthrtService comAuthrtService;

	@Resource(name = "apcEvrmntStngService")
	private ApcEvrmntStngService apcEvrmntStngService;


	@Override
	public ComUserVO selectComUser(ComUserVO comUserVO) throws Exception {

		ComUserVO comUserRsltVO = comUserMapper.selectComUser(comUserVO);
		return comUserRsltVO;
	}

	@Override
	public ComUserVO selectComUser(String userId) throws Exception {

		ComUserVO comUserVO = new ComUserVO();
		comUserVO.setUserId(userId);

		return selectComUser(comUserVO);
	}

	@Override
	public List<ComUserVO> selectComUserList(ComUserVO comUserVO) throws Exception {
		
		List<ComUserVO> resultList = comUserMapper.selectComUserList(comUserVO);
		return resultList;
	}
	
	@Override
	public List<ComUserVO> selectComUserApcList(ComUserVO comUserVO) throws Exception {

		List<ComUserVO> resultList = comUserMapper.selectComUserApcList(comUserVO);
		return resultList;
	}

	@Override
	public HashMap<String, Object> updateUserSttsList(List<ComUserVO> comUserList) throws Exception {
		HashMap<String, Object> rtnObj = new HashMap<>();
		
		for ( ComUserVO comUserVO : comUserList ) {
			rtnObj = updateComUserStts(comUserVO);
			if (rtnObj != null) {
				// error throw exception;
				throw new EgovBizException(getMessageForMap(rtnObj));
			}
		}
		
		return null;
	}
	
	@Override
	public HashMap<String, Object> updateComUserStts(ComUserVO comUserVO) throws Exception {
		
		// validation check
		String userId = comUserVO.getUserId();
		if (!StringUtils.hasText(userId)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "사용자ID");
		}
		
		comUserMapper.updateComUserStts(comUserVO);
		
		return null;
	}
	
	@Override
	public HashMap<String, Object> updateComUserList(List<ComUserVO> comUserList) throws Exception {
		HashMap<String, Object> rtnObj = new HashMap<>();
		
		for ( ComUserVO comUserVO : comUserList ) {
			rtnObj = updateComUser(comUserVO);
			if (rtnObj != null) {
				// error throw exception;
				throw new EgovBizException(getMessageForMap(rtnObj));
			}
		}
		
		return null;
//		return comUserMapper.updateComUser(comUserVO);
	}
	@Override
	public HashMap<String, Object> updateComUser(ComUserVO comUserVO) throws Exception {
		
		// validation check
		String userId = comUserVO.getUserId();
		if (!StringUtils.hasText(userId)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "사용자ID");
		}
		
		comUserMapper.updateComUser(comUserVO);
		
		return null;
	}

	@Override
	public int updateComUserAprv(ComUserVO comUserVO) throws Exception {
		return comUserMapper.updateComUserAprv(comUserVO);
	}

	@Override
	public HashMap<String, Object> insertUserAprvList(List<ComUserVO> comUserList) throws Exception {

		HashMap<String, Object> rtnObj = new HashMap<>();

		// validation check
		for ( ComUserVO user : comUserList ) {
			
			ComUserVO userInfo = selectComUser(user);

			if (userInfo == null || !StringUtils.hasText(userInfo.getUserId())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "사용자정보");
			}
			if (!StringUtils.hasText(userInfo.getApcCd())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드");
			}
			if (ComConstants.CON_USER_STTS_VALID.equals(userInfo.getUserStts())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_ALEADY_DONE, "승인||사용자");	// W0010	이미 {0}된 {1} 입니다.
			}
//			if (!ComConstants.CON_USER_TYPE_ADMIN.equals(userInfo.getUserType())) {
//				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_TARGET, "APC관리자");	// W0011	{0}이/가 아닙니다.
//			}

			user.setApcCd(userInfo.getApcCd());
		}

		for ( ComUserVO user : comUserList ) {

			String sysUserId = user.getSysLastChgUserId();
			String sysPrgrmId = user.getSysLastChgPrgrmId();

			user.setUserStts(ComConstants.CON_USER_STTS_VALID);
			comUserMapper.updateComUserAprv(user);

			// 승인 후 권한id 등록.
			ComAuthrtVO comAuthrtVO = new ComAuthrtVO();
			comAuthrtVO.setSysFrstInptUserId(sysUserId);
			comAuthrtVO.setSysFrstInptPrgrmId(sysPrgrmId);
			comAuthrtVO.setSysLastChgUserId(sysUserId);
			comAuthrtVO.setSysLastChgPrgrmId(sysPrgrmId);
			comAuthrtVO.setApcCd(user.getApcCd());
			comAuthrtVO.setUserId(user.getUserId());

			rtnObj = comAuthrtService.insertApcAuthrtId(comAuthrtVO);
			if (rtnObj != null) {
				throw new EgovBizException(getMessageForMap(rtnObj));
			}

//			ApcEvrmntStngVO apcEvrmntStngVO = new ApcEvrmntStngVO();
//			apcEvrmntStngVO.setSysFrstInptUserId(sysUserId);
//			apcEvrmntStngVO.setSysFrstInptPrgrmId(sysPrgrmId);
//			apcEvrmntStngVO.setSysLastChgUserId(sysUserId);
//			apcEvrmntStngVO.setSysLastChgPrgrmId(sysPrgrmId);
//			apcEvrmntStngVO.setApcCd(user.getApcCd());
//
//			rtnObj = apcEvrmntStngService.insertApcInitInfo(apcEvrmntStngVO);
//			if (rtnObj != null) {
//				logger.error(getMessageForMap(rtnObj));
//				throw new EgovBizException(getMessageForMap(rtnObj));
//			}
		}

		return null;
	}

	@Override
	public int updComUserPwd(ComUserVO comUserVO) throws Exception {
		LoginVO loginVo = new LoginVO();
		loginVo.setId(comUserVO.getUserId());
		loginService.updateResetFailCount(loginVo);
		return comUserMapper.updComUserPwd(comUserVO);
	}

}
