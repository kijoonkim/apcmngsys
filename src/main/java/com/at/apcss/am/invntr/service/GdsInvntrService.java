package com.at.apcss.am.invntr.service;

import java.util.HashMap;
import java.util.List;

import com.at.apcss.am.invntr.vo.GdsInvntrVO;
import com.at.apcss.am.invntr.vo.SortInvntrVO;
import com.at.apcss.am.sort.vo.SortPrfmncVO;
import com.at.apcss.am.spmt.vo.SpmtDsctnTotVO;
import com.at.apcss.am.spmt.vo.SpmtPrfmncVO;

/**
 * 상품재고 Service 인터페이스
 * @author 신정철
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21  신정철        최초 생성
 * </pre>
 */
public interface GdsInvntrService {

	/**
	 * 상품재고 단건 조회
	 * @param gdsInvntrVO
	 * @return
	 * @throws Exception
	 */
	public GdsInvntrVO selectGdsInvntr(GdsInvntrVO gdsInvntrVO) throws Exception;

	/**
	 * 출하상품재고 조회
	 * @param gdsInvntrVO
	 * @return
	 * @throws Exception
	 */
	public GdsInvntrVO selectSpmtGdsInvntr(GdsInvntrVO gdsInvntrVO) throws Exception;

	/**
	 * 출하상품재고 대상 조회
	 * @param gdsInvntrVO
	 * @return
	 * @throws Exception
	 */
	public List<GdsInvntrVO> selectSpmtGdsInvntrList(GdsInvntrVO gdsInvntrVO) throws Exception;
	
	/**
	 * 출하상품재고 대상 조회 (포장번호)
	 * @param gdsInvntrVO
	 * @return
	 * @throws Exception
	 */
	public List<GdsInvntrVO> selectSpmtGdsInvntrListByPckgno(GdsInvntrVO gdsInvntrVO) throws Exception;
	

	/**
	 * 상품재고 목록 조회
	 * @param gdsInvntrVO
	 * @return
	 * @throws Exception
	 */
	public List<GdsInvntrVO> selectGdsInvntrList(GdsInvntrVO gdsInvntrVO) throws Exception;

	/**
	 * 상품재고 목록 집계조회
	 * @param gdsInvntrVO
	 * @return
	 * @throws Exception
	 */
	public List<GdsInvntrVO> selectGdsInvntrTotalList(GdsInvntrVO gdsInvntrVO) throws Exception;

	/**
	 * 상품재고 일일재고 목록 조회
	 * @param gdsInvntrVO
	 * @return
	 * @throws Exception
	 */
	public List<GdsInvntrVO> selectDailyGdsInvntrList(GdsInvntrVO gdsInvntrVO) throws Exception;

	/**
	 * 상품재고 일일재고 목록 조회
	 * @param gdsInvntrVO
	 * @return
	 * @throws Exception
	 */
	public List<GdsInvntrVO> selectDailyGdsInvntrTotalList(GdsInvntrVO gdsInvntrVO) throws Exception;

	/**
	 * 상품재고 목록 조회
	 * @param gdsInvntrVO
	 * @return
	 * @throws Exception
	 */
	public List<GdsInvntrVO> selectUpdateGdsInvntrList(GdsInvntrVO gdsInvntrVO) throws Exception;

	/**
	 * 상품재고 등록
	 * @param gdsInvntrVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertGdsInvntr(GdsInvntrVO gdsInvntrVO) throws Exception;

	/**
	 * 상품재고 목록 등록
	 * @param gdsInvntrList
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertGdsInvntrList(List<GdsInvntrVO> gdsInvntrList) throws Exception;

	/**
	 * 상품재고 엑셀 import 목록 등록
	 * @param gdsInvntrList
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertGdsInvntrListForImport(List<GdsInvntrVO> gdsInvntrList) throws Exception;

	/**
	 * 상품재고 변경
	 * @param gdsInvntrVO
	 * @return
	 * @throws Exception
	 */
	public int updateGdsInvntr(GdsInvntrVO gdsInvntrVO) throws Exception;

	/**
	 * 상품재고 내역 변경
	 * @param gdsInvntrVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> multiSaveGdsInvntrList(List<GdsInvntrVO> gdsInvntrList) throws Exception;

	/**
	 * 상품재고 삭제
	 * @param gdsInvntrVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> deleteGdsInvntr(GdsInvntrVO gdsInvntrVO) throws Exception;

	/**
	 * 상품재고 변경 : 출하처리
	 * @param gdsInvntrVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> updateGdsInvntrSpmtPrfmnc(GdsInvntrVO gdsInvntrVO) throws Exception;

	/**
	 * 상품재고 변경 : 출하취소처리
	 * @param gdsInvntrVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> updateGdsInvntrSpmtPrfmncCncl(GdsInvntrVO gdsInvntrVO) throws Exception;

	/**
	 * 상품재고 변경 : 반품등록
	 * @param gdsInvntrVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> updateGdsInvntrSpmtPrfmncRtn(GdsInvntrVO gdsInvntrVO) throws Exception;

	/**
	 * 상품재고 변경 : 반품등록취소처리
	 * @param gdsInvntrVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> updateGdsInvntrSpmtPrfmncRtnCncl(GdsInvntrVO gdsInvntrVO) throws Exception;
	/**
	 * 상품재고 이송처리
	 * @param gdsInvntrVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> updateInvntrTrnsf(GdsInvntrVO gdsInvntrVO) throws Exception;

	/**
	 * 상품재고 변경이력 등록
	 * @param gdsInvntrVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertGdsInvntrChgHstry(GdsInvntrVO gdsInvntrVO) throws Exception;

	/**
	 * 파프리카 재고 조회(출하실적)
	 * @param SpmtDsctnTotVO
	 * @return List<SpmtDsctnTotVO>
	 * @throws Exception
	 */
	public List<SpmtDsctnTotVO> selectGdsDsctn(SpmtDsctnTotVO spmtDsctnTotVO) throws Exception;
	/**
	 * 출하실적조회 모바일 재고조회
	 * @param gdsInvntrVO
	 * @return List<SpmtDsctnTotVO>
	 * @throws Exception
	 */
    List<GdsInvntrVO> selectSortGdsInvntrList(GdsInvntrVO gdsInvntrVO) throws Exception;
	/**
	 * 상품재고 조회 [선출하 D3]
	 * @param gdsInvntrVO
	 * @return List<gdsInvntrVO>
	 * @throws Exception
	 */
	List<SpmtPrfmncVO> selectBelowZeroGdsInvntrList(GdsInvntrVO gdsInvntrVO) throws Exception;
	/**
	 * 일일대사 선출하실적 선별실적 => 상품재고 조회
	 * @param sortInvntrVO
	 * @return List<gdsInvntrVO>
	 * @throws Exception
	 */
	GdsInvntrVO selectGdsInvntrToSortInvntr(SortInvntrVO sortInvntrVO) throws Exception;
	/**
	 * 일일대사 선출하실적 감가산 적용 UPDATE
	 * @param originGdsInvntrVO
	 * @return int
	 * @throws Exception
	 */
	int updateReconciliation(GdsInvntrVO originGdsInvntrVO) throws Exception;

	/**
	 * 일일대사 선출하실적 마이너스재고 del_yn & 0값 처리
	 * @param originGdsInvntrVO
	 * @return int
	 * @throws Exception
	 */
	int updateGdsInvntrDelQnttWght(GdsInvntrVO originGdsInvntrVO) throws Exception;
	/**
	 * 일일대사 선출하실적 선별실적별 재고정보 포함 SELECT
	 * @param sortPrfmncVO
	 * @return int
	 * @throws Exception
	 */
	List<GdsInvntrVO> selectSortPrfmncToGdsInvntrList(SortPrfmncVO sortPrfmncVO) throws Exception;
	/**
	 * 출하실적 간편등록 (원물,선별 생략)
	 * @param gdsInvntrVO
	 * @return int
	 * @throws Exception
	 */
    int selectSimpGdsInvntr(GdsInvntrVO gdsInvntrVO) throws Exception;
}
