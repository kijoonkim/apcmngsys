package com.at.apcss.co.authrt.service.impl;

import java.util.HashMap;
import java.util.List;

import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.authrt.mapper.ComDpcnLgnMapper;
import com.at.apcss.co.authrt.service.ComDpcnLgnService;
import com.at.apcss.co.authrt.vo.ComDpcnLgnVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;

@Service("comDpcnLgnService")
public class ComDpcnLgnServiceImpl extends BaseServiceImpl implements ComDpcnLgnService {

	@Autowired
	private ComDpcnLgnMapper comDpcnLgnMapper;

	@Override
	public String selectUserIdComDpcnLgn(ComDpcnLgnVO comDpcnLgnVO) throws Exception {
		String resultStr = comDpcnLgnMapper.selectUserIdComDpcnLgn(comDpcnLgnVO);
		return resultStr;
	}
	@Override
	public List<ComDpcnLgnVO> selectComDpcnLgnList(ComDpcnLgnVO comDpcnLgnVO) throws Exception {
		List<ComDpcnLgnVO> resultList = comDpcnLgnMapper.selectComDpcnLgnList(comDpcnLgnVO);
		return resultList;
	}

	@Override
	public HashMap<String, Object> saveDpcnLgnList(List<ComDpcnLgnVO> comDpcnLgnList) throws Exception {
		// TODO Auto-generated method stub
		
		for (ComDpcnLgnVO comDpcnLgnVO : comDpcnLgnList) {
			if("I".equals(comDpcnLgnVO.getRowSts())) {
				String userId = selectUserIdComDpcnLgn(comDpcnLgnVO);
				if(userId != null) {
					throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "이미 등록된 사용자ID 입니다."))); // E0000	{0}
				}
				insertDpcnLgn(comDpcnLgnVO);
			}else if("U".equals(comDpcnLgnVO.getRowSts())) {
				updateDpcnLgn(comDpcnLgnVO);
			}
		}
		return null;
	}
	
	@Override
	public int updateDpcnLgn(ComDpcnLgnVO comDpcnLgnVO) throws Exception {
		int updateCnt = comDpcnLgnMapper.updateDpcnLgn(comDpcnLgnVO);
		return updateCnt;
	}
	@Override
	public int insertDpcnLgn(ComDpcnLgnVO comDpcnLgnVO) throws Exception {
		int insertCnt = comDpcnLgnMapper.insertDpcnLgn(comDpcnLgnVO);
		return insertCnt;
	}

}
