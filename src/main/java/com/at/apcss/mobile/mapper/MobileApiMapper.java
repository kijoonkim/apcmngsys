package com.at.apcss.mobile.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.springframework.dao.DataAccessException;

import com.at.apcss.mobile.vo.FacilityMngVO;
import com.at.apcss.mobile.vo.WarehouseInfoVO;

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
	
}
