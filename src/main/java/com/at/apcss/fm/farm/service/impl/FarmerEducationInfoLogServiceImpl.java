package com.at.apcss.fm.farm.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.fm.bbs.mapper.BbsMapper;
import com.at.apcss.fm.bbs.service.BbsService;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.fm.farm.mapper.FarmerEducationInfoLogMapper;
import com.at.apcss.fm.farm.service.FarmerEducationInfoLogService;
import com.at.apcss.fm.farm.vo.FarmerEducationInfoLogVO;


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
@Service("farmerEducationInfoLogService")
public class FarmerEducationInfoLogServiceImpl implements FarmerEducationInfoLogService{

	@Autowired
	private FarmerEducationInfoLogMapper farmerEducationInfoLogMapper;

	@Override
	public FarmerEducationInfoLogVO selectfarmerEducationInfoLog(FarmerEducationInfoLogVO farmerEducationInfoLogVO) throws Exception {

		FarmerEducationInfoLogVO resultVO = farmerEducationInfoLogMapper.selectfarmerEducationInfoLog(farmerEducationInfoLogVO);

		return resultVO;
	}

	@Override
	public List<FarmerEducationInfoLogVO> selectfarmerEducationInfoLogList(FarmerEducationInfoLogVO farmerEducationInfoLogVO) throws Exception {

		List<FarmerEducationInfoLogVO> resultList = farmerEducationInfoLogMapper.selectfarmerEducationInfoLogList(farmerEducationInfoLogVO);
		return resultList;
	}

	@Override
	public int insertfarmerEducationInfoLog(FarmerEducationInfoLogVO farmerEducationInfoLogVO) throws Exception {

		int insertedCnt = farmerEducationInfoLogMapper.insertfarmerEducationInfoLog(farmerEducationInfoLogVO);

		return insertedCnt;
	}

	@Override
	public int updatefarmerEducationInfoLog(FarmerEducationInfoLogVO farmerEducationInfoLogVO) throws Exception {

		int updatedCnt = farmerEducationInfoLogMapper.updatefarmerEducationInfoLog(farmerEducationInfoLogVO);

		return updatedCnt;
	}

	@Override
	public int multiSavefarmerEducationInfoLogList(List<FarmerEducationInfoLogVO> farmerEducationInfoLogVOList) throws Exception {
		int savedCnt = 0;
		for (FarmerEducationInfoLogVO farmerEducationInfoLogVO : farmerEducationInfoLogVOList) {
			if(ComConstants.ROW_STS_INSERT.equals(farmerEducationInfoLogVO.getRowSts())) {
				savedCnt += insertfarmerEducationInfoLog(farmerEducationInfoLogVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(farmerEducationInfoLogVO.getRowSts())) {
				savedCnt += updatefarmerEducationInfoLog(farmerEducationInfoLogVO);
			}
		}
		return savedCnt;
	}

	@Override
	public int insertMegerfarmerEducationInfoLog(FarmerEducationInfoLogVO farmerEducationInfoLogVO) throws Exception {
		return farmerEducationInfoLogMapper.insertMegerfarmerEducationInfoLog(farmerEducationInfoLogVO);
	}
	@Override
	public int insertMegerLogfarmerEducationInfoLog(FarmerEducationInfoLogVO farmerEducationInfoLogVO) throws Exception {
		return farmerEducationInfoLogMapper.insertMegerLogfarmerEducationInfoLog(farmerEducationInfoLogVO);
	}
	@Override
	public int updateMegerfarmerEducationInfoLog(FarmerEducationInfoLogVO farmerEducationInfoLogVO) throws Exception {
		return farmerEducationInfoLogMapper.updateMegerfarmerEducationInfoLog(farmerEducationInfoLogVO);
	}

	@Override
	public int deletefarmerEducationInfoLog(FarmerEducationInfoLogVO farmerEducationInfoLogVO) throws Exception {
		return farmerEducationInfoLogMapper.deletefarmerEducationInfoLog(farmerEducationInfoLogVO);
	}

}
