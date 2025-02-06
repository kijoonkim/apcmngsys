package com.at.apcss.pd.hisPopup.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.pd.hisPopup.mapper.IsoGenalTblHisPopupMapper;
import com.at.apcss.pd.hisPopup.service.IsoGenalTblHisPopupService;
import com.at.apcss.pd.hisPopup.vo.IsoGenalTblVO;


/**
 * @Class Name : PrdcrOgnHisPopupServiceImpl.java
 * @Description : 게시판 서비스를 정의하기 위한 서비스 구현 클래스
 * @author ljw
 * @since 2024.12.04
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.12.04  ljw        최초 생성
 * </pre>
 */
@Service("IsoGenalTblHisPopupService")
public class IsoGenalTblHisPopupServiceImpl extends BaseServiceImpl implements IsoGenalTblHisPopupService{

	@Autowired
	private IsoGenalTblHisPopupMapper IsoGenalTblHisPopupMapper;

	@Override
	public List<IsoGenalTblVO> selectHisIsoGenalTbl2024(IsoGenalTblVO IsoGenalTblVO) throws Exception {
		List<IsoGenalTblVO> resultVO = IsoGenalTblHisPopupMapper.selectHisIsoGenalTbl2024(IsoGenalTblVO);
		return resultVO;
	}

	@Override
	public List<IsoGenalTblVO> selectHisIsoGenalTbl2025(IsoGenalTblVO IsoGenalTblVO) throws Exception {
		List<IsoGenalTblVO> resultVO = IsoGenalTblHisPopupMapper.selectHisIsoGenalTbl2025(IsoGenalTblVO);
		return resultVO;
	}

	@Override
	public List<IsoGenalTblVO> selectHisIsoClsfTot2025(IsoGenalTblVO IsoGenalTblVO) throws Exception {
		List<IsoGenalTblVO> resultVO = IsoGenalTblHisPopupMapper.selectHisIsoClsfTot2025(IsoGenalTblVO);
		return resultVO;
	}
}
