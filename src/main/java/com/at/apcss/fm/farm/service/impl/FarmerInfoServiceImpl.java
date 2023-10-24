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
	public FarmerInfoVO selectfarmerInfo(FarmerInfoVO farmerInfoVO) throws Exception {

		FarmerInfoVO resultVO = farmerInfoMapper.selectfarmerInfo(farmerInfoVO);

		return resultVO;
	}

	@Override
	public List<FarmerInfoVO> selectfarmerInfoList(FarmerInfoVO farmerInfoVO) throws Exception {

		List<FarmerInfoVO> resultList = farmerInfoMapper.selectfarmerInfoList(farmerInfoVO);
		return resultList;
	}

	@Override
	public int insertFarmerInfo(FarmerInfoVO farmerInfoVO) throws Exception {

		int insertedCnt = farmerInfoMapper.insertfarmerInfo(farmerInfoVO);

		return insertedCnt;
	}

	@Override
	public int updateFarmerInfo(FarmerInfoVO farmerInfoVO) throws Exception {

		int updatedCnt = farmerInfoMapper.updatefarmerInfo(farmerInfoVO);

		return updatedCnt;
	}

	@Override
	public int multiSavefarmerInfoList(List<FarmerInfoVO> farmerInfoVOList) throws Exception {
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
	public int insertMegerfarmerInfo(FarmerInfoVO farmerInfoVO) throws Exception {
		return farmerInfoMapper.insertMegerfarmerInfo(farmerInfoVO);
	}
	@Override
	public int insertMegerLogfarmerInfo(FarmerInfoVO farmerInfoVO) throws Exception {
		return farmerInfoMapper.insertMegerLogfarmerInfo(farmerInfoVO);
	}


	@Override
	public int insertMegerfarmerInfoMap(Map<String, String> MapList) throws Exception {
		return farmerInfoMapper.insertMegerfarmerInfoMap(MapList);
	}
	@Override
	public int insertMegerLogfarmerInfoMap(Map<String, String> MapList) throws Exception {
		return farmerInfoMapper.insertMegerLogfarmerInfoMap(MapList);
	}

	@Override
	public int updateMegerfarmerInfo(FarmerInfoVO farmerInfoVO) throws Exception {
		return farmerInfoMapper.updateMegerfarmerInfo(farmerInfoVO);
	}

	@Override
	public int deletefarmerInfo(FarmerInfoVO farmerInfoVO) throws Exception {
		return farmerInfoMapper.deletefarmerInfo(farmerInfoVO);
	}

}
