package com.at.apcss.co.sys.service.impl;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.log.mapper.ComLogMapper;
import com.at.apcss.co.log.vo.ComLogVO;
import com.at.apcss.co.menu.mapper.ComMenuMapper;
import com.at.apcss.co.menu.vo.ComMenuVO;
import com.at.apcss.co.sys.service.ComSysService;
import com.at.apcss.co.sys.vo.ComSysVO;

@Service("comSysService")
public class ComSysServiceImpl extends BaseServiceImpl implements ComSysService {

	@Autowired
	private ComMenuMapper comMenuMapper;
	
	@Autowired
	private ComLogMapper comLogMapper;
	
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

	
}
