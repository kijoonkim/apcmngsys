package com.at.apcss.co.sys.service;

import java.util.Map;

import com.at.apcss.co.sys.vo.LoginVO;

/**
 * 로그인 Service 인터페이스
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
public interface LoginService {
	
	/**
	 * 일반 로그인을 처리한다
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
	public LoginVO actionLogin(LoginVO vo) throws Exception;
	
    /**
	 * 인증서 로그인을 처리한다
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
	public LoginVO actionCrtfctLogin(LoginVO vo) throws Exception;
    
	/**
	 * SSO 로그인을 처리한다
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public LoginVO actionSSOLogin(LoginVO vo) throws Exception;
	
    /**
	 * 아이디를 찾는다.
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
    LoginVO searchId(LoginVO vo) throws Exception;
    
    /**
	 * 비밀번호를 찾는다.
	 * @param vo LoginVO
	 * @return boolean
	 * @exception Exception
	 */
    boolean searchPassword(LoginVO vo) throws Exception;
    
    /**
	 * 로그인인증제한을 처리한다.
	 * @param vo LoginVO
	 * @param Map mapLockUserInfo
	 * @return String
	 * @exception Exception
	 */
    String processLoginIncorrect(LoginVO vo, Map<?,?> mapLockUserInfo) throws Exception;
    
    /**
	 * 로그인인증제한을 조회한다.
	 * @param vo LoginVO
	 * @return Map
	 * @exception Exception
	 */
    Map<?,?> selectLoginIncorrect(LoginVO vo) throws Exception;

    /**
	 * 비밀번호를 수정한후 경과한 날짜를 조회한다.
	 * @param vo LoginVO
	 * @return int
	 * @exception Exception
	 */    
    int selectPassedDayChangePWD(LoginVO vo) throws Exception;

	/**
	 * 디지털원패스 인증 회원 조회한다.
	 * @param id
	 * @return LoginVO
	 * @exception Exception
	 */
    LoginVO onepassLogin(String id) throws Exception;
	
}
