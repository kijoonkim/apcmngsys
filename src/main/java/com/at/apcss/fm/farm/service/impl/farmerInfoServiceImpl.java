package com.at.apcss.fm.farm.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.fm.bbs.mapper.BbsMapper;
import com.at.apcss.fm.bbs.service.BbsService;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.fm.farm.mapper.farmerInfoMapper;
import com.at.apcss.fm.farm.service.farmerInfoService;
import com.at.apcss.fm.farm.vo.farmerInfoVO;


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
@Service("farmerInfoService")
public class farmerInfoServiceImpl implements farmerInfoService{

	@Autowired
	private farmerInfoMapper farmerInfoMapper;

	@Override
	public farmerInfoVO selectfarmerInfo(farmerInfoVO farmerInfoVO) throws Exception {

		farmerInfoVO resultVO = farmerInfoMapper.selectfarmerInfo(farmerInfoVO);

		return resultVO;
	}

	@Override
	public List<farmerInfoVO> selectfarmerInfoList(farmerInfoVO farmerInfoVO) throws Exception {

		List<farmerInfoVO> resultList = farmerInfoMapper.selectfarmerInfoList(farmerInfoVO);
		return resultList;
	}

	@Override
	public int insertfarmerInfo(farmerInfoVO farmerInfoVO) throws Exception {

		int insertedCnt = farmerInfoMapper.insertfarmerInfo(farmerInfoVO);

		return insertedCnt;
	}

	@Override
	public int updatefarmerInfo(farmerInfoVO farmerInfoVO) throws Exception {

		int updatedCnt = farmerInfoMapper.updatefarmerInfo(farmerInfoVO);

		return updatedCnt;
	}

	@Override
	public int multiSavefarmerInfoList(List<farmerInfoVO> farmerInfoVOList) throws Exception {
		int savedCnt = 0;
		for (farmerInfoVO farmerInfoVO : farmerInfoVOList) {
			if(ComConstants.ROW_STS_INSERT.equals(farmerInfoVO.getRowSts())) {
				savedCnt += insertfarmerInfo(farmerInfoVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(farmerInfoVO.getRowSts())) {
				savedCnt += updatefarmerInfo(farmerInfoVO);
			}
		}
		return savedCnt;
	}

	@Override
	public int deletefarmerInfo(farmerInfoVO farmerInfoVO) throws Exception {
		return farmerInfoMapper.deletefarmerInfo(farmerInfoVO);
	}

}
