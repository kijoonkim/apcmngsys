package com.at.apcss.pd.hisPopup.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.pd.hisPopup.mapper.UoSpItmPurSalNHisPopupMapper;
import com.at.apcss.pd.hisPopup.service.UoSpItmPurSalNHisPopupService;
import com.at.apcss.pd.hisPopup.vo.UoSpItmPurSalVO;


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
@Service("UoSpItmPurSalNHisPopupService")
public class UoSpItmPurSalNHisPopupServiceImpl extends BaseServiceImpl implements UoSpItmPurSalNHisPopupService{

	@Autowired
	private UoSpItmPurSalNHisPopupMapper UoSpItmPurSalNHisPopupMapper;

	@Override
	public List<UoSpItmPurSalVO> selectHisUoSpItmPurSalN2024(UoSpItmPurSalVO UoSpItmPurSalVO) throws Exception {
		List<UoSpItmPurSalVO> resultVO = UoSpItmPurSalNHisPopupMapper.selectHisUoSpItmPurSalN2024(UoSpItmPurSalVO);
		return resultVO;
	}

	@Override
	public List<UoSpItmPurSalVO> selectHisUoSpItmPurSalN2025(UoSpItmPurSalVO UoSpItmPurSalVO) throws Exception {
		List<UoSpItmPurSalVO> resultVO = UoSpItmPurSalNHisPopupMapper.selectHisUoSpItmPurSalN2025(UoSpItmPurSalVO);
		return resultVO;
	}

}
