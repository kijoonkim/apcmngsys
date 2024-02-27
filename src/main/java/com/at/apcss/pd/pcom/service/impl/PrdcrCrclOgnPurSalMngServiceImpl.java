package com.at.apcss.pd.pcom.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.pd.pcom.mapper.PrdcrCrclOgnPurSalMngMapper;
import com.at.apcss.pd.pcom.service.PrdcrCrclOgnPurSalMngService;
import com.at.apcss.pd.pcom.vo.PrdcrCrclOgnPurSalMngVO;


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
@Service("PrdcrCrclOgnPurSalMngService")
public class PrdcrCrclOgnPurSalMngServiceImpl extends BaseServiceImpl implements PrdcrCrclOgnPurSalMngService{

	@Autowired
	private PrdcrCrclOgnPurSalMngMapper PrdcrCrclOgnPurSalMngMapper;

	@Override
	public PrdcrCrclOgnPurSalMngVO selectPrdcrCrclOgnPurSalMng(PrdcrCrclOgnPurSalMngVO PrdcrCrclOgnPurSalMngVO) throws Exception {

		PrdcrCrclOgnPurSalMngVO resultVO = PrdcrCrclOgnPurSalMngMapper.selectPrdcrCrclOgnPurSalMng(PrdcrCrclOgnPurSalMngVO);

		return resultVO;
	}

	@Override
	public List<PrdcrCrclOgnPurSalMngVO> selectPrdcrCrclOgnPurSalMngList(PrdcrCrclOgnPurSalMngVO PrdcrCrclOgnPurSalMngVO) throws Exception {

		List<PrdcrCrclOgnPurSalMngVO> resultList = PrdcrCrclOgnPurSalMngMapper.selectPrdcrCrclOgnPurSalMngList(PrdcrCrclOgnPurSalMngVO);
		return resultList;
	}

	@Override
	public int insertPrdcrCrclOgnPurSalMng01(PrdcrCrclOgnPurSalMngVO PrdcrCrclOgnPurSalMngVO) throws Exception {

		int insertedCnt = PrdcrCrclOgnPurSalMngMapper.insertPrdcrCrclOgnPurSalMng01(PrdcrCrclOgnPurSalMngVO);

		return insertedCnt;
	}

	@Override
	public int insertPrdcrCrclOgnPurSalMng02(PrdcrCrclOgnPurSalMngVO PrdcrCrclOgnPurSalMngVO) throws Exception {

		int insertedCnt = PrdcrCrclOgnPurSalMngMapper.insertPrdcrCrclOgnPurSalMng02(PrdcrCrclOgnPurSalMngVO);

		return insertedCnt;
	}

	@Override
	public int insertPrdcrCrclOgnPurSalMng03(PrdcrCrclOgnPurSalMngVO PrdcrCrclOgnPurSalMngVO) throws Exception {

		int insertedCnt = PrdcrCrclOgnPurSalMngMapper.insertPrdcrCrclOgnPurSalMng03(PrdcrCrclOgnPurSalMngVO);

		return insertedCnt;
	}

	@Override
	public int updatePrdcrCrclOgnPurSalMng(PrdcrCrclOgnPurSalMngVO PrdcrCrclOgnPurSalMngVO) throws Exception {

		int updatedCnt = PrdcrCrclOgnPurSalMngMapper.updatePrdcrCrclOgnPurSalMng(PrdcrCrclOgnPurSalMngVO);

		return updatedCnt;
	}

	@Override
	public int multiSavePrdcrCrclOgnPurSalMngList01(List<PrdcrCrclOgnPurSalMngVO> PrdcrCrclOgnPurSalMngVOList) throws Exception {
		int savedCnt = 0;
		for (PrdcrCrclOgnPurSalMngVO PrdcrCrclOgnPurSalMngVO : PrdcrCrclOgnPurSalMngVOList) {
			savedCnt += insertPrdcrCrclOgnPurSalMng01(PrdcrCrclOgnPurSalMngVO);
			/*
			if(ComConstants.ROW_STS_INSERT.equals(PrdcrCrclOgnPurSalMngVO.getRowSts())) {
				savedCnt += insertPrdcrCrclOgnPurSalMng01(PrdcrCrclOgnPurSalMngVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(PrdcrCrclOgnPurSalMngVO.getRowSts())) {
				savedCnt += updatePrdcrCrclOgnPurSalMng(PrdcrCrclOgnPurSalMngVO);
			}
			*/
		}
		return savedCnt;
	}

	@Override
	public int multiSavePrdcrCrclOgnPurSalMngList02(List<PrdcrCrclOgnPurSalMngVO> PrdcrCrclOgnPurSalMngVOList) throws Exception {
		int savedCnt = 0;
		for (PrdcrCrclOgnPurSalMngVO PrdcrCrclOgnPurSalMngVO : PrdcrCrclOgnPurSalMngVOList) {
			savedCnt += insertPrdcrCrclOgnPurSalMng02(PrdcrCrclOgnPurSalMngVO);
		}
		return savedCnt;
	}

	@Override
	public int multiSavePrdcrCrclOgnPurSalMngList03(List<PrdcrCrclOgnPurSalMngVO> PrdcrCrclOgnPurSalMngVOList) throws Exception {
		int savedCnt = 0;
		for (PrdcrCrclOgnPurSalMngVO PrdcrCrclOgnPurSalMngVO : PrdcrCrclOgnPurSalMngVOList) {
			savedCnt += insertPrdcrCrclOgnPurSalMng03(PrdcrCrclOgnPurSalMngVO);
		}
		return savedCnt;
	}

	@Override
	public int deletePrdcrCrclOgnPurSalMng(PrdcrCrclOgnPurSalMngVO PrdcrCrclOgnPurSalMngVO) throws Exception {
		return PrdcrCrclOgnPurSalMngMapper.deletePrdcrCrclOgnPurSalMng(PrdcrCrclOgnPurSalMngVO);
	}

	@Override
	public List<PrdcrCrclOgnPurSalMngVO> selectRawDataList(PrdcrCrclOgnPurSalMngVO PrdcrCrclOgnPurSalMngVO) throws Exception {

		List<PrdcrCrclOgnPurSalMngVO> resultList = PrdcrCrclOgnPurSalMngMapper.selectRawDataList(PrdcrCrclOgnPurSalMngVO);
		return resultList;
	}

}
