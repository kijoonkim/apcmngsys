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
	ApcEvrmntStngVO selectApcInfo(ApcEvrmntStngVO ApcEvrmntStngVO) throws Exception;

	/**
	 * APC정보관리 APC내역 조회
	 * @param ApcEvrmntStngVO
	 * @return List<ApcEvrmntStngVO>
	 * @throws Exception
	 */
	List<ApcEvrmntStngVO> selectApcDsctnList(ApcEvrmntStngVO ApcEvrmntStngVO) throws Exception;

	/**
	 * APC정보관리 APC내역 수정
	 * @param ApcEvrmntStngVO
	 * @return
	 * @throws Exception
	 */
	int updateApcDsctn(ApcEvrmntStngVO ApcEvrmntStngVO) throws Exception;

	/**
	 * APC정보관리 APC내역 등록
	 * @param ApcEvrmntStngVO
	 * @return
	 * @throws Exception
	 */
	int insertApcDsctn(ApcEvrmntStngVO ApcEvrmntStngVO) throws Exception;
	
	/**
	 * APC정보관리 APC내역 등록
	 * @param apcDsctnList
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> multiApcDsctnList(List<ApcEvrmntStngVO> apcDsctnList) throws Exception;


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
	


}
