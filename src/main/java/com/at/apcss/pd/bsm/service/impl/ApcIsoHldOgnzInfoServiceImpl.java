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
import com.at.apcss.pd.bsm.mapper.ApcIsoHldOgnzInfoMapper;
import com.at.apcss.pd.bsm.service.ApcIsoHldOgnzInfoService;
import com.at.apcss.pd.bsm.vo.ApcIsoHldOgnzInfoVO;


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
@Service("apcIsoHldOgnzInfoService")
public class ApcIsoHldOgnzInfoServiceImpl implements ApcIsoHldOgnzInfoService{

	@Autowired
	private ApcIsoHldOgnzInfoMapper apcIsoHldOgnzInfoMapper;

	@Override
	public ApcIsoHldOgnzInfoVO selectApcIsoHldOgnzInfo(ApcIsoHldOgnzInfoVO apcIsoHldOgnzInfoVO) throws Exception {

		ApcIsoHldOgnzInfoVO resultVO = apcIsoHldOgnzInfoMapper.selectApcIsoHldOgnzInfo(apcIsoHldOgnzInfoVO);

		return resultVO;
	}

	@Override
	public List<ApcIsoHldOgnzInfoVO> selectApcIsoHldOgnzInfoList(ApcIsoHldOgnzInfoVO apcIsoHldOgnzInfoVO) throws Exception {

		List<ApcIsoHldOgnzInfoVO> resultList = apcIsoHldOgnzInfoMapper.selectApcIsoHldOgnzInfoList(apcIsoHldOgnzInfoVO);
		return resultList;
	}

	@Override
	public int insertApcIsoHldOgnzInfo(ApcIsoHldOgnzInfoVO apcIsoHldOgnzInfoVO) throws Exception {

		int insertedCnt = apcIsoHldOgnzInfoMapper.insertApcIsoHldOgnzInfo(apcIsoHldOgnzInfoVO);

		return insertedCnt;
	}

	@Override
	public int updateApcIsoHldOgnzInfo(ApcIsoHldOgnzInfoVO apcIsoHldOgnzInfoVO) throws Exception {

		int updatedCnt = apcIsoHldOgnzInfoMapper.updateApcIsoHldOgnzInfo(apcIsoHldOgnzInfoVO);

		return updatedCnt;
	}

	@Override
	public int multiSaveApcIsoHldOgnzInfoList(List<ApcIsoHldOgnzInfoVO> apcIsoHldOgnzInfoVOList) throws Exception {
		int savedCnt = 0;
		for (ApcIsoHldOgnzInfoVO apcIsoHldOgnzInfoVO : apcIsoHldOgnzInfoVOList) {
			if(ComConstants.ROW_STS_INSERT.equals(apcIsoHldOgnzInfoVO.getRowSts())) {
				savedCnt += insertApcIsoHldOgnzInfo(apcIsoHldOgnzInfoVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(apcIsoHldOgnzInfoVO.getRowSts())) {
				savedCnt += updateApcIsoHldOgnzInfo(apcIsoHldOgnzInfoVO);
			}
		}
		return savedCnt;
	}

	@Override
	public int insertMegerApcIsoHldOgnzInfo(ApcIsoHldOgnzInfoVO apcIsoHldOgnzInfoVO) throws Exception {
		return apcIsoHldOgnzInfoMapper.insertMegerApcIsoHldOgnzInfo(apcIsoHldOgnzInfoVO);
	}
	@Override
	public int insertMegerLogApcIsoHldOgnzInfo(ApcIsoHldOgnzInfoVO apcIsoHldOgnzInfoVO) throws Exception {
		return apcIsoHldOgnzInfoMapper.insertMegerLogApcIsoHldOgnzInfo(apcIsoHldOgnzInfoVO);
	}


	@Override
	public int insertMegerApcIsoHldOgnzInfoMap(Map<String, String> MapList) throws Exception {
		return apcIsoHldOgnzInfoMapper.insertMegerApcIsoHldOgnzInfoMap(MapList);
	}
	@Override
	public int insertMegerLogApcIsoHldOgnzInfoMap(Map<String, String> MapList) throws Exception {
		return apcIsoHldOgnzInfoMapper.insertMegerLogApcIsoHldOgnzInfoMap(MapList);
	}

	@Override
	public int updateMegerApcIsoHldOgnzInfo(ApcIsoHldOgnzInfoVO apcIsoHldOgnzInfoVO) throws Exception {
		return apcIsoHldOgnzInfoMapper.updateMegerApcIsoHldOgnzInfo(apcIsoHldOgnzInfoVO);
	}

	@Override
	public int deleteApcIsoHldOgnzInfo(ApcIsoHldOgnzInfoVO apcIsoHldOgnzInfoVO) throws Exception {
		return apcIsoHldOgnzInfoMapper.deleteApcIsoHldOgnzInfo(apcIsoHldOgnzInfoVO);
	}

}
