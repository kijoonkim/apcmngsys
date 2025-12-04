package com.apcmngsys.apcss.pd.popup.mapper;

import com.apcmngsys.apcss.pd.popup.vo.SprtBizRsltInqPopupVO;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import java.util.List;

@Mapper
public interface SprtBizRsltInqPopupMapper {

	/**
	 * 법인명 리스트
	 * @param SprtBizRsltInqPopupVO
	 * @return
	 * @throws Exception
	 */
	public List<SprtBizRsltInqPopupVO> selectSprtBizRsltInqPopupList(SprtBizRsltInqPopupVO sprtBizRsltInqPopupVO) throws Exception;

}
