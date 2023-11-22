package com.at.apcss.fm.farm.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.fm.bbs.mapper.BbsMapper;
import com.at.apcss.fm.bbs.service.BbsService;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.fm.farm.mapper.FarmerEducationInfoMapper;
import com.at.apcss.fm.farm.service.FarmerEducationInfoService;
import com.at.apcss.fm.farm.vo.FarmerEducationInfoVO;


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
@Service("farmerEducationInfoService")
public class FarmerEducationInfoServiceImpl extends BaseServiceImpl implements FarmerEducationInfoService{

	@Autowired
	private FarmerEducationInfoMapper farmerEducationInfoMapper;

	@Override
	public FarmerEducationInfoVO selectFarmerEducationInfo(FarmerEducationInfoVO farmerEducationInfoVO) throws Exception {

		FarmerEducationInfoVO resultVO = farmerEducationInfoMapper.selectFarmerEducationInfo(farmerEducationInfoVO);

		return resultVO;
	}

	@Override
	public List<FarmerEducationInfoVO> selectFarmerEducationInfoList(FarmerEducationInfoVO farmerEducationInfoVO) throws Exception {

		List<FarmerEducationInfoVO> resultList = farmerEducationInfoMapper.selectFarmerEducationInfoList(farmerEducationInfoVO);
		return resultList;
	}

	@Override
	public int insertFarmerEducationInfo(FarmerEducationInfoVO farmerEducationInfoVO) throws Exception {

		int insertedCnt = farmerEducationInfoMapper.insertFarmerEducationInfo(farmerEducationInfoVO);

		return insertedCnt;
	}

	@Override
	public int updateFarmerEducationInfo(FarmerEducationInfoVO farmerEducationInfoVO) throws Exception {

		int updatedCnt = farmerEducationInfoMapper.updateFarmerEducationInfo(farmerEducationInfoVO);

		return updatedCnt;
	}

	@Override
	public int multiSaveFarmerEducationInfoList(List<FarmerEducationInfoVO> farmerEducationInfoVOList) throws Exception {
		int savedCnt = 0;
		for (FarmerEducationInfoVO farmerEducationInfoVO : farmerEducationInfoVOList) {
			if(ComConstants.ROW_STS_INSERT.equals(farmerEducationInfoVO.getRowSts())) {
				savedCnt += insertFarmerEducationInfo(farmerEducationInfoVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(farmerEducationInfoVO.getRowSts())) {
				savedCnt += updateFarmerEducationInfo(farmerEducationInfoVO);
			}
		}
		return savedCnt;
	}

	@Override
	public int insertMegerFarmerEducationInfo(FarmerEducationInfoVO farmerEducationInfoVO) throws Exception {
		return farmerEducationInfoMapper.insertMegerFarmerEducationInfo(farmerEducationInfoVO);
	}
	@Override
	public int insertMegerLogFarmerEducationInfo(FarmerEducationInfoVO farmerEducationInfoVO) throws Exception {
		return farmerEducationInfoMapper.insertMegerLogFarmerEducationInfo(farmerEducationInfoVO);
	}


	@Override
	public int insertMegerFarmerEducationInfoMap(Map<String, String> MapList) throws Exception {
		return farmerEducationInfoMapper.insertMegerFarmerEducationInfoMap(MapList);
	}
	@Override
	public int insertMegerLogFarmerEducationInfoMap(Map<String, String> MapList) throws Exception {
		return farmerEducationInfoMapper.insertMegerLogFarmerEducationInfoMap(MapList);
	}

	@Override
	public int updateMegerFarmerEducationInfo(FarmerEducationInfoVO farmerEducationInfoVO) throws Exception {
		return farmerEducationInfoMapper.updateMegerFarmerEducationInfo(farmerEducationInfoVO);
	}

	@Override
	public int deleteFarmerEducationInfo(FarmerEducationInfoVO farmerEducationInfoVO) throws Exception {
		return farmerEducationInfoMapper.deleteFarmerEducationInfo(farmerEducationInfoVO);
	}

}
