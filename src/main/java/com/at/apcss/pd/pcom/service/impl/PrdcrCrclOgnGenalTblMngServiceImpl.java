package com.at.apcss.pd.pcom.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.pd.pcom.mapper.PrdcrCrclOgnGenalTblMngMapper;
import com.at.apcss.pd.pcom.service.PrdcrCrclOgnGenalTblMngService;
import com.at.apcss.pd.pcom.vo.PrdcrCrclOgnGenalTblMngVO;


/**
 * @Class Name : BbsServiceImpl.java
 * @Description : 게시판 서비스를 정의하기 위한 서비스 구현 클래스
 * @author 정연두
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21  정연두        최초 생성
 * </pre>
 */
@Service("PrdcrCrclOgnGenalTblMngService")
public class PrdcrCrclOgnGenalTblMngServiceImpl extends BaseServiceImpl implements PrdcrCrclOgnGenalTblMngService{

	@Autowired
	private PrdcrCrclOgnGenalTblMngMapper PrdcrCrclOgnGenalTblMngMapper;

	@Override
	public PrdcrCrclOgnGenalTblMngVO selectPrdcrCrclOgnGenalTblMng(PrdcrCrclOgnGenalTblMngVO PrdcrCrclOgnGenalTblMngVO) throws Exception {

		PrdcrCrclOgnGenalTblMngVO resultVO = PrdcrCrclOgnGenalTblMngMapper.selectPrdcrCrclOgnGenalTblMng(PrdcrCrclOgnGenalTblMngVO);

		return resultVO;
	}

	@Override
	public List<PrdcrCrclOgnGenalTblMngVO> selectPrdcrCrclOgnGenalTblMngUoList(PrdcrCrclOgnGenalTblMngVO PrdcrCrclOgnGenalTblMngVO) throws Exception {

		List<PrdcrCrclOgnGenalTblMngVO> resultList = PrdcrCrclOgnGenalTblMngMapper.selectPrdcrCrclOgnGenalTblMngUoList(PrdcrCrclOgnGenalTblMngVO);
		return resultList;
	}

	@Override
	public List<PrdcrCrclOgnGenalTblMngVO> selectPrdcrCrclOgnGenalTblMngList(PrdcrCrclOgnGenalTblMngVO PrdcrCrclOgnGenalTblMngVO) throws Exception {

		List<PrdcrCrclOgnGenalTblMngVO> resultList = PrdcrCrclOgnGenalTblMngMapper.selectPrdcrCrclOgnGenalTblMngList(PrdcrCrclOgnGenalTblMngVO);
		return resultList;
	}

}
