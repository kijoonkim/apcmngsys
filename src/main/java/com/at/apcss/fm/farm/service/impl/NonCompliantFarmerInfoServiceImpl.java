package com.at.apcss.fm.farm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.fm.farm.mapper.NonCompliantFarmerInfoMapper;
import com.at.apcss.fm.farm.service.NonCompliantFarmerInfoService;
import com.at.apcss.fm.farm.vo.NonCompliantFarmerInfoVO;


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
@Service("NonCompliantFarmerInfoService")
public class NonCompliantFarmerInfoServiceImpl extends BaseServiceImpl implements NonCompliantFarmerInfoService{

	@Autowired
	private NonCompliantFarmerInfoMapper NonCompliantFarmerInfoMapper;

	@Override
	public NonCompliantFarmerInfoVO selectNonCompliantFarmerInfo(NonCompliantFarmerInfoVO NonCompliantFarmerInfoVO) throws Exception {

		NonCompliantFarmerInfoVO resultVO = NonCompliantFarmerInfoMapper.selectNonCompliantFarmerInfo(NonCompliantFarmerInfoVO);

		return resultVO;
	}

	@Override
	public List<NonCompliantFarmerInfoVO> selectNonCompliantFarmerInfoList(NonCompliantFarmerInfoVO NonCompliantFarmerInfoVO) throws Exception {

		List<NonCompliantFarmerInfoVO> resultList = NonCompliantFarmerInfoMapper.selectNonCompliantFarmerInfoList(NonCompliantFarmerInfoVO);
		return resultList;
	}

	@Override
	public int insertNonCompliantFarmerInfo(NonCompliantFarmerInfoVO NonCompliantFarmerInfoVO) throws Exception {

		int insertedCnt = NonCompliantFarmerInfoMapper.insertNonCompliantFarmerInfo(NonCompliantFarmerInfoVO);

		return insertedCnt;
	}

	@Override
	public int updateNonCompliantFarmerInfo(NonCompliantFarmerInfoVO NonCompliantFarmerInfoVO) throws Exception {

		int updatedCnt = NonCompliantFarmerInfoMapper.updateNonCompliantFarmerInfo(NonCompliantFarmerInfoVO);

		return updatedCnt;
	}

	@Override
	public int multiSaveNonCompliantFarmerInfoList(List<NonCompliantFarmerInfoVO> NonCompliantFarmerInfoVOList) throws Exception {
		int savedCnt = 0;
		for (NonCompliantFarmerInfoVO NonCompliantFarmerInfoVO : NonCompliantFarmerInfoVOList) {
			if(ComConstants.ROW_STS_INSERT.equals(NonCompliantFarmerInfoVO.getRowSts())) {
				savedCnt += insertNonCompliantFarmerInfo(NonCompliantFarmerInfoVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(NonCompliantFarmerInfoVO.getRowSts())) {
				savedCnt += updateNonCompliantFarmerInfo(NonCompliantFarmerInfoVO);
			}
		}
		return savedCnt;
	}

	@Override
	public int deleteNonCompliantFarmerInfo(NonCompliantFarmerInfoVO NonCompliantFarmerInfoVO) throws Exception {
		return NonCompliantFarmerInfoMapper.deleteNonCompliantFarmerInfo(NonCompliantFarmerInfoVO);
	}

	@Override
	public int insertLogNonCompliantFarmerInfo(NonCompliantFarmerInfoVO NonCompliantFarmerInfoVO) throws Exception {
		return NonCompliantFarmerInfoMapper.insertLogNonCompliantFarmerInfo(NonCompliantFarmerInfoVO);
	}

	@Override
	public List<NonCompliantFarmerInfoVO> selectFrmerSnList(NonCompliantFarmerInfoVO NonCompliantFarmerInfoVO) throws Exception {
		return NonCompliantFarmerInfoMapper.selectFrmerSnList(NonCompliantFarmerInfoVO);
	}

}
