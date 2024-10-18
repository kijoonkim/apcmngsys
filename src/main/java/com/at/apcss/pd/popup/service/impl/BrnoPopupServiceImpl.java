package com.at.apcss.pd.popup.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.pd.popup.mapper.BrnoPopupMapper;
import com.at.apcss.pd.popup.service.BrnoPopupService;
import com.at.apcss.pd.popup.vo.BrnoPopupVO;


/**
 * @Class Name : BrnoPopupServiceImpl.java
 * @Description : 통합조직,출자출하조직 팝업 서비스를 정의하기 위한 서비스 구현 클래스
 * @author ljw
 * @since 2024.10.17
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.10.17  ljw        최초 생성
 * </pre>
 */
@Service("BrnoPopupService")
public class BrnoPopupServiceImpl extends BaseServiceImpl implements BrnoPopupService{

	@Autowired
	private BrnoPopupMapper BrnoPopupMapper;

	@Override
	public List<BrnoPopupVO> selectBrnoList(BrnoPopupVO vo) throws Exception {
		List<BrnoPopupVO> resultList = BrnoPopupMapper.selectBrnoList(vo);

		return resultList;
	}

	@Override
	public List<BrnoPopupVO> selectAplyBrnoList(BrnoPopupVO vo) throws Exception {
		List<BrnoPopupVO> resultList = BrnoPopupMapper.selectAplyBrnoList(vo);

		return resultList;
	}

}
