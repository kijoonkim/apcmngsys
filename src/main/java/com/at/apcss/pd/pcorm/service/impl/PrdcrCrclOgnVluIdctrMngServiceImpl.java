package com.at.apcss.pd.pcorm.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.fm.bbs.mapper.BbsMapper;
import com.at.apcss.fm.bbs.service.BbsService;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.pd.pcorm.mapper.PrdcrCrclOgnVluIdctrMngMapper;
import com.at.apcss.pd.pcorm.service.PrdcrCrclOgnVluIdctrMngService;
import com.at.apcss.pd.pcorm.vo.PrdcrCrclOgnVluIdctrMngVO;


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
@Service("prdcrCrclOgnVluIdctrMngService")
public class PrdcrCrclOgnVluIdctrMngServiceImpl implements PrdcrCrclOgnVluIdctrMngService{

	@Autowired
	private PrdcrCrclOgnVluIdctrMngMapper prdcrCrclOgnVluIdctrMngMapper;

	@Override
	public PrdcrCrclOgnVluIdctrMngVO selectPrdcrCrclOgnVluIdctrMng(PrdcrCrclOgnVluIdctrMngVO prdcrCrclOgnVluIdctrMngVO) throws Exception {

		PrdcrCrclOgnVluIdctrMngVO resultVO = prdcrCrclOgnVluIdctrMngMapper.selectPrdcrCrclOgnVluIdctrMng(prdcrCrclOgnVluIdctrMngVO);

		return resultVO;
	}

	@Override
	public List<PrdcrCrclOgnVluIdctrMngVO> selectPrdcrCrclOgnVluIdctrMngList(PrdcrCrclOgnVluIdctrMngVO prdcrCrclOgnVluIdctrMngVO) throws Exception {

		List<PrdcrCrclOgnVluIdctrMngVO> resultList = prdcrCrclOgnVluIdctrMngMapper.selectPrdcrCrclOgnVluIdctrMngList(prdcrCrclOgnVluIdctrMngVO);
		return resultList;
	}

	@Override
	public int insertPrdcrCrclOgnVluIdctrMng(PrdcrCrclOgnVluIdctrMngVO prdcrCrclOgnVluIdctrMngVO) throws Exception {

		int insertedCnt = prdcrCrclOgnVluIdctrMngMapper.insertPrdcrCrclOgnVluIdctrMng(prdcrCrclOgnVluIdctrMngVO);

		return insertedCnt;
	}

	@Override
	public int updatePrdcrCrclOgnVluIdctrMng(PrdcrCrclOgnVluIdctrMngVO prdcrCrclOgnVluIdctrMngVO) throws Exception {

		int updatedCnt = prdcrCrclOgnVluIdctrMngMapper.updatePrdcrCrclOgnVluIdctrMng(prdcrCrclOgnVluIdctrMngVO);

		return updatedCnt;
	}

	@Override
	public int multiSavePrdcrCrclOgnVluIdctrMngList(List<PrdcrCrclOgnVluIdctrMngVO> prdcrCrclOgnVluIdctrMngVOList) throws Exception {
		int savedCnt = 0;
		for (PrdcrCrclOgnVluIdctrMngVO prdcrCrclOgnVluIdctrMngVO : prdcrCrclOgnVluIdctrMngVOList) {
			if(ComConstants.ROW_STS_INSERT.equals(prdcrCrclOgnVluIdctrMngVO.getRowSts())) {
				savedCnt += insertPrdcrCrclOgnVluIdctrMng(prdcrCrclOgnVluIdctrMngVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(prdcrCrclOgnVluIdctrMngVO.getRowSts())) {
				savedCnt += updatePrdcrCrclOgnVluIdctrMng(prdcrCrclOgnVluIdctrMngVO);
			}
		}
		return savedCnt;
	}

	@Override
	public int deletePrdcrCrclOgnVluIdctrMng(PrdcrCrclOgnVluIdctrMngVO prdcrCrclOgnVluIdctrMngVO) throws Exception {
		return prdcrCrclOgnVluIdctrMngMapper.deletePrdcrCrclOgnVluIdctrMng(prdcrCrclOgnVluIdctrMngVO);
	}

}
