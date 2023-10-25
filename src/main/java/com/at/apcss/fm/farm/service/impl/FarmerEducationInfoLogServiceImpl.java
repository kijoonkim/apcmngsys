package com.at.apcss.fm.farm.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.fm.bbs.mapper.BbsMapper;
import com.at.apcss.fm.bbs.service.BbsService;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.fm.farm.mapper.FarmerEducationInfoLogMapper;
import com.at.apcss.fm.farm.service.FarmerEducationInfoLogService;
import com.at.apcss.fm.farm.vo.FarmerEducationInfoLogVO;


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
@Service("farmerEducationInfoLogService")
public class FarmerEducationInfoLogServiceImpl implements FarmerEducationInfoLogService{

	@Autowired
	private FarmerEducationInfoLogMapper farmerEducationInfoLogMapper;

	@Override
	public FarmerEducationInfoLogVO selectFarmerEducationInfoLog(FarmerEducationInfoLogVO farmerEducationInfoLogVO) throws Exception {

		FarmerEducationInfoLogVO resultVO = farmerEducationInfoLogMapper.selectFarmerEducationInfoLog(farmerEducationInfoLogVO);

		return resultVO;
	}

	@Override
	public List<FarmerEducationInfoLogVO> selectFarmerEducationInfoLogList(FarmerEducationInfoLogVO farmerEducationInfoLogVO) throws Exception {

		List<FarmerEducationInfoLogVO> resultList = farmerEducationInfoLogMapper.selectFarmerEducationInfoLogList(farmerEducationInfoLogVO);
		return resultList;
	}

	@Override
	public int insertFarmerEducationInfoLog(FarmerEducationInfoLogVO farmerEducationInfoLogVO) throws Exception {

		int insertedCnt = farmerEducationInfoLogMapper.insertFarmerEducationInfoLog(farmerEducationInfoLogVO);

		return insertedCnt;
	}

	@Override
	public int updateFarmerEducationInfoLog(FarmerEducationInfoLogVO farmerEducationInfoLogVO) throws Exception {

		int updatedCnt = farmerEducationInfoLogMapper.updateFarmerEducationInfoLog(farmerEducationInfoLogVO);

		return updatedCnt;
	}

	@Override
	public int multiSaveFarmerEducationInfoLogList(List<FarmerEducationInfoLogVO> farmerEducationInfoLogVOList) throws Exception {
		int savedCnt = 0;
		for (FarmerEducationInfoLogVO farmerEducationInfoLogVO : farmerEducationInfoLogVOList) {
			if(ComConstants.ROW_STS_INSERT.equals(farmerEducationInfoLogVO.getRowSts())) {
				savedCnt += insertFarmerEducationInfoLog(farmerEducationInfoLogVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(farmerEducationInfoLogVO.getRowSts())) {
				savedCnt += updateFarmerEducationInfoLog(farmerEducationInfoLogVO);
			}
		}
		return savedCnt;
	}

	@Override
	public int insertMegerFarmerEducationInfoLog(FarmerEducationInfoLogVO farmerEducationInfoLogVO) throws Exception {
		return farmerEducationInfoLogMapper.insertMegerFarmerEducationInfoLog(farmerEducationInfoLogVO);
	}
	@Override
	public int insertMegerLogFarmerEducationInfoLog(FarmerEducationInfoLogVO farmerEducationInfoLogVO) throws Exception {
		return farmerEducationInfoLogMapper.insertMegerLogFarmerEducationInfoLog(farmerEducationInfoLogVO);
	}
	@Override
	public int updateMegerFarmerEducationInfoLog(FarmerEducationInfoLogVO farmerEducationInfoLogVO) throws Exception {
		return farmerEducationInfoLogMapper.updateMegerFarmerEducationInfoLog(farmerEducationInfoLogVO);
	}

	@Override
	public int deleteFarmerEducationInfoLog(FarmerEducationInfoLogVO farmerEducationInfoLogVO) throws Exception {
		return farmerEducationInfoLogMapper.deleteFarmerEducationInfoLog(farmerEducationInfoLogVO);
	}

}
