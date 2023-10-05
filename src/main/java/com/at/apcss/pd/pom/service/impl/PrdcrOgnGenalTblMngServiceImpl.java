package com.at.apcss.pd.pom.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.fm.bbs.mapper.BbsMapper;
import com.at.apcss.fm.bbs.service.BbsService;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.pd.pom.mapper.PrdcrOgnGenalTblMngMapper;
import com.at.apcss.pd.pom.service.PrdcrOgnGenalTblMngService;
import com.at.apcss.pd.pom.vo.PrdcrOgnGenalTblMngVO;


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
@Service("PrdcrOgnGenalTblMngService")
public class PrdcrOgnGenalTblMngServiceImpl implements PrdcrOgnGenalTblMngService{

	@Autowired
	private PrdcrOgnGenalTblMngMapper PrdcrOgnGenalTblMngMapper;

	@Override
	public PrdcrOgnGenalTblMngVO selectPrdcrOgnGenalTblMng(PrdcrOgnGenalTblMngVO PrdcrOgnGenalTblMngVO) throws Exception {

		PrdcrOgnGenalTblMngVO resultVO = PrdcrOgnGenalTblMngMapper.selectPrdcrOgnGenalTblMng(PrdcrOgnGenalTblMngVO);

		return resultVO;
	}

	@Override
	public List<PrdcrOgnGenalTblMngVO> selectPrdcrOgnGenalTblMngList(PrdcrOgnGenalTblMngVO PrdcrOgnGenalTblMngVO) throws Exception {

		List<PrdcrOgnGenalTblMngVO> resultList = PrdcrOgnGenalTblMngMapper.selectPrdcrOgnGenalTblMngList(PrdcrOgnGenalTblMngVO);
		return resultList;
	}

	@Override
	public int insertPrdcrOgnGenalTblMng(PrdcrOgnGenalTblMngVO PrdcrOgnGenalTblMngVO) throws Exception {

		int insertedCnt = PrdcrOgnGenalTblMngMapper.insertPrdcrOgnGenalTblMng(PrdcrOgnGenalTblMngVO);

		return insertedCnt;
	}

	@Override
	public int updatePrdcrOgnGenalTblMng(PrdcrOgnGenalTblMngVO PrdcrOgnGenalTblMngVO) throws Exception {

		int updatedCnt = PrdcrOgnGenalTblMngMapper.updatePrdcrOgnGenalTblMng(PrdcrOgnGenalTblMngVO);

		return updatedCnt;
	}

	@Override
	public int multiSavePrdcrOgnGenalTblMngList(List<PrdcrOgnGenalTblMngVO> PrdcrOgnGenalTblMngVOList) throws Exception {
		int savedCnt = 0;
		for (PrdcrOgnGenalTblMngVO PrdcrOgnGenalTblMngVO : PrdcrOgnGenalTblMngVOList) {
			if(ComConstants.ROW_STS_INSERT.equals(PrdcrOgnGenalTblMngVO.getRowSts())) {
				savedCnt += insertPrdcrOgnGenalTblMng(PrdcrOgnGenalTblMngVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(PrdcrOgnGenalTblMngVO.getRowSts())) {
				savedCnt += updatePrdcrOgnGenalTblMng(PrdcrOgnGenalTblMngVO);
			}
		}
		return savedCnt;
	}

	@Override
	public int deletePrdcrOgnGenalTblMng(PrdcrOgnGenalTblMngVO PrdcrOgnGenalTblMngVO) throws Exception {
		return PrdcrOgnGenalTblMngMapper.deletePrdcrOgnGenalTblMng(PrdcrOgnGenalTblMngVO);
	}

}
