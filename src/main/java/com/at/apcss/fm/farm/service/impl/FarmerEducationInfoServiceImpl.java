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
public class FarmerEducationInfoServiceImpl implements FarmerEducationInfoService{

	@Autowired
	private FarmerEducationInfoMapper farmerEducationInfoMapper;

	@Override
	public FarmerEducationInfoVO selectfarmerEducationInfo(FarmerEducationInfoVO farmerEducationInfoVO) throws Exception {

		FarmerEducationInfoVO resultVO = farmerEducationInfoMapper.selectfarmerEducationInfo(farmerEducationInfoVO);

		return resultVO;
	}

	@Override
	public List<FarmerEducationInfoVO> selectfarmerEducationInfoList(FarmerEducationInfoVO farmerEducationInfoVO) throws Exception {

		List<FarmerEducationInfoVO> resultList = farmerEducationInfoMapper.selectfarmerEducationInfoList(farmerEducationInfoVO);
		return resultList;
	}

	@Override
	public int insertFarmerEducationInfo(FarmerEducationInfoVO farmerEducationInfoVO) throws Exception {

		int insertedCnt = farmerEducationInfoMapper.insertfarmerEducationInfo(farmerEducationInfoVO);

		return insertedCnt;
	}

	@Override
	public int updateFarmerEducationInfo(FarmerEducationInfoVO farmerEducationInfoVO) throws Exception {

		int updatedCnt = farmerEducationInfoMapper.updatefarmerEducationInfo(farmerEducationInfoVO);

		return updatedCnt;
	}

	@Override
	public int multiSavefarmerEducationInfoList(List<FarmerEducationInfoVO> farmerEducationInfoVOList) throws Exception {
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
	public int insertMegerfarmerEducationInfo(FarmerEducationInfoVO farmerEducationInfoVO) throws Exception {
		return farmerEducationInfoMapper.insertMegerfarmerEducationInfo(farmerEducationInfoVO);
	}
	@Override
	public int insertMegerLogfarmerEducationInfo(FarmerEducationInfoVO farmerEducationInfoVO) throws Exception {
		return farmerEducationInfoMapper.insertMegerLogfarmerEducationInfo(farmerEducationInfoVO);
	}


	@Override
	public int insertMegerfarmerEducationInfoMap(Map<String, String> MapList) throws Exception {
		return farmerEducationInfoMapper.insertMegerfarmerEducationInfoMap(MapList);
	}
	@Override
	public int insertMegerLogfarmerEducationInfoMap(Map<String, String> MapList) throws Exception {
		return farmerEducationInfoMapper.insertMegerLogfarmerEducationInfoMap(MapList);
	}

	@Override
	public int updateMegerfarmerEducationInfo(FarmerEducationInfoVO farmerEducationInfoVO) throws Exception {
		return farmerEducationInfoMapper.updateMegerfarmerEducationInfo(farmerEducationInfoVO);
	}

	@Override
	public int deletefarmerEducationInfo(FarmerEducationInfoVO farmerEducationInfoVO) throws Exception {
		return farmerEducationInfoMapper.deletefarmerEducationInfo(farmerEducationInfoVO);
	}

}
