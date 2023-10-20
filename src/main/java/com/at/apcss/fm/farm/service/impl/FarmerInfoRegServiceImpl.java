package com.at.apcss.fm.farm.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.fm.bbs.mapper.BbsMapper;
import com.at.apcss.fm.bbs.service.BbsService;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.fm.farm.mapper.farmerInfoRegMapper;
import com.at.apcss.fm.farm.service.farmerInfoRegService;
import com.at.apcss.fm.farm.vo.farmerInfoRegVO;


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
@Service("farmerInfoRegService")
public class farmerInfoRegServiceImpl implements farmerInfoRegService{

	@Autowired
	private farmerInfoRegMapper farmerInfoRegMapper;

	@Override
	public farmerInfoRegVO selectfarmerInfoReg(farmerInfoRegVO farmerInfoRegVO) throws Exception {

		farmerInfoRegVO resultVO = farmerInfoRegMapper.selectfarmerInfoReg(farmerInfoRegVO);

		return resultVO;
	}

	@Override
	public List<farmerInfoRegVO> selectfarmerInfoRegList(farmerInfoRegVO farmerInfoRegVO) throws Exception {

		List<farmerInfoRegVO> resultList = farmerInfoRegMapper.selectfarmerInfoRegList(farmerInfoRegVO);
		return resultList;
	}

	@Override
	public int insertfarmerInfoReg(farmerInfoRegVO farmerInfoRegVO) throws Exception {

		int insertedCnt = farmerInfoRegMapper.insertfarmerInfoReg(farmerInfoRegVO);

		return insertedCnt;
	}

	@Override
	public int updatefarmerInfoReg(farmerInfoRegVO farmerInfoRegVO) throws Exception {

		int updatedCnt = farmerInfoRegMapper.updatefarmerInfoReg(farmerInfoRegVO);

		return updatedCnt;
	}

	@Override
	public int multiSavefarmerInfoRegList(List<farmerInfoRegVO> farmerInfoRegVOList) throws Exception {
		int savedCnt = 0;
		for (farmerInfoRegVO farmerInfoRegVO : farmerInfoRegVOList) {
			if(ComConstants.ROW_STS_INSERT.equals(farmerInfoRegVO.getRowSts())) {
				savedCnt += insertfarmerInfoReg(farmerInfoRegVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(farmerInfoRegVO.getRowSts())) {
				savedCnt += updatefarmerInfoReg(farmerInfoRegVO);
			}
		}
		return savedCnt;
	}

	@Override
	public int deletefarmerInfoReg(farmerInfoRegVO farmerInfoRegVO) throws Exception {
		return farmerInfoRegMapper.deletefarmerInfoReg(farmerInfoRegVO);
	}

}
