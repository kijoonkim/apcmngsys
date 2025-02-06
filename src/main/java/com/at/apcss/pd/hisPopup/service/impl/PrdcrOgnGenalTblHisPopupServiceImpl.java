package com.at.apcss.pd.hisPopup.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.pd.hisPopup.mapper.PrdcrOgnGenalTblHisPopupMapper;
import com.at.apcss.pd.hisPopup.service.PrdcrOgnGenalTblHisPopupService;
import com.at.apcss.pd.hisPopup.vo.PrdcrOgnGenalTblVO;


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
@Service("PrdcrOgnGenalTblHisPopupService")
public class PrdcrOgnGenalTblHisPopupServiceImpl extends BaseServiceImpl implements PrdcrOgnGenalTblHisPopupService{

	@Autowired
	private PrdcrOgnGenalTblHisPopupMapper PrdcrOgnGenalTblHisPopupMapper;

	@Override
	public List<PrdcrOgnGenalTblVO> selectHisPrdcrOgnGenalTbl2024(PrdcrOgnGenalTblVO PrdcrOgnGenalTblVO) throws Exception {
		List<PrdcrOgnGenalTblVO> resultVO = PrdcrOgnGenalTblHisPopupMapper.selectHisPrdcrOgnGenalTbl2024(PrdcrOgnGenalTblVO);
		return resultVO;
	}

	@Override
	public List<PrdcrOgnGenalTblVO> selectHisPrdcrOgnGenalTbl2025(PrdcrOgnGenalTblVO PrdcrOgnGenalTblVO) throws Exception {
		List<PrdcrOgnGenalTblVO> resultVO = PrdcrOgnGenalTblHisPopupMapper.selectHisPrdcrOgnGenalTbl2025(PrdcrOgnGenalTblVO);
		return resultVO;
	}

}
