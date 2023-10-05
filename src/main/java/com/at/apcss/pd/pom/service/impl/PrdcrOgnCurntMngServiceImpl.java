package com.at.apcss.pd.pom.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.fm.bbs.mapper.BbsMapper;
import com.at.apcss.fm.bbs.service.BbsService;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.pd.pom.mapper.PrdcrOgnCurntMngMapper;
import com.at.apcss.pd.pom.service.PrdcrOgnCurntMngService;
import com.at.apcss.pd.pom.vo.PrdcrOgnCurntMngVO;


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
public class PrdcrOgnCurntMngServiceImpl implements PrdcrOgnCurntMngService{

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
	public int insertPrdcrOgnCurntMng(PrdcrOgnCurntMngVO PrdcrOgnCurntMngVO) throws Exception {

		int insertedCnt = PrdcrOgnCurntMngMapper.insertPrdcrOgnCurntMng(PrdcrOgnCurntMngVO);

		return insertedCnt;
	}

	@Override
	public int updatePrdcrOgnCurntMng(PrdcrOgnCurntMngVO PrdcrOgnCurntMngVO) throws Exception {

		int updatedCnt = PrdcrOgnCurntMngMapper.updatePrdcrOgnCurntMng(PrdcrOgnCurntMngVO);

		return updatedCnt;
	}

	@Override
	public int multiSavePrdcrOgnCurntMngList(List<PrdcrOgnCurntMngVO> PrdcrOgnCurntMngVOList) throws Exception {
		int savedCnt = 0;
		for (PrdcrOgnCurntMngVO PrdcrOgnCurntMngVO : PrdcrOgnCurntMngVOList) {
			if(ComConstants.ROW_STS_INSERT.equals(PrdcrOgnCurntMngVO.getRowSts())) {
				savedCnt += insertPrdcrOgnCurntMng(PrdcrOgnCurntMngVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(PrdcrOgnCurntMngVO.getRowSts())) {
				savedCnt += updatePrdcrOgnCurntMng(PrdcrOgnCurntMngVO);
			}
		}
		return savedCnt;
	}

	@Override
	public int deletePrdcrOgnCurntMng(PrdcrOgnCurntMngVO PrdcrOgnCurntMngVO) throws Exception {
		return PrdcrOgnCurntMngMapper.deletePrdcrOgnCurntMng(PrdcrOgnCurntMngVO);
	}

}
