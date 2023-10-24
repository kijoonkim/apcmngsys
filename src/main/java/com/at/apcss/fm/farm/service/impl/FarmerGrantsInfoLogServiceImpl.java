package com.at.apcss.fm.farm.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.co.constants.ComConstants;
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
public class FarmerGrantsInfoLogServiceImpl implements FarmerGrantsInfoLogService{

	@Autowired
	private FarmerGrantsInfoLogMapper farmerGrantsInfoLogMapper;

	@Override
	public FarmerGrantsInfoLogVO selectfarmerGrantsInfoLog(FarmerGrantsInfoLogVO farmerGrantsInfoLogVO) throws Exception {

		FarmerGrantsInfoLogVO resultVO = farmerGrantsInfoLogMapper.selectfarmerGrantsInfoLog(farmerGrantsInfoLogVO);

		return resultVO;
	}

	@Override
	public List<FarmerGrantsInfoLogVO> selectfarmerGrantsInfoLogList(FarmerGrantsInfoLogVO farmerGrantsInfoLogVO) throws Exception {

		List<FarmerGrantsInfoLogVO> resultList = farmerGrantsInfoLogMapper.selectfarmerGrantsInfoLogList(farmerGrantsInfoLogVO);
		return resultList;
	}

	@Override
	public int insertfarmerGrantsInfoLog(FarmerGrantsInfoLogVO farmerGrantsInfoLogVO) throws Exception {

		int insertedCnt = farmerGrantsInfoLogMapper.insertfarmerGrantsInfoLog(farmerGrantsInfoLogVO);

		return insertedCnt;
	}

	@Override
	public int updatefarmerGrantsInfoLog(FarmerGrantsInfoLogVO farmerGrantsInfoLogVO) throws Exception {

		int updatedCnt = farmerGrantsInfoLogMapper.updatefarmerGrantsInfoLog(farmerGrantsInfoLogVO);

		return updatedCnt;
	}

	@Override
	public int multiSavefarmerGrantsInfoLogList(List<FarmerGrantsInfoLogVO> farmerGrantsInfoLogVOList) throws Exception {
		int savedCnt = 0;
		for (FarmerGrantsInfoLogVO farmerGrantsInfoLogVO : farmerGrantsInfoLogVOList) {
			if(ComConstants.ROW_STS_INSERT.equals(farmerGrantsInfoLogVO.getRowSts())) {
				savedCnt += insertfarmerGrantsInfoLog(farmerGrantsInfoLogVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(farmerGrantsInfoLogVO.getRowSts())) {
				savedCnt += updatefarmerGrantsInfoLog(farmerGrantsInfoLogVO);
			}
		}
		return savedCnt;
	}

	@Override
	public int insertMegerfarmerGrantsInfoLog(FarmerGrantsInfoLogVO farmerGrantsInfoLogVO) throws Exception {
		return farmerGrantsInfoLogMapper.insertMegerfarmerGrantsInfoLog(farmerGrantsInfoLogVO);
	}
	@Override
	public int insertMegerLogfarmerGrantsInfoLog(FarmerGrantsInfoLogVO farmerGrantsInfoLogVO) throws Exception {
		return farmerGrantsInfoLogMapper.insertMegerLogfarmerGrantsInfoLog(farmerGrantsInfoLogVO);
	}
	@Override
	public int updateMegerfarmerGrantsInfoLog(FarmerGrantsInfoLogVO farmerGrantsInfoLogVO) throws Exception {
		return farmerGrantsInfoLogMapper.updateMegerfarmerGrantsInfoLog(farmerGrantsInfoLogVO);
	}

	@Override
	public int deletefarmerGrantsInfoLog(FarmerGrantsInfoLogVO farmerGrantsInfoLogVO) throws Exception {
		return farmerGrantsInfoLogMapper.deletefarmerGrantsInfoLog(farmerGrantsInfoLogVO);
	}

}
