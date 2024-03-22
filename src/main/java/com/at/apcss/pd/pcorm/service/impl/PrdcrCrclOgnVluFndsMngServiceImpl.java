package com.at.apcss.pd.pcorm.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.pd.pcorm.mapper.PrdcrCrclOgnVluFndsMngMapper;
import com.at.apcss.pd.pcorm.service.PrdcrCrclOgnVluFndsMngService;
import com.at.apcss.pd.pcorm.vo.PrdcrCrclOgnVluFndsMngVO;

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
@Service("prdcrCrclOgnVluFndsMngService")
public class PrdcrCrclOgnVluFndsMngServiceImpl extends BaseServiceImpl implements PrdcrCrclOgnVluFndsMngService{

	@Autowired
	private PrdcrCrclOgnVluFndsMngMapper prdcrCrclOgnVluFndsMngMapper;

	@Override
	public List<PrdcrCrclOgnVluFndsMngVO> selectScoreList1(PrdcrCrclOgnVluFndsMngVO prdcrCrclOgnVluFndsMngVO) throws Exception {

		List<PrdcrCrclOgnVluFndsMngVO> resultList = prdcrCrclOgnVluFndsMngMapper.selectScoreList1(prdcrCrclOgnVluFndsMngVO);
		return resultList;
	}

	@Override
	public List<PrdcrCrclOgnVluFndsMngVO> selectScoreList2(PrdcrCrclOgnVluFndsMngVO prdcrCrclOgnVluFndsMngVO) throws Exception {

		List<PrdcrCrclOgnVluFndsMngVO> resultList = prdcrCrclOgnVluFndsMngMapper.selectScoreList2(prdcrCrclOgnVluFndsMngVO);
		return resultList;
	}

	@Override
	public List<PrdcrCrclOgnVluFndsMngVO> selectScrRsltList(PrdcrCrclOgnVluFndsMngVO prdcrCrclOgnVluFndsMngVO) throws Exception {

		List<PrdcrCrclOgnVluFndsMngVO> resultList = prdcrCrclOgnVluFndsMngMapper.selectScrRsltList(prdcrCrclOgnVluFndsMngVO);
		return resultList;
	}

	@Override
	public int insertActvtnFund(PrdcrCrclOgnVluFndsMngVO PrdcrCrclOgnVluFndsMngVO) throws Exception {
		int saveCnt = prdcrCrclOgnVluFndsMngMapper.insertActvtnFund(PrdcrCrclOgnVluFndsMngVO);
		return saveCnt;
	}

	@Override
	public int multiSaveActvtnFundList(List<PrdcrCrclOgnVluFndsMngVO> PrdcrCrclOgnVluFndsMngVOList) throws Exception {
		int savedCnt = 0;
		for (PrdcrCrclOgnVluFndsMngVO PrdcrCrclOgnVluFndsMngVO : PrdcrCrclOgnVluFndsMngVOList) {
			savedCnt += insertActvtnFund(PrdcrCrclOgnVluFndsMngVO);
		}
		return savedCnt;
	}

	@Override
	public int insertScrRslt(PrdcrCrclOgnVluFndsMngVO PrdcrCrclOgnVluFndsMngVO) throws Exception {
		int saveCnt = prdcrCrclOgnVluFndsMngMapper.insertScrRslt(PrdcrCrclOgnVluFndsMngVO);
		return saveCnt;
	}

	@Override
	public int multiSaveScrRsltList(List<PrdcrCrclOgnVluFndsMngVO> PrdcrCrclOgnVluFndsMngVOList) throws Exception {
		int savedCnt = 0;
		for (PrdcrCrclOgnVluFndsMngVO PrdcrCrclOgnVluFndsMngVO : PrdcrCrclOgnVluFndsMngVOList) {
			savedCnt += insertScrRslt(PrdcrCrclOgnVluFndsMngVO);
		}
		return savedCnt;
	}




	@Override
	public List<PrdcrCrclOgnVluFndsMngVO> selectComputWayList(PrdcrCrclOgnVluFndsMngVO prdcrCrclOgnVluFndsMngVO) throws Exception {

		List<PrdcrCrclOgnVluFndsMngVO> resultList = prdcrCrclOgnVluFndsMngMapper.selectComputWayList(prdcrCrclOgnVluFndsMngVO);
		return resultList;
	}

	@Override
	public int insertComputWay(PrdcrCrclOgnVluFndsMngVO PrdcrCrclOgnVluFndsMngVO) throws Exception {
		int saveCnt = prdcrCrclOgnVluFndsMngMapper.insertComputWay(PrdcrCrclOgnVluFndsMngVO);
		return saveCnt;
	}

	@Override
	public int multiSaveComputWayList(List<PrdcrCrclOgnVluFndsMngVO> PrdcrCrclOgnVluFndsMngVOList) throws Exception {
		int savedCnt = 0;
		for (PrdcrCrclOgnVluFndsMngVO PrdcrCrclOgnVluFndsMngVO : PrdcrCrclOgnVluFndsMngVOList) {
			savedCnt += insertComputWay(PrdcrCrclOgnVluFndsMngVO);
		}
		return savedCnt;
	}

	@Override
	public List<PrdcrCrclOgnVluFndsMngVO> selectScrDataList(PrdcrCrclOgnVluFndsMngVO prdcrCrclOgnVluFndsMngVO) throws Exception {

		List<PrdcrCrclOgnVluFndsMngVO> resultList = prdcrCrclOgnVluFndsMngMapper.selectScrDataList(prdcrCrclOgnVluFndsMngVO);
		return resultList;
	}

	@Override
	public List<PrdcrCrclOgnVluFndsMngVO> selectRtDataList(PrdcrCrclOgnVluFndsMngVO prdcrCrclOgnVluFndsMngVO) throws Exception {

		List<PrdcrCrclOgnVluFndsMngVO> resultList = prdcrCrclOgnVluFndsMngMapper.selectRtDataList(prdcrCrclOgnVluFndsMngVO);
		return resultList;
	}

	@Override
	public List<PrdcrCrclOgnVluFndsMngVO> selectFndsRawDataUoList(PrdcrCrclOgnVluFndsMngVO prdcrCrclOgnVluFndsMngVO) throws Exception {

		List<PrdcrCrclOgnVluFndsMngVO> resultList = prdcrCrclOgnVluFndsMngMapper.selectFndsRawDataUoList(prdcrCrclOgnVluFndsMngVO);
		return resultList;
	}

	@Override
	public List<PrdcrCrclOgnVluFndsMngVO> selectFndsRawDataIsoList(PrdcrCrclOgnVluFndsMngVO prdcrCrclOgnVluFndsMngVO) throws Exception {

		List<PrdcrCrclOgnVluFndsMngVO> resultList = prdcrCrclOgnVluFndsMngMapper.selectFndsRawDataIsoList(prdcrCrclOgnVluFndsMngVO);
		return resultList;
	}


	/* 사용자용 화면 조회  */

	@Override
	public List<PrdcrCrclOgnVluFndsMngVO> selectScrUserGrid01(PrdcrCrclOgnVluFndsMngVO PrdcrCrclOgnVluFndsMngVO) throws Exception {
		List<PrdcrCrclOgnVluFndsMngVO> resultList = prdcrCrclOgnVluFndsMngMapper.selectScrUserGrid01(PrdcrCrclOgnVluFndsMngVO);
		return resultList;
	}

	@Override
	public List<PrdcrCrclOgnVluFndsMngVO> selectScrUserGrid02(PrdcrCrclOgnVluFndsMngVO PrdcrCrclOgnVluFndsMngVO) throws Exception {
		List<PrdcrCrclOgnVluFndsMngVO> resultList = prdcrCrclOgnVluFndsMngMapper.selectScrUserGrid02(PrdcrCrclOgnVluFndsMngVO);
		return resultList;
	}

	@Override
	public List<PrdcrCrclOgnVluFndsMngVO> selectScrUserGrid03(PrdcrCrclOgnVluFndsMngVO PrdcrCrclOgnVluFndsMngVO) throws Exception {
		List<PrdcrCrclOgnVluFndsMngVO> resultList = prdcrCrclOgnVluFndsMngMapper.selectScrUserGrid03(PrdcrCrclOgnVluFndsMngVO);
		return resultList;
	}

	@Override
	public List<PrdcrCrclOgnVluFndsMngVO> selectScrUserGrid04(PrdcrCrclOgnVluFndsMngVO PrdcrCrclOgnVluFndsMngVO) throws Exception {
		List<PrdcrCrclOgnVluFndsMngVO> resultList = prdcrCrclOgnVluFndsMngMapper.selectScrUserGrid04(PrdcrCrclOgnVluFndsMngVO);
		return resultList;
	}

	@Override
	public List<PrdcrCrclOgnVluFndsMngVO> selectScrUserGrid05(PrdcrCrclOgnVluFndsMngVO PrdcrCrclOgnVluFndsMngVO) throws Exception {
		List<PrdcrCrclOgnVluFndsMngVO> resultList = prdcrCrclOgnVluFndsMngMapper.selectScrUserGrid05(PrdcrCrclOgnVluFndsMngVO);
		return resultList;
	}
}
