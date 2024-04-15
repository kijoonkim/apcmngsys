package com.at.apcma.co.test.mapper;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcma.co.test.vo.TestVO;

/**
 * Test Mapper
 * @author 신정철
 * @since 2024.04.15
 * @version 1.0
 * @see
 *
 * <pre>
 * 공통코드
 *
 *  수정일      	수정자      수정내용
 *  ----------  --------  ---------------------------
 *  2024.04.15  신정철      최초 생성
 *
 *  </pre>
 */
@Mapper
public interface TestMapper {
	public TestVO selectTest(TestVO testVO) throws Exception;
}
