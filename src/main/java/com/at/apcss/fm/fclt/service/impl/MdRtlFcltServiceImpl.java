package com.at.apcss.fm.fclt.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.fm.fclt.mapper.MdRtlFcltMapper;
import com.at.apcss.fm.fclt.service.MdRtlFcltService;
import com.at.apcss.fm.fclt.vo.MdRtlFcltVO;

@Service("mdRtlFcltService")
public class MdRtlFcltServiceImpl implements MdRtlFcltService {
	@Autowired
	private MdRtlFcltMapper mdRtlFcltMapper;
	@Override
	public HashMap<String,Object> selectFirstGridList(MdRtlFcltVO mdRtlFcltVO) throws Exception {
		
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<MdRtlFcltVO> result = mdRtlFcltMapper.selectFirstGridList(mdRtlFcltVO);
		resultMap.put("result1", result);
		return resultMap;
		 
	}

}
