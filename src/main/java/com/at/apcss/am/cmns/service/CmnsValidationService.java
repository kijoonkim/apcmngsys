package com.at.apcss.am.cmns.service;

import com.at.apcss.am.cmns.vo.CmnsValidationVO;

/**
 * 업무 Validation Service 인터페이스
 * @author 신정철
 * @since 2023.07.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.08.21  신정철        최초 생성
 * </pre>
 */
public interface CmnsValidationService {

	/**
	 *
	 * @param apcCd	APC코드
	 * @param stdCd 코드
	 * @return
	 * @throws Exception
	 */
	public String selectChkCdDelible(String apcCd, String cdId, String cdVl) throws Exception;

	public CmnsValidationVO selectChkCdDelible(CmnsValidationVO cmnsValidationVO) throws Exception;
}
