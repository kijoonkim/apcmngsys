package com.at.apcss.pd.bsm.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.pd.bsm.mapper.PrdcrCrclOgnMngMapper;
import com.at.apcss.pd.bsm.service.PrdcrCrclOgnMngService;
import com.at.apcss.pd.bsm.vo.PrdcrCrclOgnMngVO;
import com.at.apcss.pd.bsm.vo.UoListVO;


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
@Service("PrdcrCrclOgnMngService")
public class PrdcrCrclOgnMngServiceImpl extends BaseServiceImpl implements PrdcrCrclOgnMngService{

	@Autowired
	private PrdcrCrclOgnMngMapper prdcrCrclOgnMngMapper;

	@Override
	public PrdcrCrclOgnMngVO selectPrdcrCrclOgnMng(PrdcrCrclOgnMngVO PrdcrCrclOgnMngVO) throws Exception {

		return prdcrCrclOgnMngMapper.selectPrdcrCrclOgnMng(PrdcrCrclOgnMngVO);
	}

	@Override
	public List<PrdcrCrclOgnMngVO> selectPrdcrCrclOgnMngList(PrdcrCrclOgnMngVO PrdcrCrclOgnMngVO) throws Exception {

		return prdcrCrclOgnMngMapper.selectPrdcrCrclOgnMngList(PrdcrCrclOgnMngVO);
	}

	@Override
	public int insertPrdcrCrclOgnMng(PrdcrCrclOgnMngVO PrdcrCrclOgnMngVO) throws Exception {

		int insertedCnt = prdcrCrclOgnMngMapper.insertPrdcrCrclOgnMng(PrdcrCrclOgnMngVO);
		updatePrdcrCrclOgnMngHstry(PrdcrCrclOgnMngVO);
		return insertedCnt;
	}

	@Override
	public int updatePrdcrCrclOgnMng(PrdcrCrclOgnMngVO PrdcrCrclOgnMngVO) throws Exception {

		int updatedCnt = prdcrCrclOgnMngMapper.updatePrdcrCrclOgnMng(PrdcrCrclOgnMngVO);
		updatePrdcrCrclOgnMngHstry(PrdcrCrclOgnMngVO);
		return updatedCnt;
	}

	@Override
	public int updatePrdcrCrclOgnMngHstry(PrdcrCrclOgnMngVO PrdcrCrclOgnMngVO) throws Exception {

		return prdcrCrclOgnMngMapper.updatePrdcrCrclOgnMngHstry(PrdcrCrclOgnMngVO);
	}

	@Override
	public int multiSavePrdcrCrclOgnMngList(List<PrdcrCrclOgnMngVO> PrdcrCrclOgnMngVOList) throws Exception {
		int savedCnt = 0;
		for (PrdcrCrclOgnMngVO PrdcrCrclOgnMngVO : PrdcrCrclOgnMngVOList) {
			if(ComConstants.ROW_STS_INSERT.equals(PrdcrCrclOgnMngVO.getRowSts())) {
				savedCnt += insertPrdcrCrclOgnMng(PrdcrCrclOgnMngVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(PrdcrCrclOgnMngVO.getRowSts())) {
				savedCnt += updatePrdcrCrclOgnMng(PrdcrCrclOgnMngVO);
			}
		}
		return savedCnt;
	}

	@Override
	public int deletePrdcrCrclOgnMng(PrdcrCrclOgnMngVO PrdcrCrclOgnMngVO) throws Exception {
		return prdcrCrclOgnMngMapper.deletePrdcrCrclOgnMng(PrdcrCrclOgnMngVO);
	}



	@Override
	public UoListVO selectUo(UoListVO uoListVO) throws Exception {

		return prdcrCrclOgnMngMapper.selectUo(uoListVO);
	}

	@Override
	public List<UoListVO> selectUoList(UoListVO uoListVO) throws Exception {
		return prdcrCrclOgnMngMapper.selectUoList(uoListVO);
	}

	@Override
	public List<UoListVO> selectUoHstryList(UoListVO uoListVO) throws Exception {
		return prdcrCrclOgnMngMapper.selectUoHstryList(uoListVO);
	}

	@Override
	public int multiSaveUoList(List<UoListVO> uoListVOList) throws Exception {
		int savedCnt = 0;
		for (UoListVO UoListVO : uoListVOList) {
			if(ComConstants.ROW_STS_INSERT.equals(UoListVO.getRowSts())) {
				savedCnt += insertUo(UoListVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(UoListVO.getRowSts())) {
				savedCnt += updateUo(UoListVO);
			}
		}
		return savedCnt;
	}
	@Override
	public int insertUo(UoListVO uoListVO) throws Exception {

		return prdcrCrclOgnMngMapper.insertUo(uoListVO);
	}

	@Override
	public int updateUo(UoListVO uoListVO) throws Exception {

		return prdcrCrclOgnMngMapper.updateUo(uoListVO);
	}

	@Override
	public int deleteUo(UoListVO uoListVO) throws Exception {
		return prdcrCrclOgnMngMapper.deleteUo(uoListVO);
	}

	@Override
	public List<PrdcrCrclOgnMngVO> selectPrdcrCrclOgnMngRowDataList(PrdcrCrclOgnMngVO PrdcrCrclOgnMngVO) throws Exception {
		return prdcrCrclOgnMngMapper.selectPrdcrCrclOgnMngRowDataList(PrdcrCrclOgnMngVO);
	}

	@Override
	public PrdcrCrclOgnMngVO selectSetYear(PrdcrCrclOgnMngVO PrdcrCrclOgnMngVO) throws Exception {
		return prdcrCrclOgnMngMapper.selectSetYear(PrdcrCrclOgnMngVO);
	}

}
