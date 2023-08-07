package com.at.apcss.am.apc.service;

import java.util.List;

import com.at.apcss.am.apc.vo.ApcEvrmntStngVO;
import com.at.apcss.am.apc.vo.ApcInfoVO;
import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.co.user.vo.ComUserVO;

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

}
