package com.at.apcss.pd.pcorm.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.fm.bbs.mapper.BbsMapper;
import com.at.apcss.fm.bbs.service.BbsService;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.pd.pcorm.mapper.PrdcrCrclOgnVluFndsMngMapper;
import com.at.apcss.pd.pcorm.service.PrdcrCrclOgnVluFndsMngService;
import com.at.apcss.pd.pcorm.vo.PrdcrCrclOgnVluFndsMngVO;


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
@Service("prdcrCrclOgnVluFndsMngService")
public class PrdcrCrclOgnVluFndsMngServiceImpl extends BaseServiceImpl implements PrdcrCrclOgnVluFndsMngService{

	@Autowired
	private PrdcrCrclOgnVluFndsMngMapper prdcrCrclOgnVluFndsMngMapper;

	@Override
	public PrdcrCrclOgnVluFndsMngVO selectPrdcrCrclOgnVluFndsMng(PrdcrCrclOgnVluFndsMngVO prdcrCrclOgnVluFndsMngVO) throws Exception {

		PrdcrCrclOgnVluFndsMngVO resultVO = prdcrCrclOgnVluFndsMngMapper.selectPrdcrCrclOgnVluFndsMng(prdcrCrclOgnVluFndsMngVO);

		return resultVO;
	}

	@Override
	public List<PrdcrCrclOgnVluFndsMngVO> selectPrdcrCrclOgnVluFndsMngList(PrdcrCrclOgnVluFndsMngVO prdcrCrclOgnVluFndsMngVO) throws Exception {

		List<PrdcrCrclOgnVluFndsMngVO> resultList = prdcrCrclOgnVluFndsMngMapper.selectPrdcrCrclOgnVluFndsMngList(prdcrCrclOgnVluFndsMngVO);
		return resultList;
	}

	@Override
	public int insertPrdcrCrclOgnVluFndsMng(PrdcrCrclOgnVluFndsMngVO prdcrCrclOgnVluFndsMngVO) throws Exception {

		int insertedCnt = prdcrCrclOgnVluFndsMngMapper.insertPrdcrCrclOgnVluFndsMng(prdcrCrclOgnVluFndsMngVO);

		return insertedCnt;
	}

	@Override
	public int updatePrdcrCrclOgnVluFndsMng(PrdcrCrclOgnVluFndsMngVO prdcrCrclOgnVluFndsMngVO) throws Exception {

		int updatedCnt = prdcrCrclOgnVluFndsMngMapper.updatePrdcrCrclOgnVluFndsMng(prdcrCrclOgnVluFndsMngVO);

		return updatedCnt;
	}

	@Override
	public int multiSavePrdcrCrclOgnVluFndsMngList(List<PrdcrCrclOgnVluFndsMngVO> prdcrCrclOgnVluFndsMngVOList) throws Exception {
		int savedCnt = 0;
		for (PrdcrCrclOgnVluFndsMngVO prdcrCrclOgnVluFndsMngVO : prdcrCrclOgnVluFndsMngVOList) {
			if(ComConstants.ROW_STS_INSERT.equals(prdcrCrclOgnVluFndsMngVO.getRowSts())) {
				savedCnt += insertPrdcrCrclOgnVluFndsMng(prdcrCrclOgnVluFndsMngVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(prdcrCrclOgnVluFndsMngVO.getRowSts())) {
				savedCnt += updatePrdcrCrclOgnVluFndsMng(prdcrCrclOgnVluFndsMngVO);
			}
		}
		return savedCnt;
	}

	@Override
	public int deletePrdcrCrclOgnVluFndsMng(PrdcrCrclOgnVluFndsMngVO prdcrCrclOgnVluFndsMngVO) throws Exception {
		return prdcrCrclOgnVluFndsMngMapper.deletePrdcrCrclOgnVluFndsMng(prdcrCrclOgnVluFndsMngVO);
	}

}
