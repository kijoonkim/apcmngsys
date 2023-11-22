package com.at.apcss.fm.farm.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.fm.bbs.mapper.BbsMapper;
import com.at.apcss.fm.bbs.service.BbsService;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.fm.farm.mapper.FarmLandInfoRegMapper;
import com.at.apcss.fm.farm.service.FarmLandInfoRegService;
import com.at.apcss.fm.farm.vo.FarmLandInfoRegVO;


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
@Service("farmLandInfoRegService")
public class FarmLandInfoRegServiceImpl extends BaseServiceImpl implements FarmLandInfoRegService{

	@Autowired
	private FarmLandInfoRegMapper farmLandInfoRegMapper;

	@Override
	public FarmLandInfoRegVO selectFarmLandInfoReg(FarmLandInfoRegVO farmLandInfoRegVO) throws Exception {

		FarmLandInfoRegVO resultVO = farmLandInfoRegMapper.selectFarmLandInfoReg(farmLandInfoRegVO);

		return resultVO;
	}

	@Override
	public List<FarmLandInfoRegVO> selectFarmLandInfoRegList(FarmLandInfoRegVO farmLandInfoRegVO) throws Exception {

		List<FarmLandInfoRegVO> resultList = farmLandInfoRegMapper.selectFarmLandInfoRegList(farmLandInfoRegVO);
		return resultList;
	}

	@Override
	public int insertFarmLandInfoReg(FarmLandInfoRegVO farmLandInfoRegVO) throws Exception {

		int insertedCnt = farmLandInfoRegMapper.insertFarmLandInfoReg(farmLandInfoRegVO);

		return insertedCnt;
	}

	@Override
	public int updateFarmLandInfoReg(FarmLandInfoRegVO farmLandInfoRegVO) throws Exception {

		int updatedCnt = farmLandInfoRegMapper.updateFarmLandInfoReg(farmLandInfoRegVO);

		return updatedCnt;
	}

	@Override
	public int multiSaveFarmLandInfoRegList(List<FarmLandInfoRegVO> farmLandInfoRegVOList) throws Exception {
		int savedCnt = 0;
		for (FarmLandInfoRegVO farmLandInfoRegVO : farmLandInfoRegVOList) {
			if(ComConstants.ROW_STS_INSERT.equals(farmLandInfoRegVO.getRowSts())) {
				savedCnt += insertFarmLandInfoReg(farmLandInfoRegVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(farmLandInfoRegVO.getRowSts())) {
				savedCnt += updateFarmLandInfoReg(farmLandInfoRegVO);
			}
		}
		return savedCnt;
	}

	@Override
	public int deleteFarmLandInfoReg(FarmLandInfoRegVO farmLandInfoRegVO) throws Exception {
		return farmLandInfoRegMapper.deleteFarmLandInfoReg(farmLandInfoRegVO);
	}

}
