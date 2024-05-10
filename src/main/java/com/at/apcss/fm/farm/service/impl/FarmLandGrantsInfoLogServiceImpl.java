package com.at.apcss.fm.farm.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
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
public class FarmLandGrantsInfoLogServiceImpl extends BaseServiceImpl implements FarmLandGrantsInfoLogService{

	@Autowired
	private FarmLandGrantsInfoLogMapper FarmLandGrantsInfoLogMapper;

	@Override
	public FarmLandGrantsInfoLogVO selectFarmLandGrantsInfoLog(FarmLandGrantsInfoLogVO FarmLandGrantsInfoLogVO) throws Exception {

		FarmLandGrantsInfoLogVO resultVO = FarmLandGrantsInfoLogMapper.selectFarmLandGrantsInfoLog(FarmLandGrantsInfoLogVO);

		return resultVO;
	}

	@Override
	public List<FarmLandGrantsInfoLogVO> selectFarmLandGrantsInfoLogList(FarmLandGrantsInfoLogVO FarmLandGrantsInfoLogVO) throws Exception {

		List<FarmLandGrantsInfoLogVO> resultList = FarmLandGrantsInfoLogMapper.selectFarmLandGrantsInfoLogList(FarmLandGrantsInfoLogVO);
		return resultList;
	}

}
