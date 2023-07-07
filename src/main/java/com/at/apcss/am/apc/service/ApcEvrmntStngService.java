package com.at.apcss.am.apc.service;

import java.util.List;

import com.at.apcss.am.apc.vo.ApcEvrmntStngVO;
import com.at.apcss.co.user.vo.ComUserVO;

public interface ApcEvrmntStngService {

	/**
	 * APC환경설정 APC정보 조회
	 * @param ApcEvrmntStngVO
	 * @return ApcEvrmntStngVO
	 * @throws Exception
	 */
	ApcEvrmntStngVO selectApcInfo(ApcEvrmntStngVO apcEvrmntStngVO) throws Exception;



	/**
	 * APC 사용자 목록 조회
	 * @param ApcEvrmntStngVO
	 * @return List<ApcEvrmntStngVO>
	 * @throws Exception
	 */
	List<ComUserVO> selectApcUserList(ApcEvrmntStngVO apcEvrmntStngVO) throws Exception;;

}
