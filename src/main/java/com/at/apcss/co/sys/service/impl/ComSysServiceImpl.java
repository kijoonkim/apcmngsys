package com.at.apcss.co.sys.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.at.apcss.co.cd.mapper.ComCdMapper;
import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.co.constants.ApcConstants;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.log.mapper.ComLogMapper;
import com.at.apcss.co.log.vo.ComLogVO;
import com.at.apcss.co.menu.mapper.ComMenuMapper;
import com.at.apcss.co.menu.vo.ComMenuVO;
import com.at.apcss.co.sys.mapper.ComSysMapper;
import com.at.apcss.co.sys.service.ComSysService;
import com.at.apcss.co.sys.vo.ComLgnPlcyVO;
import com.at.apcss.co.sys.vo.ComSessionVO;
import com.at.apcss.co.sys.vo.ComSysVO;

@Service("comSysService")
public class ComSysServiceImpl extends BaseServiceImpl implements ComSysService {

	@Autowired
	private ComSysMapper comSysMapper;
	
	@Autowired
	private ComMenuMapper comMenuMapper;
	
	@Autowired
	private ComLogMapper comLogMapper;
	
	@Autowired
	private ComCdMapper comCdMapper;
	
	@Override
	public HashMap<String, Object> insertComeMenuLogPrsnaInfo(ComSysVO comSysVO) throws Exception {

		ComMenuVO menuParam = new ComMenuVO();
		menuParam.setMenuId(comSysVO.getPrgrmId());
		ComMenuVO menuInfo = comMenuMapper.selectComMenu(menuParam);
		
		if (menuInfo == null || !StringUtils.hasText(menuInfo.getMenuId())) {
			return null;
		}
		
		if (!ComConstants.CON_YES.equals(menuInfo.getPrsnaInfoYn())) {
			return null;
		}
		
		ComLogVO comLogVO = new ComLogVO();
		comLogVO.setSysFrstInptUserId(comSysVO.getUserId());
		comLogVO.setSysFrstInptPrgrmId(comSysVO.getPrgrmId());
		comLogVO.setSysLastChgUserId(comSysVO.getUserId());
		comLogVO.setSysLastChgPrgrmId(comSysVO.getPrgrmId());
		
		comLogVO.setMenuId(menuInfo.getMenuId());
		comLogVO.setMenuNm(menuInfo.getMenuNm());
		comLogVO.setUserId(comSysVO.getUserId());
		comLogVO.setUserNm(comSysVO.getUserNm());
		comLogVO.setUserType(comSysVO.getUserType());
		
		comLogVO.setLgnScsYn(comSysVO.getLgnScsYn());
		comLogVO.setPrslType(comSysVO.getPrslType());
		comLogVO.setUserIp(comSysVO.getUserIp());
		comLogVO.setApcCd(comSysVO.getApcCd());
		comLogVO.setFlfmtTaskSeCd(comSysVO.getFlfmtTaskSeCd());

		comLogMapper.insertMenuHstry(comLogVO);
		
		return null;
	}

	@Override
	public HashMap<String, Object> insertComSession(ComSysVO comSysVO) throws Exception {

		ComSessionVO sessionVO = new ComSessionVO();
		// delete
		sessionVO.setSessId(comSysVO.getSessId());
		comSysMapper.deleteComSession(sessionVO);
		
		sessionVO.setUserId(comSysVO.getUserId());
		comSysMapper.insertComSession(sessionVO);
		
		return null;
	}

	@Override
	public HashMap<String, Object> updateComSessionExpiry(ComSysVO comSysVO) throws Exception {
		
		ComSessionVO sessionVO = new ComSessionVO();
		// delete
		sessionVO.setSessId(comSysVO.getSessId());
		comSysMapper.updateComSessionExpiry(sessionVO);
		
		return null;
	}
	

	@Override
	public HashMap<String, Object> updateComSessionExpiryByUser(ComSysVO comSysVO) throws Exception {
		ComSessionVO sessParam = new ComSessionVO();
		// delete
		sessParam.setUserId(comSysVO.getUserId());
		List<ComSessionVO> sessList = comSysMapper.selectAliveSessionListByUserId(sessParam);
		
		if (sessList != null && !sessList.isEmpty()) {
			for ( ComSessionVO sessionVO : sessList ) {
				sessionVO.setFrcdExpryYn(comSysVO.getFrcdExpryYn());
				comSysMapper.updateComSessionExpiry(sessionVO);
			}
		}
		
		return null;
	}

	@Override
	public boolean checkSessionValid(String sessId) throws Exception {
		
		ComSessionVO sessParam = new ComSessionVO();
		sessParam.setSessId(sessId);
		
		ComSessionVO sessionVO = comSysMapper.selectComSession(sessParam);
		
		if (sessionVO == null || !StringUtils.hasText(sessionVO.getSessId())) {
			return false;
		}
		logger.debug("sessionVO.getSessExpryDt() {}", sessionVO.getSessExpryDt());
		if (StringUtils.hasText(sessionVO.getSessExpryDt())) {
			// 세션 만료 일시 확인
			return false;
		}
		
		// FIXME 세션 access 일시 update 추가할 것
		
		return true;
	}

	@Override
	public boolean checkDuplicatedUser(String userId, String userIp) throws Exception {
		
		ComCdVO dupChkParam = new ComCdVO();
		dupChkParam.setCdId(ComConstants.CON_DPCN_LGN);
		dupChkParam.setApcCd(ApcConstants.APC_CD_SYSTEM);
		dupChkParam.setDelYn(ComConstants.CON_NONE);
		
		List<ComCdVO> dpcnLgnPsbltyList = comCdMapper.selectComCdDtlList(dupChkParam);
		if (dpcnLgnPsbltyList != null && !dpcnLgnPsbltyList.isEmpty()) {
			for ( ComCdVO dpcnLgnPsblty : dpcnLgnPsbltyList ) {
				logger.debug("dpcnLgnPsblty.getCdVl() {}", dpcnLgnPsblty.getCdVl());
				logger.debug("check {}", ComConstants.CON_DPCN_LGN_PSBLTY.equals(dpcnLgnPsblty.getCdVl()));
				if (ComConstants.CON_DPCN_LGN_PSBLTY.equals(dpcnLgnPsblty.getCdVl())) {
					return false;
				}
			}
		}
				
		ComLgnPlcyVO lgnPlcyParam = new ComLgnPlcyVO();
		lgnPlcyParam.setUserId(userId);
		
		ComLgnPlcyVO comLgnPlcyVO = comSysMapper.selectComLgnPlcy(lgnPlcyParam);
		
		if (comLgnPlcyVO != null && StringUtils.hasText(comLgnPlcyVO.getUserId())) {
			if (ComConstants.CON_YES.equals(comLgnPlcyVO.getUseYn())) {
				
				if (ComConstants.CON_YES.equals(comLgnPlcyVO.getDpcnLgnPsbltyYn())) {
					return false;
				}
				/*
				if (ComConstants.CON_YES.equals(comLgnPlcyVO.getIpLmtYn())
						&& StringUtils.hasText(comLgnPlcyVO.getIpInfo())) {
					if (!comLgnPlcyVO.getIpInfo().equals(userIp)) {
						
					}
				}
				*/
			}
		}
		
		ComSessionVO sessParam = new ComSessionVO();
		sessParam.setUserId(userId);
		
		ComSessionVO aliveSessVO = comSysMapper.selectAliveSessionCountByUserId(sessParam);
		
		if (aliveSessVO != null && StringUtils.hasText(aliveSessVO.getUserId())) {
			if (aliveSessVO.getCntSess() > 0) {
				return true;
			}
		}
		
		return false;
	}


	
}
