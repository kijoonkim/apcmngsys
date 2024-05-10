package com.at.apcss.fm.farm.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.fm.farm.mapper.NonCompliantFarmerInfoRegMapper;
import com.at.apcss.fm.farm.service.NonCompliantFarmerInfoRegService;
import com.at.apcss.fm.farm.vo.NonCompliantFarmerInfoRegVO;


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
@Service("NonCompliantFarmerInfoRegService")
public class NonCompliantFarmerInfoRegServiceImpl extends BaseServiceImpl implements NonCompliantFarmerInfoRegService{

	@Autowired
	private NonCompliantFarmerInfoRegMapper NonCompliantFarmerInfoRegMapper;

	@Override
	public NonCompliantFarmerInfoRegVO selectNonCompliantFarmerInfoReg(NonCompliantFarmerInfoRegVO NonCompliantFarmerInfoRegVO) throws Exception {

		NonCompliantFarmerInfoRegVO resultVO = NonCompliantFarmerInfoRegMapper.selectNonCompliantFarmerInfoReg(NonCompliantFarmerInfoRegVO);

		return resultVO;
	}

	@Override
	public List<NonCompliantFarmerInfoRegVO> selectNonCompliantFarmerInfoRegList(NonCompliantFarmerInfoRegVO NonCompliantFarmerInfoRegVO) throws Exception {

		List<NonCompliantFarmerInfoRegVO> resultList = NonCompliantFarmerInfoRegMapper.selectNonCompliantFarmerInfoRegList(NonCompliantFarmerInfoRegVO);
		return resultList;
	}

	@Override
	public int insertNonCompliantFarmerInfoReg(NonCompliantFarmerInfoRegVO NonCompliantFarmerInfoRegVO) throws Exception {

		int insertedCnt = NonCompliantFarmerInfoRegMapper.insertNonCompliantFarmerInfoReg(NonCompliantFarmerInfoRegVO);

		return insertedCnt;
	}

	@Override
	public int deleteNonCompliantFarmerInfoReg(NonCompliantFarmerInfoRegVO NonCompliantFarmerInfoRegVO) throws Exception {
		return NonCompliantFarmerInfoRegMapper.deleteNonCompliantFarmerInfoReg(NonCompliantFarmerInfoRegVO);
	}

}
