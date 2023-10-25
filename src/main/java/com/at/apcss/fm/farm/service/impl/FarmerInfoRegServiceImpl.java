package com.at.apcss.fm.farm.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.fm.bbs.mapper.BbsMapper;
import com.at.apcss.fm.bbs.service.BbsService;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.fm.farm.mapper.FarmerInfoRegMapper;
import com.at.apcss.fm.farm.service.FarmerInfoRegService;
import com.at.apcss.fm.farm.vo.FarmerInfoRegVO;


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
@Service("farmerInfoRegService")
public class FarmerInfoRegServiceImpl implements FarmerInfoRegService{

	@Autowired
	private FarmerInfoRegMapper farmerInfoRegMapper;

	@Override
	public FarmerInfoRegVO selectFarmerInfoReg(FarmerInfoRegVO farmerInfoRegVO) throws Exception {

		FarmerInfoRegVO resultVO = farmerInfoRegMapper.selectFarmerInfoReg(farmerInfoRegVO);

		return resultVO;
	}

	@Override
	public List<FarmerInfoRegVO> selectFarmerInfoRegList(FarmerInfoRegVO farmerInfoRegVO) throws Exception {

		List<FarmerInfoRegVO> resultList = farmerInfoRegMapper.selectFarmerInfoRegList(farmerInfoRegVO);
		return resultList;
	}

	@Override
	public int insertFarmerInfoReg(FarmerInfoRegVO farmerInfoRegVO) throws Exception {

		int insertedCnt = farmerInfoRegMapper.insertFarmerInfoReg(farmerInfoRegVO);

		return insertedCnt;
	}

	@Override
	public int updateFarmerInfoReg(FarmerInfoRegVO farmerInfoRegVO) throws Exception {

		int updatedCnt = farmerInfoRegMapper.updateFarmerInfoReg(farmerInfoRegVO);

		return updatedCnt;
	}

	@Override
	public int multiSaveFarmerInfoRegList(List<FarmerInfoRegVO> farmerInfoRegVOList) throws Exception {
		int savedCnt = 0;
		for (FarmerInfoRegVO farmerInfoRegVO : farmerInfoRegVOList) {
			if(ComConstants.ROW_STS_INSERT.equals(farmerInfoRegVO.getRowSts())) {
				savedCnt += insertFarmerInfoReg(farmerInfoRegVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(farmerInfoRegVO.getRowSts())) {
				savedCnt += updateFarmerInfoReg(farmerInfoRegVO);
			}
		}
		return savedCnt;
	}

	@Override
	public int deleteFarmerInfoReg(FarmerInfoRegVO farmerInfoRegVO) throws Exception {
		return farmerInfoRegMapper.deleteFarmerInfoReg(farmerInfoRegVO);
	}

}
