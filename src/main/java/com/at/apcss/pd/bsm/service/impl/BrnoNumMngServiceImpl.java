package com.at.apcss.pd.bsm.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.pd.bsm.mapper.BrnoNumMngMapper;
import com.at.apcss.pd.bsm.service.BrnoNumMngService;
import com.at.apcss.pd.bsm.vo.BrnoNumMngVO;


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
@Service("BrnoNumMngService")
public class BrnoNumMngServiceImpl extends BaseServiceImpl implements BrnoNumMngService{

	@Autowired
	private BrnoNumMngMapper BrnoNumMngMapper;

	@Override
	public BrnoNumMngVO selectBrnoNumMng(BrnoNumMngVO BrnoNumMngVO) throws Exception {
		BrnoNumMngVO resultVO = BrnoNumMngMapper.selectBrnoNumMng(BrnoNumMngVO);
		return resultVO;
	}

	@Override
	public List<BrnoNumMngVO> selectBrnoNumMngList(BrnoNumMngVO BrnoNumMngVO) throws Exception {
		List<BrnoNumMngVO> resultList = BrnoNumMngMapper.selectBrnoNumMngList(BrnoNumMngVO);
		return resultList;
	}

	@Override
	public int updateBrnoNumMng(BrnoNumMngVO BrnoNumMngVO) throws Exception {
		int updatedCnt = BrnoNumMngMapper.updateBrnoNumMng(BrnoNumMngVO);
		return updatedCnt;
	}

	@Override
	public int deleteBrnoNumMng(BrnoNumMngVO BrnoNumMngVO) throws Exception {
		int deletedCnt = BrnoNumMngMapper.deleteBrnoNumMng(BrnoNumMngVO);
		return deletedCnt;
	}

	@Override
	public int multiSaveBrnoNumMngList(List<BrnoNumMngVO> BrnoNumMngVOList) throws Exception {
		int savedCnt = 0;
		for (BrnoNumMngVO BrnoNumMngVO : BrnoNumMngVOList) {
			savedCnt += updateBrnoNumMng(BrnoNumMngVO);
			BrnoNumMngMapper.updateSlctnYnHstry(BrnoNumMngVO);
		}
		return savedCnt;
	}

	@Override
	public List<BrnoNumMngVO> selectBrnoNumMngRowDataList(BrnoNumMngVO BrnoNumMngVO) throws Exception {
		List<BrnoNumMngVO> resultList = BrnoNumMngMapper.selectBrnoNumMngRowDataList(BrnoNumMngVO);
		return resultList;
	}

}
