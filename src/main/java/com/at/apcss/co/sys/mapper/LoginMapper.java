package com.at.apcss.co.sys.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.at.apcss.co.sys.vo.LoginVO;

/**
 * 일반 로그인, 인증서 로그인을 처리하는 DAO 클래스
 * @author 신정철
 * @since 2023.06.12
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일         수정자       수정내용
 *  ----------   --------   ---------------------------
 *  2023.06.12   박지욱       최초 생성
 *  </pre>
 */
@Mapper
public interface LoginMapper {

	public LoginVO selectUser(LoginVO vo) throws Exception;

	public LoginVO actionLogin(LoginVO vo) throws Exception;

	public LoginVO actionCrtfctLogin(LoginVO vo) throws Exception;

	public LoginVO actionSSOLogin(LoginVO vo) throws Exception;

	public LoginVO searchId(LoginVO vo) throws Exception;

	public LoginVO searchPassword(LoginVO vo) throws Exception;
}
