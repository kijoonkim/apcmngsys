package com.at.apcss.am.apc.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.at.apcss.am.apc.mapper.ApcLinkMapper;
import com.at.apcss.am.apc.service.ApcLinkService;
import com.at.apcss.am.apc.vo.ApcLinkVO;
import com.at.apcss.am.constants.AmConstants;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;

@Service("apcLinkService")
public class ApcLinkServiceImpl extends BaseServiceImpl implements ApcLinkService{

	@Autowired
	private ApcLinkMapper apcLinkMapper;

	@Override
	public ApcLinkVO selectApcLink(ApcLinkVO apcLinkVO) throws Exception {
		return apcLinkMapper.selectApcLink(apcLinkVO);
	}

	@Override
	public ApcLinkVO selectApcLinkTrsmMat(ApcLinkVO apcLinkVO) throws Exception {
		return apcLinkMapper.selectApcLinkTrsmMat(apcLinkVO);
	}


	@Override
	public HashMap<String, Object> updateApcLinkIdnty(ApcLinkVO apcLinkVO) throws Exception {
		apcLinkVO.setTrsmMatSttsCd("S0");
		apcLinkMapper.updateApcLinkIdnty(apcLinkVO);
		return null;
	}

	@Override
	public HashMap<String, Object> updateApcLinkTrsmMatIdnty(ApcLinkVO apcLinkVO) throws Exception {
		apcLinkVO.setTrsmMatSttsCd("S0");
		apcLinkMapper.updateApcLinkTrsmMatIdnty(apcLinkVO);
		return null;
	}
	
	@Override
	public HashMap<String, Object> updateLinkStts(ApcLinkVO apcLinkVO) throws Exception {
		
		String linkKnd = apcLinkVO.getLinkKnd();
		String linkStts = apcLinkVO.getLinkStts();
		
		if (!StringUtils.hasText(linkKnd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "연계서비스종류");
		}
		
		if (!StringUtils.hasText(linkStts)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "연계상태");
		}
		
		List<String> linkKndList = new ArrayList<>(); 
		linkKndList.add(AmConstants.CON_LINK_KND_WGH);
		linkKndList.add(AmConstants.CON_LINK_KND_RCPT);
		linkKndList.add(AmConstants.CON_LINK_KND_SORT);
		linkKndList.add(AmConstants.CON_LINK_KND_PCKG);
		linkKndList.add(AmConstants.CON_LINK_KND_SPMT);
		
		List<String> linkSttsList = new ArrayList<>();
		linkSttsList.add(AmConstants.CON_LINK_STTS_REQ_DONE);
		linkSttsList.add(AmConstants.CON_LINK_STTS_REQ_CNCL);
		linkSttsList.add(AmConstants.CON_LINK_STTS_SND_DONE);
		linkSttsList.add(AmConstants.CON_LINK_STTS_PRCS_DONE);
		
		if (!linkKndList.contains(linkKnd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_TARGET, "연계서비스");
		}
		
		if (!linkSttsList.contains(linkStts)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_TARGET, "연계상태");
		}
		
		apcLinkMapper.updateSpApcLinkSttsUpdt(apcLinkVO);
		
		if (StringUtils.hasText(apcLinkVO.getRtnCd())) {
			return ComUtil.getResultMap(apcLinkVO.getRtnCd(), apcLinkVO.getRtnMsg());
		}
		
		return null;
	}

	@Override
	public HashMap<String, Object> updateWghLinkStts(ApcLinkVO apcLinkVO) throws Exception {
		apcLinkVO.setLinkKnd(AmConstants.CON_LINK_KND_WGH);
		return updateLinkStts(apcLinkVO);
	}

	@Override
	public HashMap<String, Object> updateWrhsLinkStts(ApcLinkVO apcLinkVO) throws Exception {
		apcLinkVO.setLinkKnd(AmConstants.CON_LINK_KND_RCPT);
		return updateLinkStts(apcLinkVO);
	}

	@Override
	public HashMap<String, Object> updateSortLinkStts(ApcLinkVO apcLinkVO) throws Exception {
		apcLinkVO.setLinkKnd(AmConstants.CON_LINK_KND_SORT);
		return updateLinkStts(apcLinkVO);
	}

	@Override
	public HashMap<String, Object> updatePckgLinkStts(ApcLinkVO apcLinkVO) throws Exception {
		apcLinkVO.setLinkKnd(AmConstants.CON_LINK_KND_PCKG);
		return updateLinkStts(apcLinkVO);
	}

	@Override
	public HashMap<String, Object> updateSpmtLinkStts(ApcLinkVO apcLinkVO) throws Exception {
		apcLinkVO.setLinkKnd(AmConstants.CON_LINK_KND_SPMT);
		return updateLinkStts(apcLinkVO);
	}

	@Override
	public HashMap<String, Object> updateLinkTrsmMatStts(ApcLinkVO apcLinkVO) throws Exception {

		String linkKnd = apcLinkVO.getLinkKnd();
		String linkStts = apcLinkVO.getLinkStts();
		
		if (!StringUtils.hasText(linkKnd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "연계서비스종류");
		}
		
		if (!StringUtils.hasText(linkStts)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "연계상태");
		}
		
		List<String> linkKndList = new ArrayList<>(); 
		linkKndList.add(AmConstants.CON_LINK_KND_WGH);
		linkKndList.add(AmConstants.CON_LINK_KND_RCPT);
		linkKndList.add(AmConstants.CON_LINK_KND_SORT);
		linkKndList.add(AmConstants.CON_LINK_KND_PCKG);
		linkKndList.add(AmConstants.CON_LINK_KND_SPMT);
		
		List<String> linkSttsList = new ArrayList<>();
		linkSttsList.add(AmConstants.CON_LINK_STTS_REQ_DONE);
		linkSttsList.add(AmConstants.CON_LINK_STTS_REQ_CNCL);
		linkSttsList.add(AmConstants.CON_LINK_STTS_SND_DONE);
		linkSttsList.add(AmConstants.CON_LINK_STTS_PRCS_DONE);
		
		if (!linkKndList.contains(linkKnd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_TARGET, "연계서비스");
		}
		
		if (!linkSttsList.contains(linkStts)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_TARGET, "연계상태");
		}
		
		apcLinkMapper.updateSpApcLinkTrsmMatSttsUpdt(apcLinkVO);
		
		if (StringUtils.hasText(apcLinkVO.getRtnCd())) {
			return ComUtil.getResultMap(apcLinkVO.getRtnCd(), apcLinkVO.getRtnMsg());
		}
		
		return null;
	}

	@Override
	public List<ApcLinkVO> selectApcLinkTrsmMatSttsList(ApcLinkVO apcLinkVO) throws Exception {
		return apcLinkMapper.selectApcLinkTrsmMatSttsList(apcLinkVO);
	}


}
