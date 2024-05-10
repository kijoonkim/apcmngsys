package com.at.apcss.fm.farm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
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
	private FarmerEducationInfoMapper FarmerEducationInfoMapper;

	@Override
	public FarmerEducationInfoVO selectFarmerEducationInfo(FarmerEducationInfoVO FarmerEducationInfoVO) throws Exception {

		FarmerEducationInfoVO resultVO = FarmerEducationInfoMapper.selectFarmerEducationInfo(FarmerEducationInfoVO);

		return resultVO;
	}

	@Override
	public List<FarmerEducationInfoVO> selectFarmerEducationInfoList(FarmerEducationInfoVO FarmerEducationInfoVO) throws Exception {

		List<FarmerEducationInfoVO> resultList = FarmerEducationInfoMapper.selectFarmerEducationInfoList(FarmerEducationInfoVO);
		return resultList;
	}

	@Override
	public int insertFarmerEducationInfo(FarmerEducationInfoVO FarmerEducationInfoVO) throws Exception {

		int insertedCnt = FarmerEducationInfoMapper.insertFarmerEducationInfo(FarmerEducationInfoVO);

		return insertedCnt;
	}

	@Override
	public int updateFarmerEducationInfo(FarmerEducationInfoVO FarmerEducationInfoVO) throws Exception {

		int updatedCnt = FarmerEducationInfoMapper.updateFarmerEducationInfo(FarmerEducationInfoVO);

		return updatedCnt;
	}

	@Override
	public int multiSaveFarmerEducationInfoList(List<FarmerEducationInfoVO> FarmerEducationInfoVOList) throws Exception {
		int savedCnt = 0;
		for (FarmerEducationInfoVO FarmerEducationInfoVO : FarmerEducationInfoVOList) {
			if(ComConstants.ROW_STS_INSERT.equals(FarmerEducationInfoVO.getRowSts())) {
				savedCnt += insertFarmerEducationInfo(FarmerEducationInfoVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(FarmerEducationInfoVO.getRowSts())) {
				savedCnt += updateFarmerEducationInfo(FarmerEducationInfoVO);
			}
		}
		return savedCnt;
	}

	@Override
	public int insertMergeFarmerEducationInfo(FarmerEducationInfoVO FarmerEducationInfoVO) throws Exception {
		return FarmerEducationInfoMapper.insertMergeFarmerEducationInfo(FarmerEducationInfoVO);
	}
	@Override
	public int insertLogFarmerEducationInfo(FarmerEducationInfoVO FarmerEducationInfoVO) throws Exception {
		return FarmerEducationInfoMapper.insertLogFarmerEducationInfo(FarmerEducationInfoVO);
	}

	@Override
	public int deleteFarmerEducationInfo(FarmerEducationInfoVO FarmerEducationInfoVO) throws Exception {
		return FarmerEducationInfoMapper.deleteFarmerEducationInfo(FarmerEducationInfoVO);
	}

	@Override
	public List<FarmerEducationInfoVO> selectFrmerSnList(FarmerEducationInfoVO FarmerEducationInfoVO) throws Exception {
		return FarmerEducationInfoMapper.selectFrmerSnList(FarmerEducationInfoVO);
	}


}
