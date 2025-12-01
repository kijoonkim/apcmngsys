package com.at.apcss.pd.popup.service;

import com.at.apcss.pd.popup.vo.SprtBizRsltInqPopupVO;

import java.util.List;


public interface SprtBizRsltInqPopupService {

	/**
	 * 법인명 리스트
	 * @param sprtBizRsltInqPopupVO
	 * @return
	 * @throws Exception
	 */
	public List<SprtBizRsltInqPopupVO> selectSprtBizRsltInqPopupList(SprtBizRsltInqPopupVO sprtBizRsltInqPopupVO) throws Exception;

}
