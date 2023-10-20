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
	public FarmerInfoLogVO selectfarmerInfoLog(FarmerInfoLogVO farmerInfoLogVO) throws Exception {

		FarmerInfoLogVO resultVO = farmerInfoLogMapper.selectfarmerInfoLog(farmerInfoLogVO);

		return resultVO;
	}

	@Override
	public List<FarmerInfoLogVO> selectfarmerInfoLogList(FarmerInfoLogVO farmerInfoLogVO) throws Exception {

		List<FarmerInfoLogVO> resultList = farmerInfoLogMapper.selectfarmerInfoLogList(farmerInfoLogVO);
		return resultList;
	}

	@Override
	public int insertfarmerInfoLog(FarmerInfoLogVO farmerInfoLogVO) throws Exception {

		int insertedCnt = farmerInfoLogMapper.insertfarmerInfoLog(farmerInfoLogVO);

		return insertedCnt;
	}

	@Override
	public int updatefarmerInfoLog(FarmerInfoLogVO farmerInfoLogVO) throws Exception {

		int updatedCnt = farmerInfoLogMapper.updatefarmerInfoLog(farmerInfoLogVO);

		return updatedCnt;
	}

	@Override
	public int multiSavefarmerInfoLogList(List<FarmerInfoLogVO> farmerInfoLogVOList) throws Exception {
		int savedCnt = 0;
		for (FarmerInfoLogVO farmerInfoLogVO : farmerInfoLogVOList) {
			if(ComConstants.ROW_STS_INSERT.equals(farmerInfoLogVO.getRowSts())) {
				savedCnt += insertfarmerInfoLog(farmerInfoLogVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(farmerInfoLogVO.getRowSts())) {
				savedCnt += updatefarmerInfoLog(farmerInfoLogVO);
			}
		}
		return savedCnt;
	}

	@Override
	public int insertMegerfarmerInfoLog(FarmerInfoLogVO farmerInfoLogVO) throws Exception {
		return farmerInfoLogMapper.insertMegerfarmerInfoLog(farmerInfoLogVO);
	}
	@Override
	public int insertMegerLogfarmerInfoLog(FarmerInfoLogVO farmerInfoLogVO) throws Exception {
		return farmerInfoLogMapper.insertMegerLogfarmerInfoLog(farmerInfoLogVO);
	}
	@Override
	public int updateMegerfarmerInfoLog(FarmerInfoLogVO farmerInfoLogVO) throws Exception {
		return farmerInfoLogMapper.updateMegerfarmerInfoLog(farmerInfoLogVO);
	}

	@Override
	public int deletefarmerInfoLog(FarmerInfoLogVO farmerInfoLogVO) throws Exception {
		return farmerInfoLogMapper.deletefarmerInfoLog(farmerInfoLogVO);
	}

}
