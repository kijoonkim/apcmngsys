package com.at.apcss.pd.hisPopup.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.pd.hisPopup.mapper.PrdcrOgnHisPopupMapper;
import com.at.apcss.pd.hisPopup.service.PrdcrOgnHisPopupService;
import com.at.apcss.pd.hisPopup.vo.OgnzVO;
import com.at.apcss.pd.hisPopup.vo.CltvtnLandVO;
import com.at.apcss.pd.hisPopup.vo.PrdcrOgnzVO;


/**
 * @Class Name : PrdcrOgnHisPopupServiceImpl.java
 * @Description : 생산자조직 현황 과거 실적 조회
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
@Service("PrdcrOgnHisPopupService")
public class PrdcrOgnHisPopupServiceImpl extends BaseServiceImpl implements PrdcrOgnHisPopupService{

	@Autowired
	private PrdcrOgnHisPopupMapper PrdcrOgnHisPopupMapper;

	@Override
	public List<OgnzVO> selectHisBrnoMngList(OgnzVO OgnzVO) throws Exception {
		List<OgnzVO> resultVO = PrdcrOgnHisPopupMapper.selectHisBrnoMngList(OgnzVO);
		return resultVO;
	}

	@Override
	public OgnzVO selectHisBrnoInfo(OgnzVO OgnzVO) throws Exception {
		OgnzVO resultVO = PrdcrOgnHisPopupMapper.selectHisBrnoInfo(OgnzVO);
		return resultVO;
	}

	@Override
	public List<OgnzVO> selectHisBrnoList(OgnzVO OgnzVO) throws Exception {
		List<OgnzVO> resultVO = PrdcrOgnHisPopupMapper.selectHisBrnoList(OgnzVO);
		return resultVO;
	}

	@Override
	public List<OgnzVO> selectHisUoList(OgnzVO OgnzVO) throws Exception {
		List<OgnzVO> resultVO = PrdcrOgnHisPopupMapper.selectHisUoList(OgnzVO);
		return resultVO;
	}

	@Override
	public List<PrdcrOgnzVO> selectHisPrdcrOgnz2024(PrdcrOgnzVO PrdcrOgnzVO) throws Exception {
		List<PrdcrOgnzVO> resultVO = PrdcrOgnHisPopupMapper.selectHisPrdcrOgnz2024(PrdcrOgnzVO);
		return resultVO;
	}

	@Override
	public List<CltvtnLandVO> selectHisCltvtnLand2024(CltvtnLandVO CltvtnLandVO) throws Exception {
		List<CltvtnLandVO> resultVO = PrdcrOgnHisPopupMapper.selectHisCltvtnLand2024(CltvtnLandVO);
		return resultVO;
	}

	@Override
	public List<PrdcrOgnzVO> selectHisPrdcrOgnz2025(PrdcrOgnzVO PrdcrOgnzVO) throws Exception {
		List<PrdcrOgnzVO> resultVO = PrdcrOgnHisPopupMapper.selectHisPrdcrOgnz2025(PrdcrOgnzVO);
		return resultVO;
	}

	@Override
	public List<CltvtnLandVO> selectHisCltvtnLand2025(CltvtnLandVO CltvtnLandVO) throws Exception {
		List<CltvtnLandVO> resultVO = PrdcrOgnHisPopupMapper.selectHisCltvtnLand2025(CltvtnLandVO);
		return resultVO;
	}


}
