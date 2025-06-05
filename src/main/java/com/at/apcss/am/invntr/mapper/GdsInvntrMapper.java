package com.at.apcss.am.invntr.mapper;

import java.util.List;

import com.at.apcss.am.invntr.vo.SortInvntrVO;
import com.at.apcss.am.sort.vo.SortPrfmncVO;
import com.at.apcss.am.spmt.vo.SpmtPrfmncVO;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.am.invntr.vo.GdsInvntrVO;
import com.at.apcss.am.invntr.vo.GdsStdGrdVO;
import com.at.apcss.am.spmt.vo.SpmtDsctnTotVO;

/**
 * 상품재고관리 Mapper 인터페이스
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
@Mapper
public interface GdsInvntrMapper {

	/**
	 * 상품재고 단건 조회
	 * @param gdsInvntrVO
	 * @return
	 * @throws Exception
	 */
	public GdsInvntrVO selectGdsInvntr(GdsInvntrVO gdsInvntrVO) throws Exception;

	/**
	 * 출하상품재고 단건 조회
	 * @param gdsInvntrVO
	 * @return
	 * @throws Exception
	 */
	public GdsInvntrVO selectSpmtGdsInvntr(GdsInvntrVO gdsInvntrVO) throws Exception;

	/**
	 * 출하상품재고 목록 조회
	 * @param gdsInvntrVO
	 * @return
	 * @throws Exception
	 */
	public List<GdsInvntrVO> selectSpmtGdsInvntrList(GdsInvntrVO gdsInvntrVO) throws Exception;

	/**
	 * 출하상품재고 목록 조회
	 * @param gdsInvntrVO
	 * @return
	 * @throws Exception
	 */
	public List<GdsInvntrVO> selectSpmtGdsInvntrListByPckgno(GdsInvntrVO gdsInvntrVO) throws Exception;

	/**
	 * 출하상품재고 목록 조회 (스펙)
	 * @param gdsInvntrVO
	 * @return
	 * @throws Exception
	 */
	public List<GdsInvntrVO> selectSpmtGdsInvntrListBySpec(GdsInvntrVO gdsInvntrVO) throws Exception;


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
	 * 상품재고 목록 조회
	 * @param gdsInvntrVO
	 * @return
	 * @throws Exception
	 */
	public List<GdsInvntrVO> selectUpdateGdsInvntrList(GdsInvntrVO gdsInvntrVO) throws Exception;

	/**
	 * 상품재고 일일재고 목록 조회
	 * @param gdsInvntrVO
	 * @return
	 * @throws Exception
	 */
	public List<GdsInvntrVO> selectDailyGdsInvntrList(GdsInvntrVO gdsInvntrVO) throws Exception;

	/**
	 * 상품재고 일일재고 목록 집계조회
	 * @param gdsInvntrVO
	 * @return
	 * @throws Exception
	 */
	public List<GdsInvntrVO> selectDailyGdsInvntrTotalList(GdsInvntrVO gdsInvntrVO) throws Exception;

	/**
	 * 파프리카 재고 조회(출하실적)
	 * @param SpmtDsctnTotVO
	 * @return List<SpmtDsctnTotVO>
	 * @throws Exception
	 */
	public SpmtDsctnTotVO selectGdsDsctn(SpmtDsctnTotVO spmtDsctnTotVO) throws Exception;

	/**
	 * 상품재고 등록
	 * @param gdsInvntrVO
	 * @return
	 * @throws Exception
	 */
	public int insertGdsInvntr(GdsInvntrVO gdsInvntrVO) throws Exception;

	/**
	 * 상품재고 변경
	 * @param gdsInvntrVO
	 * @return
	 * @throws Exception
	 */
	public int updateGdsInvntr(GdsInvntrVO gdsInvntrVO) throws Exception;
	/**
	 * 상품재고 변경
	 * @param gdsInvntrVO
	 * @return
	 * @throws Exception
	 */
	public int updateGdsInvntrChg(GdsInvntrVO gdsInvntrVO) throws Exception;

	/**
	 * 상품재고 삭제
	 * @param gdsInvntrVO
	 * @return
	 * @throws Exception
	 */
	public int deleteGdsInvntr(GdsInvntrVO gdsInvntrVO) throws Exception;

	/**
	 * 상품재고 삭제 : set delYn Y
	 * @param gdsInvntrVO
	 * @return
	 * @throws Exception
	 */
	public int updateGdsInvntrForDelY(GdsInvntrVO gdsInvntrVO) throws Exception;

	/**
	 * 상품재고 변경 : 출하실적 처리
	 * @param gdsInvntrVO
	 * @return
	 * @throws Exception
	 */
	public int updateGdsInvntrSpmtPrfmnc(GdsInvntrVO gdsInvntrVO) throws Exception;
	/**
	 * 상품재고 변경 : 출하반품 처리
	 * @param gdsInvntrVO
	 * @return
	 * @throws Exception
	 */
	public int updateGdsInvntrSpmtPrfmncRtn(GdsInvntrVO gdsInvntrVO) throws Exception;

	/**
	 * 상품재고 표준등급 등록
	 * @param gdsInvntrVO
	 * @return
	 * @throws Exception
	 */
	public int insertGdsStdGrd(GdsStdGrdVO gdsStdGrdVO) throws Exception;

	/**
	 * 상품재고 표준등급 삭제 : set delyn Y
	 * @param gdsStdGrdVO
	 * @return
	 * @throws Exception
	 */
	public int updateGdsStdGrdForDelY(GdsStdGrdVO gdsStdGrdVO) throws Exception;

	/**
	 * 상품재고 이송처리
	 * @param gdsInvntrVO
	 * @return
	 * @throws Exception
	 */
	public int updateInvntrTrnsf(GdsInvntrVO gdsInvntrVO) throws Exception;

	/**
	 * 상품재고 변경이력 등록
	 * @param gdsInvntrVO
	 * @return
	 * @throws Exception
	 */
	public int insertGdsInvntrChgHstry(GdsInvntrVO gdsInvntrVO) throws Exception;
	/**
	 * 출하실적조회 모바일 재고조회
	 * @param gdsInvntrVO
	 * @return List<SpmtDsctnTotVO>
	 * @throws Exception
	 */
    public List<GdsInvntrVO> selectSortGdsInvntrList(GdsInvntrVO gdsInvntrVO) throws Exception;
	/**
	 * 상품재고 조회 [선출하 D3]
	 * @param gdsInvntrVO
	 * @return List<gdsInvntrVO>
	 * @throws Exception
	 */
	public List<SpmtPrfmncVO> selectBelowZeroGdsInvntrList(GdsInvntrVO gdsInvntrVO) throws Exception;
	/**
	 * 일일대사 선출하실적 선별실적 => 상품재고 조회
	 * @param sortInvntrVO
	 * @return List<gdsInvntrVO>
	 * @throws Exception
	 */
	public GdsInvntrVO selectGdsInvntrToSortInvntr(SortInvntrVO sortInvntrVO) throws Exception;
	/**
	 * 일일대사 선출하실적 감가산 적용 UPDATE
	 * @param originGdsInvntrVO
	 * @return int
	 * @throws Exception
	 */
	public int updateReconciliation(GdsInvntrVO originGdsInvntrVO) throws Exception;

	/**
	 * 일일대사 선출하실적 마이너스재고 del_yn & 0값 처리
	 * @param originGdsInvntrVO
	 * @return int
	 * @throws Exception
	 */
	public int updateGdsInvntrDelQnttWght(GdsInvntrVO originGdsInvntrVO) throws Exception;
	/**
	 * 일일대사 선출하실적 선별실적별 재고정보 포함 SELECT
	 * @param sortPrfmncVO
	 * @return int
	 * @throws Exception
	 */
	public List<GdsInvntrVO> selectSortPrfmncToGdsInvntrList(SortPrfmncVO sortPrfmncVO) throws Exception;
	/**
	 * 출하실적 간편등록 (원물,선별 생략)
	 * @param gdsInvntrVO
	 * @return int
	 * @throws Exception
	 */
	public int selectSimpGdsInvntr(GdsInvntrVO gdsInvntrVO) throws Exception;
	/**
	 * 출하실적 간편등록 상품재고 조회
	 * @param item
	 * @return List<GdsInvntrVO>
	 * @throws Exception
	 */
	public List<GdsInvntrVO> selectGdsInvntrForSpmt(SpmtPrfmncVO item) throws Exception;

	// 미처리 선출하 실적 조회
	public List<GdsInvntrVO> selectSpmtPrfmncForUnsettled(GdsInvntrVO gdsInvntrVO) throws Exception;

	public List<GdsInvntrVO> selectSpmtGdsInvntrListForCompare(GdsInvntrVO gdsInvntrVO) throws Exception;
}
