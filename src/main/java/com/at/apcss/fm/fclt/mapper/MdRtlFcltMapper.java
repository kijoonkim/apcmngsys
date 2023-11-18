package com.at.apcss.fm.fclt.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.at.apcss.fm.fclt.vo.MdRtlFcltVO;

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
public interface MdRtlFcltMapper {

	/**
	 * APC현황
	 * @param MdRtlFcltVO
	 * @return List<MdRtlFcltVO>
	 * @throws Exception
	 */
	public List<MdRtlFcltVO> selectMapSttn(MdRtlFcltVO mdRtlFcltVO) throws Exception;
	
	/**
	 * APC지역목록조회
	 * @param MdRtlFcltVO
	 * @return List<MdRtlFcltVO>
	 * @throws Exception
	 */
	public List<MdRtlFcltVO> selectCtpvAreaList(MdRtlFcltVO mdRtlFcltVO) throws Exception;
	
	/**
	 * 운영조직 취급실적을 조회한다
	 * @param MdRtlFcltVO
	 * @return
	 */
	public List<MdRtlFcltVO> selectMdRtlOgnzGridList(MdRtlFcltVO mdRtlFcltVO) throws Exception;
	/**
	 * 개소수:소유자 및 운영자 목록을 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<MdRtlFcltVO> selectOwnrAndOperGridList(MdRtlFcltVO mdRtlFcltVO);

	/**
	 * 총 건축면적 목록을 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<MdRtlFcltVO> selectAllBdarGridList(MdRtlFcltVO mdRtlFcltVO);

	/**
	 * 물류: 상품화시설(건축면적) 목록을 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<MdRtlFcltVO> selectLgstcsGdsGridList(MdRtlFcltVO mdRtlFcltVO);

	/**
	 * 저온냉장고 목록을 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<MdRtlFcltVO> selectLwtpStrgGridList(MdRtlFcltVO mdRtlFcltVO);

	/**
	 * 예냉시설 목록을 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<MdRtlFcltVO> selectPrprtnClngFcltGridList(MdRtlFcltVO mdRtlFcltVO);

	/**
	 * CA저장시설 목록을 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<MdRtlFcltVO> selectStrgFcltGridList(MdRtlFcltVO mdRtlFcltVO);

	/**
	 * 측정장비설치 개소수 목록을 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<MdRtlFcltVO> selectFcltMsrmtEqpmntGridList(MdRtlFcltVO mdRtlFcltVO);

	/**
	 * 투자금액:전체 목록을 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<MdRtlFcltVO> selectInvstAtmAllGridList(MdRtlFcltVO mdRtlFcltVO);

	/**
	 * 투자금액:자금 유형을 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<MdRtlFcltVO> selectInvstAtmFundTypeGridList(MdRtlFcltVO mdRtlFcltVO);

	/**
	 * 투자금액:소유자를 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<MdRtlFcltVO> selectInvstAtmOwnrGridList(MdRtlFcltVO mdRtlFcltVO);

	/**
	 * 투자금액:운영자를 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<MdRtlFcltVO> selectInvstAtmOperPrsnGridList(MdRtlFcltVO mdRtlFcltVO);
	
	/**
	 * 지역별 개소수: 산지유통조직 유형을 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<MdRtlFcltVO> selectMdRtlOgnzTypeGridList(MdRtlFcltVO mdRtlFcltVO);
	
	/**
	 * 지역별 개소수: 운영자를 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<MdRtlFcltVO> selectRgnOperPrsnGridList(MdRtlFcltVO mdRtlFcltVO);
	
	/**
	 * 물류·상품화 시설를 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<MdRtlFcltVO> selectLgstcsGdsFcltGridList(MdRtlFcltVO mdRtlFcltVO);
	
	/**
	 * 저온냉장고를 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<MdRtlFcltVO> selectMdLwtpStrgGridList(MdRtlFcltVO mdRtlFcltVO);
	
	/**
	 * 예냉시설을 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<MdRtlFcltVO> selectRgnPrprtnClngFcltGridList(MdRtlFcltVO mdRtlFcltVO);
	
	/**
	 * CA저장고 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<MdRtlFcltVO> selectRgnStrgFcltGridList(MdRtlFcltVO mdRtlFcltVO);
	
	/**
	 * 선별기·측정장비 설치 개소 수 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<MdRtlFcltVO> selectRgnFcltMsrmtEqpmntGridList(MdRtlFcltVO mdRtlFcltVO);
	
	/**
	 * 지역별 투자금액 전체 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<MdRtlFcltVO> selectRgnInvstAtmAllGridList(MdRtlFcltVO mdRtlFcltVO);
	
	/**
	 * 지역별 투자금액 소유자 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<MdRtlFcltVO> selectRgnInvstAtmOwnrGridList(MdRtlFcltVO mdRtlFcltVO);
	
	/**
	 * 지역별 투자금액 운영자 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<MdRtlFcltVO> selectRgnInvstOperPrsnGridList(MdRtlFcltVO mdRtlFcltVO);
	
	/**
	 * 정부지원 - 개소수:산지유통조직 유형을 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<MdRtlFcltVO> selectBzeatCntMdRtlOgnzTypeGridList(MdRtlFcltVO mdRtlFcltVO);
	
	/**
	 * 정부지원 - 개소수:소유자 및 운영자를 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<MdRtlFcltVO> selectBzeatCntOwnrAndOperGridList(MdRtlFcltVO mdRtlFcltVO);
	
	/**
	 * 정부지원 - 총 건축면적을 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<MdRtlFcltVO> selectFcltEqpmntAllBdarGridList(MdRtlFcltVO mdRtlFcltVO);
	
	/**
	 * 정부지원 - 물류, 상품화 시설(건축면적)을 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<MdRtlFcltVO> selectLgstcsGdsFcltBdarGridList(MdRtlFcltVO mdRtlFcltVO);
	
	/**
	 * 정부지원 - 저온저장고를 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<MdRtlFcltVO> selectBzeatCntLwtpStrgGridList(MdRtlFcltVO mdRtlFcltVO);
	
	/**
	 * 정부지원 - 예냉시설을 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<MdRtlFcltVO> selectBzeatCntPrprtnClngFcltGridList(MdRtlFcltVO mdRtlFcltVO);
	
	/**
	 * 정부지원 - CA 저장시설을 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<MdRtlFcltVO> selectBzeatCntStrgFcltGridList(MdRtlFcltVO mdRtlFcltVO);
	
	/**
	 * 정부지원 - 선별기, 측정장비 설치 개소 수를 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<MdRtlFcltVO> selectBzeatCntFcltMsrmtEqpmntGridList(MdRtlFcltVO mdRtlFcltVO);
	
	/**
	 * 정부지원 - 투자금액: 전체를 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<MdRtlFcltVO> selectBzeatCntInvstAtmAllGridList(MdRtlFcltVO mdRtlFcltVO);
	
	/**
	 * 정부지원 - 투자금액: 자금 유형을 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<MdRtlFcltVO> selectBzeatCntInvstAtmFundTypeGridList(MdRtlFcltVO mdRtlFcltVO);
	
	/**
	 * 정부지원 - 투자금액: 소유자를 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<MdRtlFcltVO> selectBzeatCntInvstAtmOwnrGridList(MdRtlFcltVO mdRtlFcltVO);
	
	/**
	 * 정부지원 - 투자금액: 운영자를 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<MdRtlFcltVO> selectBzeatCntInvstOperPrsnGridList(MdRtlFcltVO mdRtlFcltVO);
	
	/**
	 * 정부지원산지유통시설지역별현황 - 지역별 개소수 : 산지유통조직 유형을 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<MdRtlFcltVO> selectGvrngmtSprtMdRtlOgnzTypeGridList(MdRtlFcltVO mdRtlFcltVO);
	
	/**
	 * 정부지원산지유통시설지역별현황 - 지역별 개소수 : 운영자를 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<MdRtlFcltVO> selectGvrngmtSprtRgnOperPrsnGridList(MdRtlFcltVO mdRtlFcltVO);
	
	/**
	 * 정부지원산지유통시설지역별현황 - 물류·상품화 시설를 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<MdRtlFcltVO> selectGvrngmtSprtLgstcsGdsFcltGridList(MdRtlFcltVO mdRtlFcltVO);
	
	/**
	 * 정부지원산지유통시설지역별현황 - 저온저장고를 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<MdRtlFcltVO> selectGvrngmtSprtLwtpStrgGridList(MdRtlFcltVO mdRtlFcltVO);
	
	/**
	 * 정부지원산지유통시설지역별현황 - 예냉시설을 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<MdRtlFcltVO> selectGvrngmtSprtPrprtnClngFcltGridList(MdRtlFcltVO mdRtlFcltVO);
	
	/**
	 * 정부지원산지유통시설지역별현황 - CA저장시설을 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<MdRtlFcltVO> selectGvrngmtSprtStrgFcltGridList(MdRtlFcltVO mdRtlFcltVO);
	
	/**
	 * 정부지원산지유통시설지역별현황 - 선별기, 특정장비 설치 개소수을 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<MdRtlFcltVO> selectGvrngmtSprtFcltMsrmtEqpmntGridList(MdRtlFcltVO mdRtlFcltVO);
	
	/**
	 * 정부지원산지유통시설지역별현황 - 지역별 투자금액 전체를 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<MdRtlFcltVO> selectGvrngmtSprtRgnInvstAtmAllGridList(MdRtlFcltVO mdRtlFcltVO);
	
	/**
	 * 정부지원산지유통시설지역별현황 - 지역별 투자금액 : 소유자를 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<MdRtlFcltVO> selectMdInvstAtmOwnrGridList(MdRtlFcltVO mdRtlFcltVO);
	
	/**
	 * 정부지원산지유통시설지역별현황 - 지역별 투자금액 : 운영자를 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<MdRtlFcltVO> selectMdInvstAtmOperPrsnGridList(MdRtlFcltVO mdRtlFcltVO);
	
	/**
	 * 산지유통시설운영실적 - 운영조직 취급실적을 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<MdRtlFcltVO> selectOperOgnzTrmtPrfmncGridList(MdRtlFcltVO mdRtlFcltVO);
	
	/**
	 * 산지유통시설운영실적 - 운영조직 처리실적을 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<MdRtlFcltVO> selectOperOgnzPrcsPrfmncGridList(MdRtlFcltVO mdRtlFcltVO);
	
	/**
	 * 산지유통시설운영실적 - 운영조직 평균 취급실적을 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<MdRtlFcltVO> selectOperOgnzAvgTrmtPrfmncGridList(MdRtlFcltVO mdRtlFcltVO);
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
