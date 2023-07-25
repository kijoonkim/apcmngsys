package com.at.apcss.am.apc.service;

import java.util.List;

import com.at.apcss.am.apc.vo.ApcEvrmntStngVO;
import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.co.user.vo.ComUserVO;

public interface ApcEvrmntStngService {

	/**
	 * APC환경설정 APC정보 조회
	 * @param ComUserVO
	 * @return ApcEvrmntStngVO
	 * @throws Exception
	 */
	ApcEvrmntStngVO selectApcInfo(ComUserVO comUserVO) throws Exception;
	
	
	ApcEvrmntStngVO selectUserAprvReg(ComUserVO comUserVO) throws Exception;


	/**
	 * APC 사용자 목록 조회
	 * @param ComUserVO
	 * @return List<ApcEvrmntStngVO>
	 * @throws Exception
	 */
	List<ComUserVO> selectApcUserList(ComUserVO comUserVO) throws Exception;

	/**
	 * APC 실버, 장비 목록 조회
	 * @param ComCdVO
	 * @return List<ComCdVO>
	 * @throws Exception
	 */
	List<ComUserVO> selectRsrcList(ComCdVO comCdVO) throws Exception;


}
