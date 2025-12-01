package com.at.apcss.pd.popup.service.impl;

import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.pd.popup.mapper.SprtBizRsltInqPopupMapper;
import com.at.apcss.pd.popup.service.SprtBizRsltInqPopupService;
import com.at.apcss.pd.popup.vo.SprtBizRsltInqPopupVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service("sprtBizRsltInqPopupService")
public class SprtBizRsltInqPopupServiceImpl extends BaseServiceImpl implements SprtBizRsltInqPopupService {

	@Autowired
	private SprtBizRsltInqPopupMapper sprtBizRsltInqPopupMapper;

	@Override
	public List<SprtBizRsltInqPopupVO> selectSprtBizRsltInqPopupList(SprtBizRsltInqPopupVO sprtBizRsltInqPopupVO) throws Exception {
		List<SprtBizRsltInqPopupVO> resultList = sprtBizRsltInqPopupMapper.selectSprtBizRsltInqPopupList(sprtBizRsltInqPopupVO);

		return resultList;
	}

}
