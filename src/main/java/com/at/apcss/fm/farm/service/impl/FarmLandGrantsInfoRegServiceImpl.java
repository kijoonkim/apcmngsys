package com.at.apcss.fm.farm.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.fm.farm.mapper.FarmLandGrantsInfoRegMapper;
import com.at.apcss.fm.farm.service.FarmLandGrantsInfoRegService;
import com.at.apcss.fm.farm.vo.FarmLandGrantsInfoRegVO;


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
@Service("farmLandGrantsInfoRegService")
public class FarmLandGrantsInfoRegServiceImpl extends BaseServiceImpl implements FarmLandGrantsInfoRegService{

	@Autowired
	private FarmLandGrantsInfoRegMapper FarmLandGrantsInfoRegMapper;

	@Override
	public FarmLandGrantsInfoRegVO selectFarmLandGrantsInfoReg(FarmLandGrantsInfoRegVO FarmLandGrantsInfoRegVO) throws Exception {

		FarmLandGrantsInfoRegVO resultVO = FarmLandGrantsInfoRegMapper.selectFarmLandGrantsInfoReg(FarmLandGrantsInfoRegVO);

		return resultVO;
	}

	@Override
	public List<FarmLandGrantsInfoRegVO> selectFarmLandGrantsInfoRegList(FarmLandGrantsInfoRegVO FarmLandGrantsInfoRegVO) throws Exception {

		List<FarmLandGrantsInfoRegVO> resultList = FarmLandGrantsInfoRegMapper.selectFarmLandGrantsInfoRegList(FarmLandGrantsInfoRegVO);
		return resultList;
	}

	@Override
	public int insertFarmLandGrantsInfoReg(FarmLandGrantsInfoRegVO FarmLandGrantsInfoRegVO) throws Exception {

		int insertedCnt = FarmLandGrantsInfoRegMapper.insertFarmLandGrantsInfoReg(FarmLandGrantsInfoRegVO);

		return insertedCnt;
	}

	@Override
	public int deleteFarmLandGrantsInfoReg(FarmLandGrantsInfoRegVO FarmLandGrantsInfoRegVO) throws Exception {
		return FarmLandGrantsInfoRegMapper.deleteFarmLandGrantsInfoReg(FarmLandGrantsInfoRegVO);
	}

}
