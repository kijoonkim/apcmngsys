package com.at.apcss.fm.farm.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.fm.bbs.mapper.BbsMapper;
import com.at.apcss.fm.bbs.service.BbsService;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.fm.farm.mapper.FarmLandInfoMapper;
import com.at.apcss.fm.farm.service.FarmLandInfoService;
import com.at.apcss.fm.farm.vo.FarmLandInfoVO;


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
@Service("farmLandInfoService")
public class FarmLandInfoServiceImpl implements FarmLandInfoService{

	@Autowired
	private FarmLandInfoMapper farmLandInfoMapper;

	@Override
	public FarmLandInfoVO selectfarmLandInfo(FarmLandInfoVO farmLandInfoVO) throws Exception {

		FarmLandInfoVO resultVO = farmLandInfoMapper.selectfarmLandInfo(farmLandInfoVO);

		return resultVO;
	}

	@Override
	public List<FarmLandInfoVO> selectfarmLandInfoList(FarmLandInfoVO farmLandInfoVO) throws Exception {

		List<FarmLandInfoVO> resultList = farmLandInfoMapper.selectfarmLandInfoList(farmLandInfoVO);
		return resultList;
	}

	@Override
	public int insertfarmLandInfo(FarmLandInfoVO farmLandInfoVO) throws Exception {

		int insertedCnt = farmLandInfoMapper.insertfarmLandInfo(farmLandInfoVO);

		return insertedCnt;
	}

	@Override
	public int updatefarmLandInfo(FarmLandInfoVO farmLandInfoVO) throws Exception {

		int updatedCnt = farmLandInfoMapper.updatefarmLandInfo(farmLandInfoVO);

		return updatedCnt;
	}

	@Override
	public int multiSavefarmLandInfoList(List<FarmLandInfoVO> farmLandInfoVOList) throws Exception {
		int savedCnt = 0;
		for (FarmLandInfoVO farmLandInfoVO : farmLandInfoVOList) {
			if(ComConstants.ROW_STS_INSERT.equals(farmLandInfoVO.getRowSts())) {
				savedCnt += insertfarmLandInfo(farmLandInfoVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(farmLandInfoVO.getRowSts())) {
				savedCnt += updatefarmLandInfo(farmLandInfoVO);
			}
		}
		return savedCnt;
	}

	@Override
	public int deletefarmLandInfo(FarmLandInfoVO farmLandInfoVO) throws Exception {
		return farmLandInfoMapper.deletefarmLandInfo(farmLandInfoVO);
	}

}
