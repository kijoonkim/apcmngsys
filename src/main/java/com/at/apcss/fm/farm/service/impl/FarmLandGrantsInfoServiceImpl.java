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
import com.at.apcss.fm.farm.mapper.FarmLandGrantsInfoMapper;
import com.at.apcss.fm.farm.service.FarmLandGrantsInfoService;
import com.at.apcss.fm.farm.vo.FarmLandGrantsInfoVO;


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
@Service("farmLandGrantsInfoService")
public class FarmLandGrantsInfoServiceImpl implements FarmLandGrantsInfoService{

	@Autowired
	private FarmLandGrantsInfoMapper farmLandGrantsInfoMapper;

	@Override
	public FarmLandGrantsInfoVO selectFarmLandGrantsInfo(FarmLandGrantsInfoVO farmLandGrantsInfoVO) throws Exception {

		FarmLandGrantsInfoVO resultVO = farmLandGrantsInfoMapper.selectFarmLandGrantsInfo(farmLandGrantsInfoVO);

		return resultVO;
	}

	@Override
	public List<FarmLandGrantsInfoVO> selectFarmLandGrantsInfoList(FarmLandGrantsInfoVO farmLandGrantsInfoVO) throws Exception {

		List<FarmLandGrantsInfoVO> resultList = farmLandGrantsInfoMapper.selectFarmLandGrantsInfoList(farmLandGrantsInfoVO);
		return resultList;
	}

	@Override
	public int insertFarmLandGrantsInfo(FarmLandGrantsInfoVO farmLandGrantsInfoVO) throws Exception {

		int insertedCnt = farmLandGrantsInfoMapper.insertFarmLandGrantsInfo(farmLandGrantsInfoVO);

		return insertedCnt;
	}

	@Override
	public int updateFarmLandGrantsInfo(FarmLandGrantsInfoVO farmLandGrantsInfoVO) throws Exception {

		int updatedCnt = farmLandGrantsInfoMapper.updateFarmLandGrantsInfo(farmLandGrantsInfoVO);

		return updatedCnt;
	}

	@Override
	public int multiSaveFarmLandGrantsInfoList(List<FarmLandGrantsInfoVO> farmLandGrantsInfoVOList) throws Exception {
		int savedCnt = 0;
		for (FarmLandGrantsInfoVO farmLandGrantsInfoVO : farmLandGrantsInfoVOList) {
			if(ComConstants.ROW_STS_INSERT.equals(farmLandGrantsInfoVO.getRowSts())) {
				savedCnt += insertFarmLandGrantsInfo(farmLandGrantsInfoVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(farmLandGrantsInfoVO.getRowSts())) {
				savedCnt += updateFarmLandGrantsInfo(farmLandGrantsInfoVO);
			}
		}
		return savedCnt;
	}

	@Override
	public int insertMegerFarmLandGrantsInfo(FarmLandGrantsInfoVO farmLandGrantsInfoVO) throws Exception {
		return farmLandGrantsInfoMapper.insertMegerFarmLandGrantsInfo(farmLandGrantsInfoVO);
	}
	@Override
	public int insertMegerLogFarmLandGrantsInfo(FarmLandGrantsInfoVO farmLandGrantsInfoVO) throws Exception {
		return farmLandGrantsInfoMapper.insertMegerLogFarmLandGrantsInfo(farmLandGrantsInfoVO);
	}


	@Override
	public int insertMegerFarmLandGrantsInfoMap(Map<String, String> MapList) throws Exception {
		return farmLandGrantsInfoMapper.insertMegerFarmLandGrantsInfoMap(MapList);
	}
	@Override
	public int insertMegerLogFarmLandGrantsInfoMap(Map<String, String> MapList) throws Exception {
		return farmLandGrantsInfoMapper.insertMegerLogFarmLandGrantsInfoMap(MapList);
	}

	@Override
	public int updateMegerFarmLandGrantsInfo(FarmLandGrantsInfoVO farmLandGrantsInfoVO) throws Exception {
		return farmLandGrantsInfoMapper.updateMegerFarmLandGrantsInfo(farmLandGrantsInfoVO);
	}

	@Override
	public int deleteFarmLandGrantsInfo(FarmLandGrantsInfoVO farmLandGrantsInfoVO) throws Exception {
		return farmLandGrantsInfoMapper.deleteFarmLandGrantsInfo(farmLandGrantsInfoVO);
	}

}
