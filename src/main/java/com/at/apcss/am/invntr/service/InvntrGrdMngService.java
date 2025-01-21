package com.at.apcss.am.invntr.service;

import java.util.List;

import com.at.apcss.am.invntr.vo.InvntrMngVO;

/**
 * 재고관리 Service 인터페이스
 * @author 박승진
 * @since 2025.01.13
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2025.01.13  박승진        최초 생성
 * </pre>
 */
public interface InvntrGrdMngService {

	/**
	 * 재고 등급 조회
	 * @param invntrVO
	 * @return
	 * @throws Exception
	 */
	public List<InvntrMngVO> selectInvntrGrdMng(InvntrMngVO invntrMngVO) throws Exception;




}
