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
import com.at.apcss.pd.bsm.mapper.ApcOgnzInfoMapper;
import com.at.apcss.pd.bsm.service.ApcOgnzInfoService;
import com.at.apcss.pd.bsm.vo.ApcOgnzInfoVO;


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
@Service("apcOgnzInfoService")
public class ApcOgnzInfoServiceImpl extends BaseServiceImpl implements ApcOgnzInfoService{

	@Autowired
	private ApcOgnzInfoMapper apcOgnzInfoMapper;

	@Override
	public ApcOgnzInfoVO selectApcOgnzInfo(ApcOgnzInfoVO apcOgnzInfoVO) throws Exception {

		ApcOgnzInfoVO resultVO = apcOgnzInfoMapper.selectApcOgnzInfo(apcOgnzInfoVO);

		return resultVO;
	}

	@Override
	public List<ApcOgnzInfoVO> selectApcOgnzInfoList(ApcOgnzInfoVO apcOgnzInfoVO) throws Exception {

		List<ApcOgnzInfoVO> resultList = apcOgnzInfoMapper.selectApcOgnzInfoList(apcOgnzInfoVO);
		return resultList;
	}

	@Override
	public int insertApcOgnzInfo(ApcOgnzInfoVO apcOgnzInfoVO) throws Exception {

		int insertedCnt = apcOgnzInfoMapper.insertApcOgnzInfo(apcOgnzInfoVO);

		return insertedCnt;
	}

	@Override
	public int updateApcOgnzInfo(ApcOgnzInfoVO apcOgnzInfoVO) throws Exception {

		int updatedCnt = apcOgnzInfoMapper.updateApcOgnzInfo(apcOgnzInfoVO);

		return updatedCnt;
	}

	@Override
	public int multiSaveApcOgnzInfoList(List<ApcOgnzInfoVO> apcOgnzInfoVOList) throws Exception {
		int savedCnt = 0;
		for (ApcOgnzInfoVO apcOgnzInfoVO : apcOgnzInfoVOList) {
			if(ComConstants.ROW_STS_INSERT.equals(apcOgnzInfoVO.getRowSts())) {
				savedCnt += insertApcOgnzInfo(apcOgnzInfoVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(apcOgnzInfoVO.getRowSts())) {
				savedCnt += updateApcOgnzInfo(apcOgnzInfoVO);
			}
		}
		return savedCnt;
	}

	@Override
	public int insertMegerApcOgnzInfo(ApcOgnzInfoVO apcOgnzInfoVO) throws Exception {
		return apcOgnzInfoMapper.insertMegerApcOgnzInfo(apcOgnzInfoVO);
	}
	@Override
	public int insertMegerLogApcOgnzInfo(ApcOgnzInfoVO apcOgnzInfoVO) throws Exception {
		return apcOgnzInfoMapper.insertMegerLogApcOgnzInfo(apcOgnzInfoVO);
	}


	@Override
	public int insertMegerApcOgnzInfoMap(Map<String, String> MapList) throws Exception {
		return apcOgnzInfoMapper.insertMegerApcOgnzInfoMap(MapList);
	}
	@Override
	public int insertMegerLogApcOgnzInfoMap(Map<String, String> MapList) throws Exception {
		return apcOgnzInfoMapper.insertMegerLogApcOgnzInfoMap(MapList);
	}

	@Override
	public int updateMegerApcOgnzInfo(ApcOgnzInfoVO apcOgnzInfoVO) throws Exception {
		return apcOgnzInfoMapper.updateMegerApcOgnzInfo(apcOgnzInfoVO);
	}

	@Override
	public int deleteApcOgnzInfo(ApcOgnzInfoVO apcOgnzInfoVO) throws Exception {
		return apcOgnzInfoMapper.deleteApcOgnzInfo(apcOgnzInfoVO);
	}

}
