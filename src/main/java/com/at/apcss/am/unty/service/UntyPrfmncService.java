package com.at.apcss.am.unty.service;

import com.at.apcss.am.pckg.vo.PckgInptVO;
import com.at.apcss.am.sort.vo.SortInptPrfmncVO;
import com.at.apcss.am.unty.vo.UntyPrfmncVO;
import com.at.apcss.am.sort.vo.SortPrfmncVO;
import com.at.apcss.am.pckg.vo.PckgPrfmncVO;
import com.at.apcss.am.spmt.vo.SpmtPrfmncVO;
import com.at.apcss.am.wrhs.vo.RawMtrWrhsVO;

import java.util.HashMap;
import java.util.List;

/**
 * 통합실적 Service 인터페이스
 * @author 김 호
 * @since 2025.08.18
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2025.08.18  김 호        최초 생성
 * </pre>
 */
public interface UntyPrfmncService {

	/**
	 * 통합실적 목록 조회(논산배수출영농조합)
	 * @param untyPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public List<UntyPrfmncVO> selectRawDlngPrfmncList(UntyPrfmncVO untyPrfmncVO) throws Exception;
	/**
	 * 통합실적 등록
	 * @param untyPrfmncList
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> multiUntyPrfmnc(List<UntyPrfmncVO> untyPrfmncList) throws Exception;

	/**
	 * 통합실적 등록
	 * @param untyPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> multiUntyPrfmnc(UntyPrfmncVO untyPrfmncVO) throws Exception;

	/**
	 * 통합실적 선별등록
	 * @param sortPrfmncList
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> multiUntySortPrfmncList(List<SortPrfmncVO> sortPrfmncList) throws Exception;

	/**
	 * 통합실적 포장등록
	 * @param pckgPrfmncList
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> multiUntyPckgPrfmncList(List<PckgPrfmncVO> pckgPrfmncList) throws Exception;

	/**
	 * 통합실적 출하등록
	 * @param spmtPrfmncList
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> multyUntySpmtPrfmncList(List<SpmtPrfmncVO> spmtPrfmncList) throws Exception;

	/**
	 * 통합실적 목록 삭제
	 * @param untyPrfmncList
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> deleteUntyPrfmncList(List<UntyPrfmncVO> untyPrfmncList) throws Exception;

	/**
	 * 통합실적 포장투입실적 등록
	 * @param pckgInptVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertUntyPckgInptPrfmnc(PckgInptVO pckgInptVO) throws Exception;

	/**
	 * 통합실적 포장투입실적 목록 등록
	 * @param pckgInptList
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertUntyPckgInptPrfmncList(List<PckgInptVO> pckgInptList) throws Exception;

	/**
	 * 통합실적 선별실적 목록 저장
	 * @param sortInptPrfmnc
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> multiUntySortInptPrfmnc(SortInptPrfmncVO sortInptPrfmnc) throws Exception;

	/**
	 * 통합실적 선별투입실적 목록 저장
	 * @param sortInptPrfmncList
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> multiUntySortInptPrfmncList(List<SortInptPrfmncVO> sortInptPrfmncList) throws Exception;

	/**
	 * 통합실적 원물입고실적 변경
	 * @param rawMtrWrhsVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> updateRawMtrWrhsPrfmnc(RawMtrWrhsVO rawMtrWrhsVO) throws Exception;

	/**
	 * 통합실적 원물입고실적 등록
	 * @param rawMtrWrhsVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertRawMtrWrhsPrfmnc(RawMtrWrhsVO rawMtrWrhsVO) throws Exception;

	/**
	 * 통합실적 포장투입실적 데이터 확인 및 기본값 셋팅
	 * @param pckgInptVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> pckgInptSet (PckgInptVO pckgInptVO) throws Exception;

	/**
	 * 통합실적 포장실적 데이터 확인 및 기본값 셋팅
	 * @param pckgPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> pckgPrfmncSet (PckgPrfmncVO pckgPrfmncVO) throws Exception;

	/**
	 * 통합실적 원물입고실적 데이터 확인 및 기본값 셋팅
	 * @param rawMtrWrhsVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> rawMtrWrhsSet (RawMtrWrhsVO rawMtrWrhsVO) throws Exception;

	/**
	 * 통합실적 선별실적 데이터 확인 및 기본값 셋팅
	 * @param sortPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> sortPrfmncSet (SortPrfmncVO sortPrfmncVO) throws Exception;
	/**
	 * 통합실적 선별투입실적 데이터 확인 및 기본값 셋팅
	 * @param sortInptPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> sortInptSet (SortInptPrfmncVO sortInptPrfmncVO) throws Exception;
}
