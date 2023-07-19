package com.at.apcss.co.sys.service.impl;

import java.io.IOException;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.springframework.stereotype.Service;

import com.at.apcss.co.sys.service.ApcSSOService;
import com.at.apcss.co.sys.vo.LoginVO;

/**
 * @Class Name : ApcSSOServiceImpl.java
 * @Description : APC SSO 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("apcSSOService")
public class ApcSSOServiceImpl implements ApcSSOService {

	@Override
	public boolean hasTokenInSSOServer(ServletRequest request, ServletResponse response) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void requestIssueToken(ServletRequest request, ServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void ssoLoginByServer(ServletRequest request, ServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public LoginVO getLoginVO(ServletRequest request, ServletResponse response) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void ssoLogout(ServletRequest request, ServletResponse response, String returnURL) throws IOException {
		// TODO Auto-generated method stub
		
	}

}
