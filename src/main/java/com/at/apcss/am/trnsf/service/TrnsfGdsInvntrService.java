package com.at.apcss.am.trnsf.service;

import java.util.HashMap;
import java.util.List;

import com.at.apcss.am.trnsf.vo.TrnsfGdsInvntrVO;

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
public interface TrnsfGdsInvntrService {
	/**
	 * 상품재고 목록 조회
	 * @param gdsInvntrVO
	 * @return
	 * @throws Exception
	 */
	public List<TrnsfGdsInvntrVO> selectUpdateTrnsfGdsInvntrList(TrnsfGdsInvntrVO trnsfGdsInvntrVO) throws Exception;

	/**
	 * 상품재고 이송 등록
	 * @param gdsInvntrVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> inserttrnsfGdsInvntrList(List<TrnsfGdsInvntrVO> trnsfGdsInvntrList) throws Exception;

}
