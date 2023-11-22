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
import com.at.apcss.fm.farm.mapper.FarmLandInfoMapper;
import com.at.apcss.fm.farm.service.FarmLandInfoService;
import com.at.apcss.fm.farm.vo.FarmLandInfoVO;


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
@Service("farmLandInfoService")
public class FarmLandInfoServiceImpl extends BaseServiceImpl implements FarmLandInfoService{

	@Autowired
	private FarmLandInfoMapper farmLandInfoMapper;

	@Override
	public FarmLandInfoVO selectFarmLandInfo(FarmLandInfoVO farmLandInfoVO) throws Exception {

		FarmLandInfoVO resultVO = farmLandInfoMapper.selectFarmLandInfo(farmLandInfoVO);

		return resultVO;
	}

	@Override
	public List<FarmLandInfoVO> selectFarmLandInfoList(FarmLandInfoVO farmLandInfoVO) throws Exception {

		List<FarmLandInfoVO> resultList = farmLandInfoMapper.selectFarmLandInfoList(farmLandInfoVO);
		return resultList;
	}

	@Override
	public int insertFarmLandInfo(FarmLandInfoVO farmLandInfoVO) throws Exception {

		int insertedCnt = farmLandInfoMapper.insertFarmLandInfo(farmLandInfoVO);

		return insertedCnt;
	}

	@Override
	public int updateFarmLandInfo(FarmLandInfoVO farmLandInfoVO) throws Exception {

		int updatedCnt = farmLandInfoMapper.updateFarmLandInfo(farmLandInfoVO);

		return updatedCnt;
	}

	@Override
	public int multiSaveFarmLandInfoList(List<FarmLandInfoVO> farmLandInfoVOList) throws Exception {
		int savedCnt = 0;
		for (FarmLandInfoVO farmLandInfoVO : farmLandInfoVOList) {
			if(ComConstants.ROW_STS_INSERT.equals(farmLandInfoVO.getRowSts())) {
				savedCnt += insertFarmLandInfo(farmLandInfoVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(farmLandInfoVO.getRowSts())) {
				savedCnt += updateFarmLandInfo(farmLandInfoVO);
			}
		}
		return savedCnt;
	}

	@Override
	public int insertMegerFarmLandInfo(FarmLandInfoVO farmLandInfoVO) throws Exception {
		return farmLandInfoMapper.insertMegerFarmLandInfo(farmLandInfoVO);
	}
	@Override
	public int insertMegerLogFarmLandInfo(FarmLandInfoVO farmLandInfoVO) throws Exception {
		return farmLandInfoMapper.insertMegerLogFarmLandInfo(farmLandInfoVO);
	}


	@Override
	public int insertMegerFarmLandInfoMap(Map<String, String> MapList) throws Exception {
		return farmLandInfoMapper.insertMegerFarmLandInfoMap(MapList);
	}
	@Override
	public int insertMegerLogFarmLandInfoMap(Map<String, String> MapList) throws Exception {
		return farmLandInfoMapper.insertMegerLogFarmLandInfoMap(MapList);
	}

	@Override
	public int updateMegerFarmLandInfo(FarmLandInfoVO farmLandInfoVO) throws Exception {
		return farmLandInfoMapper.updateMegerFarmLandInfo(farmLandInfoVO);
	}

	@Override
	public int deleteFarmLandInfo(FarmLandInfoVO farmLandInfoVO) throws Exception {
		return farmLandInfoMapper.deleteFarmLandInfo(farmLandInfoVO);
	}

}
