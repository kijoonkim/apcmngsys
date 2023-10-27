package com.at.apcss.fm.farm.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.fm.bbs.mapper.BbsMapper;
import com.at.apcss.fm.bbs.service.BbsService;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.fm.farm.mapper.FarmLandInfoLogMapper;
import com.at.apcss.fm.farm.service.FarmLandInfoLogService;
import com.at.apcss.fm.farm.vo.FarmLandInfoLogVO;


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
@Service("farmLandInfoLogService")
public class FarmLandInfoLogServiceImpl implements FarmLandInfoLogService{

	@Autowired
	private FarmLandInfoLogMapper farmLandInfoLogMapper;

	@Override
	public FarmLandInfoLogVO selectFarmLandInfoLog(FarmLandInfoLogVO farmLandInfoLogVO) throws Exception {

		FarmLandInfoLogVO resultVO = farmLandInfoLogMapper.selectFarmLandInfoLog(farmLandInfoLogVO);

		return resultVO;
	}

	@Override
	public List<FarmLandInfoLogVO> selectFarmLandInfoLogList(FarmLandInfoLogVO farmLandInfoLogVO) throws Exception {

		List<FarmLandInfoLogVO> resultList = farmLandInfoLogMapper.selectFarmLandInfoLogList(farmLandInfoLogVO);
		return resultList;
	}

	@Override
	public int insertFarmLandInfoLog(FarmLandInfoLogVO farmLandInfoLogVO) throws Exception {

		int insertedCnt = farmLandInfoLogMapper.insertFarmLandInfoLog(farmLandInfoLogVO);

		return insertedCnt;
	}

	@Override
	public int updateFarmLandInfoLog(FarmLandInfoLogVO farmLandInfoLogVO) throws Exception {

		int updatedCnt = farmLandInfoLogMapper.updateFarmLandInfoLog(farmLandInfoLogVO);

		return updatedCnt;
	}

	@Override
	public int multiSaveFarmLandInfoLogList(List<FarmLandInfoLogVO> farmLandInfoLogVOList) throws Exception {
		int savedCnt = 0;
		for (FarmLandInfoLogVO farmLandInfoLogVO : farmLandInfoLogVOList) {
			if(ComConstants.ROW_STS_INSERT.equals(farmLandInfoLogVO.getRowSts())) {
				savedCnt += insertFarmLandInfoLog(farmLandInfoLogVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(farmLandInfoLogVO.getRowSts())) {
				savedCnt += updateFarmLandInfoLog(farmLandInfoLogVO);
			}
		}
		return savedCnt;
	}

	@Override
	public int insertMegerFarmLandInfoLog(FarmLandInfoLogVO farmLandInfoLogVO) throws Exception {
		return farmLandInfoLogMapper.insertMegerFarmLandInfoLog(farmLandInfoLogVO);
	}
	@Override
	public int insertMegerLogFarmLandInfoLog(FarmLandInfoLogVO farmLandInfoLogVO) throws Exception {
		return farmLandInfoLogMapper.insertMegerLogFarmLandInfoLog(farmLandInfoLogVO);
	}
	@Override
	public int updateMegerFarmLandInfoLog(FarmLandInfoLogVO farmLandInfoLogVO) throws Exception {
		return farmLandInfoLogMapper.updateMegerFarmLandInfoLog(farmLandInfoLogVO);
	}

	@Override
	public int deleteFarmLandInfoLog(FarmLandInfoLogVO farmLandInfoLogVO) throws Exception {
		return farmLandInfoLogMapper.deleteFarmLandInfoLog(farmLandInfoLogVO);
	}

}
