package com.at.apcss.pd.hisPopup.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.pd.hisPopup.mapper.UoGenalTblHisPopupMapper;
import com.at.apcss.pd.hisPopup.service.UoGenalTblHisPopupService;
import com.at.apcss.pd.hisPopup.vo.UoGenalTblVO;


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
@Service("UoGenalTblHisPopupService")
public class UoGenalTblHisPopupServiceImpl extends BaseServiceImpl implements UoGenalTblHisPopupService{

	@Autowired
	private UoGenalTblHisPopupMapper UoGenalTblHisPopupMapper;

	@Override
	public List<UoGenalTblVO> selectHisUoGenalTbl2024(UoGenalTblVO UoGenalTblVO) throws Exception {
		List<UoGenalTblVO> resultVO = UoGenalTblHisPopupMapper.selectHisUoGenalTbl2024(UoGenalTblVO);
		return resultVO;
	}

	@Override
	public List<UoGenalTblVO> selectHisUoGenalTbl2025(UoGenalTblVO UoGenalTblVO) throws Exception {
		List<UoGenalTblVO> resultVO = UoGenalTblHisPopupMapper.selectHisUoGenalTbl2025(UoGenalTblVO);
		return resultVO;
	}

	@Override
	public List<UoGenalTblVO> selectHisUoClsfTot2025(UoGenalTblVO UoGenalTblVO) throws Exception {
		List<UoGenalTblVO> resultVO = UoGenalTblHisPopupMapper.selectHisUoClsfTot2025(UoGenalTblVO);
		return resultVO;
	}
}
