package com.at.apcss.am.apc.service;

import java.util.HashMap;
import java.util.List;

import com.at.apcss.am.apc.vo.ApcLinkVO;

public interface ApcLinkService {

	/**
	 * APC 연계정보 조회
	 * @param apcLinkVO
	 * @return
	 * @throws Exception
	 */
	ApcLinkVO selectApcLink(ApcLinkVO apcLinkVO) throws Exception;

	/**
	 * APC 연계기기 정보조회
	 * @param apcLinkVO
	 * @return
	 * @throws Exception
	 */
	ApcLinkVO selectApcLinkTrsmMat(ApcLinkVO apcLinkVO) throws Exception;

	/**
	 * APC 연계기기 목록 조회
	 * @param apcLinkVO
	 * @return
	 * @throws Exception
	 */
	List<ApcLinkVO> selectApcLinkTrsmMatSttsList(ApcLinkVO apcLinkVO) throws Exception;
	
	/**
	 * APC 연계정보 확인
	 * @param apcLinkVO
	 * @return
	 * @throws Exception
	 */
	HashMap<String, Object> updateApcLinkIdnty(ApcLinkVO apcLinkVO) throws Exception;
	
	/**
	 * APC 연계기기 정보 확인
	 * @param apcLinkVO
	 * @return
	 * @throws Exception
	 */
	HashMap<String, Object> updateApcLinkTrsmMatIdnty(ApcLinkVO apcLinkVO) throws Exception;
	
	
	/**
	 * APC 연계정보 상태 변경
	 * @param apcLinkVO
	 * @return
	 * @throws Exception
	 */
	HashMap<String, Object> updateLinkStts(ApcLinkVO apcLinkVO) throws Exception;
	
	HashMap<String, Object> updateWghLinkStts(ApcLinkVO apcLinkVO) throws Exception;
	HashMap<String, Object> updateWrhsLinkStts(ApcLinkVO apcLinkVO) throws Exception;
	HashMap<String, Object> updateSortLinkStts(ApcLinkVO apcLinkVO) throws Exception;
	HashMap<String, Object> updatePckgLinkStts(ApcLinkVO apcLinkVO) throws Exception;
	HashMap<String, Object> updateSpmtLinkStts(ApcLinkVO apcLinkVO) throws Exception;
	
	/**
	 * APC 연계기기 상태 변경
	 * @param apcLinkVO
	 * @return
	 * @throws Exception
	 */
	HashMap<String, Object> updateLinkTrsmMatStts(ApcLinkVO apcLinkVO) throws Exception;
	
}
