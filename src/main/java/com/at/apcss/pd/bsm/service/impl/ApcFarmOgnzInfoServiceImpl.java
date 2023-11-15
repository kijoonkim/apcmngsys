package com.at.apcss.pd.bsm.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.fm.bbs.mapper.BbsMapper;
import com.at.apcss.fm.bbs.service.BbsService;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.pd.bsm.mapper.ApcFarmOgnzInfoMapper;
import com.at.apcss.pd.bsm.service.ApcFarmOgnzInfoService;
import com.at.apcss.pd.bsm.vo.ApcFarmOgnzInfoVO;


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
@Service("apcFarmOgnzInfoService")
public class ApcFarmOgnzInfoServiceImpl implements ApcFarmOgnzInfoService{

	@Autowired
	private ApcFarmOgnzInfoMapper apcFarmOgnzInfoMapper;

	@Override
	public ApcFarmOgnzInfoVO selectApcFarmOgnzInfo(ApcFarmOgnzInfoVO apcFarmOgnzInfoVO) throws Exception {

		ApcFarmOgnzInfoVO resultVO = apcFarmOgnzInfoMapper.selectApcFarmOgnzInfo(apcFarmOgnzInfoVO);

		return resultVO;
	}

	@Override
	public List<ApcFarmOgnzInfoVO> selectApcFarmOgnzInfoList(ApcFarmOgnzInfoVO apcFarmOgnzInfoVO) throws Exception {

		List<ApcFarmOgnzInfoVO> resultList = apcFarmOgnzInfoMapper.selectApcFarmOgnzInfoList(apcFarmOgnzInfoVO);
		return resultList;
	}

	@Override
	public int insertApcFarmOgnzInfo(ApcFarmOgnzInfoVO apcFarmOgnzInfoVO) throws Exception {

		int insertedCnt = apcFarmOgnzInfoMapper.insertApcFarmOgnzInfo(apcFarmOgnzInfoVO);

		return insertedCnt;
	}

	@Override
	public int updateApcFarmOgnzInfo(ApcFarmOgnzInfoVO apcFarmOgnzInfoVO) throws Exception {

		int updatedCnt = apcFarmOgnzInfoMapper.updateApcFarmOgnzInfo(apcFarmOgnzInfoVO);

		return updatedCnt;
	}

	@Override
	public int multiSaveApcFarmOgnzInfoList(List<ApcFarmOgnzInfoVO> apcFarmOgnzInfoVOList) throws Exception {
		int savedCnt = 0;
		for (ApcFarmOgnzInfoVO apcFarmOgnzInfoVO : apcFarmOgnzInfoVOList) {
			if(ComConstants.ROW_STS_INSERT.equals(apcFarmOgnzInfoVO.getRowSts())) {
				savedCnt += insertApcFarmOgnzInfo(apcFarmOgnzInfoVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(apcFarmOgnzInfoVO.getRowSts())) {
				savedCnt += updateApcFarmOgnzInfo(apcFarmOgnzInfoVO);
			}
		}
		return savedCnt;
	}

	@Override
	public int insertMegerApcFarmOgnzInfo(ApcFarmOgnzInfoVO apcFarmOgnzInfoVO) throws Exception {
		return apcFarmOgnzInfoMapper.insertMegerApcFarmOgnzInfo(apcFarmOgnzInfoVO);
	}
	@Override
	public int insertMegerLogApcFarmOgnzInfo(ApcFarmOgnzInfoVO apcFarmOgnzInfoVO) throws Exception {
		return apcFarmOgnzInfoMapper.insertMegerLogApcFarmOgnzInfo(apcFarmOgnzInfoVO);
	}


	@Override
	public int insertMegerApcFarmOgnzInfoMap(Map<String, String> MapList) throws Exception {
		return apcFarmOgnzInfoMapper.insertMegerApcFarmOgnzInfoMap(MapList);
	}
	@Override
	public int insertMegerLogApcFarmOgnzInfoMap(Map<String, String> MapList) throws Exception {
		return apcFarmOgnzInfoMapper.insertMegerLogApcFarmOgnzInfoMap(MapList);
	}

	@Override
	public int updateMegerApcFarmOgnzInfo(ApcFarmOgnzInfoVO apcFarmOgnzInfoVO) throws Exception {
		return apcFarmOgnzInfoMapper.updateMegerApcFarmOgnzInfo(apcFarmOgnzInfoVO);
	}

	@Override
	public int deleteApcFarmOgnzInfo(ApcFarmOgnzInfoVO apcFarmOgnzInfoVO) throws Exception {
		return apcFarmOgnzInfoMapper.deleteApcFarmOgnzInfo(apcFarmOgnzInfoVO);
	}

}
