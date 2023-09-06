package com.at.apcss.am.apc.service;

import java.util.HashMap;
import java.util.List;

import com.at.apcss.am.apc.vo.ApcEvrmntStngVO;
import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.co.user.vo.ComUserVO;

public interface ApcEvrmntStngService {

	/**
	 * APC환경설정 APC정보 조회
	 * @param ApcEvrmntStngVO
	 * @return ApcEvrmntStngVO
	 * @throws Exception
	 */
	ApcEvrmntStngVO selectApcInfo(ApcEvrmntStngVO apcEvrmntStngVO) throws Exception;

	
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

	/**
	 * 품종 팝업에서 조회
	 * @param ComCdVO
	 * @return
	 * @throws Exception
	 */

	List<ComCdVO> selectVrtyList(ComCdVO comCdVO) throws Exception;


	/**
	 * APC환경설정 정보 조회
	 * @param ApcEvrmntStngVO
	 * @return ApcEvrmntStngVO
	 * @throws Exception
	 */
	ApcEvrmntStngVO selectApcEvrmntStng(ApcEvrmntStngVO apcEvrmntStngVO) throws Exception;

	/**
	 * APC 초기정보 설정
	 * @param ApcEvrmntStngVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertApcInitInfo(ApcEvrmntStngVO apcEvrmntStngVO) throws Exception;

	/**
	 * APC 환경설정 메뉴사용여부 변경
	 * @param apcEvrmntStngVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> updateApcEvrmntStngAuthrt(ApcEvrmntStngVO apcEvrmntStngVO) throws Exception;

	/**
	 * APC 권한 간편설정
	 * @param apcEvrmntStngVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertApcSimpleAuthrt(ApcEvrmntStngVO apcEvrmntStngVO) throws Exception;

	/**
	 * APC 권한 일반설정
	 * @param apcEvrmntStngVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertApcNormalAuthrt(ApcEvrmntStngVO apcEvrmntStngVO) throws Exception;

	/**
	 * APC환경설정 APC 정보 변경
	 * @param ApcEvrmntStngVO
	 * @return
	 * @throws Exception
	 */
	int updateApcEvrmntStng(ApcEvrmntStngVO apcEvrmntStngVO) throws Exception;



}
