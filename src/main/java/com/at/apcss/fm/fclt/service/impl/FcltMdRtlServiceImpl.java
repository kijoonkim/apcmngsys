package com.at.apcss.fm.fclt.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.fm.fclt.mapper.FcltMdRtlMapper;
import com.at.apcss.fm.fclt.service.FcltMdRtlService;
import com.at.apcss.fm.fclt.vo.FcltMdRtlVO;

@Service("fcltMdRtlService")
public class FcltMdRtlServiceImpl extends BaseServiceImpl implements FcltMdRtlService {
	@Autowired
	private FcltMdRtlMapper fcltMdRtlMapper;

	@Override
	public List<FcltMdRtlVO> selectCrtrYnList(FcltMdRtlVO fcltMdRtlVO) throws Exception {
		List<FcltMdRtlVO> resultList = fcltMdRtlMapper.selectCrtrYnList(fcltMdRtlVO);
		return resultList;
	}
	
	@Override
	public List<FcltMdRtlVO> selectMapSttn(FcltMdRtlVO fcltMdRtlVO) throws Exception {
		List<FcltMdRtlVO> resultList = fcltMdRtlMapper.selectMapSttn(fcltMdRtlVO);
		return resultList;
	}

	@Override
	public List<FcltMdRtlVO> selectCtpvAreaList(FcltMdRtlVO fcltMdRtlVO) throws Exception {
		List<FcltMdRtlVO> resultList = fcltMdRtlMapper.selectCtpvAreaList(fcltMdRtlVO);
		return resultList;
	}

	@Override
	public HashMap<String,Object> selectMdRtlOgnzNowGridList(FcltMdRtlVO fcltMdRtlVO) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		//개소수:소유자 및 운영자
		List<FcltMdRtlVO> resultMdRtlOgnz = fcltMdRtlMapper.selectMdRtlOgnzGridList(fcltMdRtlVO);
		//개소수:소유자 및 운영자
		List<FcltMdRtlVO> resultOwnrAndOper = fcltMdRtlMapper.selectOwnrAndOperGridList(fcltMdRtlVO);
		//산지유통시설 시설ㆍ장비 - 총 건축면적
		List<FcltMdRtlVO> resultAllBdar = fcltMdRtlMapper.selectAllBdarGridList(fcltMdRtlVO);
		//산지유통시설 시설ㆍ장비 - 물류:상품화시설(건축면적)
		List<FcltMdRtlVO> resultLgstcsGds = fcltMdRtlMapper.selectLgstcsGdsGridList(fcltMdRtlVO);
		//산지유통시설 시설ㆍ장비 - 저온냉장고
		List<FcltMdRtlVO> resultLwtpStrg = fcltMdRtlMapper.selectLwtpStrgGridList(fcltMdRtlVO);
		//산지유통시설 시설ㆍ장비 - 예냉시설
		List<FcltMdRtlVO> resultPrprtnClngFclt = fcltMdRtlMapper.selectPrprtnClngFcltGridList(fcltMdRtlVO);
		//산지유통시설 시설ㆍ장비 - CA저장시설
		List<FcltMdRtlVO> resultStrgFclt = fcltMdRtlMapper.selectStrgFcltGridList(fcltMdRtlVO);
		//산지유통시설 시설ㆍ장비 - 측정장비설치 개소수
		List<FcltMdRtlVO> resultFcltMsrmtEqpmnt = fcltMdRtlMapper.selectFcltMsrmtEqpmntGridList(fcltMdRtlVO);
		//산지유통시설 시설ㆍ장비 - 투자금액:전체
		List<FcltMdRtlVO> resultInvstAtmAll = fcltMdRtlMapper.selectInvstAtmAllGridList(fcltMdRtlVO);
		//산지유통시설 시설ㆍ장비 - 투자금액:자금유형
		List<FcltMdRtlVO> resultInvstAtmFundType = fcltMdRtlMapper.selectInvstAtmFundTypeGridList(fcltMdRtlVO);
		//산지유통시설 시설ㆍ장비 - 투자금액:소유자
		List<FcltMdRtlVO> resultInvstAtmOwnr = fcltMdRtlMapper.selectInvstAtmOwnrGridList(fcltMdRtlVO);
		//산지유통시설 시설ㆍ장비 - 투자금액:운영자
		List<FcltMdRtlVO> resultInvstAtmOperPrsn = fcltMdRtlMapper.selectInvstAtmOperPrsnGridList(fcltMdRtlVO);


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
	public HashMap<String,Object> selectMdRtlFcltRgnNowGridList(FcltMdRtlVO fcltMdRtlVO) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		// 지역별 개소수 : 산지유통조직유형
		List<FcltMdRtlVO> resultMdRtlOgnzType =  fcltMdRtlMapper.selectMdRtlOgnzTypeGridList(fcltMdRtlVO);
		// 지역별 개소수 : 운영자
		List<FcltMdRtlVO> resultRgnOperPrsn = fcltMdRtlMapper.selectRgnOperPrsnGridList(fcltMdRtlVO);
		// 산지유통시설 시설·장비 : 물류·상품화 시설
		List<FcltMdRtlVO> resultLgstcsGdsFclt = fcltMdRtlMapper.selectLgstcsGdsFcltGridList(fcltMdRtlVO);
		// 저온냉장고
		List<FcltMdRtlVO> resultMdLwtpStrg = fcltMdRtlMapper.selectMdLwtpStrgGridList(fcltMdRtlVO);
		// 예냉시설
		List<FcltMdRtlVO> resultRgnPrprtnClngFclt = fcltMdRtlMapper.selectRgnPrprtnClngFcltGridList(fcltMdRtlVO);
		// CA저장고
		List<FcltMdRtlVO> resultRgnStrgFclt = fcltMdRtlMapper.selectRgnStrgFcltGridList(fcltMdRtlVO);
		// 선별기·측정장비 설치 개소 수
		List<FcltMdRtlVO> resultRgnFcltMsrmtEqpmnt = fcltMdRtlMapper.selectRgnFcltMsrmtEqpmntGridList(fcltMdRtlVO);
		// 지역별 투자금액: 전체
		List<FcltMdRtlVO> resultRgnInvstAtmAll = fcltMdRtlMapper.selectRgnInvstAtmAllGridList(fcltMdRtlVO);
		// 지역별 투자금액: 소유자
		List<FcltMdRtlVO> resultRgnInvstAtmOwnr = fcltMdRtlMapper.selectRgnInvstAtmOwnrGridList(fcltMdRtlVO);
		// 지역별 투자금액: 운영자
		List<FcltMdRtlVO> resultRgnInvstOperPrsn = fcltMdRtlMapper.selectRgnInvstOperPrsnGridList(fcltMdRtlVO);

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
	public HashMap<String,Object> selectGvrngmtSprtMdRtlFcltGridList(FcltMdRtlVO fcltMdRtlVO) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		
		// 정부지원 산지유통시설 현황 - 개소수:산지유통조직 유형
		List<FcltMdRtlVO> resultBzeatCntMdRtlOgnzType =  fcltMdRtlMapper.selectBzeatCntMdRtlOgnzTypeGridList(fcltMdRtlVO);
		// 정부지원 산지유통시설 현황 - 개소수:소유자 및 운영자
		List<FcltMdRtlVO> resultBzeatCntOwnrAndOper =  fcltMdRtlMapper.selectBzeatCntOwnrAndOperGridList(fcltMdRtlVO);
		// 정부지원 산지유통시설 현황 - 총 건축면적
		List<FcltMdRtlVO> resultFcltEqpmntAllBdar =  fcltMdRtlMapper.selectFcltEqpmntAllBdarGridList(fcltMdRtlVO);
		// 정부지원 산지유통시설 현황 - 물류, 상품화 시설(건축면적)
		List<FcltMdRtlVO> resultLgstcsGdsFcltBdar =  fcltMdRtlMapper.selectLgstcsGdsFcltBdarGridList(fcltMdRtlVO);
		// 정부지원 산지유통시설 현황 - 저온저장고
		List<FcltMdRtlVO> resultBzeatCntLwtpStrg =  fcltMdRtlMapper.selectBzeatCntLwtpStrgGridList(fcltMdRtlVO);
		// 정부지원 산지유통시설 현황 - 예냉시설
		List<FcltMdRtlVO> resultBzeatCntPrprtnClngFclt =  fcltMdRtlMapper.selectBzeatCntPrprtnClngFcltGridList(fcltMdRtlVO);
		// 정부지원 산지유통시설 현황 - CA 저장시설
		List<FcltMdRtlVO> resultBzeatCntStrgFclt =  fcltMdRtlMapper.selectBzeatCntStrgFcltGridList(fcltMdRtlVO);
		// 정부지원 산지유통시설 현황 - 선별기, 측정장비 설치 개소 수
		List<FcltMdRtlVO> resultBzeatCntFcltMsrmtEqpmnt =  fcltMdRtlMapper.selectBzeatCntFcltMsrmtEqpmntGridList(fcltMdRtlVO);
		// 정부지원 산지유통시설 현황 - 투자금액:전체
		List<FcltMdRtlVO> resultBzeatCntInvstAtmAll =  fcltMdRtlMapper.selectBzeatCntInvstAtmAllGridList(fcltMdRtlVO);
		// 정부지원 산지유통시설 현황 - 투자금액:자금 유형
		List<FcltMdRtlVO> resultBzeatCntInvstAtmFundType =  fcltMdRtlMapper.selectBzeatCntInvstAtmFundTypeGridList(fcltMdRtlVO);
		// 정부지원 산지유통시설 현황 - 투자금액:소유자
		List<FcltMdRtlVO> resultBzeatCntInvstAtmOwnr =  fcltMdRtlMapper.selectBzeatCntInvstAtmOwnrGridList(fcltMdRtlVO);
		// 정부지원 산지유통시설 현황 - 투자금액:운영자
		List<FcltMdRtlVO> resultBzeatCntInvstOperPrsn =  fcltMdRtlMapper.selectBzeatCntInvstOperPrsnGridList(fcltMdRtlVO);
		
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
	public HashMap<String,Object> selectGvrngmtSprtMdRtlOgnzTypeGridList(FcltMdRtlVO fcltMdRtlVO) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		
		// 정부지원산지유통시설지역별현황 - 지역별 개소수 : 산지유통조직 유형
		List<FcltMdRtlVO> resultGvrngmtSprtMdRtlOgnzType =  fcltMdRtlMapper.selectGvrngmtSprtMdRtlOgnzTypeGridList(fcltMdRtlVO);
		// 정부지원산지유통시설지역별현황 - 지역별 개소수 : 운영자
		List<FcltMdRtlVO> resultGvrngmtSprtRgnOperPrsn =  fcltMdRtlMapper.selectGvrngmtSprtRgnOperPrsnGridList(fcltMdRtlVO);
		// 정부지원산지유통시설지역별현황 - 물류·상품화 시설
		List<FcltMdRtlVO> resultGvrngmtSprtLgstcsGdsFclt =  fcltMdRtlMapper.selectGvrngmtSprtLgstcsGdsFcltGridList(fcltMdRtlVO);
		// 정부지원산지유통시설지역별현황 - 저온저장고
		List<FcltMdRtlVO> resultGvrngmtSprtLwtpStrg =  fcltMdRtlMapper.selectGvrngmtSprtLwtpStrgGridList(fcltMdRtlVO);
		// 정부지원산지유통시설지역별현황 - 예냉시설
		List<FcltMdRtlVO> resultGvrngmtSprtPrprtnClngFclt =  fcltMdRtlMapper.selectGvrngmtSprtPrprtnClngFcltGridList(fcltMdRtlVO);
		// 정부지원산지유통시설지역별현황 - CA저장시설
		List<FcltMdRtlVO> resultGvrngmtSprtStrgFclt =  fcltMdRtlMapper.selectGvrngmtSprtStrgFcltGridList(fcltMdRtlVO);
		// 정부지원산지유통시설지역별현황 - 선별기, 특정장비 설치 개소수
		List<FcltMdRtlVO> resultGvrngmtSprtFcltMsrmtEqpmnt =  fcltMdRtlMapper.selectGvrngmtSprtFcltMsrmtEqpmntGridList(fcltMdRtlVO);
		// 정부지원산지유통시설지역별현황 - 지역별 투자금액 전체
		List<FcltMdRtlVO> resultGvrngmtSprtRgnInvstAtmAll =  fcltMdRtlMapper.selectGvrngmtSprtRgnInvstAtmAllGridList(fcltMdRtlVO);
		// 정부지원산지유통시설지역별현황 - 지역별 투자금액 : 소유자
		List<FcltMdRtlVO> resultMdInvstAtmOwnr =  fcltMdRtlMapper.selectMdInvstAtmOwnrGridList(fcltMdRtlVO);
		// 정부지원산지유통시설지역별현황 - 지역별 투자금액 : 운영자
		List<FcltMdRtlVO> resultMdInvstAtmOperPrsn =  fcltMdRtlMapper.selectMdInvstAtmOperPrsnGridList(fcltMdRtlVO);
		
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
	public HashMap<String,Object> selectMdRtlFcltOperPrfmncGridList(FcltMdRtlVO fcltMdRtlVO) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		
		// 산지유통시설운영실적 - 운영조직 취급실적
		List<FcltMdRtlVO> resultOperOgnzTrmtPrfmnc =  fcltMdRtlMapper.selectOperOgnzTrmtPrfmncGridList(fcltMdRtlVO);
		// 산지유통시설운영실적 - 운영조직 처리실적
		List<FcltMdRtlVO> resultOperOgnzPrcsPrfmnc =  fcltMdRtlMapper.selectOperOgnzPrcsPrfmncGridList(fcltMdRtlVO);
		// 산지유통시설운영실적 - 운영조직 평균 취급실적
		List<FcltMdRtlVO> resultOperOgnzAvgTrmtPrfmnc =  fcltMdRtlMapper.selectOperOgnzAvgTrmtPrfmncGridList(fcltMdRtlVO);
		// 산지유통시설운영실적 - 지역별 운영조직 취급실적
		List<FcltMdRtlVO> resultMdOperOgnzTrmtPrfmnc =  fcltMdRtlMapper.selectMdOperOgnzTrmtPrfmncGridList(fcltMdRtlVO);
		// 산지유통시설운영실적 - 지역별 운영조직 취급실적(평균)
		List<FcltMdRtlVO> resultMdOperOgnzTrmtPrfmncAvg =  fcltMdRtlMapper.selectMdOperOgnzTrmtPrfmncAvgGridList(fcltMdRtlVO);
		// 산지유통시설운영실적 - 지역별 APC 처리실적
		List<FcltMdRtlVO> resultMdApcPrcsPrfmnc =  fcltMdRtlMapper.selectMdApcPrcsPrfmncGridList(fcltMdRtlVO);
		// 산지유통시설운영실적 - 지역별 APC 처리실적(평균)
		List<FcltMdRtlVO> resultMdApcPrcsPrfmncAvg =  fcltMdRtlMapper.selectMdApcPrcsPrfmncAvgGridList(fcltMdRtlVO);
		
		
		resultMap.put("resultOperOgnzTrmtPrfmnc", resultOperOgnzTrmtPrfmnc);
		resultMap.put("resultOperOgnzPrcsPrfmnc", resultOperOgnzPrcsPrfmnc);
		resultMap.put("resultOperOgnzAvgTrmtPrfmnc", resultOperOgnzAvgTrmtPrfmnc);
		resultMap.put("resultMdOperOgnzTrmtPrfmnc", resultMdOperOgnzTrmtPrfmnc);
		resultMap.put("resultMdOperOgnzTrmtPrfmncAvg", resultMdOperOgnzTrmtPrfmncAvg);
		resultMap.put("resultMdApcPrcsPrfmnc", resultMdApcPrcsPrfmnc);
		resultMap.put("resultMdApcPrcsPrfmncAvg", resultMdApcPrcsPrfmncAvg);
		
		return resultMap;
		
	}
	@Override
	public HashMap<String,Object> selectGvrngmtSprtRgnOperPrfmncGridList(FcltMdRtlVO fcltMdRtlVO) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		
		// 정부지원지역별운영실적 - 운영조직 취급실적
		List<FcltMdRtlVO> resultGvrngmtSprtOperOgnzTrmtPrfmnc =  fcltMdRtlMapper.selectGvrngmtSprtOperOgnzTrmtPrfmncGridList(fcltMdRtlVO);
		// 정부지원지역별운영실적 - 산지유통시설 처리실적
		List<FcltMdRtlVO> resultMdRtlFcltPrcsPrfmnc =  fcltMdRtlMapper.selectMdRtlFcltPrcsPrfmncGridList(fcltMdRtlVO);
		// 정부지원지역별운영실적 - 산지유통시설 처리실적(평균)
		List<FcltMdRtlVO> resultMdRtlFcltPrcsPrfmncAvg =  fcltMdRtlMapper.selectMdRtlFcltPrcsPrfmncAvgcGridList(fcltMdRtlVO);
		// 정부지원지역별운영실적 - 산지유통시설 취급실적
		List<FcltMdRtlVO> resultRgnOperOgnzTrmtPrfmnc =  fcltMdRtlMapper.selectRgnOperOgnzTrmtPrfmncGridList(fcltMdRtlVO);
		// 정부지원지역별운영실적 - 산지유통시설 취급실적(평균)
		List<FcltMdRtlVO> resultRgnOperOgnzTrmtPrfmncAvg =  fcltMdRtlMapper.selectRgnOperOgnzTrmtPrfmncAvgGridList(fcltMdRtlVO);
		// 정부지원지역별운영실적 - 산지유통시설 처리실적
		List<FcltMdRtlVO> resultRgnOperOgnzApcPrcsPrfmnc =  fcltMdRtlMapper.selectRgnOperOgnzApcPrcsPrfmncGridList(fcltMdRtlVO);
		// 정부지원지역별운영실적 - 산지유통시설 처리실적(평균)
		List<FcltMdRtlVO> resultRgnOperOgnzApcPrcsPrfmncAvg =  fcltMdRtlMapper.selectRgnOperOgnzApcPrcsPrfmncAvgGridList(fcltMdRtlVO);
		
		
		resultMap.put("resultGvrngmtSprtOperOgnzTrmtPrfmnc", resultGvrngmtSprtOperOgnzTrmtPrfmnc);
		resultMap.put("resultMdRtlFcltPrcsPrfmnc", resultMdRtlFcltPrcsPrfmnc);
		resultMap.put("resultMdRtlFcltPrcsPrfmncAvg", resultMdRtlFcltPrcsPrfmncAvg);
		resultMap.put("resultRgnOperOgnzTrmtPrfmnc", resultRgnOperOgnzTrmtPrfmnc);
		resultMap.put("resultRgnOperOgnzTrmtPrfmncAvg", resultRgnOperOgnzTrmtPrfmncAvg);
		resultMap.put("resultRgnOperOgnzApcPrcsPrfmnc", resultRgnOperOgnzApcPrcsPrfmnc);
		resultMap.put("resultRgnOperOgnzApcPrcsPrfmncAvg", resultRgnOperOgnzApcPrcsPrfmncAvg);
		
		return resultMap;
		
	}
	
}