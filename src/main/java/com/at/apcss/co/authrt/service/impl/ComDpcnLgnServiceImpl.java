package com.at.apcss.co.authrt.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.authrt.mapper.ComDpcnLgnMapper;
import com.at.apcss.co.authrt.service.ComDpcnLgnService;
import com.at.apcss.co.authrt.vo.ComDpcnLgnVO;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;

@Service("comDpcnLgnService")
public class ComDpcnLgnServiceImpl extends BaseServiceImpl implements ComDpcnLgnService {

	@Autowired
	private ComDpcnLgnMapper comDpcnLgnMapper;

	@Override
	public List<ComDpcnLgnVO> selectComDpcnLgnList(ComDpcnLgnVO comDpcnLgnVO) throws Exception {
		List<ComDpcnLgnVO> resultList = comDpcnLgnMapper.selectComDpcnLgnList(comDpcnLgnVO);
		return resultList;
	}

	@Override
	public int saveDpcnLgnList(List<ComDpcnLgnVO> comDpcnLgnList) throws Exception {
		// TODO Auto-generated method stub
		int saveCnt = 0;
		for (ComDpcnLgnVO comDpcnLgnVO : comDpcnLgnList) {
			if("I".equals(comDpcnLgnVO.getRowSts())) {
				saveCnt += insertDpcnLgn(comDpcnLgnVO);
			}else if("U".equals(comDpcnLgnVO.getRowSts())) {
				saveCnt += updateDpcnLgn(comDpcnLgnVO);
			}
		}
		return saveCnt;
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
