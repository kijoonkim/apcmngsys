package com.at.apcss.pd.bsm.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.fm.bbs.mapper.BbsMapper;
import com.at.apcss.fm.bbs.service.BbsService;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.pd.bsm.mapper.ApcTotalOgnzInfoMapper;
import com.at.apcss.pd.bsm.service.ApcTotalOgnzInfoService;
import com.at.apcss.pd.bsm.vo.ApcTotalOgnzInfoVO;


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
@Service("apcTotalOgnzInfoService")
public class ApcTotalOgnzInfoServiceImpl extends BaseServiceImpl implements ApcTotalOgnzInfoService{

	@Autowired
	private ApcTotalOgnzInfoMapper apcTotalOgnzInfoMapper;

	@Override
	public ApcTotalOgnzInfoVO selectApcTotalOgnzInfo(ApcTotalOgnzInfoVO apcTotalOgnzInfoVO) throws Exception {

		ApcTotalOgnzInfoVO resultVO = apcTotalOgnzInfoMapper.selectApcTotalOgnzInfo(apcTotalOgnzInfoVO);

		return resultVO;
	}

	@Override
	public List<ApcTotalOgnzInfoVO> selectApcTotalOgnzInfoList(ApcTotalOgnzInfoVO apcTotalOgnzInfoVO) throws Exception {

		List<ApcTotalOgnzInfoVO> resultList = apcTotalOgnzInfoMapper.selectApcTotalOgnzInfoList(apcTotalOgnzInfoVO);
		return resultList;
	}

	@Override
	public int insertApcTotalOgnzInfo(ApcTotalOgnzInfoVO apcTotalOgnzInfoVO) throws Exception {

		int insertedCnt = apcTotalOgnzInfoMapper.insertApcTotalOgnzInfo(apcTotalOgnzInfoVO);

		return insertedCnt;
	}

	@Override
	public int updateApcTotalOgnzInfo(ApcTotalOgnzInfoVO apcTotalOgnzInfoVO) throws Exception {

		int updatedCnt = apcTotalOgnzInfoMapper.updateApcTotalOgnzInfo(apcTotalOgnzInfoVO);

		return updatedCnt;
	}

	@Override
	public int multiSaveApcTotalOgnzInfoList(List<ApcTotalOgnzInfoVO> apcTotalOgnzInfoVOList) throws Exception {
		int savedCnt = 0;
		for (ApcTotalOgnzInfoVO apcTotalOgnzInfoVO : apcTotalOgnzInfoVOList) {
			if(ComConstants.ROW_STS_INSERT.equals(apcTotalOgnzInfoVO.getRowSts())) {
				savedCnt += insertApcTotalOgnzInfo(apcTotalOgnzInfoVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(apcTotalOgnzInfoVO.getRowSts())) {
				savedCnt += updateApcTotalOgnzInfo(apcTotalOgnzInfoVO);
			}
		}
		return savedCnt;
	}

	@Override
	public int insertMegerApcTotalOgnzInfo(ApcTotalOgnzInfoVO apcTotalOgnzInfoVO) throws Exception {
		return apcTotalOgnzInfoMapper.insertMegerApcTotalOgnzInfo(apcTotalOgnzInfoVO);
	}
	@Override
	public int insertMegerLogApcTotalOgnzInfo(ApcTotalOgnzInfoVO apcTotalOgnzInfoVO) throws Exception {
		return apcTotalOgnzInfoMapper.insertMegerLogApcTotalOgnzInfo(apcTotalOgnzInfoVO);
	}


	@Override
	public int insertMegerApcTotalOgnzInfoMap(Map<String, String> MapList) throws Exception {
		return apcTotalOgnzInfoMapper.insertMegerApcTotalOgnzInfoMap(MapList);
	}
	@Override
	public int insertMegerLogApcTotalOgnzInfoMap(Map<String, String> MapList) throws Exception {
		return apcTotalOgnzInfoMapper.insertMegerLogApcTotalOgnzInfoMap(MapList);
	}

	@Override
	public int updateMegerApcTotalOgnzInfo(ApcTotalOgnzInfoVO apcTotalOgnzInfoVO) throws Exception {
		return apcTotalOgnzInfoMapper.updateMegerApcTotalOgnzInfo(apcTotalOgnzInfoVO);
	}

	@Override
	public int deleteApcTotalOgnzInfo(ApcTotalOgnzInfoVO apcTotalOgnzInfoVO) throws Exception {
		return apcTotalOgnzInfoMapper.deleteApcTotalOgnzInfo(apcTotalOgnzInfoVO);
	}

}
