package com.at.apcss.pd.bsm.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.fm.bbs.mapper.BbsMapper;
import com.at.apcss.fm.bbs.service.BbsService;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.pd.bsm.mapper.PrdcrCrclOgnMngMapper;
import com.at.apcss.pd.bsm.service.PrdcrCrclOgnMngService;
import com.at.apcss.pd.bsm.vo.PrdcrCrclOgnMngVO;


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
public class PrdcrCrclOgnMngServiceImpl implements PrdcrCrclOgnMngService{

	@Autowired
	private PrdcrCrclOgnMngMapper PrdcrCrclOgnMngMapper;

	@Override
	public PrdcrCrclOgnMngVO selectPrdcrCrclOgnMng(PrdcrCrclOgnMngVO PrdcrCrclOgnMngVO) throws Exception {

		PrdcrCrclOgnMngVO resultVO = PrdcrCrclOgnMngMapper.selectPrdcrCrclOgnMng(PrdcrCrclOgnMngVO);

		return resultVO;
	}

	@Override
	public List<PrdcrCrclOgnMngVO> selectPrdcrCrclOgnMngList(PrdcrCrclOgnMngVO PrdcrCrclOgnMngVO) throws Exception {

		List<PrdcrCrclOgnMngVO> resultList = PrdcrCrclOgnMngMapper.selectPrdcrCrclOgnMngList(PrdcrCrclOgnMngVO);
		return resultList;
	}

	@Override
	public int insertPrdcrCrclOgnMng(PrdcrCrclOgnMngVO PrdcrCrclOgnMngVO) throws Exception {

		int insertedCnt = PrdcrCrclOgnMngMapper.insertPrdcrCrclOgnMng(PrdcrCrclOgnMngVO);

		return insertedCnt;
	}

	@Override
	public int updatePrdcrCrclOgnMng(PrdcrCrclOgnMngVO PrdcrCrclOgnMngVO) throws Exception {

		int updatedCnt = PrdcrCrclOgnMngMapper.updatePrdcrCrclOgnMng(PrdcrCrclOgnMngVO);

		return updatedCnt;
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
		return PrdcrCrclOgnMngMapper.deletePrdcrCrclOgnMng(PrdcrCrclOgnMngVO);
	}

}
