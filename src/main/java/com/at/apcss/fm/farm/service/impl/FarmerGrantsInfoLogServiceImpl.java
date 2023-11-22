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
import com.at.apcss.fm.farm.mapper.FarmerGrantsInfoLogMapper;
import com.at.apcss.fm.farm.service.FarmerGrantsInfoLogService;
import com.at.apcss.fm.farm.vo.FarmerGrantsInfoLogVO;


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
@Service("farmerGrantsInfoLogService")
public class FarmerGrantsInfoLogServiceImpl extends BaseServiceImpl implements FarmerGrantsInfoLogService{

	@Autowired
	private FarmerGrantsInfoLogMapper farmerGrantsInfoLogMapper;

	@Override
	public FarmerGrantsInfoLogVO selectFarmerGrantsInfoLog(FarmerGrantsInfoLogVO farmerGrantsInfoLogVO) throws Exception {

		FarmerGrantsInfoLogVO resultVO = farmerGrantsInfoLogMapper.selectFarmerGrantsInfoLog(farmerGrantsInfoLogVO);

		return resultVO;
	}

	@Override
	public List<FarmerGrantsInfoLogVO> selectFarmerGrantsInfoLogList(FarmerGrantsInfoLogVO farmerGrantsInfoLogVO) throws Exception {

		List<FarmerGrantsInfoLogVO> resultList = farmerGrantsInfoLogMapper.selectFarmerGrantsInfoLogList(farmerGrantsInfoLogVO);
		return resultList;
	}

	@Override
	public int insertFarmerGrantsInfoLog(FarmerGrantsInfoLogVO farmerGrantsInfoLogVO) throws Exception {

		int insertedCnt = farmerGrantsInfoLogMapper.insertFarmerGrantsInfoLog(farmerGrantsInfoLogVO);

		return insertedCnt;
	}

	@Override
	public int updateFarmerGrantsInfoLog(FarmerGrantsInfoLogVO farmerGrantsInfoLogVO) throws Exception {

		int updatedCnt = farmerGrantsInfoLogMapper.updateFarmerGrantsInfoLog(farmerGrantsInfoLogVO);

		return updatedCnt;
	}

	@Override
	public int multiSaveFarmerGrantsInfoLogList(List<FarmerGrantsInfoLogVO> farmerGrantsInfoLogVOList) throws Exception {
		int savedCnt = 0;
		for (FarmerGrantsInfoLogVO farmerGrantsInfoLogVO : farmerGrantsInfoLogVOList) {
			if(ComConstants.ROW_STS_INSERT.equals(farmerGrantsInfoLogVO.getRowSts())) {
				savedCnt += insertFarmerGrantsInfoLog(farmerGrantsInfoLogVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(farmerGrantsInfoLogVO.getRowSts())) {
				savedCnt += updateFarmerGrantsInfoLog(farmerGrantsInfoLogVO);
			}
		}
		return savedCnt;
	}

	@Override
	public int insertMegerFarmerGrantsInfoLog(FarmerGrantsInfoLogVO farmerGrantsInfoLogVO) throws Exception {
		return farmerGrantsInfoLogMapper.insertMegerFarmerGrantsInfoLog(farmerGrantsInfoLogVO);
	}
	@Override
	public int insertMegerLogFarmerGrantsInfoLog(FarmerGrantsInfoLogVO farmerGrantsInfoLogVO) throws Exception {
		return farmerGrantsInfoLogMapper.insertMegerLogFarmerGrantsInfoLog(farmerGrantsInfoLogVO);
	}
	@Override
	public int updateMegerFarmerGrantsInfoLog(FarmerGrantsInfoLogVO farmerGrantsInfoLogVO) throws Exception {
		return farmerGrantsInfoLogMapper.updateMegerFarmerGrantsInfoLog(farmerGrantsInfoLogVO);
	}

	@Override
	public int deleteFarmerGrantsInfoLog(FarmerGrantsInfoLogVO farmerGrantsInfoLogVO) throws Exception {
		return farmerGrantsInfoLogMapper.deleteFarmerGrantsInfoLog(farmerGrantsInfoLogVO);
	}

}
