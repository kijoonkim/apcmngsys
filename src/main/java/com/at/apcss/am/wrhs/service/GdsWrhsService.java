package com.at.apcss.am.wrhs.service;

import java.util.HashMap;
import java.util.List;

import com.at.apcss.am.invntr.vo.GdsInvntrVO;

/**
 * 상품입고 Service 인터페이스
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
public interface GdsWrhsService {
	
	/**
	 * 상품입고등록 목록 조회
	 * @param gdsInvntrVO
	 * @return
	 * @throws Exception
	 */
	public List<GdsInvntrVO> selectGdsWrhsList(GdsInvntrVO gdsInvntrVO) throws Exception;
	
	/**
	 * 상품입고등록 등록
	 * @param gdsInvntrVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertGdsInvntr(GdsInvntrVO gdsInvntrVO) throws Exception;
	
	/**
	 * 상품입고등록 삭제
	 * @param gdsInvntrVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> deleteGdsInvntr(GdsInvntrVO gdsInvntrVO) throws Exception;
	
}
