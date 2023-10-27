package com.at.apcss.am.pckg.service;

import java.util.List;

import com.at.apcss.am.pckg.vo.GdsCdVO;


/**
 * 상품코드 Service 인터페이스
 * @author 김현호
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21  김현호        최초 생성
 * </pre>
 */
public interface GdsCdService {
	/**
	 * 상품코드 목록 조회
	 * @param GdsCdVO
	 * @return
	 * @throws Exception
	 */
	public List<GdsCdVO> selectGdsCdList(GdsCdVO gdsCdVO) throws Exception;
}
