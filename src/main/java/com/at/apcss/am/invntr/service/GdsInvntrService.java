package com.at.apcss.am.invntr.service;

import java.util.HashMap;
import java.util.List;

import com.at.apcss.am.invntr.vo.GdsInvntrVO;

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
	 * 상품재고 목록 조회
	 * @param gdsInvntrVO
	 * @return
	 * @throws Exception
	 */
	public List<GdsInvntrVO> selectGdsInvntrList(GdsInvntrVO gdsInvntrVO) throws Exception;

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

}
