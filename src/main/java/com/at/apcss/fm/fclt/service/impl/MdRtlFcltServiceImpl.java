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
	public HashMap<String,Object> selectMdRtlOgnzNowGridList(MdRtlFcltVO mdRtlFcltVO) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		//개소수:소유자 및 운영자
		List<MdRtlFcltVO> resultMdRtlOgnz = mdRtlFcltMapper.selectMdRtlOgnzGridList(mdRtlFcltVO);
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


		resultMap.put("resultMdRtlOgnz", resultMdRtlOgnz);
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

	@Override
	public HashMap<String,Object> selectMdRtlFcltRgnNowGridList(MdRtlFcltVO mdRtlFcltVO) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		// 지역별 개소수 : 산지유통조직유형
		List<MdRtlFcltVO> resultMdRtlOgnzType =  mdRtlFcltMapper.selectMdRtlOgnzTypeGridList(mdRtlFcltVO);
		// 지역별 개소수 : 운영자
		List<MdRtlFcltVO> resultRgnOperPrsn = mdRtlFcltMapper.selectRgnOperPrsnGridList(mdRtlFcltVO);
		// 산지유통시설 시설·장비 : 물류·상품화 시설
		List<MdRtlFcltVO> resultLgstcsGdsFclt = mdRtlFcltMapper.selectLgstcsGdsFcltGridList(mdRtlFcltVO);
		// 저온냉장고
		List<MdRtlFcltVO> resultMdLwtpStrg = mdRtlFcltMapper.selectMdLwtpStrgGridList(mdRtlFcltVO);
		// 예냉시설
		List<MdRtlFcltVO> resultRgnPrprtnClngFclt = mdRtlFcltMapper.selectRgnPrprtnClngFcltGridList(mdRtlFcltVO);
		// CA저장고
		List<MdRtlFcltVO> resultRgnStrgFclt = mdRtlFcltMapper.selectRgnStrgFcltGridList(mdRtlFcltVO);
		// 선별기·측정장비 설치 개소 수
		List<MdRtlFcltVO> resultRgnFcltMsrmtEqpmnt = mdRtlFcltMapper.selectRgnFcltMsrmtEqpmntGridList(mdRtlFcltVO);
		// 지역별 투자금액: 전체
		List<MdRtlFcltVO> resultRgnInvstAtmAll = mdRtlFcltMapper.selectRgnInvstAtmAllGridList(mdRtlFcltVO);
		// 지역별 투자금액: 소유자
		List<MdRtlFcltVO> resultRgnInvstAtmOwnr = mdRtlFcltMapper.selectRgnInvstAtmOwnrGridList(mdRtlFcltVO);
		// 지역별 투자금액: 운영자
		List<MdRtlFcltVO> resultRgnInvstOperPrsn = mdRtlFcltMapper.selectRgnInvstOperPrsnGridList(mdRtlFcltVO);

		resultMap.put("resultMdRtlOgnzType", resultMdRtlOgnzType);
		resultMap.put("resultRgnOperPrsn", resultRgnOperPrsn);
		resultMap.put("resultLgstcsGdsFclt", resultLgstcsGdsFclt);
		resultMap.put("resultMdLwtpStrg", resultMdLwtpStrg);
		resultMap.put("resultRgnPrprtnClngFclt", resultRgnPrprtnClngFclt);
		resultMap.put("resultRgnStrgFclt", resultRgnStrgFclt);
		resultMap.put("resultRgnFcltMsrmtEqpmnt", resultRgnFcltMsrmtEqpmnt);
		resultMap.put("resultRgnInvstAtmAll", resultRgnInvstAtmAll);
		resultMap.put("resultRgnInvstAtmOwnr", resultRgnInvstAtmOwnr);
		resultMap.put("resultRgnInvstOperPrsn", resultRgnInvstOperPrsn);
		
		
		return resultMap;

	}
	
	
	@Override
	public HashMap<String,Object> selectGvrngmtSprtMdRtlFcltGridList(MdRtlFcltVO mdRtlFcltVO) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		
		// 정부지원 산지유통시설 현황 - 개소수:산지유통조직 유형
		List<MdRtlFcltVO> resultBzeatCntMdRtlOgnzType =  mdRtlFcltMapper.selectBzeatCntMdRtlOgnzTypeGridList(mdRtlFcltVO);
		// 정부지원 산지유통시설 현황 - 개소수:소유자 및 운영자
		List<MdRtlFcltVO> resultBzeatCntOwnrAndOper =  mdRtlFcltMapper.selectBzeatCntOwnrAndOperGridList(mdRtlFcltVO);
		// 정부지원 산지유통시설 현황 - 총 건축면적
		List<MdRtlFcltVO> resultFcltEqpmntAllBdar =  mdRtlFcltMapper.selectFcltEqpmntAllBdarGridList(mdRtlFcltVO);
		// 정부지원 산지유통시설 현황 - 물류, 상품화 시설(건축면적)
		List<MdRtlFcltVO> resultLgstcsGdsFcltBdar =  mdRtlFcltMapper.selectLgstcsGdsFcltBdarGridList(mdRtlFcltVO);
		// 정부지원 산지유통시설 현황 - 저온저장고
		List<MdRtlFcltVO> resultBzeatCntLwtpStrg =  mdRtlFcltMapper.selectBzeatCntLwtpStrgGridList(mdRtlFcltVO);
		// 정부지원 산지유통시설 현황 - 예냉시설
		List<MdRtlFcltVO> resultBzeatCntPrprtnClngFclt =  mdRtlFcltMapper.selectBzeatCntPrprtnClngFcltGridList(mdRtlFcltVO);
		// 정부지원 산지유통시설 현황 - CA 저장시설
		List<MdRtlFcltVO> resultBzeatCntStrgFclt =  mdRtlFcltMapper.selectBzeatCntStrgFcltGridList(mdRtlFcltVO);
		// 정부지원 산지유통시설 현황 - 선별기, 측정장비 설치 개소 수
		List<MdRtlFcltVO> resultBzeatCntFcltMsrmtEqpmnt =  mdRtlFcltMapper.selectBzeatCntFcltMsrmtEqpmntGridList(mdRtlFcltVO);
		// 정부지원 산지유통시설 현황 - 투자금액:전체
		List<MdRtlFcltVO> resultBzeatCntInvstAtmAll =  mdRtlFcltMapper.selectBzeatCntInvstAtmAllGridList(mdRtlFcltVO);
		// 정부지원 산지유통시설 현황 - 투자금액:자금 유형
		List<MdRtlFcltVO> resultBzeatCntInvstAtmFundType =  mdRtlFcltMapper.selectBzeatCntInvstAtmFundTypeGridList(mdRtlFcltVO);
		// 정부지원 산지유통시설 현황 - 투자금액:소유자
		List<MdRtlFcltVO> resultBzeatCntInvstAtmOwnr =  mdRtlFcltMapper.selectBzeatCntInvstAtmOwnrGridList(mdRtlFcltVO);
		// 정부지원 산지유통시설 현황 - 투자금액:운영자
		List<MdRtlFcltVO> resultBzeatCntInvstOperPrsn =  mdRtlFcltMapper.selectBzeatCntInvstOperPrsnGridList(mdRtlFcltVO);
		
		resultMap.put("resultBzeatCntMdRtlOgnzType", resultBzeatCntMdRtlOgnzType);
		resultMap.put("resultBzeatCntOwnrAndOper", resultBzeatCntOwnrAndOper);
		resultMap.put("resultFcltEqpmntAllBdar", resultFcltEqpmntAllBdar);
		resultMap.put("resultLgstcsGdsFcltBdar", resultLgstcsGdsFcltBdar);
		resultMap.put("resultBzeatCntLwtpStrg", resultBzeatCntLwtpStrg);
		resultMap.put("resultBzeatCntPrprtnClngFclt", resultBzeatCntPrprtnClngFclt);
		resultMap.put("resultBzeatCntStrgFclt", resultBzeatCntStrgFclt);
		resultMap.put("resultBzeatCntFcltMsrmtEqpmnt", resultBzeatCntFcltMsrmtEqpmnt);
		resultMap.put("resultBzeatCntInvstAtmAll", resultBzeatCntInvstAtmAll);
		resultMap.put("resultBzeatCntInvstAtmFundType", resultBzeatCntInvstAtmFundType);
		resultMap.put("resultBzeatCntInvstAtmOwnr", resultBzeatCntInvstAtmOwnr);
		resultMap.put("resultBzeatCntInvstOperPrsn", resultBzeatCntInvstOperPrsn);
		
		return resultMap;
		
	}
	
	@Override
	public HashMap<String,Object> selectGvrngmtSprtMdRtlOgnzTypeGridList(MdRtlFcltVO mdRtlFcltVO) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		
		// 정부지원산지유통시설지역별현황 - 지역별 개소수 : 산지유통조직 유형
		List<MdRtlFcltVO> resultGvrngmtSprtMdRtlOgnzType =  mdRtlFcltMapper.selectGvrngmtSprtMdRtlOgnzTypeGridList(mdRtlFcltVO);
		// 정부지원산지유통시설지역별현황 - 지역별 개소수 : 운영자
		List<MdRtlFcltVO> resultGvrngmtSprtRgnOperPrsn =  mdRtlFcltMapper.selectGvrngmtSprtRgnOperPrsnGridList(mdRtlFcltVO);
		// 정부지원산지유통시설지역별현황 - 물류·상품화 시설
		List<MdRtlFcltVO> resultGvrngmtSprtLgstcsGdsFclt =  mdRtlFcltMapper.selectGvrngmtSprtLgstcsGdsFcltGridList(mdRtlFcltVO);
		// 정부지원산지유통시설지역별현황 - 저온저장고
		List<MdRtlFcltVO> resultGvrngmtSprtLwtpStrg =  mdRtlFcltMapper.selectGvrngmtSprtLwtpStrgGridList(mdRtlFcltVO);
		// 정부지원산지유통시설지역별현황 - 예냉시설
		List<MdRtlFcltVO> resultGvrngmtSprtPrprtnClngFclt =  mdRtlFcltMapper.selectGvrngmtSprtPrprtnClngFcltGridList(mdRtlFcltVO);
		// 정부지원산지유통시설지역별현황 - CA저장시설
		List<MdRtlFcltVO> resultGvrngmtSprtStrgFclt =  mdRtlFcltMapper.selectGvrngmtSprtStrgFcltGridList(mdRtlFcltVO);
		// 정부지원산지유통시설지역별현황 - 선별기, 특정장비 설치 개소수
		List<MdRtlFcltVO> resultGvrngmtSprtFcltMsrmtEqpmnt =  mdRtlFcltMapper.selectGvrngmtSprtFcltMsrmtEqpmntGridList(mdRtlFcltVO);
		// 정부지원산지유통시설지역별현황 - 지역별 투자금액 전체
		List<MdRtlFcltVO> resultGvrngmtSprtRgnInvstAtmAll =  mdRtlFcltMapper.selectGvrngmtSprtRgnInvstAtmAllGridList(mdRtlFcltVO);
		// 정부지원산지유통시설지역별현황 - 지역별 투자금액 : 소유자
		List<MdRtlFcltVO> resultMdInvstAtmOwnr =  mdRtlFcltMapper.selectMdInvstAtmOwnrGridList(mdRtlFcltVO);
		// 정부지원산지유통시설지역별현황 - 지역별 투자금액 : 운영자
		List<MdRtlFcltVO> resultMdInvstAtmOperPrsn =  mdRtlFcltMapper.selectMdInvstAtmOperPrsnGridList(mdRtlFcltVO);
		
		resultMap.put("resultGvrngmtSprtMdRtlOgnzType", resultGvrngmtSprtMdRtlOgnzType);
		resultMap.put("resultGvrngmtSprtRgnOperPrsn", resultGvrngmtSprtRgnOperPrsn);
		resultMap.put("resultGvrngmtSprtLgstcsGdsFclt", resultGvrngmtSprtLgstcsGdsFclt);
		resultMap.put("resultGvrngmtSprtLwtpStrg", resultGvrngmtSprtLwtpStrg);
		resultMap.put("resultGvrngmtSprtPrprtnClngFclt", resultGvrngmtSprtPrprtnClngFclt);
		resultMap.put("resultGvrngmtSprtStrgFclt", resultGvrngmtSprtStrgFclt);
		resultMap.put("resultGvrngmtSprtFcltMsrmtEqpmnt", resultGvrngmtSprtFcltMsrmtEqpmnt);
		resultMap.put("resultGvrngmtSprtRgnInvstAtmAll", resultGvrngmtSprtRgnInvstAtmAll);
		resultMap.put("resultMdInvstAtmOwnr", resultMdInvstAtmOwnr);
		resultMap.put("resultMdInvstAtmOperPrsn", resultMdInvstAtmOperPrsn);
		
		return resultMap;
		
	}
	@Override
	public HashMap<String,Object> selectMdRtlFcltOperPrfmncGridList(MdRtlFcltVO mdRtlFcltVO) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		
		// 산지유통시설운영실적 - 운영조직 취급실적
		List<MdRtlFcltVO> resultOperOgnzTrmtPrfmnc =  mdRtlFcltMapper.selectOperOgnzTrmtPrfmncGridList(mdRtlFcltVO);
		// 산지유통시설운영실적 - 운영조직 처리실적
		List<MdRtlFcltVO> resultOperOgnzPrcsPrfmnc =  mdRtlFcltMapper.selectOperOgnzPrcsPrfmncGridList(mdRtlFcltVO);
		// 산지유통시설운영실적 - 운영조직 평균 취급실적
		List<MdRtlFcltVO> resultOperOgnzAvgTrmtPrfmnc =  mdRtlFcltMapper.selectOperOgnzAvgTrmtPrfmncGridList(mdRtlFcltVO);
//		// 산지유통시설운영실적 - 지역별 운영조직 취급실적
//		List<MdRtlFcltVO> resultMdOperOgnzTrmtPrfmnc =  mdRtlFcltMapper.selectMdOperOgnzTrmtPrfmncGridList(mdRtlFcltVO);
//		// 산지유통시설운영실적 - 지역별 운영조직 취급실적(평균)
//		List<MdRtlFcltVO> resultMdOperOgnzTrmtPrfmncAvg =  mdRtlFcltMapper.selectMdOperOgnzTrmtPrfmncAvgGridList(mdRtlFcltVO);
//		// 산지유통시설운영실적 - 지역별 APC 처리실적
//		List<MdRtlFcltVO> resultMdApcPrcsPrfmnc =  mdRtlFcltMapper.selectMdApcPrcsPrfmncGridList(mdRtlFcltVO);
//		// 산지유통시설운영실적 - 지역별 APC 처리실적(평균)
//		List<MdRtlFcltVO> resultMdApcPrcsPrfmncAvg =  mdRtlFcltMapper.selectMdApcPrcsPrfmncAvgGridList(mdRtlFcltVO);
		
		
		resultMap.put("resultOperOgnzTrmtPrfmnc", resultOperOgnzTrmtPrfmnc);
		resultMap.put("resultOperOgnzPrcsPrfmnc", resultOperOgnzPrcsPrfmnc);
		resultMap.put("resultOperOgnzAvgTrmtPrfmnc", resultOperOgnzAvgTrmtPrfmnc);
//		resultMap.put("resultMdOperOgnzTrmtPrfmnc", resultMdOperOgnzTrmtPrfmnc);
//		resultMap.put("resultMdOperOgnzTrmtPrfmncAvg", resultMdOperOgnzTrmtPrfmncAvg);
//		resultMap.put("resultMdApcPrcsPrfmnc", resultMdApcPrcsPrfmnc);
//		resultMap.put("resultMdApcPrcsPrfmncAvg", resultMdApcPrcsPrfmncAvg);
		
		return resultMap;
		
	}
	
}