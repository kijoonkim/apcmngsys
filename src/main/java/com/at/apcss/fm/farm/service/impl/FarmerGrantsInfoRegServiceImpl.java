package com.at.apcss.fm.farm.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.fm.bbs.mapper.BbsMapper;
import com.at.apcss.fm.bbs.service.BbsService;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.fm.farm.mapper.FarmerGrantsInfoRegMapper;
import com.at.apcss.fm.farm.service.FarmerGrantsInfoRegService;
import com.at.apcss.fm.farm.vo.FarmerGrantsInfoRegVO;


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
@Service("farmerGrantsInfoRegService")
public class FarmerGrantsInfoRegServiceImpl implements FarmerGrantsInfoRegService{

	@Autowired
	private FarmerGrantsInfoRegMapper farmerGrantsInfoRegMapper;

	@Override
	public FarmerGrantsInfoRegVO selectfarmerGrantsInfoReg(FarmerGrantsInfoRegVO farmerGrantsInfoRegVO) throws Exception {

		FarmerGrantsInfoRegVO resultVO = farmerGrantsInfoRegMapper.selectfarmerGrantsInfoReg(farmerGrantsInfoRegVO);

		return resultVO;
	}

	@Override
	public List<FarmerGrantsInfoRegVO> selectfarmerGrantsInfoRegList(FarmerGrantsInfoRegVO farmerGrantsInfoRegVO) throws Exception {

		List<FarmerGrantsInfoRegVO> resultList = farmerGrantsInfoRegMapper.selectfarmerGrantsInfoRegList(farmerGrantsInfoRegVO);
		return resultList;
	}

	@Override
	public int insertFarmerGrantsInfoReg(FarmerGrantsInfoRegVO farmerGrantsInfoRegVO) throws Exception {

		int insertedCnt = farmerGrantsInfoRegMapper.insertfarmerGrantsInfoReg(farmerGrantsInfoRegVO);

		return insertedCnt;
	}

	@Override
	public int updateFarmerGrantsInfoReg(FarmerGrantsInfoRegVO farmerGrantsInfoRegVO) throws Exception {

		int updatedCnt = farmerGrantsInfoRegMapper.updateFarmerGrantsInfoReg(farmerGrantsInfoRegVO);

		return updatedCnt;
	}

	@Override
	public int multiSavefarmerGrantsInfoRegList(List<FarmerGrantsInfoRegVO> farmerGrantsInfoRegVOList) throws Exception {
		int savedCnt = 0;
		for (FarmerGrantsInfoRegVO farmerGrantsInfoRegVO : farmerGrantsInfoRegVOList) {
			if(ComConstants.ROW_STS_INSERT.equals(farmerGrantsInfoRegVO.getRowSts())) {
				savedCnt += insertFarmerGrantsInfoReg(farmerGrantsInfoRegVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(farmerGrantsInfoRegVO.getRowSts())) {
				savedCnt += updateFarmerGrantsInfoReg(farmerGrantsInfoRegVO);
			}
		}
		return savedCnt;
	}

	@Override
	public int deletefarmerGrantsInfoReg(FarmerGrantsInfoRegVO farmerGrantsInfoRegVO) throws Exception {
		return farmerGrantsInfoRegMapper.deletefarmerGrantsInfoReg(farmerGrantsInfoRegVO);
	}

}
