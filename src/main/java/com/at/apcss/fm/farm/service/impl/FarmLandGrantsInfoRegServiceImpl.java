package com.at.apcss.fm.farm.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.fm.bbs.mapper.BbsMapper;
import com.at.apcss.fm.bbs.service.BbsService;
import com.at.apcss.fm.bbs.vo.BbsVO;
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
public class FarmLandGrantsInfoRegServiceImpl implements FarmLandGrantsInfoRegService{

	@Autowired
	private FarmLandGrantsInfoRegMapper farmLandGrantsInfoRegMapper;

	@Override
	public FarmLandGrantsInfoRegVO selectfarmLandGrantsInfoReg(FarmLandGrantsInfoRegVO farmLandGrantsInfoRegVO) throws Exception {

		FarmLandGrantsInfoRegVO resultVO = farmLandGrantsInfoRegMapper.selectfarmLandGrantsInfoReg(farmLandGrantsInfoRegVO);

		return resultVO;
	}

	@Override
	public List<FarmLandGrantsInfoRegVO> selectfarmLandGrantsInfoRegList(FarmLandGrantsInfoRegVO farmLandGrantsInfoRegVO) throws Exception {

		List<FarmLandGrantsInfoRegVO> resultList = farmLandGrantsInfoRegMapper.selectfarmLandGrantsInfoRegList(farmLandGrantsInfoRegVO);
		return resultList;
	}

	@Override
	public int insertFarmLandGrantsInfoReg(FarmLandGrantsInfoRegVO farmLandGrantsInfoRegVO) throws Exception {

		int insertedCnt = farmLandGrantsInfoRegMapper.insertfarmLandGrantsInfoReg(farmLandGrantsInfoRegVO);

		return insertedCnt;
	}

	@Override
	public int updateFarmLandGrantsInfoReg(FarmLandGrantsInfoRegVO farmLandGrantsInfoRegVO) throws Exception {

		int updatedCnt = farmLandGrantsInfoRegMapper.updateFarmLandGrantsInfoReg(farmLandGrantsInfoRegVO);

		return updatedCnt;
	}

	@Override
	public int multiSavefarmLandGrantsInfoRegList(List<FarmLandGrantsInfoRegVO> farmLandGrantsInfoRegVOList) throws Exception {
		int savedCnt = 0;
		for (FarmLandGrantsInfoRegVO farmLandGrantsInfoRegVO : farmLandGrantsInfoRegVOList) {
			if(ComConstants.ROW_STS_INSERT.equals(farmLandGrantsInfoRegVO.getRowSts())) {
				savedCnt += insertFarmLandGrantsInfoReg(farmLandGrantsInfoRegVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(farmLandGrantsInfoRegVO.getRowSts())) {
				savedCnt += updateFarmLandGrantsInfoReg(farmLandGrantsInfoRegVO);
			}
		}
		return savedCnt;
	}

	@Override
	public int deletefarmLandGrantsInfoReg(FarmLandGrantsInfoRegVO farmLandGrantsInfoRegVO) throws Exception {
		return farmLandGrantsInfoRegMapper.deletefarmLandGrantsInfoReg(farmLandGrantsInfoRegVO);
	}

}
