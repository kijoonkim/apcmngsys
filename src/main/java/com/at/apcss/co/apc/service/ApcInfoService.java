package com.at.apcss.co.apc.service;

import java.util.HashMap;
import java.util.List;

import com.at.apcss.co.apc.vo.ApcInfoVO;

public interface ApcInfoService {

	/**
	 * APC정보 조회
	 * @param apcInfoVO
	 * @return ApcInfoVO
	 * @throws Exception
	 */
	ApcInfoVO selectApcInfo(ApcInfoVO apcInfoVO) throws Exception;

	/**
	 * APC내역 조회
	 * @param apcInfoVO
	 * @return List<ApcInfoVO>
	 * @throws Exception
	 */
	List<ApcInfoVO> selectApcInfoList(ApcInfoVO apcInfoVO) throws Exception;

	/**
	 *
	 * @param apcInfoVO
	 * @return
	 * @throws Exception
	 */
	List<ApcInfoVO> selectApcMngList(ApcInfoVO apcInfoVO) throws Exception;

	/**
	 * APC정보관리 APC내역 조회
	 * @param apcInfoVO
	 * @return List<ApcInfoVO>
	 * @throws Exception
	 */
	List<ApcInfoVO> selectApcDsctnList(ApcInfoVO apcInfoVO) throws Exception;

	/**
	 * APC정보관리 APC내역 수정
	 * @param apcInfoVO
	 * @return
	 * @throws Exception
	 */
	int updateApcDsctn(ApcInfoVO apcInfoVO) throws Exception;

	/**
	 * APC정보관리 APC내역 등록
	 * @param apcInfoVO
	 * @return
	 * @throws Exception
	 */
	int insertApcDsctn(ApcInfoVO apcInfoVO) throws Exception;

	/**
	 * APC정보관리 APC내역 등록
	 * @param apcDsctnList
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> multiApcDsctnList(List<ApcInfoVO> apcDsctnList) throws Exception;
}
