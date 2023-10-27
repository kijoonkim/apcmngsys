package com.at.apcss.fm.farm.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.fm.bbs.mapper.BbsMapper;
import com.at.apcss.fm.bbs.service.BbsService;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.fm.farm.mapper.FarmerInfoLogMapper;
import com.at.apcss.fm.farm.service.FarmerInfoLogService;
import com.at.apcss.fm.farm.vo.FarmerInfoLogVO;


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
@Service("farmerInfoLogService")
public class FarmerInfoLogServiceImpl implements FarmerInfoLogService{

	@Autowired
	private FarmerInfoLogMapper farmerInfoLogMapper;

	@Override
	public FarmerInfoLogVO selectFarmerInfoLog(FarmerInfoLogVO farmerInfoLogVO) throws Exception {

		FarmerInfoLogVO resultVO = farmerInfoLogMapper.selectFarmerInfoLog(farmerInfoLogVO);

		return resultVO;
	}

	@Override
	public List<FarmerInfoLogVO> selectFarmerInfoLogList(FarmerInfoLogVO farmerInfoLogVO) throws Exception {

		List<FarmerInfoLogVO> resultList = farmerInfoLogMapper.selectFarmerInfoLogList(farmerInfoLogVO);
		return resultList;
	}

	@Override
	public int insertFarmerInfoLog(FarmerInfoLogVO farmerInfoLogVO) throws Exception {

		int insertedCnt = farmerInfoLogMapper.insertFarmerInfoLog(farmerInfoLogVO);

		return insertedCnt;
	}

	@Override
	public int updateFarmerInfoLog(FarmerInfoLogVO farmerInfoLogVO) throws Exception {

		int updatedCnt = farmerInfoLogMapper.updateFarmerInfoLog(farmerInfoLogVO);

		return updatedCnt;
	}

	@Override
	public int multiSaveFarmerInfoLogList(List<FarmerInfoLogVO> farmerInfoLogVOList) throws Exception {
		int savedCnt = 0;
		for (FarmerInfoLogVO farmerInfoLogVO : farmerInfoLogVOList) {
			if(ComConstants.ROW_STS_INSERT.equals(farmerInfoLogVO.getRowSts())) {
				savedCnt += insertFarmerInfoLog(farmerInfoLogVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(farmerInfoLogVO.getRowSts())) {
				savedCnt += updateFarmerInfoLog(farmerInfoLogVO);
			}
		}
		return savedCnt;
	}

	@Override
	public int insertMegerFarmerInfoLog(FarmerInfoLogVO farmerInfoLogVO) throws Exception {
		return farmerInfoLogMapper.insertMegerFarmerInfoLog(farmerInfoLogVO);
	}
	@Override
	public int insertMegerLogFarmerInfoLog(FarmerInfoLogVO farmerInfoLogVO) throws Exception {
		return farmerInfoLogMapper.insertMegerLogFarmerInfoLog(farmerInfoLogVO);
	}
	@Override
	public int updateMegerFarmerInfoLog(FarmerInfoLogVO farmerInfoLogVO) throws Exception {
		return farmerInfoLogMapper.updateMegerFarmerInfoLog(farmerInfoLogVO);
	}

	@Override
	public int deleteFarmerInfoLog(FarmerInfoLogVO farmerInfoLogVO) throws Exception {
		return farmerInfoLogMapper.deleteFarmerInfoLog(farmerInfoLogVO);
	}

}
