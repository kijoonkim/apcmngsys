package com.at.apcss.pd.pom.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.pd.pom.mapper.PrdcrOgnCurntMngMapper;
import com.at.apcss.pd.pom.service.PrdcrOgnCurntMngService;
import com.at.apcss.pd.pom.vo.PrdcrOgnCurntMngVO;
import com.at.apcss.pd.pom.vo.TbEvFrmhsApoVO;


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
@Service("PrdcrOgnCurntMngService")
public class PrdcrOgnCurntMngServiceImpl extends BaseServiceImpl implements PrdcrOgnCurntMngService{

	@Autowired
	private PrdcrOgnCurntMngMapper PrdcrOgnCurntMngMapper;

	@Override
	public PrdcrOgnCurntMngVO selectPrdcrOgnCurntMng(PrdcrOgnCurntMngVO PrdcrOgnCurntMngVO) throws Exception {

		PrdcrOgnCurntMngVO resultVO = PrdcrOgnCurntMngMapper.selectPrdcrOgnCurntMng(PrdcrOgnCurntMngVO);

		return resultVO;
	}

	@Override
	public List<PrdcrOgnCurntMngVO> selectPrdcrOgnCurntMngList(PrdcrOgnCurntMngVO PrdcrOgnCurntMngVO) throws Exception {

		List<PrdcrOgnCurntMngVO> resultList = PrdcrOgnCurntMngMapper.selectPrdcrOgnCurntMngList(PrdcrOgnCurntMngVO);
		return resultList;
	}

	@Override
	public List<PrdcrOgnCurntMngVO> selectPrdcrOgnCurntMngDtlList(PrdcrOgnCurntMngVO PrdcrOgnCurntMngVO) throws Exception {

		List<PrdcrOgnCurntMngVO> resultList = PrdcrOgnCurntMngMapper.selectPrdcrOgnCurntMngDtlList(PrdcrOgnCurntMngVO);
		return resultList;
	}

	@Override
	public int insertPrdcrOgnCurntMngDtl(PrdcrOgnCurntMngVO PrdcrOgnCurntMngVO) throws Exception {

		int insertedCnt = PrdcrOgnCurntMngMapper.insertPrdcrOgnCurntMngDtl(PrdcrOgnCurntMngVO);

		return insertedCnt;
	}

	@Override
	public int updatePrdcrOgnCurntMng(PrdcrOgnCurntMngVO PrdcrOgnCurntMngVO) throws Exception {

		int updatedCnt = PrdcrOgnCurntMngMapper.updatePrdcrOgnCurntMng(PrdcrOgnCurntMngVO);

		return updatedCnt;
	}

	@Override
	public int multiSavePrdcrOgnCurntMngDtlList(List<PrdcrOgnCurntMngVO> PrdcrOgnCurntMngVOList) throws Exception {
		int savedCnt = 0;
		for (PrdcrOgnCurntMngVO PrdcrOgnCurntMngVO : PrdcrOgnCurntMngVOList) {
			if(ComConstants.ROW_STS_INSERT.equals(PrdcrOgnCurntMngVO.getRowSts())) {
				savedCnt += insertPrdcrOgnCurntMngDtl(PrdcrOgnCurntMngVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(PrdcrOgnCurntMngVO.getRowSts())) {
				savedCnt += updatePrdcrOgnCurntMng(PrdcrOgnCurntMngVO);
			}
		}
		return savedCnt;
	}

	@Override
	public int deletePrdcrOgnCurntMngDtl(PrdcrOgnCurntMngVO PrdcrOgnCurntMngVO) throws Exception {
		return PrdcrOgnCurntMngMapper.deletePrdcrOgnCurntMngDtl(PrdcrOgnCurntMngVO);
	}



	//생산자 조직
	@Override
	public TbEvFrmhsApoVO selectTbEvFrmhsApo(TbEvFrmhsApoVO tbEvFrmhsApoVO) throws Exception {
		TbEvFrmhsApoVO resultVO = PrdcrOgnCurntMngMapper.selectTbEvFrmhsApo(tbEvFrmhsApoVO);

		return resultVO;
	}

	@Override
	public List<TbEvFrmhsApoVO> selectTbEvFrmhsApoList(TbEvFrmhsApoVO tbEvFrmhsApoVO) throws Exception {
		List<TbEvFrmhsApoVO> resultList = PrdcrOgnCurntMngMapper.selectTbEvFrmhsApoList(tbEvFrmhsApoVO);
		return resultList;
	}

	@Override
	public int multiSaveTbEvFrmhsApoList(List<TbEvFrmhsApoVO> tbEvFrmhsApoVOList) throws Exception {
		int savedCnt = 0;
		for (TbEvFrmhsApoVO tbEvFrmhsApoVO : tbEvFrmhsApoVOList) {
			savedCnt += insertTbEvFrmhsApo(tbEvFrmhsApoVO);
			//생산자조직 품목,취급유형,전문육성구분 수정
			updateTbEvFrmhsPrdctnEcSpmtSttnApo(tbEvFrmhsApoVO);
		}
		return savedCnt;
	}

	@Override
	public int insertTbEvFrmhsApo(TbEvFrmhsApoVO tbEvFrmhsApoVO) throws Exception {
		int insertedCnt = PrdcrOgnCurntMngMapper.insertTbEvFrmhsApo(tbEvFrmhsApoVO);
		return insertedCnt;
	}

	@Override
	public int deleteTbEvFrmhsApo(TbEvFrmhsApoVO tbEvFrmhsApoVO) throws Exception {
		int deletedCnt =PrdcrOgnCurntMngMapper.deleteTbEvFrmhsApo(tbEvFrmhsApoVO);
		PrdcrOgnCurntMngMapper.deleteTbEvFrmhsPrdctnEcSpmtSttnApo(tbEvFrmhsApoVO);
		return deletedCnt;
	}

	@Override
	public int deleteTbEvFrmhsPrdctnEcSpmtSttnApo(TbEvFrmhsApoVO tbEvFrmhsApoVO) throws Exception {
		int deletedCnt = PrdcrOgnCurntMngMapper.deleteTbEvFrmhsPrdctnEcSpmtSttnApo(tbEvFrmhsApoVO);
		return deletedCnt;
	}

	@Override
	public int updateTbEvFrmhsPrdctnEcSpmtSttnApo(TbEvFrmhsApoVO tbEvFrmhsApoVO) throws Exception {
		int updatedCnt = PrdcrOgnCurntMngMapper.updateTbEvFrmhsPrdctnEcSpmtSttnApo(tbEvFrmhsApoVO);
		return updatedCnt;
	}
}
