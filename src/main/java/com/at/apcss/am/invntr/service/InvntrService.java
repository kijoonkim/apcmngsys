package com.at.apcss.am.invntr.service;

import java.util.HashMap;

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
public interface InvntrService {
	
	/**
	 * 재고 등록
	 * @param invntrVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertInvntr(InvntrVO invntrVO) throws Exception;

	/**
	 * 재고 변경
	 * @param invntrVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> updateInvntr(InvntrVO invntrVO) throws Exception;

	
}
