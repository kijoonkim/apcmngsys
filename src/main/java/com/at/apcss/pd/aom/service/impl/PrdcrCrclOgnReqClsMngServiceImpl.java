package com.at.apcss.pd.aom.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.fm.bbs.mapper.BbsMapper;
import com.at.apcss.fm.bbs.service.BbsService;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.pd.aom.mapper.PrdcrCrclOgnReqClsMngMapper;
import com.at.apcss.pd.aom.service.PrdcrCrclOgnReqClsMngService;
import com.at.apcss.pd.aom.vo.PrdcrCrclOgnReqClsMngVO;


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
@Service("PrdcrCrclOgnReqClsMngService")
public class PrdcrCrclOgnReqClsMngServiceImpl implements PrdcrCrclOgnReqClsMngService{

	@Autowired
	private PrdcrCrclOgnReqClsMngMapper PrdcrCrclOgnReqClsMngMapper;

	@Override
	public PrdcrCrclOgnReqClsMngVO selectPrdcrCrclOgnReqClsMng(PrdcrCrclOgnReqClsMngVO PrdcrCrclOgnReqClsMngVO) throws Exception {

		PrdcrCrclOgnReqClsMngVO resultVO = PrdcrCrclOgnReqClsMngMapper.selectPrdcrCrclOgnReqClsMng(PrdcrCrclOgnReqClsMngVO);

		return resultVO;
	}

	@Override
	public List<PrdcrCrclOgnReqClsMngVO> selectPrdcrCrclOgnReqClsMngList(PrdcrCrclOgnReqClsMngVO PrdcrCrclOgnReqClsMngVO) throws Exception {

		List<PrdcrCrclOgnReqClsMngVO> resultList = PrdcrCrclOgnReqClsMngMapper.selectPrdcrCrclOgnReqClsMngList(PrdcrCrclOgnReqClsMngVO);
		return resultList;
	}

	@Override
	public int insertPrdcrCrclOgnReqClsMng(PrdcrCrclOgnReqClsMngVO PrdcrCrclOgnReqClsMngVO) throws Exception {

		int insertedCnt = PrdcrCrclOgnReqClsMngMapper.insertPrdcrCrclOgnReqClsMng(PrdcrCrclOgnReqClsMngVO);

		return insertedCnt;
	}

	@Override
	public int updatePrdcrCrclOgnReqClsMng(PrdcrCrclOgnReqClsMngVO PrdcrCrclOgnReqClsMngVO) throws Exception {

		int updatedCnt = PrdcrCrclOgnReqClsMngMapper.updatePrdcrCrclOgnReqClsMng(PrdcrCrclOgnReqClsMngVO);

		return updatedCnt;
	}

	@Override
	public int multiSavePrdcrCrclOgnReqClsMngList(List<PrdcrCrclOgnReqClsMngVO> PrdcrCrclOgnReqClsMngVOList) throws Exception {
		int savedCnt = 0;
		for (PrdcrCrclOgnReqClsMngVO PrdcrCrclOgnReqClsMngVO : PrdcrCrclOgnReqClsMngVOList) {
			if(ComConstants.ROW_STS_INSERT.equals(PrdcrCrclOgnReqClsMngVO.getRowSts())) {
				savedCnt += insertPrdcrCrclOgnReqClsMng(PrdcrCrclOgnReqClsMngVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(PrdcrCrclOgnReqClsMngVO.getRowSts())) {
				savedCnt += updatePrdcrCrclOgnReqClsMng(PrdcrCrclOgnReqClsMngVO);
			}
		}
		return savedCnt;
	}

	@Override
	public int deletePrdcrCrclOgnReqClsMng(PrdcrCrclOgnReqClsMngVO PrdcrCrclOgnReqClsMngVO) throws Exception {
		return PrdcrCrclOgnReqClsMngMapper.deletePrdcrCrclOgnReqClsMng(PrdcrCrclOgnReqClsMngVO);
	}

}
