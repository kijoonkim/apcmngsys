package com.at.apcss.am.invntr.service;

import java.util.HashMap;
import java.util.List;

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
public interface InvntrAtrbService {

	/**
	 * 원물재고 유형 수정
	 *
	 * @param InvntrMngVO
	 * @return
	 * @throws Exception
	 */
	public int updateRawMtrInvntrType(List<InvntrMngVO> invntrMngVO) throws Exception;

	/**
	 * 선별재고 유형 수정
	 *
	 * @param InvntrMngVO
	 * @return
	 * @throws Exception
	 */
	public int updateSortInvntrType(List<InvntrMngVO> invntrMngVO) throws Exception;

	/**
	 * 상품재고 유형 수정
	 *
	 * @param InvntrMngVO
	 * @return
	 * @throws Exception
	 */
	public int updateGdsInvntrType(List<InvntrMngVO> invntrMngVO) throws Exception;


}
