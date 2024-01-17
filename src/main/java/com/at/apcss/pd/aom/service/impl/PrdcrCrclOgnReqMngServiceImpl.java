package com.at.apcss.pd.aom.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.pd.aom.mapper.PrdcrCrclOgnReqMngMapper;
import com.at.apcss.pd.aom.service.PrdcrCrclOgnReqMngService;
import com.at.apcss.pd.aom.vo.PrdcrCrclOgnReqMngVO;
import com.at.apcss.pd.aom.vo.GpcVO;


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
@Service("PrdcrCrclOgnReqMngService")
public class PrdcrCrclOgnReqMngServiceImpl extends BaseServiceImpl implements PrdcrCrclOgnReqMngService{

	@Autowired
	private PrdcrCrclOgnReqMngMapper PrdcrCrclOgnReqMngMapper;

	@Override
	public PrdcrCrclOgnReqMngVO selectPrdcrCrclOgnReqMng(PrdcrCrclOgnReqMngVO PrdcrCrclOgnReqMngVO) throws Exception {

		PrdcrCrclOgnReqMngVO resultVO = PrdcrCrclOgnReqMngMapper.selectPrdcrCrclOgnReqMng(PrdcrCrclOgnReqMngVO);

		return resultVO;
	}

	@Override
	public List<PrdcrCrclOgnReqMngVO> selectPrdcrCrclOgnReqMngList(PrdcrCrclOgnReqMngVO PrdcrCrclOgnReqMngVO) throws Exception {

		List<PrdcrCrclOgnReqMngVO> resultList = PrdcrCrclOgnReqMngMapper.selectPrdcrCrclOgnReqMngList(PrdcrCrclOgnReqMngVO);
		return resultList;
	}

	@Override
	public int insertPrdcrCrclOgnReqMng(PrdcrCrclOgnReqMngVO PrdcrCrclOgnReqMngVO) throws Exception {

		int insertedCnt = PrdcrCrclOgnReqMngMapper.insertPrdcrCrclOgnReqMng(PrdcrCrclOgnReqMngVO);

		return insertedCnt;
	}

	@Override
	public int updatePrdcrCrclOgnReqMng(PrdcrCrclOgnReqMngVO PrdcrCrclOgnReqMngVO) throws Exception {

		int updatedCnt = PrdcrCrclOgnReqMngMapper.updatePrdcrCrclOgnReqMng(PrdcrCrclOgnReqMngVO);
		updatedCnt += PrdcrCrclOgnReqMngMapper.insertEvAplyMng(PrdcrCrclOgnReqMngVO);
		return updatedCnt;
	}

	@Override
	public int multiSavePrdcrCrclOgnReqMngList(List<PrdcrCrclOgnReqMngVO> PrdcrCrclOgnReqMngVOList) throws Exception {
		int savedCnt = 0;
		for (PrdcrCrclOgnReqMngVO PrdcrCrclOgnReqMngVO : PrdcrCrclOgnReqMngVOList) {
			if(ComConstants.ROW_STS_INSERT.equals(PrdcrCrclOgnReqMngVO.getRowSts())) {
				savedCnt += insertPrdcrCrclOgnReqMng(PrdcrCrclOgnReqMngVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(PrdcrCrclOgnReqMngVO.getRowSts())) {
				savedCnt += updatePrdcrCrclOgnReqMng(PrdcrCrclOgnReqMngVO);
			}
		}
		return savedCnt;
	}

	@Override
	public int deletePrdcrCrclOgnReqMng(PrdcrCrclOgnReqMngVO PrdcrCrclOgnReqMngVO) throws Exception {
		return PrdcrCrclOgnReqMngMapper.deletePrdcrCrclOgnReqMng(PrdcrCrclOgnReqMngVO);
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

		int insertedCnt = PrdcrCrclOgnReqMngMapper.insertGpc(gpcVO);

		return insertedCnt;
	}

	@Override
	public List<GpcVO> selectGpcList(GpcVO gpcVO) throws Exception {
		List<GpcVO> resultList = PrdcrCrclOgnReqMngMapper.selectGpcList(gpcVO);
		return resultList;
	}

	@Override
	public int deleteGpc(GpcVO gpcVO) throws Exception {

		int insertedCnt = PrdcrCrclOgnReqMngMapper.deleteGpc(gpcVO);

		return insertedCnt;
	}

	@Override
	public int updateCorpDdlnSeCd(PrdcrCrclOgnReqMngVO PrdcrCrclOgnReqMngVO) throws Exception {
		return PrdcrCrclOgnReqMngMapper.updateCorpDdlnSeCd(PrdcrCrclOgnReqMngVO);
	}
}
