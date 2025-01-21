package com.at.apcss.am.invntr.service;

import java.util.HashMap;

import com.at.apcss.am.invntr.vo.InvntrMngVO;
import com.at.apcss.am.invntr.vo.InvntrVO;

/**
 * 재고관리 Service 인터페이스
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
public interface InvntrGrdService {

	/**
	 * 원물재고 등급 수정
	 *
	 * @param InvntrMngVO
	 * @return
	 * @throws Exception
	 */
	public int updateRawMtrInvntrGrd(InvntrMngVO invntrMngVO) throws Exception;

	/**
	 * 선별재고 등급 수정
	 *
	 * @param InvntrMngVO
	 * @return
	 * @throws Exception
	 */
	public int updateSortInvntrGrd(InvntrMngVO invntrMngVO) throws Exception;

	/**
	 * 상품재고 등급 수정
	 *
	 * @param InvntrMngVO
	 * @return
	 * @throws Exception
	 */
	public int updateGdsInvntrGrd(InvntrMngVO invntrMngVO) throws Exception;


}
