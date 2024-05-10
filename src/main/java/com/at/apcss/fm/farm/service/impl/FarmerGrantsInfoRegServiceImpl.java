package com.at.apcss.fm.farm.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
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
public class FarmerGrantsInfoRegServiceImpl extends BaseServiceImpl implements FarmerGrantsInfoRegService{

	@Autowired
	private FarmerGrantsInfoRegMapper farmerGrantsInfoRegMapper;

	@Override
	public FarmerGrantsInfoRegVO selectFarmerGrantsInfoReg(FarmerGrantsInfoRegVO farmerGrantsInfoRegVO) throws Exception {

		FarmerGrantsInfoRegVO resultVO = farmerGrantsInfoRegMapper.selectFarmerGrantsInfoReg(farmerGrantsInfoRegVO);

		return resultVO;
	}

	@Override
	public List<FarmerGrantsInfoRegVO> selectFarmerGrantsInfoRegList(FarmerGrantsInfoRegVO farmerGrantsInfoRegVO) throws Exception {

		List<FarmerGrantsInfoRegVO> resultList = farmerGrantsInfoRegMapper.selectFarmerGrantsInfoRegList(farmerGrantsInfoRegVO);
		return resultList;
	}

	@Override
	public int insertFarmerGrantsInfoReg(FarmerGrantsInfoRegVO farmerGrantsInfoRegVO) throws Exception {

		int insertedCnt = farmerGrantsInfoRegMapper.insertFarmerGrantsInfoReg(farmerGrantsInfoRegVO);

		return insertedCnt;
	}

	@Override
	public int deleteFarmerGrantsInfoReg(FarmerGrantsInfoRegVO farmerGrantsInfoRegVO) throws Exception {
		return farmerGrantsInfoRegMapper.deleteFarmerGrantsInfoReg(farmerGrantsInfoRegVO);
	}

}
