package com.at.apcss.fm.farm.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.fm.bbs.mapper.BbsMapper;
import com.at.apcss.fm.bbs.service.BbsService;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.fm.farm.mapper.farmLandInfoRegMapper;
import com.at.apcss.fm.farm.service.farmLandInfoRegService;
import com.at.apcss.fm.farm.vo.farmLandInfoRegVO;


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
@Service("farmLandInfoRegService")
public class farmLandInfoRegServiceImpl implements farmLandInfoRegService{

	@Autowired
	private farmLandInfoRegMapper farmLandInfoRegMapper;

	@Override
	public farmLandInfoRegVO selectfarmLandInfoReg(farmLandInfoRegVO farmLandInfoRegVO) throws Exception {

		farmLandInfoRegVO resultVO = farmLandInfoRegMapper.selectfarmLandInfoReg(farmLandInfoRegVO);

		return resultVO;
	}

	@Override
	public List<farmLandInfoRegVO> selectfarmLandInfoRegList(farmLandInfoRegVO farmLandInfoRegVO) throws Exception {

		List<farmLandInfoRegVO> resultList = farmLandInfoRegMapper.selectfarmLandInfoRegList(farmLandInfoRegVO);
		return resultList;
	}

	@Override
	public int insertfarmLandInfoReg(farmLandInfoRegVO farmLandInfoRegVO) throws Exception {

		int insertedCnt = farmLandInfoRegMapper.insertfarmLandInfoReg(farmLandInfoRegVO);

		return insertedCnt;
	}

	@Override
	public int updatefarmLandInfoReg(farmLandInfoRegVO farmLandInfoRegVO) throws Exception {

		int updatedCnt = farmLandInfoRegMapper.updatefarmLandInfoReg(farmLandInfoRegVO);

		return updatedCnt;
	}

	@Override
	public int multiSavefarmLandInfoRegList(List<farmLandInfoRegVO> farmLandInfoRegVOList) throws Exception {
		int savedCnt = 0;
		for (farmLandInfoRegVO farmLandInfoRegVO : farmLandInfoRegVOList) {
			if(ComConstants.ROW_STS_INSERT.equals(farmLandInfoRegVO.getRowSts())) {
				savedCnt += insertfarmLandInfoReg(farmLandInfoRegVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(farmLandInfoRegVO.getRowSts())) {
				savedCnt += updatefarmLandInfoReg(farmLandInfoRegVO);
			}
		}
		return savedCnt;
	}

	@Override
	public int deletefarmLandInfoReg(farmLandInfoRegVO farmLandInfoRegVO) throws Exception {
		return farmLandInfoRegMapper.deletefarmLandInfoReg(farmLandInfoRegVO);
	}

}
