package com.at.apcss.fm.farm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
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
@Service("FarmLandGrantsInfoService")
public class FarmLandGrantsInfoServiceImpl extends BaseServiceImpl implements FarmLandGrantsInfoService{

	@Autowired
	private FarmLandGrantsInfoMapper FarmLandGrantsInfoMapper;

	@Override
	public FarmLandGrantsInfoVO selectFarmLandGrantsInfo(FarmLandGrantsInfoVO FarmLandGrantsInfoVO) throws Exception {

		FarmLandGrantsInfoVO resultVO = FarmLandGrantsInfoMapper.selectFarmLandGrantsInfo(FarmLandGrantsInfoVO);

		return resultVO;
	}

	@Override
	public List<FarmLandGrantsInfoVO> selectFarmLandGrantsInfoList(FarmLandGrantsInfoVO FarmLandGrantsInfoVO) throws Exception {

		List<FarmLandGrantsInfoVO> resultList = FarmLandGrantsInfoMapper.selectFarmLandGrantsInfoList(FarmLandGrantsInfoVO);
		return resultList;
	}

	@Override
	public int insertFarmLandGrantsInfo(FarmLandGrantsInfoVO FarmLandGrantsInfoVO) throws Exception {

		int insertedCnt = FarmLandGrantsInfoMapper.insertFarmLandGrantsInfo(FarmLandGrantsInfoVO);

		return insertedCnt;
	}

	@Override
	public int updateFarmLandGrantsInfo(FarmLandGrantsInfoVO FarmLandGrantsInfoVO) throws Exception {

		int updatedCnt = FarmLandGrantsInfoMapper.updateFarmLandGrantsInfo(FarmLandGrantsInfoVO);

		return updatedCnt;
	}

	@Override
	public int multiSaveFarmLandGrantsInfoList(List<FarmLandGrantsInfoVO> FarmLandGrantsInfoVOList) throws Exception {
		int savedCnt = 0;
		for (FarmLandGrantsInfoVO FarmLandGrantsInfoVO : FarmLandGrantsInfoVOList) {
			if(ComConstants.ROW_STS_INSERT.equals(FarmLandGrantsInfoVO.getRowSts())) {
				savedCnt += insertFarmLandGrantsInfo(FarmLandGrantsInfoVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(FarmLandGrantsInfoVO.getRowSts())) {
				savedCnt += updateFarmLandGrantsInfo(FarmLandGrantsInfoVO);
			}
		}
		return savedCnt;
	}

	@Override
	public int deleteFarmLandGrantsInfo(FarmLandGrantsInfoVO FarmLandGrantsInfoVO) throws Exception {
		return FarmLandGrantsInfoMapper.deleteFarmLandGrantsInfo(FarmLandGrantsInfoVO);
	}

	@Override
	public int insertLogFarmLandGrantsInfo(FarmLandGrantsInfoVO FarmLandGrantsInfoVO) throws Exception {
		return FarmLandGrantsInfoMapper.insertLogFarmLandGrantsInfo(FarmLandGrantsInfoVO);
	}

	@Override
	public List<FarmLandGrantsInfoVO> selectFrmerSnList(FarmLandGrantsInfoVO FarmLandGrantsInfoVO) throws Exception {
		return FarmLandGrantsInfoMapper.selectFrmerSnList(FarmLandGrantsInfoVO);
	}


}
