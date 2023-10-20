package com.at.apcss.fm.farm.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.fm.bbs.mapper.BbsMapper;
import com.at.apcss.fm.bbs.service.BbsService;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.fm.farm.mapper.farmLandInfoMapper;
import com.at.apcss.fm.farm.service.farmLandInfoService;
import com.at.apcss.fm.farm.vo.farmLandInfoVO;


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
public class farmLandInfoServiceImpl implements farmLandInfoService{

	@Autowired
	private farmLandInfoMapper farmLandInfoMapper;

	@Override
	public farmLandInfoVO selectfarmLandInfo(farmLandInfoVO farmLandInfoVO) throws Exception {

		farmLandInfoVO resultVO = farmLandInfoMapper.selectfarmLandInfo(farmLandInfoVO);

		return resultVO;
	}

	@Override
	public List<farmLandInfoVO> selectfarmLandInfoList(farmLandInfoVO farmLandInfoVO) throws Exception {

		List<farmLandInfoVO> resultList = farmLandInfoMapper.selectfarmLandInfoList(farmLandInfoVO);
		return resultList;
	}

	@Override
	public int insertfarmLandInfo(farmLandInfoVO farmLandInfoVO) throws Exception {

		int insertedCnt = farmLandInfoMapper.insertfarmLandInfo(farmLandInfoVO);

		return insertedCnt;
	}

	@Override
	public int updatefarmLandInfo(farmLandInfoVO farmLandInfoVO) throws Exception {

		int updatedCnt = farmLandInfoMapper.updatefarmLandInfo(farmLandInfoVO);

		return updatedCnt;
	}

	@Override
	public int multiSavefarmLandInfoList(List<farmLandInfoVO> farmLandInfoVOList) throws Exception {
		int savedCnt = 0;
		for (farmLandInfoVO farmLandInfoVO : farmLandInfoVOList) {
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
	public int deletefarmLandInfo(farmLandInfoVO farmLandInfoVO) throws Exception {
		return farmLandInfoMapper.deletefarmLandInfo(farmLandInfoVO);
	}

}
