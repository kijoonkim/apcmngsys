package com.at.apcss.am.spmt.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.spmt.mapper.SlsMngMapper;
import com.at.apcss.am.spmt.service.SlsMngService;
import com.at.apcss.am.spmt.vo.SlsMngVO;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;

@Service("slsMngService")
public class SlsMngServiceImpl extends BaseServiceImpl implements SlsMngService {

	@Autowired
	private SlsMngMapper slsMngMapper;

	@Override
	public List<SlsMngVO> selectSlsPrfmnc(SlsMngVO slsMngVO) throws Exception {
		
		List<SlsMngVO> resultList = slsMngMapper.selectSlsPrfmnc(slsMngVO);
		
		return resultList;
	}

	@Override
	public int deleteSlsPrfmnc(List<SlsMngVO> slsMngVO) throws Exception {
		int deleteCnt = 0;
		for(SlsMngVO vo: slsMngVO) {
			deleteCnt += slsMngMapper.deleteSlsPrfmnc(vo);			
		}
		
		
		return deleteCnt;
	}
}
