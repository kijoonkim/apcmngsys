package com.at.apcss.fm.farm.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.fm.farm.mapper.FarmerSnCertificationInfoRegMapper;
import com.at.apcss.fm.farm.service.FarmerSnCertificationInfoRegService;
import com.at.apcss.fm.farm.vo.FarmerSnCertificationInfoRegVO;


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
@Service("farmerSnCertificationInfoRegService")
public class FarmerSnCertificationInfoRegServiceImpl extends BaseServiceImpl implements FarmerSnCertificationInfoRegService{

	@Autowired
	private FarmerSnCertificationInfoRegMapper farmerSnCertificationInfoRegMapper;

	@Override
	public FarmerSnCertificationInfoRegVO selectFarmerSnCertificationInfoReg(FarmerSnCertificationInfoRegVO farmerSnCertificationInfoRegVO) throws Exception {

		FarmerSnCertificationInfoRegVO resultVO = farmerSnCertificationInfoRegMapper.selectFarmerSnCertificationInfoReg(farmerSnCertificationInfoRegVO);

		return resultVO;
	}

	@Override
	public List<FarmerSnCertificationInfoRegVO> selectFarmerSnCertificationInfoRegList(FarmerSnCertificationInfoRegVO farmerSnCertificationInfoRegVO) throws Exception {

		List<FarmerSnCertificationInfoRegVO> resultList = farmerSnCertificationInfoRegMapper.selectFarmerSnCertificationInfoRegList(farmerSnCertificationInfoRegVO);
		return resultList;
	}

	@Override
	public int insertFarmerSnCertificationInfoReg(FarmerSnCertificationInfoRegVO farmerSnCertificationInfoRegVO) throws Exception {

		int insertedCnt = farmerSnCertificationInfoRegMapper.insertFarmerSnCertificationInfoReg(farmerSnCertificationInfoRegVO);

		return insertedCnt;
	}

	@Override
	public int deleteFarmerSnCertificationInfoReg(FarmerSnCertificationInfoRegVO farmerSnCertificationInfoRegVO) throws Exception {
		return farmerSnCertificationInfoRegMapper.deleteFarmerSnCertificationInfoReg(farmerSnCertificationInfoRegVO);
	}

}
