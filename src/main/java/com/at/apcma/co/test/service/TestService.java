package com.at.apcma.co.test.service;

import com.at.apcma.co.test.vo.TestVO;

/**
 * Test Service 인터페이스
 * @author 신정철
 * @since 2024.04.15
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.04.15  신정철        최초 생성
 * </pre>
 */
public interface TestService {
	public TestVO selectTest(TestVO testVO) throws Exception;
}
