package com.at.apcss.mobile.mapper;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;
import org.springframework.dao.DataAccessException;

import java.util.List;
import java.util.Map;

/**
 * 모바일 입고 관리 Mapper
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
@Mapper
public interface MobileApiMapper {
	
	/**
	 * Refresh Token을 등록한다.
	 * @param Map
	 * @return 결과값(0또는 1)
	 * @throws DataAccessException
	 */
	public int addRefreshToken(Map<String, Object> map) throws DataAccessException;
	
	/**
	 * Refresh Token을 삭제한다.
	 * @param userId:String
	 * @return 결과값(0또는 1)
	 * @throws DataAccessException
	 */
	public int delRefreshToken(String userId) throws DataAccessException;
	
	/**
	 * Refresh Token 조회
	 * @return Map
	 * @throws Exception
	 */
	public Map<String, Object> findRefreshToken(String userId) throws Exception;

	/**
	 * 1년 동안 APC 월단위 입고,선별,출고량
	 * @param map:Map<String, Object> map
	 * @return List<Map<String, Object>>
	 * @throws Exception
	 */
	public List<Map<String, Object>> getStatsForOneYearBySearchYmd(Map<String, Object> map) throws Exception;

    /**
     * APC 에이전트 통계 데이터
     * @param map:Map<String, Object> map
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> getApcAgtStats(Map<String, Object> map) throws Exception;

	/**
	 * 생산자 수량
	 * @return int
	 * @throws Exception
	 */
	public int getCountAllPrdcr() throws Exception;
}
