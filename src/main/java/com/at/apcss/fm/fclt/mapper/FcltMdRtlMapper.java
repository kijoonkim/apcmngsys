package com.at.apcss.fm.fclt.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.at.apcss.fm.fclt.vo.FcltMdRtlVO;

/**
 * APC전수조사 대시보드 Mapper 인터페이스
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

@Mapper
public interface FcltMdRtlMapper {

	/**
	 * 기준년도 목록 조회
	 * @param FcltMdRtlVO
	 * @return List<MdRtlFcltVO>
	 * @throws Exception
	 */
	public List<FcltMdRtlVO> selectCrtrYnList(FcltMdRtlVO fcltMdRtlVO) throws Exception;
	
	/**
	 * APC현황
	 * @param FcltMdRtlVO
	 * @return List<MdRtlFcltVO>
	 * @throws Exception
	 */
	public List<FcltMdRtlVO> selectMapSttn(FcltMdRtlVO fcltMdRtlVO) throws Exception;
	
	/**
	 * APC지역목록조회
	 * @param FcltMdRtlVO
	 * @return List<MdRtlFcltVO>
	 * @throws Exception
	 */
	public List<FcltMdRtlVO> selectCtpvAreaList(FcltMdRtlVO fcltMdRtlVO) throws Exception;
	
	/**
	 * 운영조직 취급실적을 조회한다
	 * @param FcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectMdRtlOgnzGridList(FcltMdRtlVO fcltMdRtlVO) throws Exception;
	/**
	 * 개소수:소유자 및 운영자 목록을 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectOwnrAndOperGridList(FcltMdRtlVO fcltMdRtlVO);

	/**
	 * 총 건축면적 목록을 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectAllBdarGridList(FcltMdRtlVO fcltMdRtlVO);

	/**
	 * 물류: 상품화시설(건축면적) 목록을 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectLgstcsGdsGridList(FcltMdRtlVO fcltMdRtlVO);

	/**
	 * 저온냉장고 목록을 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectLwtpStrgGridList(FcltMdRtlVO fcltMdRtlVO);

	/**
	 * 예냉시설 목록을 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectPrprtnClngFcltGridList(FcltMdRtlVO fcltMdRtlVO);

	/**
	 * CA저장시설 목록을 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectStrgFcltGridList(FcltMdRtlVO fcltMdRtlVO);

	/**
	 * 측정장비설치 개소수 목록을 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectFcltMsrmtEqpmntGridList(FcltMdRtlVO fcltMdRtlVO);

	/**
	 * 투자금액:전체 목록을 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectInvstAtmAllGridList(FcltMdRtlVO fcltMdRtlVO);

	/**
	 * 투자금액:자금 유형을 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectInvstAtmFundTypeGridList(FcltMdRtlVO fcltMdRtlVO);

	/**
	 * 투자금액:소유자를 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectInvstAtmOwnrGridList(FcltMdRtlVO fcltMdRtlVO);

	/**
	 * 투자금액:운영자를 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectInvstAtmOperPrsnGridList(FcltMdRtlVO fcltMdRtlVO);
	
	/**
	 * 지역별 개소수: 산지유통조직 유형을 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectMdRtlOgnzTypeGridList(FcltMdRtlVO fcltMdRtlVO);
	
	/**
	 * 지역별 개소수: 운영자를 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectRgnOperPrsnGridList(FcltMdRtlVO fcltMdRtlVO);
	
	/**
	 * 물류·상품화 시설를 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectLgstcsGdsFcltGridList(FcltMdRtlVO fcltMdRtlVO);
	
	/**
	 * 저온냉장고를 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectMdLwtpStrgGridList(FcltMdRtlVO fcltMdRtlVO);
	
	/**
	 * 예냉시설을 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectRgnPrprtnClngFcltGridList(FcltMdRtlVO fcltMdRtlVO);
	
	/**
	 * CA저장고 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectRgnStrgFcltGridList(FcltMdRtlVO fcltMdRtlVO);
	
	/**
	 * 선별기·측정장비 설치 개소 수 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectRgnFcltMsrmtEqpmntGridList(FcltMdRtlVO fcltMdRtlVO);
	
	/**
	 * 지역별 투자금액 전체 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectRgnInvstAtmAllGridList(FcltMdRtlVO fcltMdRtlVO);
	
	/**
	 * 지역별 투자금액 소유자 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectRgnInvstAtmOwnrGridList(FcltMdRtlVO fcltMdRtlVO);
	
	/**
	 * 지역별 투자금액 운영자 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectRgnInvstOperPrsnGridList(FcltMdRtlVO fcltMdRtlVO);
	
	/**
	 * 정부지원 - 개소수:산지유통조직 유형을 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectBzeatCntMdRtlOgnzTypeGridList(FcltMdRtlVO fcltMdRtlVO);
	
	/**
	 * 정부지원 - 개소수:소유자 및 운영자를 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectBzeatCntOwnrAndOperGridList(FcltMdRtlVO fcltMdRtlVO);
	
	/**
	 * 정부지원 - 총 건축면적을 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectFcltEqpmntAllBdarGridList(FcltMdRtlVO fcltMdRtlVO);
	
	/**
	 * 정부지원 - 물류, 상품화 시설(건축면적)을 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectLgstcsGdsFcltBdarGridList(FcltMdRtlVO fcltMdRtlVO);
	
	/**
	 * 정부지원 - 저온저장고를 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectBzeatCntLwtpStrgGridList(FcltMdRtlVO fcltMdRtlVO);
	
	/**
	 * 정부지원 - 예냉시설을 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectBzeatCntPrprtnClngFcltGridList(FcltMdRtlVO fcltMdRtlVO);
	
	/**
	 * 정부지원 - CA 저장시설을 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectBzeatCntStrgFcltGridList(FcltMdRtlVO fcltMdRtlVO);
	
	/**
	 * 정부지원 - 선별기, 측정장비 설치 개소 수를 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectBzeatCntFcltMsrmtEqpmntGridList(FcltMdRtlVO fcltMdRtlVO);
	
	/**
	 * 정부지원 - 투자금액: 전체를 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectBzeatCntInvstAtmAllGridList(FcltMdRtlVO fcltMdRtlVO);
	
	/**
	 * 정부지원 - 투자금액: 자금 유형을 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectBzeatCntInvstAtmFundTypeGridList(FcltMdRtlVO fcltMdRtlVO);
	
	/**
	 * 정부지원 - 투자금액: 소유자를 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectBzeatCntInvstAtmOwnrGridList(FcltMdRtlVO fcltMdRtlVO);
	
	/**
	 * 정부지원 - 투자금액: 운영자를 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectBzeatCntInvstOperPrsnGridList(FcltMdRtlVO fcltMdRtlVO);
	
	/**
	 * 정부지원산지유통시설지역별현황 - 지역별 개소수 : 산지유통조직 유형을 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectGvrngmtSprtMdRtlOgnzTypeGridList(FcltMdRtlVO fcltMdRtlVO);
	
	/**
	 * 정부지원산지유통시설지역별현황 - 지역별 개소수 : 운영자를 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectGvrngmtSprtRgnOperPrsnGridList(FcltMdRtlVO fcltMdRtlVO);
	
	/**
	 * 정부지원산지유통시설지역별현황 - 물류·상품화 시설를 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectGvrngmtSprtLgstcsGdsFcltGridList(FcltMdRtlVO fcltMdRtlVO);
	
	/**
	 * 정부지원산지유통시설지역별현황 - 저온저장고를 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectGvrngmtSprtLwtpStrgGridList(FcltMdRtlVO fcltMdRtlVO);
	
	/**
	 * 정부지원산지유통시설지역별현황 - 예냉시설을 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectGvrngmtSprtPrprtnClngFcltGridList(FcltMdRtlVO fcltMdRtlVO);
	
	/**
	 * 정부지원산지유통시설지역별현황 - CA저장시설을 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectGvrngmtSprtStrgFcltGridList(FcltMdRtlVO fcltMdRtlVO);
	
	/**
	 * 정부지원산지유통시설지역별현황 - 선별기, 특정장비 설치 개소수을 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectGvrngmtSprtFcltMsrmtEqpmntGridList(FcltMdRtlVO fcltMdRtlVO);
	
	/**
	 * 정부지원산지유통시설지역별현황 - 지역별 투자금액 전체를 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectGvrngmtSprtRgnInvstAtmAllGridList(FcltMdRtlVO fcltMdRtlVO);
	
	/**
	 * 정부지원산지유통시설지역별현황 - 지역별 투자금액 : 소유자를 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectMdInvstAtmOwnrGridList(FcltMdRtlVO fcltMdRtlVO);
	
	/**
	 * 정부지원산지유통시설지역별현황 - 지역별 투자금액 : 운영자를 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectMdInvstAtmOperPrsnGridList(FcltMdRtlVO fcltMdRtlVO);
	
	/**
	 * 산지유통시설운영실적 - 운영조직 취급실적을 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectOperOgnzTrmtPrfmncGridList(FcltMdRtlVO fcltMdRtlVO);
	
	/**
	 * 산지유통시설운영실적 - 운영조직 처리실적을 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectOperOgnzPrcsPrfmncGridList(FcltMdRtlVO fcltMdRtlVO);
	
	/**
	 * 산지유통시설운영실적 - 운영조직 평균 취급실적을 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectOperOgnzAvgTrmtPrfmncGridList(FcltMdRtlVO fcltMdRtlVO);
	/**
	 * 산지유통시설운영실적 - 지역별 운영조직 취급실적을 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectMdOperOgnzTrmtPrfmncGridList(FcltMdRtlVO fcltMdRtlVO);
	/**
	 * 산지유통시설운영실적 - 지역별 운영조직 취급실적(평균)을 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectMdOperOgnzTrmtPrfmncAvgGridList(FcltMdRtlVO fcltMdRtlVO);
	/**
	 * 산지유통시설운영실적 - 지역별 APC 처리실적을 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectMdApcPrcsPrfmncGridList(FcltMdRtlVO fcltMdRtlVO);
	/**
	 * 산지유통시설운영실적 - 지역별 APC 처리실적(평균)을 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectMdApcPrcsPrfmncAvgGridList(FcltMdRtlVO fcltMdRtlVO);
	/**
	 * 정부지원 지역별 운영실적 - 운영조직 취급실적을 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectGvrngmtSprtOperOgnzTrmtPrfmncGridList(FcltMdRtlVO fcltMdRtlVO);
	/**
	 * 정부지원 지역별 운영실적 - 산지유통시설 처리실적을 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectMdRtlFcltPrcsPrfmncGridList(FcltMdRtlVO fcltMdRtlVO);
	/**
	 * 정부지원 지역별 운영실적 - 산지유통시설 처리실적(평균)을 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectMdRtlFcltPrcsPrfmncAvgcGridList(FcltMdRtlVO fcltMdRtlVO);
	/**
	 * 정부지원 지역별 운영실적 - 지역별 운영조직 취급실적을 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectRgnOperOgnzTrmtPrfmncGridList(FcltMdRtlVO fcltMdRtlVO);
	/**
	 * 정부지원 지역별 운영실적 - 지역별 운영조직 취급실적(평균)을 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectRgnOperOgnzTrmtPrfmncAvgGridList(FcltMdRtlVO fcltMdRtlVO);
	/**
	 * 정부지원 지역별 운영실적 - 지역별 APC 처리실적을 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectRgnOperOgnzApcPrcsPrfmncGridList(FcltMdRtlVO fcltMdRtlVO);
	/**
	 * 정부지원 지역별 운영실적 - 지역별 APC 처리실적(평균)을 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectRgnOperOgnzApcPrcsPrfmncAvgGridList(FcltMdRtlVO fcltMdRtlVO);
}
