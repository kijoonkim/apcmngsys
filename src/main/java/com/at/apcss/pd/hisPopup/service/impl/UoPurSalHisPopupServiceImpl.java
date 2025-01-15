package com.at.apcss.pd.hisPopup.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.pd.hisPopup.mapper.UoPurSalHisPopupMapper;
import com.at.apcss.pd.hisPopup.service.UoPurSalHisPopupService;
import com.at.apcss.pd.hisPopup.vo.UoPurSalVO;


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
@Service("UoPurSalHisPopupService")
public class UoPurSalHisPopupServiceImpl extends BaseServiceImpl implements UoPurSalHisPopupService{

	@Autowired
	private UoPurSalHisPopupMapper UoPurSalHisPopupMapper;

	@Override
	public List<UoPurSalVO> selectHisUoPurSal2024(UoPurSalVO UoPurSalVO) throws Exception {
		List<UoPurSalVO> resultVO = UoPurSalHisPopupMapper.selectHisUoPurSal2024(UoPurSalVO);
		return resultVO;
	}

	@Override
	public List<UoPurSalVO> selectHisUoPurSal2025(UoPurSalVO UoPurSalVO) throws Exception {
		List<UoPurSalVO> resultVO = UoPurSalHisPopupMapper.selectHisUoPurSal2025(UoPurSalVO);
		return resultVO;
	}

}
