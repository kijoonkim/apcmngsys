package com.at.apcss.pd.bsm.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.pd.bsm.mapper.BrnoMngMapper;
import com.at.apcss.pd.bsm.service.BrnoMngService;
import com.at.apcss.pd.bsm.vo.BrnoMngVO;


/**
 * @Class Name : BbsServiceImpl.java
 * @Description : 게시판 서비스를 정의하기 위한 서비스 구현 클래스
 * @author
 * @since 2024.11.11
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.11.11  ljw        최초 생성
 * </pre>
 */
@Service("BrnoMngService")
public class BrnoMngServiceImpl extends BaseServiceImpl implements BrnoMngService{

	@Autowired
	private BrnoMngMapper BrnoMngMapper;

	@Override
	public BrnoMngVO selectBrnoMng(BrnoMngVO BrnoMngVO) throws Exception {

		BrnoMngVO resultVO = BrnoMngMapper.selectBrnoMng(BrnoMngVO);

		return resultVO;
	}

	@Override
	public List<BrnoMngVO> selectBrnoMngList(BrnoMngVO BrnoMngVO) throws Exception {

		List<BrnoMngVO> resultList = BrnoMngMapper.selectBrnoMngList(BrnoMngVO);
		return resultList;
	}

	@Override
	public List<BrnoMngVO> selectDtlBrnoMngList(BrnoMngVO BrnoMngVO) throws Exception {

		List<BrnoMngVO> resultList = BrnoMngMapper.selectDtlBrnoMngList(BrnoMngVO);
		return resultList;
	}

	@Override
	public int insertBrnoMng(BrnoMngVO BrnoMngVO) throws Exception {

		int insertedCnt = BrnoMngMapper.insertBrnoMng(BrnoMngVO);
		return insertedCnt;
	}

	@Override
	public int updateBrnoMng(BrnoMngVO BrnoMngVO) throws Exception {

		int updatedCnt = BrnoMngMapper.updateBrnoMng(BrnoMngVO);
		return updatedCnt;
	}

	@Override
	public int multiSaveBrnoMngList(List<BrnoMngVO> BrnoMngVOList) throws Exception {
		int savedCnt = 0;
		for (BrnoMngVO BrnoMngVO : BrnoMngVOList) {
			if(ComConstants.ROW_STS_INSERT.equals(BrnoMngVO.getRowSts())) {
				savedCnt += insertBrnoMng(BrnoMngVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(BrnoMngVO.getRowSts())) {
				savedCnt += updateBrnoMng(BrnoMngVO);
			}
		}
		return savedCnt;
	}

	@Override
	public int deleteBrnoMng(BrnoMngVO BrnoMngVO) throws Exception {
		return BrnoMngMapper.deleteBrnoMng(BrnoMngVO);
	}


	@Override
	public List<BrnoMngVO> selectBrnoMngRowDataList(BrnoMngVO BrnoMngVO) throws Exception {

		List<BrnoMngVO> resultList = BrnoMngMapper.selectBrnoMngRowDataList(BrnoMngVO);
		return resultList;
	}

}
