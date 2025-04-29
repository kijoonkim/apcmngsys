package com.at.apcss.fm.fclt.service;

import java.util.HashMap;
import java.util.List;

import com.at.apcss.fm.fclt.vo.FcltMdRtlVO;

/**
 * APC전수조사관리 대시보드 Service 인터페이스
 * @author 김현호
 * @since 2023.11.15
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.11.15  김현호        최초 생성
 * </pre>
 */
public interface FcltMdRtlService {
	/**
	 * 기준년도 목록 조회
	 * @param fcltMdRtlVO
	 * @return List<MdRtlFcltVO>
	 * @throws Exception
	 */
	public List<FcltMdRtlVO> selectCrtrYnList(FcltMdRtlVO fcltMdRtlVO) throws Exception;
	/**
	 * APC현황
	 * @param fcltMdRtlVO
	 * @return List<MdRtlFcltVO>
	 * @throws Exception
	 */
	public List<FcltMdRtlVO> selectMapSttn(FcltMdRtlVO fcltMdRtlVO) throws Exception;

	/**
	 * 전수조사 집계현황
	 * @param fcltMdRtlVO
	 * @return List<MdRtlFcltVO>
	 * @throws Exception
	 */
	public List<HashMap<String,Object>> selectApcTotList(FcltMdRtlVO fcltMdRtlVO) throws Exception;
	/**
	 * APC지역목록조회
	 * @param fcltMdRtlVO
	 * @return List<MdRtlFcltVO>
	 * @throws Exception
	 */
	public List<FcltMdRtlVO> selectCtpvAreaList(FcltMdRtlVO fcltMdRtlVO) throws Exception;
	/**
	 * 산지유통시설현황 목록을 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String,Object> selectMdRtlOgnzNowGridList(FcltMdRtlVO fcltMdRtlVO) throws Exception;

	/**
	 * 산지유통시설지역별현황 목록을 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String,Object> selectMdRtlFcltRgnNowGridList(FcltMdRtlVO fcltMdRtlVO) throws Exception;

	/**
	 * 정부지원산지유통시설현황 목록을 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String,Object> selectGvrngmtSprtMdRtlFcltGridList(FcltMdRtlVO fcltMdRtlVO) throws Exception;

	/**
	 * 정부지원산지유통시설지역별현황 목록을 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String,Object> selectGvrngmtSprtMdRtlOgnzTypeGridList(FcltMdRtlVO fcltMdRtlVO) throws Exception;

	/**
	 * 산지유통시설 운영실적 목록을 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String,Object> selectMdRtlFcltOperPrfmncGridList(FcltMdRtlVO fcltMdRtlVO) throws Exception;

	/**
	 * 정부지원 지역별 운영실적 목록을 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String,Object> selectGvrngmtSprtRgnOperPrfmncGridList(FcltMdRtlVO fcltMdRtlVO) throws Exception;



	/**
	 * APC 집계요약
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectApcTotSmmryList(FcltMdRtlVO fcltMdRtlVO) throws Exception;

	/**
	 * APC 집계 요약 (지역별)
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectApcTotSmmryListByCtpv(FcltMdRtlVO fcltMdRtlVO) throws Exception;

	/**
	 * 지역별 APC 목록 조회
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectApcListByCtpv(FcltMdRtlVO fcltMdRtlVO) throws Exception;

	/**
	 * 1.1. APC 산지유통시설 개소수 집계 목록 조회
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectApcSpotTotList(FcltMdRtlVO fcltMdRtlVO) throws Exception;

	/**
	 * 1.1. APC 산지유통시설 개소수 집계 목록 조회 (소유자/운영자)
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectApcSpotTotListByOwnerOper(FcltMdRtlVO fcltMdRtlVO) throws Exception;

	/**
	 * 2.1. 지역별 APC 산지유통시설 개소수 집계 목록 조회
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectApcSpotTotListByCtpv(FcltMdRtlVO fcltMdRtlVO) throws Exception;

	/**
	 * 1.2. APC 산지유통시설 시설ㆍ장비 면적 집계 목록 조회
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectApcFcltAreaSizeTotList(FcltMdRtlVO fcltMdRtlVO) throws Exception;

	/**
	 * 2.2. 지역별 APC 산지유통시설 시설ㆍ장비 면적 집계 목록 조회
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectApcFcltAreaSizeTotListByCtpv(FcltMdRtlVO fcltMdRtlVO) throws Exception;


	/**
	 * 1.2. APC 선별기·측정장비 설치 개소 수 집계 목록 조회
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectApcInstalledEquipmentTotList(FcltMdRtlVO fcltMdRtlVO) throws Exception;

	/**
	 * 2.2. APC 지역별 선별기·측정장비 설치 개소 수 집계 목록 조회
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectApcInstalledEquipmentTotListByCtpv(FcltMdRtlVO fcltMdRtlVO) throws Exception;

	/**
	 * 1.3. APC 투자금액 집계 목록 조회
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectApcInvestmentTotList(FcltMdRtlVO fcltMdRtlVO) throws Exception;

	/**
	 * 2.3. 지역별 APC 투자금액 집계 목록 조회
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectApcInvestmentTotListByCtpv(FcltMdRtlVO fcltMdRtlVO) throws Exception;


	/**
	 * APC 운영 실적 집계 목록 조회
	 * @param fcltMdRtlVO
	 * @return
	 * @throws Exception
	 */
	public List<FcltMdRtlVO> selectApcOperPrfmncTotList(FcltMdRtlVO fcltMdRtlVO) throws Exception;

	/**
	 * APC 운영 실적 집계 목록 (지역별) 조회
	 * @param fcltMdRtlVO
	 * @return
	 * @throws Exception
	 */
	public List<FcltMdRtlVO> selectApcOperPrfmncTotListByCtpv(FcltMdRtlVO fcltMdRtlVO) throws Exception;

}
