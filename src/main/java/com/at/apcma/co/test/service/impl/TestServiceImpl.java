package com.at.apcma.co.test.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcma.co.test.mapper.TestMapper;
import com.at.apcma.co.test.service.TestService;
import com.at.apcma.co.test.vo.TestVO;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;

/**
 * @Class Name : TestServiceImpl.java
 * @Description : 테스트 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("testService")
public class TestServiceImpl extends BaseServiceImpl implements TestService{

	@Autowired
	private TestMapper testMapper;
	
	@Override
	public TestVO selectTest(TestVO testVO) throws Exception {
		return testMapper.selectTest(testVO);
	}

}
