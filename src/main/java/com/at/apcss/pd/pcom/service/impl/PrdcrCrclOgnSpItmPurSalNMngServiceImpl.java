package com.at.apcss.pd.pcom.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.fm.bbs.mapper.BbsMapper;
import com.at.apcss.fm.bbs.service.BbsService;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.pd.pcom.mapper.PrdcrCrclOgnSpItmPurSalNMngMapper;
import com.at.apcss.pd.pcom.service.PrdcrCrclOgnSpItmPurSalNMngService;
import com.at.apcss.pd.pcom.vo.PrdcrCrclOgnSpItmPurSalNMngVO;


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
@Service("PrdcrCrclOgnSpItmPurSalNMngService")
public class PrdcrCrclOgnSpItmPurSalNMngServiceImpl extends BaseServiceImpl implements PrdcrCrclOgnSpItmPurSalNMngService{

	@Autowired
	private PrdcrCrclOgnSpItmPurSalNMngMapper PrdcrCrclOgnSpItmPurSalNMngMapper;

	@Override
	public PrdcrCrclOgnSpItmPurSalNMngVO selectPrdcrCrclOgnSpItmPurSalNMng(PrdcrCrclOgnSpItmPurSalNMngVO PrdcrCrclOgnSpItmPurSalNMngVO) throws Exception {

		PrdcrCrclOgnSpItmPurSalNMngVO resultVO = PrdcrCrclOgnSpItmPurSalNMngMapper.selectPrdcrCrclOgnSpItmPurSalNMng(PrdcrCrclOgnSpItmPurSalNMngVO);

		return resultVO;
	}

	@Override
	public List<PrdcrCrclOgnSpItmPurSalNMngVO> selectPrdcrCrclOgnSpItmPurSalNMngList(PrdcrCrclOgnSpItmPurSalNMngVO PrdcrCrclOgnSpItmPurSalNMngVO) throws Exception {

		List<PrdcrCrclOgnSpItmPurSalNMngVO> resultList = PrdcrCrclOgnSpItmPurSalNMngMapper.selectPrdcrCrclOgnSpItmPurSalNMngList(PrdcrCrclOgnSpItmPurSalNMngVO);
		return resultList;
	}

	@Override
	public int insertPrdcrCrclOgnSpItmPurSalNMng(PrdcrCrclOgnSpItmPurSalNMngVO PrdcrCrclOgnSpItmPurSalNMngVO) throws Exception {

		int insertedCnt = PrdcrCrclOgnSpItmPurSalNMngMapper.insertPrdcrCrclOgnSpItmPurSalNMng(PrdcrCrclOgnSpItmPurSalNMngVO);

		return insertedCnt;
	}

	@Override
	public int updatePrdcrCrclOgnSpItmPurSalNMng(PrdcrCrclOgnSpItmPurSalNMngVO PrdcrCrclOgnSpItmPurSalNMngVO) throws Exception {

		int updatedCnt = PrdcrCrclOgnSpItmPurSalNMngMapper.updatePrdcrCrclOgnSpItmPurSalNMng(PrdcrCrclOgnSpItmPurSalNMngVO);

		return updatedCnt;
	}

	@Override
	public int multiSavePrdcrCrclOgnSpItmPurSalNMngList(List<PrdcrCrclOgnSpItmPurSalNMngVO> PrdcrCrclOgnSpItmPurSalNMngVOList) throws Exception {
		int savedCnt = 0;
		for (PrdcrCrclOgnSpItmPurSalNMngVO PrdcrCrclOgnSpItmPurSalNMngVO : PrdcrCrclOgnSpItmPurSalNMngVOList) {
			if(ComConstants.ROW_STS_INSERT.equals(PrdcrCrclOgnSpItmPurSalNMngVO.getRowSts())) {
				savedCnt += insertPrdcrCrclOgnSpItmPurSalNMng(PrdcrCrclOgnSpItmPurSalNMngVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(PrdcrCrclOgnSpItmPurSalNMngVO.getRowSts())) {
				savedCnt += updatePrdcrCrclOgnSpItmPurSalNMng(PrdcrCrclOgnSpItmPurSalNMngVO);
			}
		}
		return savedCnt;
	}

	@Override
	public int deletePrdcrCrclOgnSpItmPurSalNMng(PrdcrCrclOgnSpItmPurSalNMngVO PrdcrCrclOgnSpItmPurSalNMngVO) throws Exception {
		return PrdcrCrclOgnSpItmPurSalNMngMapper.deletePrdcrCrclOgnSpItmPurSalNMng(PrdcrCrclOgnSpItmPurSalNMngVO);
	}

}
