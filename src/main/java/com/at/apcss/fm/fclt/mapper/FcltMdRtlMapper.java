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
	 * APC현황
	 * @param FcltMdRtlVO
	 * @return List<MdRtlFcltVO>
	 * @throws Exception
	 */
	public List<FcltMdRtlVO> selectMapSttn(FcltMdRtlVO mdRtlFcltVO) throws Exception;
	
	/**
	 * APC지역목록조회
	 * @param FcltMdRtlVO
	 * @return List<MdRtlFcltVO>
	 * @throws Exception
	 */
	public List<FcltMdRtlVO> selectCtpvAreaList(FcltMdRtlVO mdRtlFcltVO) throws Exception;
	
	/**
	 * 운영조직 취급실적을 조회한다
	 * @param FcltMdRtlVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectMdRtlOgnzGridList(FcltMdRtlVO mdRtlFcltVO) throws Exception;
	/**
	 * 개소수:소유자 및 운영자 목록을 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectOwnrAndOperGridList(FcltMdRtlVO mdRtlFcltVO);

	/**
	 * 총 건축면적 목록을 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectAllBdarGridList(FcltMdRtlVO mdRtlFcltVO);

	/**
	 * 물류: 상품화시설(건축면적) 목록을 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectLgstcsGdsGridList(FcltMdRtlVO mdRtlFcltVO);

	/**
	 * 저온냉장고 목록을 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectLwtpStrgGridList(FcltMdRtlVO mdRtlFcltVO);

	/**
	 * 예냉시설 목록을 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectPrprtnClngFcltGridList(FcltMdRtlVO mdRtlFcltVO);

	/**
	 * CA저장시설 목록을 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectStrgFcltGridList(FcltMdRtlVO mdRtlFcltVO);

	/**
	 * 측정장비설치 개소수 목록을 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectFcltMsrmtEqpmntGridList(FcltMdRtlVO mdRtlFcltVO);

	/**
	 * 투자금액:전체 목록을 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectInvstAtmAllGridList(FcltMdRtlVO mdRtlFcltVO);

	/**
	 * 투자금액:자금 유형을 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectInvstAtmFundTypeGridList(FcltMdRtlVO mdRtlFcltVO);

	/**
	 * 투자금액:소유자를 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectInvstAtmOwnrGridList(FcltMdRtlVO mdRtlFcltVO);

	/**
	 * 투자금액:운영자를 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectInvstAtmOperPrsnGridList(FcltMdRtlVO mdRtlFcltVO);
	
	/**
	 * 지역별 개소수: 산지유통조직 유형을 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectMdRtlOgnzTypeGridList(FcltMdRtlVO mdRtlFcltVO);
	
	/**
	 * 지역별 개소수: 운영자를 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectRgnOperPrsnGridList(FcltMdRtlVO mdRtlFcltVO);
	
	/**
	 * 물류·상품화 시설를 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectLgstcsGdsFcltGridList(FcltMdRtlVO mdRtlFcltVO);
	
	/**
	 * 저온냉장고를 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectMdLwtpStrgGridList(FcltMdRtlVO mdRtlFcltVO);
	
	/**
	 * 예냉시설을 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectRgnPrprtnClngFcltGridList(FcltMdRtlVO mdRtlFcltVO);
	
	/**
	 * CA저장고 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectRgnStrgFcltGridList(FcltMdRtlVO mdRtlFcltVO);
	
	/**
	 * 선별기·측정장비 설치 개소 수 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectRgnFcltMsrmtEqpmntGridList(FcltMdRtlVO mdRtlFcltVO);
	
	/**
	 * 지역별 투자금액 전체 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectRgnInvstAtmAllGridList(FcltMdRtlVO mdRtlFcltVO);
	
	/**
	 * 지역별 투자금액 소유자 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectRgnInvstAtmOwnrGridList(FcltMdRtlVO mdRtlFcltVO);
	
	/**
	 * 지역별 투자금액 운영자 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectRgnInvstOperPrsnGridList(FcltMdRtlVO mdRtlFcltVO);
	
	/**
	 * 정부지원 - 개소수:산지유통조직 유형을 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectBzeatCntMdRtlOgnzTypeGridList(FcltMdRtlVO mdRtlFcltVO);
	
	/**
	 * 정부지원 - 개소수:소유자 및 운영자를 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectBzeatCntOwnrAndOperGridList(FcltMdRtlVO mdRtlFcltVO);
	
	/**
	 * 정부지원 - 총 건축면적을 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectFcltEqpmntAllBdarGridList(FcltMdRtlVO mdRtlFcltVO);
	
	/**
	 * 정부지원 - 물류, 상품화 시설(건축면적)을 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectLgstcsGdsFcltBdarGridList(FcltMdRtlVO mdRtlFcltVO);
	
	/**
	 * 정부지원 - 저온저장고를 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectBzeatCntLwtpStrgGridList(FcltMdRtlVO mdRtlFcltVO);
	
	/**
	 * 정부지원 - 예냉시설을 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectBzeatCntPrprtnClngFcltGridList(FcltMdRtlVO mdRtlFcltVO);
	
	/**
	 * 정부지원 - CA 저장시설을 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectBzeatCntStrgFcltGridList(FcltMdRtlVO mdRtlFcltVO);
	
	/**
	 * 정부지원 - 선별기, 측정장비 설치 개소 수를 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectBzeatCntFcltMsrmtEqpmntGridList(FcltMdRtlVO mdRtlFcltVO);
	
	/**
	 * 정부지원 - 투자금액: 전체를 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectBzeatCntInvstAtmAllGridList(FcltMdRtlVO mdRtlFcltVO);
	
	/**
	 * 정부지원 - 투자금액: 자금 유형을 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectBzeatCntInvstAtmFundTypeGridList(FcltMdRtlVO mdRtlFcltVO);
	
	/**
	 * 정부지원 - 투자금액: 소유자를 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectBzeatCntInvstAtmOwnrGridList(FcltMdRtlVO mdRtlFcltVO);
	
	/**
	 * 정부지원 - 투자금액: 운영자를 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectBzeatCntInvstOperPrsnGridList(FcltMdRtlVO mdRtlFcltVO);
	
	/**
	 * 정부지원산지유통시설지역별현황 - 지역별 개소수 : 산지유통조직 유형을 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectGvrngmtSprtMdRtlOgnzTypeGridList(FcltMdRtlVO mdRtlFcltVO);
	
	/**
	 * 정부지원산지유통시설지역별현황 - 지역별 개소수 : 운영자를 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectGvrngmtSprtRgnOperPrsnGridList(FcltMdRtlVO mdRtlFcltVO);
	
	/**
	 * 정부지원산지유통시설지역별현황 - 물류·상품화 시설를 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectGvrngmtSprtLgstcsGdsFcltGridList(FcltMdRtlVO mdRtlFcltVO);
	
	/**
	 * 정부지원산지유통시설지역별현황 - 저온저장고를 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectGvrngmtSprtLwtpStrgGridList(FcltMdRtlVO mdRtlFcltVO);
	
	/**
	 * 정부지원산지유통시설지역별현황 - 예냉시설을 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectGvrngmtSprtPrprtnClngFcltGridList(FcltMdRtlVO mdRtlFcltVO);
	
	/**
	 * 정부지원산지유통시설지역별현황 - CA저장시설을 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectGvrngmtSprtStrgFcltGridList(FcltMdRtlVO mdRtlFcltVO);
	
	/**
	 * 정부지원산지유통시설지역별현황 - 선별기, 특정장비 설치 개소수을 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectGvrngmtSprtFcltMsrmtEqpmntGridList(FcltMdRtlVO mdRtlFcltVO);
	
	/**
	 * 정부지원산지유통시설지역별현황 - 지역별 투자금액 전체를 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectGvrngmtSprtRgnInvstAtmAllGridList(FcltMdRtlVO mdRtlFcltVO);
	
	/**
	 * 정부지원산지유통시설지역별현황 - 지역별 투자금액 : 소유자를 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectMdInvstAtmOwnrGridList(FcltMdRtlVO mdRtlFcltVO);
	
	/**
	 * 정부지원산지유통시설지역별현황 - 지역별 투자금액 : 운영자를 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectMdInvstAtmOperPrsnGridList(FcltMdRtlVO mdRtlFcltVO);
	
	/**
	 * 산지유통시설운영실적 - 운영조직 취급실적을 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectOperOgnzTrmtPrfmncGridList(FcltMdRtlVO mdRtlFcltVO);
	
	/**
	 * 산지유통시설운영실적 - 운영조직 처리실적을 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectOperOgnzPrcsPrfmncGridList(FcltMdRtlVO mdRtlFcltVO);
	
	/**
	 * 산지유통시설운영실적 - 운영조직 평균 취급실적을 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<FcltMdRtlVO> selectOperOgnzAvgTrmtPrfmncGridList(FcltMdRtlVO mdRtlFcltVO);
//	/**
//	 * 산지유통시설운영실적 - 지역별 운영조직 취급실적을 조회한다.
//	 * @param mdRtlFcltVO
//	 * @return
//	 */
//	public List<MdRtlFcltVO> selectMdOperOgnzTrmtPrfmncGridList(MdRtlFcltVO mdRtlFcltVO);
//	/**
//	 * 산지유통시설운영실적 - 지역별 운영조직 취급실적(평균)을 조회한다.
//	 * @param mdRtlFcltVO
//	 * @return
//	 */
//	public List<MdRtlFcltVO> selectMdOperOgnzTrmtPrfmncAvgGridList(MdRtlFcltVO mdRtlFcltVO);
//	/**
//	 * 산지유통시설운영실적 - 지역별 APC 처리실적을 조회한다.
//	 * @param mdRtlFcltVO
//	 * @return
//	 */
//	public List<MdRtlFcltVO> selectMdApcPrcsPrfmncGridList(MdRtlFcltVO mdRtlFcltVO);
//	/**
//	 * 산지유통시설운영실적 - 지역별 APC 처리실적(평균)을 조회한다.
//	 * @param mdRtlFcltVO
//	 * @return
//	 */
//	public List<MdRtlFcltVO> selectMdApcPrcsPrfmncAvgGridList(MdRtlFcltVO mdRtlFcltVO);
}
