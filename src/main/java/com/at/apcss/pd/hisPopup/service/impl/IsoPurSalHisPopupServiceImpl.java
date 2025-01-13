package com.at.apcss.pd.hisPopup.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.pd.hisPopup.mapper.IsoPurSalHisPopupMapper;
import com.at.apcss.pd.hisPopup.service.IsoPurSalHisPopupService;
import com.at.apcss.pd.hisPopup.vo.IsoPurSalVO;


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
@Service("IsoPurSalHisPopupService")
public class IsoPurSalHisPopupServiceImpl extends BaseServiceImpl implements IsoPurSalHisPopupService{

	@Autowired
	private IsoPurSalHisPopupMapper IsoPurSalHisPopupMapper;

	@Override
	public List<IsoPurSalVO> selectHisIsoPurSal2024(IsoPurSalVO IsoPurSalVO) throws Exception {
		List<IsoPurSalVO> resultVO = IsoPurSalHisPopupMapper.selectHisIsoPurSal2024(IsoPurSalVO);
		return resultVO;
	}

	@Override
	public List<IsoPurSalVO> selectHisIsoPurSal2025(IsoPurSalVO IsoPurSalVO) throws Exception {
		List<IsoPurSalVO> resultVO = IsoPurSalHisPopupMapper.selectHisIsoPurSal2025(IsoPurSalVO);
		return resultVO;
	}

}
