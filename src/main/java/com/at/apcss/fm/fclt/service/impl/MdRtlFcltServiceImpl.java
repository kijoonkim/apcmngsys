package com.at.apcss.fm.fclt.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.fm.fclt.mapper.MdRtlFcltMapper;
import com.at.apcss.fm.fclt.service.MdRtlFcltService;
import com.at.apcss.fm.fclt.vo.MdRtlFcltVO;

@Service("mdRtlFcltService")
public class MdRtlFcltServiceImpl implements MdRtlFcltService {
	@Autowired
	private MdRtlFcltMapper mdRtlFcltMapper;

	@Override
	public List<MdRtlFcltVO> selectMapSttn(MdRtlFcltVO mdRtlFcltVO) throws Exception {
		List<MdRtlFcltVO> resultList = mdRtlFcltMapper.selectMapSttn(mdRtlFcltVO);
		return resultList;
	}

	@Override
	public List<MdRtlFcltVO> selectCtpvAreaList(MdRtlFcltVO mdRtlFcltVO) throws Exception {
		List<MdRtlFcltVO> resultList = mdRtlFcltMapper.selectCtpvAreaList(mdRtlFcltVO);
		return resultList;
	}

	@Override
	public HashMap<String,Object> selectFirstGridList(MdRtlFcltVO mdRtlFcltVO) throws Exception {


		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		//개소수:소유자 및 운영자
		List<MdRtlFcltVO> resultOwnrAndOper = mdRtlFcltMapper.selectOwnrAndOperGridList(mdRtlFcltVO);
		//산지유통시설 시설ㆍ장비 - 총 건축면적
		List<MdRtlFcltVO> resultAllBdar = mdRtlFcltMapper.selectAllBdarGridList(mdRtlFcltVO);
		//산지유통시설 시설ㆍ장비 - 물류:상품화시설(건축면적)
		List<MdRtlFcltVO> resultLgstcsGds = mdRtlFcltMapper.selectLgstcsGdsGridList(mdRtlFcltVO);
		//산지유통시설 시설ㆍ장비 - 저온냉장고
		List<MdRtlFcltVO> resultLwtpStrg = mdRtlFcltMapper.selectLwtpStrgGridList(mdRtlFcltVO);
		//산지유통시설 시설ㆍ장비 - 예냉시설
		List<MdRtlFcltVO> resultPrprtnClngFclt = mdRtlFcltMapper.selectPrprtnClngFcltGridList(mdRtlFcltVO);
		//산지유통시설 시설ㆍ장비 - CA저장시설
		List<MdRtlFcltVO> resultStrgFclt = mdRtlFcltMapper.selectStrgFcltGridList(mdRtlFcltVO);
		//산지유통시설 시설ㆍ장비 - 측정장비설치 개소수
		List<MdRtlFcltVO> resultFcltMsrmtEqpmnt = mdRtlFcltMapper.selectFcltMsrmtEqpmntGridList(mdRtlFcltVO);
		//산지유통시설 시설ㆍ장비 - 투자금액:전체
		List<MdRtlFcltVO> resultInvstAtmAll = mdRtlFcltMapper.selectInvstAtmAllGridList(mdRtlFcltVO);
		//산지유통시설 시설ㆍ장비 - 투자금액:자금유형
		List<MdRtlFcltVO> resultInvstAtmFundType = mdRtlFcltMapper.selectInvstAtmFundTypeGridList(mdRtlFcltVO);
		//산지유통시설 시설ㆍ장비 - 투자금액:소유자
		List<MdRtlFcltVO> resultInvstAtmOwnr = mdRtlFcltMapper.selectInvstAtmOwnrGridList(mdRtlFcltVO);
		//산지유통시설 시설ㆍ장비 - 투자금액:운영자
		List<MdRtlFcltVO> resultInvstAtmOperPrsn = mdRtlFcltMapper.selectInvstAtmOperPrsnGridList(mdRtlFcltVO);


		resultMap.put("resultOwnrAndOper", resultOwnrAndOper);
		resultMap.put("resultAllBdar", resultAllBdar);
		resultMap.put("resultLgstcsGds", resultLgstcsGds);
		resultMap.put("resultLwtpStrg", resultLwtpStrg);
		resultMap.put("resultPrprtnClngFclt", resultPrprtnClngFclt);
		resultMap.put("resultStrgFclt", resultStrgFclt);
		resultMap.put("resultFcltMsrmtEqpmnt", resultFcltMsrmtEqpmnt);
		resultMap.put("resultInvstAtmAll", resultInvstAtmAll);
		resultMap.put("resultInvstAtmFundType", resultInvstAtmFundType);
		resultMap.put("resultInvstAtmOwnr", resultInvstAtmOwnr);
		resultMap.put("resultInvstAtmOperPrsn", resultInvstAtmOperPrsn);


		return resultMap;

	}

}
