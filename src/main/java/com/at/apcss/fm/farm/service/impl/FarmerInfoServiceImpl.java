package com.at.apcss.fm.farm.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.fm.bbs.mapper.BbsMapper;
import com.at.apcss.fm.bbs.service.BbsService;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.fm.farm.mapper.FarmerInfoMapper;
import com.at.apcss.fm.farm.service.FarmerInfoService;
import com.at.apcss.fm.farm.vo.FarmerInfoVO;


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
@Service("farmerInfoService")
public class FarmerInfoServiceImpl implements FarmerInfoService{

	@Autowired
	private FarmerInfoMapper farmerInfoMapper;

	@Override
	public FarmerInfoVO selectFarmerInfo(FarmerInfoVO farmerInfoVO) throws Exception {

		FarmerInfoVO resultVO = farmerInfoMapper.selectFarmerInfo(farmerInfoVO);

		return resultVO;
	}

	@Override
	public List<FarmerInfoVO> selectFarmerInfoList(FarmerInfoVO farmerInfoVO) throws Exception {

		List<FarmerInfoVO> resultList = farmerInfoMapper.selectFarmerInfoList(farmerInfoVO);
		return resultList;
	}

	@Override
	public int insertFarmerInfo(FarmerInfoVO farmerInfoVO) throws Exception {

		int insertedCnt = farmerInfoMapper.insertFarmerInfo(farmerInfoVO);

		return insertedCnt;
	}

	@Override
	public int updateFarmerInfo(FarmerInfoVO farmerInfoVO) throws Exception {

		int updatedCnt = farmerInfoMapper.updateFarmerInfo(farmerInfoVO);

		return updatedCnt;
	}

	@Override
	public int multiSaveFarmerInfoList(List<FarmerInfoVO> farmerInfoVOList) throws Exception {
		int savedCnt = 0;
		for (FarmerInfoVO farmerInfoVO : farmerInfoVOList) {
			if(ComConstants.ROW_STS_INSERT.equals(farmerInfoVO.getRowSts())) {
				savedCnt += insertFarmerInfo(farmerInfoVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(farmerInfoVO.getRowSts())) {
				savedCnt += updateFarmerInfo(farmerInfoVO);
			}
		}
		return savedCnt;
	}

	@Override
	public int insertMegerFarmerInfo(FarmerInfoVO farmerInfoVO) throws Exception {
		return farmerInfoMapper.insertMegerFarmerInfo(farmerInfoVO);
	}
	@Override
	public int insertMegerLogFarmerInfo(FarmerInfoVO farmerInfoVO) throws Exception {
		return farmerInfoMapper.insertMegerLogFarmerInfo(farmerInfoVO);
	}


	@Override
	public int insertMegerFarmerInfoMap(Map<String, String> MapList) throws Exception {
		return farmerInfoMapper.insertMegerFarmerInfoMap(MapList);
	}
	@Override
	public int insertMegerLogFarmerInfoMap(Map<String, String> MapList) throws Exception {
		return farmerInfoMapper.insertMegerLogFarmerInfoMap(MapList);
	}

	@Override
	public int updateMegerFarmerInfo(FarmerInfoVO farmerInfoVO) throws Exception {
		return farmerInfoMapper.updateMegerFarmerInfo(farmerInfoVO);
	}

	@Override
	public int deleteFarmerInfo(FarmerInfoVO farmerInfoVO) throws Exception {
		return farmerInfoMapper.deleteFarmerInfo(farmerInfoVO);
	}

}
