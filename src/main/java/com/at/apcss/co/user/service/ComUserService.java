package com.at.apcss.co.user.service;

import com.at.apcss.co.user.vo.ComUserVO;

public interface ComUserService {

	/**
	 * 사용자 정보 조회
	 * @param comUserVO
	 * @return
	 */
	ComUserVO selectComUser(ComUserVO comUserVO);
	
	ComUserVO selectComUser(String userId);
}
