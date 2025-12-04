package com.apcmngsys.apcss.pd.pom.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.apcmngsys.apcss.co.constants.ComConstants;
import com.apcmngsys.apcss.co.sys.service.impl.BaseServiceImpl;
import com.apcmngsys.apcss.pd.pom.mapper.PrdcrOgnGenalTblMngMapper;
import com.apcmngsys.apcss.pd.pom.service.PrdcrOgnGenalTblMngService;
import com.apcmngsys.apcss.pd.pom.vo.PrdcrOgnGenalTblMngVO;


/**
 * @Class Name : PrdcrOgnGenalTblMngServiceImpl.java
 * @Description : 생산유통통합조직등록 생산자조직 총괄표
 * @author 신정철
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21  신정철        최초 생성
 * </pre>
 */
@Service("prdcrOgnGenalTblMngService")
public class PrdcrOgnGenalTblMngServiceImpl extends BaseServiceImpl implements PrdcrOgnGenalTblMngService{

	@Autowired
	private PrdcrOgnGenalTblMngMapper prdcrOgnGenalTblMngMapper;

	@Override
	public PrdcrOgnGenalTblMngVO selectPrdcrOgnGenalTblMng(PrdcrOgnGenalTblMngVO prdcrOgnGenalTblMngVO) throws Exception {
		return prdcrOgnGenalTblMngMapper.selectPrdcrOgnGenalTblMng(prdcrOgnGenalTblMngVO);
	}

	@Override
	public List<PrdcrOgnGenalTblMngVO> selectPrdcrOgnGenalTblMngList(PrdcrOgnGenalTblMngVO prdcrOgnGenalTblMngVO) throws Exception {
		return prdcrOgnGenalTblMngMapper.selectPrdcrOgnGenalTblMngList(prdcrOgnGenalTblMngVO);
	}

	@Override
	public List<PrdcrOgnGenalTblMngVO> selectPrdcrOgnzSummaryList(PrdcrOgnGenalTblMngVO prdcrOgnGenalTblMngVO) throws Exception {
		return prdcrOgnGenalTblMngMapper.selectPrdcrOgnzSummaryList(prdcrOgnGenalTblMngVO);
	}

	@Override
	public int insertPrdcrOgnGenalTblMng(PrdcrOgnGenalTblMngVO prdcrOgnGenalTblMngVO) throws Exception {
		return prdcrOgnGenalTblMngMapper.insertPrdcrOgnGenalTblMng(prdcrOgnGenalTblMngVO);
	}

	@Override
	public int updatePrdcrOgnGenalTblMng(PrdcrOgnGenalTblMngVO prdcrOgnGenalTblMngVO) throws Exception {
		return prdcrOgnGenalTblMngMapper.updatePrdcrOgnGenalTblMng(prdcrOgnGenalTblMngVO);
	}

	@Override
	public int multiSavePrdcrOgnGenalTblMngList(List<PrdcrOgnGenalTblMngVO> prdcrOgnGenalTblMngVOList) throws Exception {
		int savedCnt = 0;
		for (PrdcrOgnGenalTblMngVO prdcrOgnGenalTblMngVO : prdcrOgnGenalTblMngVOList) {
			if(ComConstants.ROW_STS_INSERT.equals(prdcrOgnGenalTblMngVO.getRowSts())) {
				savedCnt += insertPrdcrOgnGenalTblMng(prdcrOgnGenalTblMngVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(prdcrOgnGenalTblMngVO.getRowSts())) {
				savedCnt += updatePrdcrOgnGenalTblMng(prdcrOgnGenalTblMngVO);
			}
		}
		return savedCnt;
	}

	@Override
	public int deletePrdcrOgnGenalTblMng(PrdcrOgnGenalTblMngVO prdcrOgnGenalTblMngVO) throws Exception {
		return prdcrOgnGenalTblMngMapper.deletePrdcrOgnGenalTblMng(prdcrOgnGenalTblMngVO);
	}

	@Override
	public int updateStbltYn(PrdcrOgnGenalTblMngVO prdcrOgnGenalTblMngVO) throws Exception {
		return prdcrOgnGenalTblMngMapper.updateStbltYn(prdcrOgnGenalTblMngVO);
	}

	@Override
	public List<PrdcrOgnGenalTblMngVO> selectRawDataPrdcrOgnzList(PrdcrOgnGenalTblMngVO prdcrOgnGenalTblMngVO) throws Exception {
		return prdcrOgnGenalTblMngMapper.selectRawDataPrdcrOgnzList(prdcrOgnGenalTblMngVO);
	}

	@Override
	public List<PrdcrOgnGenalTblMngVO> selectRawDataPrdcrOgnzList2025(PrdcrOgnGenalTblMngVO prdcrOgnGenalTblMngVO) throws Exception {
		return prdcrOgnGenalTblMngMapper.selectRawDataPrdcrOgnzList2025(prdcrOgnGenalTblMngVO);
	}

}
