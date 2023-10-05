package com.at.apcss.pd.pom.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.fm.bbs.mapper.BbsMapper;
import com.at.apcss.fm.bbs.service.BbsService;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.pd.pom.mapper.PrdcrOgnShipContMngMapper;
import com.at.apcss.pd.pom.service.PrdcrOgnShipContMngService;
import com.at.apcss.pd.pom.vo.PrdcrOgnShipContMngVO;


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
@Service("PrdcrOgnShipContMngService")
public class PrdcrOgnShipContMngServiceImpl implements PrdcrOgnShipContMngService{

	@Autowired
	private PrdcrOgnShipContMngMapper PrdcrOgnShipContMngMapper;

	@Override
	public PrdcrOgnShipContMngVO selectPrdcrOgnShipContMng(PrdcrOgnShipContMngVO PrdcrOgnShipContMngVO) throws Exception {

		PrdcrOgnShipContMngVO resultVO = PrdcrOgnShipContMngMapper.selectPrdcrOgnShipContMng(PrdcrOgnShipContMngVO);

		return resultVO;
	}

	@Override
	public List<PrdcrOgnShipContMngVO> selectPrdcrOgnShipContMngList(PrdcrOgnShipContMngVO PrdcrOgnShipContMngVO) throws Exception {

		List<PrdcrOgnShipContMngVO> resultList = PrdcrOgnShipContMngMapper.selectPrdcrOgnShipContMngList(PrdcrOgnShipContMngVO);
		return resultList;
	}

	@Override
	public int insertPrdcrOgnShipContMng(PrdcrOgnShipContMngVO PrdcrOgnShipContMngVO) throws Exception {

		int insertedCnt = PrdcrOgnShipContMngMapper.insertPrdcrOgnShipContMng(PrdcrOgnShipContMngVO);

		return insertedCnt;
	}

	@Override
	public int updatePrdcrOgnShipContMng(PrdcrOgnShipContMngVO PrdcrOgnShipContMngVO) throws Exception {

		int updatedCnt = PrdcrOgnShipContMngMapper.updatePrdcrOgnShipContMng(PrdcrOgnShipContMngVO);

		return updatedCnt;
	}

	@Override
	public int multiSavePrdcrOgnShipContMngList(List<PrdcrOgnShipContMngVO> PrdcrOgnShipContMngVOList) throws Exception {
		int savedCnt = 0;
		for (PrdcrOgnShipContMngVO PrdcrOgnShipContMngVO : PrdcrOgnShipContMngVOList) {
			if(ComConstants.ROW_STS_INSERT.equals(PrdcrOgnShipContMngVO.getRowSts())) {
				savedCnt += insertPrdcrOgnShipContMng(PrdcrOgnShipContMngVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(PrdcrOgnShipContMngVO.getRowSts())) {
				savedCnt += updatePrdcrOgnShipContMng(PrdcrOgnShipContMngVO);
			}
		}
		return savedCnt;
	}

	@Override
	public int deletePrdcrOgnShipContMng(PrdcrOgnShipContMngVO PrdcrOgnShipContMngVO) throws Exception {
		return PrdcrOgnShipContMngMapper.deletePrdcrOgnShipContMng(PrdcrOgnShipContMngVO);
	}

}
