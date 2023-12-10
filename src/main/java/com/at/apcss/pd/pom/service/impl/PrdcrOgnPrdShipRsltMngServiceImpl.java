package com.at.apcss.pd.pom.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.pd.pom.mapper.PrdcrOgnPrdShipRsltMngMapper;
import com.at.apcss.pd.pom.service.PrdcrOgnPrdShipRsltMngService;
import com.at.apcss.pd.pom.vo.PrdcrOgnPrdShipRsltMngVO;


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
@Service("PrdcrOgnPrdShipRsltMngService")
public class PrdcrOgnPrdShipRsltMngServiceImpl extends BaseServiceImpl implements PrdcrOgnPrdShipRsltMngService{

	@Autowired
	private PrdcrOgnPrdShipRsltMngMapper PrdcrOgnPrdShipRsltMngMapper;

	@Override
	public PrdcrOgnPrdShipRsltMngVO selectPrdcrOgnPrdShipRsltMng(PrdcrOgnPrdShipRsltMngVO PrdcrOgnPrdShipRsltMngVO) throws Exception {

		PrdcrOgnPrdShipRsltMngVO resultVO = PrdcrOgnPrdShipRsltMngMapper.selectPrdcrOgnPrdShipRsltMng(PrdcrOgnPrdShipRsltMngVO);

		return resultVO;
	}

	@Override
	public List<PrdcrOgnPrdShipRsltMngVO> selectPrdcrOgnPrdShipRsltMngList(PrdcrOgnPrdShipRsltMngVO PrdcrOgnPrdShipRsltMngVO) throws Exception {

		List<PrdcrOgnPrdShipRsltMngVO> resultList = PrdcrOgnPrdShipRsltMngMapper.selectPrdcrOgnPrdShipRsltMngList(PrdcrOgnPrdShipRsltMngVO);
		return resultList;
	}

	@Override
	public List<PrdcrOgnPrdShipRsltMngVO> selectPrdcrOgnPrdShipRsltMngDtlList(PrdcrOgnPrdShipRsltMngVO PrdcrOgnPrdShipRsltMngVO) throws Exception {

		List<PrdcrOgnPrdShipRsltMngVO> resultList = PrdcrOgnPrdShipRsltMngMapper.selectPrdcrOgnPrdShipRsltMngDtlList(PrdcrOgnPrdShipRsltMngVO);
		return resultList;
	}

	@Override
	public int insertPrdcrOgnPrdShipRsltMng(PrdcrOgnPrdShipRsltMngVO PrdcrOgnPrdShipRsltMngVO) throws Exception {

		int insertedCnt = PrdcrOgnPrdShipRsltMngMapper.insertPrdcrOgnPrdShipRsltMng(PrdcrOgnPrdShipRsltMngVO);

		return insertedCnt;
	}

	@Override
	public int updatePrdcrOgnPrdShipRsltMng(PrdcrOgnPrdShipRsltMngVO PrdcrOgnPrdShipRsltMngVO) throws Exception {

		int updatedCnt = PrdcrOgnPrdShipRsltMngMapper.updatePrdcrOgnPrdShipRsltMng(PrdcrOgnPrdShipRsltMngVO);

		return updatedCnt;
	}

	@Override
	public int multiSavePrdcrOgnPrdShipRsltMngList(List<PrdcrOgnPrdShipRsltMngVO> PrdcrOgnPrdShipRsltMngVOList) throws Exception {
		int savedCnt = 0;
		for (PrdcrOgnPrdShipRsltMngVO PrdcrOgnPrdShipRsltMngVO : PrdcrOgnPrdShipRsltMngVOList) {
			savedCnt += insertPrdcrOgnPrdShipRsltMng(PrdcrOgnPrdShipRsltMngVO);
			/*
			if(ComConstants.ROW_STS_INSERT.equals(PrdcrOgnPrdShipRsltMngVO.getRowSts())) {
			}
			if(ComConstants.ROW_STS_UPDATE.equals(PrdcrOgnPrdShipRsltMngVO.getRowSts())) {
				savedCnt += updatePrdcrOgnPrdShipRsltMng(PrdcrOgnPrdShipRsltMngVO);
			}
			*/
		}
		return savedCnt;
	}

	@Override
	public int deletePrdcrOgnPrdShipRsltMng(PrdcrOgnPrdShipRsltMngVO PrdcrOgnPrdShipRsltMngVO) throws Exception {
		return PrdcrOgnPrdShipRsltMngMapper.deletePrdcrOgnPrdShipRsltMng(PrdcrOgnPrdShipRsltMngVO);
	}

}
