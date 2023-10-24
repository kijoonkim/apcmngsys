package com.at.apcss.fm.farm.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.fm.bbs.mapper.BbsMapper;
import com.at.apcss.fm.bbs.service.BbsService;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.fm.farm.mapper.FarmLandGrantsInfoLogMapper;
import com.at.apcss.fm.farm.service.FarmLandGrantsInfoLogService;
import com.at.apcss.fm.farm.vo.FarmLandGrantsInfoLogVO;


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
@Service("farmLandGrantsInfoLogService")
public class FarmLandGrantsInfoLogServiceImpl implements FarmLandGrantsInfoLogService{

	@Autowired
	private FarmLandGrantsInfoLogMapper farmLandGrantsInfoLogMapper;

	@Override
	public FarmLandGrantsInfoLogVO selectfarmLandGrantsInfoLog(FarmLandGrantsInfoLogVO farmLandGrantsInfoLogVO) throws Exception {

		FarmLandGrantsInfoLogVO resultVO = farmLandGrantsInfoLogMapper.selectfarmLandGrantsInfoLog(farmLandGrantsInfoLogVO);

		return resultVO;
	}

	@Override
	public List<FarmLandGrantsInfoLogVO> selectfarmLandGrantsInfoLogList(FarmLandGrantsInfoLogVO farmLandGrantsInfoLogVO) throws Exception {

		List<FarmLandGrantsInfoLogVO> resultList = farmLandGrantsInfoLogMapper.selectfarmLandGrantsInfoLogList(farmLandGrantsInfoLogVO);
		return resultList;
	}

	@Override
	public int insertfarmLandGrantsInfoLog(FarmLandGrantsInfoLogVO farmLandGrantsInfoLogVO) throws Exception {

		int insertedCnt = farmLandGrantsInfoLogMapper.insertfarmLandGrantsInfoLog(farmLandGrantsInfoLogVO);

		return insertedCnt;
	}

	@Override
	public int updatefarmLandGrantsInfoLog(FarmLandGrantsInfoLogVO farmLandGrantsInfoLogVO) throws Exception {

		int updatedCnt = farmLandGrantsInfoLogMapper.updatefarmLandGrantsInfoLog(farmLandGrantsInfoLogVO);

		return updatedCnt;
	}

	@Override
	public int multiSavefarmLandGrantsInfoLogList(List<FarmLandGrantsInfoLogVO> farmLandGrantsInfoLogVOList) throws Exception {
		int savedCnt = 0;
		for (FarmLandGrantsInfoLogVO farmLandGrantsInfoLogVO : farmLandGrantsInfoLogVOList) {
			if(ComConstants.ROW_STS_INSERT.equals(farmLandGrantsInfoLogVO.getRowSts())) {
				savedCnt += insertfarmLandGrantsInfoLog(farmLandGrantsInfoLogVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(farmLandGrantsInfoLogVO.getRowSts())) {
				savedCnt += updatefarmLandGrantsInfoLog(farmLandGrantsInfoLogVO);
			}
		}
		return savedCnt;
	}

	@Override
	public int insertMegerfarmLandGrantsInfoLog(FarmLandGrantsInfoLogVO farmLandGrantsInfoLogVO) throws Exception {
		return farmLandGrantsInfoLogMapper.insertMegerfarmLandGrantsInfoLog(farmLandGrantsInfoLogVO);
	}
	@Override
	public int insertMegerLogfarmLandGrantsInfoLog(FarmLandGrantsInfoLogVO farmLandGrantsInfoLogVO) throws Exception {
		return farmLandGrantsInfoLogMapper.insertMegerLogfarmLandGrantsInfoLog(farmLandGrantsInfoLogVO);
	}
	@Override
	public int updateMegerfarmLandGrantsInfoLog(FarmLandGrantsInfoLogVO farmLandGrantsInfoLogVO) throws Exception {
		return farmLandGrantsInfoLogMapper.updateMegerfarmLandGrantsInfoLog(farmLandGrantsInfoLogVO);
	}

	@Override
	public int deletefarmLandGrantsInfoLog(FarmLandGrantsInfoLogVO farmLandGrantsInfoLogVO) throws Exception {
		return farmLandGrantsInfoLogMapper.deletefarmLandGrantsInfoLog(farmLandGrantsInfoLogVO);
	}

}
