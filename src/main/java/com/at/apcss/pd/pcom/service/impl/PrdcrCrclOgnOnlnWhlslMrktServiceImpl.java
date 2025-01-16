package com.at.apcss.pd.pcom.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.pd.pcom.mapper.PrdcrCrclOgnOnlnWhlslMrktMapper;
import com.at.apcss.pd.pcom.service.PrdcrCrclOgnOnlnWhlslMrktService;
import com.at.apcss.pd.pcom.vo.PrdcrCrclOgnOnlnWhlslMrktVO;


/**
 * @Class Name : PrdcrCrclOgnOnlnWhlslMrktServiceImpl.java
 * @Description : 온라인도매시장 판매목표 서비스를 정의하기 위한 서비스 구현 클래스
 * @author ljw
 * @since 2025.01.07
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2025.01.07  ljw        최초 생성
 * </pre>
 */
@Service("PrdcrCrclOgnOnlnWhlslMrktService")
public class PrdcrCrclOgnOnlnWhlslMrktServiceImpl extends BaseServiceImpl implements PrdcrCrclOgnOnlnWhlslMrktService{

	@Autowired
	private PrdcrCrclOgnOnlnWhlslMrktMapper PrdcrCrclOgnOnlnWhlslMrktMapper;

	@Override
	public PrdcrCrclOgnOnlnWhlslMrktVO selectPrdcrCrclOgnOnlnWhlslMrkt(
			PrdcrCrclOgnOnlnWhlslMrktVO PrdcrCrclOgnOnlnWhlslMrktVO) throws Exception {
		PrdcrCrclOgnOnlnWhlslMrktVO resultVO = PrdcrCrclOgnOnlnWhlslMrktMapper.selectPrdcrCrclOgnOnlnWhlslMrkt(PrdcrCrclOgnOnlnWhlslMrktVO);
		return resultVO;
	}

	@Override
	public List<PrdcrCrclOgnOnlnWhlslMrktVO> selectPrdcrCrclOgnOnlnWhlslMrktUoList(
			PrdcrCrclOgnOnlnWhlslMrktVO PrdcrCrclOgnOnlnWhlslMrktVO) throws Exception {
		List<PrdcrCrclOgnOnlnWhlslMrktVO> resultList = PrdcrCrclOgnOnlnWhlslMrktMapper.selectPrdcrCrclOgnOnlnWhlslMrktUoList(PrdcrCrclOgnOnlnWhlslMrktVO);
		return resultList;
	}

	@Override
	public int insertPrdcrCrclOgnOnlnWhlslMrkt(PrdcrCrclOgnOnlnWhlslMrktVO PrdcrCrclOgnOnlnWhlslMrktVO)
			throws Exception {
		int insertedCnt = PrdcrCrclOgnOnlnWhlslMrktMapper.insertPrdcrCrclOgnOnlnWhlslMrkt(PrdcrCrclOgnOnlnWhlslMrktVO);
		return insertedCnt;
	}

	@Override
	public List<PrdcrCrclOgnOnlnWhlslMrktVO> selectOgnzList(
			PrdcrCrclOgnOnlnWhlslMrktVO PrdcrCrclOgnOnlnWhlslMrktVO) throws Exception {
		List<PrdcrCrclOgnOnlnWhlslMrktVO> resultList = PrdcrCrclOgnOnlnWhlslMrktMapper.selectOgnzList(PrdcrCrclOgnOnlnWhlslMrktVO);
		return resultList;
	}

	@Override
	public List<PrdcrCrclOgnOnlnWhlslMrktVO> selectItemList(
			PrdcrCrclOgnOnlnWhlslMrktVO PrdcrCrclOgnOnlnWhlslMrktVO) throws Exception {
		List<PrdcrCrclOgnOnlnWhlslMrktVO> resultList = PrdcrCrclOgnOnlnWhlslMrktMapper.selectItemList(PrdcrCrclOgnOnlnWhlslMrktVO);
		return resultList;
	}

	@Override
	public List<PrdcrCrclOgnOnlnWhlslMrktVO> selectOnlnDtlList(
			PrdcrCrclOgnOnlnWhlslMrktVO PrdcrCrclOgnOnlnWhlslMrktVO) throws Exception {
		List<PrdcrCrclOgnOnlnWhlslMrktVO> resultList = PrdcrCrclOgnOnlnWhlslMrktMapper.selectOnlnDtlList(PrdcrCrclOgnOnlnWhlslMrktVO);
		return resultList;
	}

	@Override
	public int insertOnlnDtl(PrdcrCrclOgnOnlnWhlslMrktVO PrdcrCrclOgnOnlnWhlslMrktVO)
			throws Exception {
		int insertedCnt = PrdcrCrclOgnOnlnWhlslMrktMapper.insertOnlnDtl(PrdcrCrclOgnOnlnWhlslMrktVO);
		return insertedCnt;
	}

	@Override
	public int multiSaveOnlnDtl(List<PrdcrCrclOgnOnlnWhlslMrktVO> PrdcrCrclOgnOnlnWhlslMrktVOList)
			throws Exception {
		int insertedCnt = 0;
		for (PrdcrCrclOgnOnlnWhlslMrktVO prdcrCrclOgnOnlnWhlslMrktVO : PrdcrCrclOgnOnlnWhlslMrktVOList) {
			insertedCnt += PrdcrCrclOgnOnlnWhlslMrktMapper.insertOnlnDtl(prdcrCrclOgnOnlnWhlslMrktVO);
		}
		return insertedCnt;
	}
}
