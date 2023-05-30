package com.at.apcss.co.cd.service;

import java.util.ArrayList;

import com.at.apcss.co.cd.vo.ComCdVO;

public interface ComCdService {

	/**
	 * 공통코드 정보 조회
	 * @param comCdVO
	 * @return
	 */
	ArrayList<ComCdVO> selectComCd(ComCdVO comCdVO) throws Exception;


}
