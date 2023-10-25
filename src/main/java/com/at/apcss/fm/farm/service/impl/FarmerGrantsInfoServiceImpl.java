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
import com.at.apcss.fm.farm.mapper.FarmerGrantsInfoMapper;
import com.at.apcss.fm.farm.service.FarmerGrantsInfoService;
import com.at.apcss.fm.farm.vo.FarmerGrantsInfoVO;


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
@Service("farmerGrantsInfoService")
public class FarmerGrantsInfoServiceImpl implements FarmerGrantsInfoService{

	@Autowired
	private FarmerGrantsInfoMapper farmerGrantsInfoMapper;

	@Override
	public FarmerGrantsInfoVO selectFarmerGrantsInfo(FarmerGrantsInfoVO farmerGrantsInfoVO) throws Exception {

		FarmerGrantsInfoVO resultVO = farmerGrantsInfoMapper.selectFarmerGrantsInfo(farmerGrantsInfoVO);

		return resultVO;
	}

	@Override
	public List<FarmerGrantsInfoVO> selectFarmerGrantsInfoList(FarmerGrantsInfoVO farmerGrantsInfoVO) throws Exception {

		List<FarmerGrantsInfoVO> resultList = farmerGrantsInfoMapper.selectFarmerGrantsInfoList(farmerGrantsInfoVO);
		return resultList;
	}

	@Override
	public int insertFarmerGrantsInfo(FarmerGrantsInfoVO farmerGrantsInfoVO) throws Exception {

		int insertedCnt = farmerGrantsInfoMapper.insertFarmerGrantsInfo(farmerGrantsInfoVO);

		return insertedCnt;
	}

	@Override
	public int updateFarmerGrantsInfo(FarmerGrantsInfoVO farmerGrantsInfoVO) throws Exception {

		int updatedCnt = farmerGrantsInfoMapper.updateFarmerGrantsInfo(farmerGrantsInfoVO);

		return updatedCnt;
	}

	@Override
	public int multiSaveFarmerGrantsInfoList(List<FarmerGrantsInfoVO> farmerGrantsInfoVOList) throws Exception {
		int savedCnt = 0;
		for (FarmerGrantsInfoVO farmerGrantsInfoVO : farmerGrantsInfoVOList) {
			if(ComConstants.ROW_STS_INSERT.equals(farmerGrantsInfoVO.getRowSts())) {
				savedCnt += insertFarmerGrantsInfo(farmerGrantsInfoVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(farmerGrantsInfoVO.getRowSts())) {
				savedCnt += updateFarmerGrantsInfo(farmerGrantsInfoVO);
			}
		}
		return savedCnt;
	}

	@Override
	public int insertMegerFarmerGrantsInfo(FarmerGrantsInfoVO farmerGrantsInfoVO) throws Exception {
		return farmerGrantsInfoMapper.insertMegerFarmerGrantsInfo(farmerGrantsInfoVO);
	}
	@Override
	public int insertMegerLogFarmerGrantsInfo(FarmerGrantsInfoVO farmerGrantsInfoVO) throws Exception {
		return farmerGrantsInfoMapper.insertMegerLogFarmerGrantsInfo(farmerGrantsInfoVO);
	}


	@Override
	public int insertMegerFarmerGrantsInfoMap(Map<String, String> MapList) throws Exception {
		return farmerGrantsInfoMapper.insertMegerFarmerGrantsInfoMap(MapList);
	}
	@Override
	public int insertMegerLogFarmerGrantsInfoMap(Map<String, String> MapList) throws Exception {
		return farmerGrantsInfoMapper.insertMegerLogFarmerGrantsInfoMap(MapList);
	}

	@Override
	public int updateMegerFarmerGrantsInfo(FarmerGrantsInfoVO farmerGrantsInfoVO) throws Exception {
		return farmerGrantsInfoMapper.updateMegerFarmerGrantsInfo(farmerGrantsInfoVO);
	}

	@Override
	public int deleteFarmerGrantsInfo(FarmerGrantsInfoVO farmerGrantsInfoVO) throws Exception {
		return farmerGrantsInfoMapper.deleteFarmerGrantsInfo(farmerGrantsInfoVO);
	}

}
