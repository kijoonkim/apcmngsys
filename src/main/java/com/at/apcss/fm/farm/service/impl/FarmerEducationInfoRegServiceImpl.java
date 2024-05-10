package com.at.apcss.fm.farm.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.fm.farm.mapper.FarmerEducationInfoRegMapper;
import com.at.apcss.fm.farm.service.FarmerEducationInfoRegService;
import com.at.apcss.fm.farm.vo.FarmerEducationInfoRegVO;


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
@Service("farmerEducationInfoRegService")
public class FarmerEducationInfoRegServiceImpl extends BaseServiceImpl implements FarmerEducationInfoRegService{

	@Autowired
	private FarmerEducationInfoRegMapper farmerEducationInfoRegMapper;

	@Override
	public FarmerEducationInfoRegVO selectFarmerEducationInfoReg(FarmerEducationInfoRegVO farmerEducationInfoRegVO) throws Exception {

		FarmerEducationInfoRegVO resultVO = farmerEducationInfoRegMapper.selectFarmerEducationInfoReg(farmerEducationInfoRegVO);

		return resultVO;
	}

	@Override
	public List<FarmerEducationInfoRegVO> selectFarmerEducationInfoRegList(FarmerEducationInfoRegVO farmerEducationInfoRegVO) throws Exception {

		List<FarmerEducationInfoRegVO> resultList = farmerEducationInfoRegMapper.selectFarmerEducationInfoRegList(farmerEducationInfoRegVO);
		return resultList;
	}

	@Override
	public int insertFarmerEducationInfoReg(FarmerEducationInfoRegVO farmerEducationInfoRegVO) throws Exception {

		int insertedCnt = farmerEducationInfoRegMapper.insertFarmerEducationInfoReg(farmerEducationInfoRegVO);

		return insertedCnt;
	}

	/*
	@Override
	public int updateFarmerEducationInfoReg(FarmerEducationInfoRegVO farmerEducationInfoRegVO) throws Exception {

		int updatedCnt = farmerEducationInfoRegMapper.updateFarmerEducationInfoReg(farmerEducationInfoRegVO);

		return updatedCnt;
	}

	@Override
	public int multiSaveFarmerEducationInfoRegList(List<FarmerEducationInfoRegVO> farmerEducationInfoRegVOList) throws Exception {
		int savedCnt = 0;
		for (FarmerEducationInfoRegVO farmerEducationInfoRegVO : farmerEducationInfoRegVOList) {
			if(ComConstants.ROW_STS_INSERT.equals(farmerEducationInfoRegVO.getRowSts())) {
				savedCnt += insertFarmerEducationInfoReg(farmerEducationInfoRegVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(farmerEducationInfoRegVO.getRowSts())) {
				savedCnt += updateFarmerEducationInfoReg(farmerEducationInfoRegVO);
			}
		}
		return savedCnt;
	}
	*/

	@Override
	public int deleteFarmerEducationInfoReg(FarmerEducationInfoRegVO farmerEducationInfoRegVO) throws Exception {
		return farmerEducationInfoRegMapper.deleteFarmerEducationInfoReg(farmerEducationInfoRegVO);
	}

}
