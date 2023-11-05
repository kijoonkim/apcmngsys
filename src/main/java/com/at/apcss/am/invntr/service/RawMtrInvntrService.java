package com.at.apcss.am.invntr.service;

import java.util.HashMap;
import java.util.List;

import com.at.apcss.am.invntr.vo.RawMtrInvntrVO;

/**
 * 원물재고 Service 인터페이스
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
public interface RawMtrInvntrService {

	/**
	 * 원물재고 단건 조회
	 * @param rawMtrInvntrVO
	 * @return
	 * @throws Exception
	 */
	public RawMtrInvntrVO selectRawMtrInvntr(RawMtrInvntrVO rawMtrInvntrVO) throws Exception;

	/**
	 * 원물재고 목록 조회
	 * @param rawMtrInvntrVO
	 * @return
	 * @throws Exception
	 */
	public List<RawMtrInvntrVO> selectRawMtrInvntrList(RawMtrInvntrVO rawMtrInvntrVO) throws Exception;

	/**
	 * 원물일일재고 목록 조회
	 * @param rawMtrInvntrVO
	 * @return
	 * @throws Exception
	 */
	public List<RawMtrInvntrVO> selectDailyRawMtrInvntrList(RawMtrInvntrVO rawMtrInvntrVO) throws Exception;

	/**
	 * 원물재고 등록
	 * @param rawMtrInvntrVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertRawMtrInvntr(RawMtrInvntrVO rawMtrInvntrVO) throws Exception;

	/**
	 * 원물재고 등록
	 * @param rawMtrInvntrVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertRawMtrInvntrList(List<RawMtrInvntrVO> rawMtrInvntrList) throws Exception;


	/**
	 * 원물재고 변경
	 * @param rawMtrInvntrVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> updateRawMtrInvntr(List<RawMtrInvntrVO> rawMtrInvntrList) throws Exception;

	/**
	 * 원물재고내역 변경
	 * @param rawMtrInvntrVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> multiSaveRawMtrInvntrList(List<RawMtrInvntrVO> rawMtrInvntrList) throws Exception;

//	public HashMap<String, Object> updateRawMtrInvntrList(RawMtrInvntrVO rawMtrInvntrVO) throws Exception;

	/**
	 * 원물재고 삭제
	 * @param rawMtrInvntrVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> deleteRawMtrInvntr(RawMtrInvntrVO rawMtrInvntrVO) throws Exception;

	/**
	 * 원물재고 삭제 : update set delYn Y
	 * @param rawMtrInvntrVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> updateRawMtrInvntrForDelY(RawMtrInvntrVO rawMtrInvntrVO) throws Exception;

	/**
	 * 원물재고 선별처리
	 * @param rawMtrInvntrVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> updateInvntrSortPrfmnc(RawMtrInvntrVO rawMtrInvntrVO) throws Exception;

	/**
	 * 원물재고 이송처리
	 * @param rawMtrInvntrVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> updateInvntrTrmsf(RawMtrInvntrVO rawMtrInvntrVO) throws Exception;

	/**
	 * 원물재고 선별취소
	 * @param rawMtrInvntrVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> updateInvntrSortPrfmncCncl(RawMtrInvntrVO rawMtrInvntrVO) throws Exception;

	/**
	 * 원물재고 선별투입
	 * @param rawMtrInvntrVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> updateInvntrSortInpt(RawMtrInvntrVO rawMtrInvntrVO) throws Exception;

	/**
	 * 원물재고 선별투입 취소
	 * @param rawMtrInvntrVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> deleteInvntrSortInpt(RawMtrInvntrVO rawMtrInvntrVO) throws Exception;
	
}
