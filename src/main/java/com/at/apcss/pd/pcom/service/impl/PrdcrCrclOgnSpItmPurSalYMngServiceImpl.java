package com.at.apcss.pd.pcom.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.fm.bbs.mapper.BbsMapper;
import com.at.apcss.fm.bbs.service.BbsService;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.pd.pcom.mapper.PrdcrCrclOgnSpItmPurSalYMngMapper;
import com.at.apcss.pd.pcom.service.PrdcrCrclOgnSpItmPurSalYMngService;
import com.at.apcss.pd.pcom.vo.PrdcrCrclOgnSpItmPurSalYMngVO;


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
@Service("PrdcrCrclOgnSpItmPurSalYMngService")
public class PrdcrCrclOgnSpItmPurSalYMngServiceImpl implements PrdcrCrclOgnSpItmPurSalYMngService{

	@Autowired
	private PrdcrCrclOgnSpItmPurSalYMngMapper PrdcrCrclOgnSpItmPurSalYMngMapper;

	@Override
	public PrdcrCrclOgnSpItmPurSalYMngVO selectPrdcrCrclOgnSpItmPurSalYMng(PrdcrCrclOgnSpItmPurSalYMngVO PrdcrCrclOgnSpItmPurSalYMngVO) throws Exception {

		PrdcrCrclOgnSpItmPurSalYMngVO resultVO = PrdcrCrclOgnSpItmPurSalYMngMapper.selectPrdcrCrclOgnSpItmPurSalYMng(PrdcrCrclOgnSpItmPurSalYMngVO);

		return resultVO;
	}

	@Override
	public List<PrdcrCrclOgnSpItmPurSalYMngVO> selectPrdcrCrclOgnSpItmPurSalYMngList(PrdcrCrclOgnSpItmPurSalYMngVO PrdcrCrclOgnSpItmPurSalYMngVO) throws Exception {

		List<PrdcrCrclOgnSpItmPurSalYMngVO> resultList = PrdcrCrclOgnSpItmPurSalYMngMapper.selectPrdcrCrclOgnSpItmPurSalYMngList(PrdcrCrclOgnSpItmPurSalYMngVO);
		return resultList;
	}

	@Override
	public int insertPrdcrCrclOgnSpItmPurSalYMng(PrdcrCrclOgnSpItmPurSalYMngVO PrdcrCrclOgnSpItmPurSalYMngVO) throws Exception {

		int insertedCnt = PrdcrCrclOgnSpItmPurSalYMngMapper.insertPrdcrCrclOgnSpItmPurSalYMng(PrdcrCrclOgnSpItmPurSalYMngVO);

		return insertedCnt;
	}

	@Override
	public int updatePrdcrCrclOgnSpItmPurSalYMng(PrdcrCrclOgnSpItmPurSalYMngVO PrdcrCrclOgnSpItmPurSalYMngVO) throws Exception {

		int updatedCnt = PrdcrCrclOgnSpItmPurSalYMngMapper.updatePrdcrCrclOgnSpItmPurSalYMng(PrdcrCrclOgnSpItmPurSalYMngVO);

		return updatedCnt;
	}

	@Override
	public int multiSavePrdcrCrclOgnSpItmPurSalYMngList(List<PrdcrCrclOgnSpItmPurSalYMngVO> PrdcrCrclOgnSpItmPurSalYMngVOList) throws Exception {
		int savedCnt = 0;
		for (PrdcrCrclOgnSpItmPurSalYMngVO PrdcrCrclOgnSpItmPurSalYMngVO : PrdcrCrclOgnSpItmPurSalYMngVOList) {
			if(ComConstants.ROW_STS_INSERT.equals(PrdcrCrclOgnSpItmPurSalYMngVO.getRowSts())) {
				savedCnt += insertPrdcrCrclOgnSpItmPurSalYMng(PrdcrCrclOgnSpItmPurSalYMngVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(PrdcrCrclOgnSpItmPurSalYMngVO.getRowSts())) {
				savedCnt += updatePrdcrCrclOgnSpItmPurSalYMng(PrdcrCrclOgnSpItmPurSalYMngVO);
			}
		}
		return savedCnt;
	}

	@Override
	public int deletePrdcrCrclOgnSpItmPurSalYMng(PrdcrCrclOgnSpItmPurSalYMngVO PrdcrCrclOgnSpItmPurSalYMngVO) throws Exception {
		return PrdcrCrclOgnSpItmPurSalYMngMapper.deletePrdcrCrclOgnSpItmPurSalYMng(PrdcrCrclOgnSpItmPurSalYMngVO);
	}

}
