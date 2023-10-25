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
import com.at.apcss.fm.farm.mapper.FarmerSnCertificationInfoMapper;
import com.at.apcss.fm.farm.service.FarmerSnCertificationInfoService;
import com.at.apcss.fm.farm.vo.FarmerSnCertificationInfoVO;


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
@Service("farmerSnCertificationInfoService")
public class FarmerSnCertificationInfoServiceImpl implements FarmerSnCertificationInfoService{

	@Autowired
	private FarmerSnCertificationInfoMapper farmerSnCertificationInfoMapper;

	@Override
	public FarmerSnCertificationInfoVO selectFarmerSnCertificationInfo(FarmerSnCertificationInfoVO farmerSnCertificationInfoVO) throws Exception {

		FarmerSnCertificationInfoVO resultVO = farmerSnCertificationInfoMapper.selectFarmerSnCertificationInfo(farmerSnCertificationInfoVO);

		return resultVO;
	}

	@Override
	public List<FarmerSnCertificationInfoVO> selectFarmerSnCertificationInfoList(FarmerSnCertificationInfoVO farmerSnCertificationInfoVO) throws Exception {

		List<FarmerSnCertificationInfoVO> resultList = farmerSnCertificationInfoMapper.selectFarmerSnCertificationInfoList(farmerSnCertificationInfoVO);
		return resultList;
	}

	@Override
	public int insertFarmerSnCertificationInfo(FarmerSnCertificationInfoVO farmerSnCertificationInfoVO) throws Exception {

		int insertedCnt = farmerSnCertificationInfoMapper.insertFarmerSnCertificationInfo(farmerSnCertificationInfoVO);

		return insertedCnt;
	}

	@Override
	public int updateFarmerSnCertificationInfo(FarmerSnCertificationInfoVO farmerSnCertificationInfoVO) throws Exception {

		int updatedCnt = farmerSnCertificationInfoMapper.updateFarmerSnCertificationInfo(farmerSnCertificationInfoVO);

		return updatedCnt;
	}

	@Override
	public int multiSaveFarmerSnCertificationInfoList(List<FarmerSnCertificationInfoVO> farmerSnCertificationInfoVOList) throws Exception {
		int savedCnt = 0;
		for (FarmerSnCertificationInfoVO farmerSnCertificationInfoVO : farmerSnCertificationInfoVOList) {
			if(ComConstants.ROW_STS_INSERT.equals(farmerSnCertificationInfoVO.getRowSts())) {
				savedCnt += insertFarmerSnCertificationInfo(farmerSnCertificationInfoVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(farmerSnCertificationInfoVO.getRowSts())) {
				savedCnt += updateFarmerSnCertificationInfo(farmerSnCertificationInfoVO);
			}
		}
		return savedCnt;
	}

	@Override
	public int insertMegerFarmerSnCertificationInfo(FarmerSnCertificationInfoVO farmerSnCertificationInfoVO) throws Exception {
		return farmerSnCertificationInfoMapper.insertMegerFarmerSnCertificationInfo(farmerSnCertificationInfoVO);
	}
	@Override
	public int insertMegerLogFarmerSnCertificationInfo(FarmerSnCertificationInfoVO farmerSnCertificationInfoVO) throws Exception {
		return farmerSnCertificationInfoMapper.insertMegerLogFarmerSnCertificationInfo(farmerSnCertificationInfoVO);
	}


	@Override
	public int insertMegerFarmerSnCertificationInfoMap(Map<String, String> MapList) throws Exception {
		return farmerSnCertificationInfoMapper.insertMegerFarmerSnCertificationInfoMap(MapList);
	}
	@Override
	public int insertMegerLogFarmerSnCertificationInfoMap(Map<String, String> MapList) throws Exception {
		return farmerSnCertificationInfoMapper.insertMegerLogFarmerSnCertificationInfoMap(MapList);
	}

	@Override
	public int updateMegerFarmerSnCertificationInfo(FarmerSnCertificationInfoVO farmerSnCertificationInfoVO) throws Exception {
		return farmerSnCertificationInfoMapper.updateMegerFarmerSnCertificationInfo(farmerSnCertificationInfoVO);
	}

	@Override
	public int deleteFarmerSnCertificationInfo(FarmerSnCertificationInfoVO farmerSnCertificationInfoVO) throws Exception {
		return farmerSnCertificationInfoMapper.deleteFarmerSnCertificationInfo(farmerSnCertificationInfoVO);
	}

}
