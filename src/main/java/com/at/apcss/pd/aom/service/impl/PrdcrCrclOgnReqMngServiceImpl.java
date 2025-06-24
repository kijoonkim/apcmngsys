package com.at.apcss.pd.aom.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.pd.aom.mapper.PrdcrCrclOgnReqMngMapper;
import com.at.apcss.pd.aom.service.PrdcrCrclOgnReqMngService;
import com.at.apcss.pd.aom.vo.PrdcrCrclOgnReqMngVO;
import com.at.apcss.pd.aom.vo.ApcInfoVO;
import com.at.apcss.pd.aom.vo.GpcVO;
import com.at.apcss.pd.aom.vo.LoanVO;


/**
 * @Class Name : BbsServiceImpl.java
 * @Description : 게시판 서비스를 정의하기 위한 서비스 구현 클래스
 * @author
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21          최초 생성
 * </pre>
 */
@Service("PrdcrCrclOgnReqMngService")
public class PrdcrCrclOgnReqMngServiceImpl extends BaseServiceImpl implements PrdcrCrclOgnReqMngService{

	@Autowired
	private PrdcrCrclOgnReqMngMapper prdcrCrclOgnReqMngMapper;

	@Override
	public PrdcrCrclOgnReqMngVO selectPrdcrCrclOgnReqMng(PrdcrCrclOgnReqMngVO prdcrCrclOgnReqMngVO) throws Exception {

		return prdcrCrclOgnReqMngMapper.selectPrdcrCrclOgnReqMng(prdcrCrclOgnReqMngVO);
	}

	@Override
	public List<PrdcrCrclOgnReqMngVO> selectPrdcrCrclOgnReqMngList(PrdcrCrclOgnReqMngVO prdcrCrclOgnReqMngVO) throws Exception {
		return prdcrCrclOgnReqMngMapper.selectPrdcrCrclOgnReqMngList(prdcrCrclOgnReqMngVO);
	}

	@Override
	public List<PrdcrCrclOgnReqMngVO> selectUoIsoOgnzList(PrdcrCrclOgnReqMngVO prdcrCrclOgnReqMngVO) throws Exception {
		int yr = Integer.parseInt(prdcrCrclOgnReqMngVO.getYr());
		if (yr < 2025) {
			prdcrCrclOgnReqMngVO.setOldDataYn(ComConstants.CON_YES);
		}
		return prdcrCrclOgnReqMngMapper.selectUoIsoOgnzList(prdcrCrclOgnReqMngVO);
	}

	@Override
	public int insertPrdcrCrclOgnReqMng(PrdcrCrclOgnReqMngVO prdcrCrclOgnReqMngVO) throws Exception {

		int insertedCnt = prdcrCrclOgnReqMngMapper.insertPrdcrCrclOgnReqMng(prdcrCrclOgnReqMngVO);

		return insertedCnt;
	}

	@Override
	public int updatePrdcrCrclOgnReqMng(PrdcrCrclOgnReqMngVO prdcrCrclOgnReqMngVO) throws Exception {
		int updatedCnt = prdcrCrclOgnReqMngMapper.updatePrdcrCrclOgnReqMng(prdcrCrclOgnReqMngVO);
		prdcrCrclOgnReqMngMapper.updatePrdcrCrclOgnReqMngHstry(prdcrCrclOgnReqMngVO);
		updatedCnt += prdcrCrclOgnReqMngMapper.insertEvAplyMng(prdcrCrclOgnReqMngVO);
		return updatedCnt;
	}

	@Override
	public int multiSavePrdcrCrclOgnReqMngList(List<PrdcrCrclOgnReqMngVO> prdcrCrclOgnReqMngVOList) throws Exception {
		int savedCnt = 0;
		for (PrdcrCrclOgnReqMngVO prdcrCrclOgnReqMngVO : prdcrCrclOgnReqMngVOList) {
			if(ComConstants.ROW_STS_INSERT.equals(prdcrCrclOgnReqMngVO.getRowSts())) {
				savedCnt += insertPrdcrCrclOgnReqMng(prdcrCrclOgnReqMngVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(prdcrCrclOgnReqMngVO.getRowSts())) {
				savedCnt += updatePrdcrCrclOgnReqMng(prdcrCrclOgnReqMngVO);
			}
		}
		return savedCnt;
	}

	@Override
	public int multiSaveGpcList(List<GpcVO> gpcVOList) throws Exception {
		int savedCnt = 0;
		for (GpcVO gpcVO : gpcVOList) {
			savedCnt += insertGpc(gpcVO);
		}
		return savedCnt;
	}

	@Override
	public int insertGpc(GpcVO gpcVO) throws Exception {

		int insertedCnt = prdcrCrclOgnReqMngMapper.insertGpc(gpcVO);

		return insertedCnt;
	}

	@Override
	public List<GpcVO> selectGpcList(GpcVO gpcVO) throws Exception {
		List<GpcVO> resultList = prdcrCrclOgnReqMngMapper.selectGpcList(gpcVO);
		return resultList;
	}

	@Override
	public int deleteGpc(GpcVO gpcVO) throws Exception {

		int insertedCnt = prdcrCrclOgnReqMngMapper.deleteGpc(gpcVO);

		return insertedCnt;
	}

	@Override
	public int updateCorpDdlnSeCd(PrdcrCrclOgnReqMngVO prdcrCrclOgnReqMngVO) throws Exception {
		return prdcrCrclOgnReqMngMapper.updateCorpDdlnSeCd(prdcrCrclOgnReqMngVO);
	}

	@Override
	public List<PrdcrCrclOgnReqMngVO> hiddenGrdUoSelectList(PrdcrCrclOgnReqMngVO prdcrCrclOgnReqMngVO) throws Exception {

		return prdcrCrclOgnReqMngMapper.hiddenGrdUoSelectList(prdcrCrclOgnReqMngVO);
	}

	@Override
	public List<ApcInfoVO> SelectApcInfoList(ApcInfoVO apcInfoVO) throws Exception {

		List<ApcInfoVO> resultList = prdcrCrclOgnReqMngMapper.SelectApcInfoList(apcInfoVO);
		return resultList;
	}

	@Override
	public int deleteUoAply(PrdcrCrclOgnReqMngVO prdcrCrclOgnReqMngVO) throws Exception {
		return prdcrCrclOgnReqMngMapper.deleteUoAply(prdcrCrclOgnReqMngVO);
	}

	@Override
	public int deleteUoUoCd(PrdcrCrclOgnReqMngVO prdcrCrclOgnReqMngVO) throws Exception {
		return prdcrCrclOgnReqMngMapper.deleteUoUoCd(prdcrCrclOgnReqMngVO);
	}

	@Override
	public int deleteUoItem(PrdcrCrclOgnReqMngVO prdcrCrclOgnReqMngVO) throws Exception {
		return prdcrCrclOgnReqMngMapper.deleteUoItem(prdcrCrclOgnReqMngVO);
	}

	@Override
	public int updateUoApoSe(PrdcrCrclOgnReqMngVO prdcrCrclOgnReqMngVO) throws Exception {
		int updatedCnt = prdcrCrclOgnReqMngMapper.updateUoApoSe(prdcrCrclOgnReqMngVO);
		prdcrCrclOgnReqMngMapper.updateUoApoSeHstry(prdcrCrclOgnReqMngVO);
		return updatedCnt;
	}

	@Override
	public List<LoanVO> selectLoanList(LoanVO loanVO) throws Exception {
		return prdcrCrclOgnReqMngMapper.selectLoanList(loanVO);
	}

	@Override
	public int updateLoanChk(LoanVO loanVO) throws Exception {
		return prdcrCrclOgnReqMngMapper.updateLoanChk(loanVO);
	}
}
