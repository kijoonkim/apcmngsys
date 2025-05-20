package com.at.apcss.mobile.service;

import org.springframework.dao.DataAccessException;

import java.util.Map;

/**
 * 모바일 입고 관리 Service
 * @author joon
 * @since 2023.11.22
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.11.22  joon       최초 생성
 * </pre>
 */

public interface MobileApiService {
	/**
	 * Refresh Token을 등록한다.
	 * @param refreshTokenDTO
	 * @return 결과값(0또는 1)
	 * @throws DataAccessException
	 */
	public int addRefreshToken(Map<String, Object> map) throws Exception;
	
	/**
	 * Refresh Token을 삭제한다.
	 * @param memberId:String
	 * @return 결과값(0또는 1)
	 * @throws DataAccessException
	 */
	public int delRefreshToken(String userId) throws Exception;
	
	/**
	 * Refresh Token 조회
	 * @return RefreshTokenDTO
	 * @throws Exception
	 */
	public Map<String, Object> findRefreshToken(String userId) throws Exception;

	/**
	 * 1년 동안 APC 월단위 입고,선별,출고량
	 * @return Map<String, Object>
	 * @throws Exception
	 */
	public Map<String, Object> getStatsForOneYearBySearchYmd() throws Exception;

    /**
     * APC 에이전트 통계 데이터
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> getApcAgtStats() throws Exception;
}
