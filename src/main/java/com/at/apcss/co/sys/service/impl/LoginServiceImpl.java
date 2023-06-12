package com.at.apcss.co.sys.service.impl;

import java.util.Map;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.at.apcss.co.sys.mapper.LoginDAO;
import com.at.apcss.co.sys.service.LoginService;
import com.at.apcss.co.sys.vo.LoginVO;

import egovframework.let.utl.fcc.service.EgovNumberUtil;
import egovframework.let.utl.fcc.service.EgovStringUtil;
import egovframework.let.utl.sim.service.EgovFileScrty;

@Service("loginService")
public class LoginServiceImpl extends EgovAbstractServiceImpl implements LoginService {

	
	@Autowired
    private LoginDAO loginDAO;
    

	@Override
	public LoginVO actionLogin(LoginVO vo) throws Exception {
		
		// 1. 입력한 비밀번호를 암호화한다.
		String enpassword = EgovFileScrty.encryptPassword(vo.getPassword(), vo.getId());
		vo.setPassword(enpassword);
		
		// 2. 아이디와 암호화된 비밀번호가 DB와 일치하는지 확인한다.
    	LoginVO loginVO = loginDAO.actionLogin(vo);
    	
    	// 3. 결과를 리턴한다.
    	if (loginVO != null 
    			&& !StringUtils.hasText(loginVO.getId()) 
    			&& !StringUtils.hasText(loginVO.getPassword())) {
    		return loginVO;
    	} else {
    		loginVO = new LoginVO();
    	}
    	
		return loginVO;
	}

	@Override
	public LoginVO actionCrtfctLogin(LoginVO vo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public LoginVO searchId(LoginVO vo) throws Exception {
		// 1. 이름, 이메일주소가 DB와 일치하는 사용자 ID를 조회한다.
    	LoginVO loginVO = loginDAO.actionLogin(vo);
    	
    	// 2. 결과를 리턴한다.
    	if (loginVO != null && !StringUtils.hasText(loginVO.getId())) {
    		return loginVO;
    	} else {
    		loginVO = new LoginVO();
    	}
    	
		return loginVO;
	}

	@Override
	public boolean searchPassword(LoginVO vo) throws Exception {
		
		boolean result = true;
		
		// 1. 아이디, 이름, 이메일주소, 비밀번호 힌트, 비밀번호 정답이 DB와 일치하는 사용자 Password를 조회한다.
    	LoginVO loginVO = loginDAO.selectPassword(vo);
    	if (loginVO == null || StringUtils.hasText(loginVO.getPassword())) {
    		return false;
    	}
		
    	// 2. 임시 비밀번호를 생성한다.(영+영+숫+영+영+숫+영+영=8자리)
    	String newPassword = "";
    	for (int i = 1; i <= 8; i++) {
    		// 영자
    		if (i % 3 != 0) {
    			newPassword += EgovStringUtil.getRandomStr('a', 'z');
    		// 숫자
    		} else {
    			newPassword += EgovNumberUtil.getRandomNum(0, 9);
    		}
    	}
		
    	// 3. 임시 비밀번호를 암호화하여 DB에 저장한다.
    	LoginVO pwVO = new LoginVO();
		String encryptPassword = EgovFileScrty.encryptPassword(newPassword, vo.getId());
    	pwVO.setId(vo.getId());
    	pwVO.setPassword(encryptPassword);
    	//pwVO.setUserSe(vo.getUserSe());
    	//loginDAO.updatePassword(pwVO);

    	// 4. 임시 비밀번호를 이메일 발송한다.(메일연동솔루션 활용)
    	/*
    	SndngMailVO sndngMailVO = new SndngMailVO();
    	sndngMailVO.setDsptchPerson("webmaster");
    	sndngMailVO.setRecptnPerson(vo.getEmail());
    	sndngMailVO.setSj("[MOIS] 임시 비밀번호를 발송했습니다.");
    	sndngMailVO.setEmailCn("고객님의 임시 비밀번호는 " + newPassword + " 입니다.");
    	sndngMailVO.setAtchFileId("");

    	result = sndngMailRegistService.insertSndngMail(sndngMailVO);
    	 */
    	return result;
	}

	@Override
	public String processLoginIncorrect(LoginVO vo, Map<?, ?> mapLockUserInfo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<?, ?> selectLoginIncorrect(LoginVO vo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectPassedDayChangePWD(LoginVO vo) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public LoginVO onepassLogin(String id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
