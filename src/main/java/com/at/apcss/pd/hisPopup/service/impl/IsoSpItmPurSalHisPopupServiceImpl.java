package com.at.apcss.pd.hisPopup.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.pd.hisPopup.mapper.IsoSpItmPurSalHisPopupMapper;
import com.at.apcss.pd.hisPopup.service.IsoSpItmPurSalHisPopupService;
import com.at.apcss.pd.hisPopup.vo.IsoSpItmPurSalVO;


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
@Service("IsoSpItmPurSalHisPopupService")
public class IsoSpItmPurSalHisPopupServiceImpl extends BaseServiceImpl implements IsoSpItmPurSalHisPopupService{

	@Autowired
	private IsoSpItmPurSalHisPopupMapper IsoSpItmPurSalHisPopupMapper;

	@Override
	public List<IsoSpItmPurSalVO> selectHisIsoSpItmPurSal2024(IsoSpItmPurSalVO IsoSpItmPurSalVO) throws Exception {
		List<IsoSpItmPurSalVO> resultVO = IsoSpItmPurSalHisPopupMapper.selectHisIsoSpItmPurSal2024(IsoSpItmPurSalVO);
		return resultVO;
	}

	@Override
	public List<IsoSpItmPurSalVO> selectHisIsoSpItmPurSal2025(IsoSpItmPurSalVO IsoSpItmPurSalVO) throws Exception {
		List<IsoSpItmPurSalVO> resultVO = IsoSpItmPurSalHisPopupMapper.selectHisIsoSpItmPurSal2025(IsoSpItmPurSalVO);
		return resultVO;
	}

}
