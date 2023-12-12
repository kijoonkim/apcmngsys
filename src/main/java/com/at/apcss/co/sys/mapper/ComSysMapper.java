package com.at.apcss.co.sys.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.co.sys.vo.ComLgnPlcyVO;
import com.at.apcss.co.sys.vo.ComSessionVO;

/**
 * 시스템 공통 정보 처리하는 DAO 클래스
 * @author 신정철
 * @since 2023.09.12
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일         수정자       수정내용
 *  ----------   --------   ---------------------------
 *  2023.09.12   박지욱       최초 생성
 *  </pre>
 */
@Mapper
public interface ComSysMapper {

	
	/**
	 * 
	 * @param comLgnPlcyVO
	 * @return
	 * @throws Exception
	 */
	public ComLgnPlcyVO selectComLgnPlcy(ComLgnPlcyVO comLgnPlcyVO) throws Exception;
	
	/**
	 * 세션정보 조회
	 * @param comSessionVO
	 * @return
	 * @throws Exception
	 */
	public ComSessionVO selectComSession(ComSessionVO comSessionVO) throws Exception;
	
	/**
	 * 세션정보 목록 조회
	 * @param comSessionVO
	 * @return
	 * @throws Exception
	 */
	public List<ComSessionVO> selectComSessionList(ComSessionVO comSessionVO) throws Exception;
	
	
	/**
	 * 세션정보 목록 조회 : alive session by user ID
	 * @param comSessionVO
	 * @return
	 * @throws Exception
	 */
	public List<ComSessionVO> selectAliveSessionListByUserId(ComSessionVO comSessionVO) throws Exception;
	
	/**
	 * 세션정보 조회 alive session count
	 * @param comSessionVO
	 * @return
	 * @throws Exception
	 */
	public ComSessionVO selectAliveSessionCountByUserId(ComSessionVO comSessionVO) throws Exception;
	
	
	
	
	/**
	 * 세션 정보 등록
	 * @param comSessionVO
	 * @return
	 * @throws Exception
	 */
	public int insertComSession(ComSessionVO comSessionVO) throws Exception;
	
	/**
	 * 세션 정보 삭제
	 * @param comSessionVO
	 * @return
	 * @throws Exception
	 */
	public int deleteComSession(ComSessionVO comSessionVO) throws Exception;
	
	
	/**
	 * 세션 정보 만료 처리
	 * @param comSessionVO
	 * @return
	 * @throws Exception
	 */
	public int updateComSessionExpiry(ComSessionVO comSessionVO) throws Exception;
	
	/**
	 * 세션 정보 만료 처리 with userId
	 * @param comSessionVO
	 * @return
	 * @throws Exception
	 */
	public int updateComSessionExpiryWithUserId(ComSessionVO comSessionVO) throws Exception;
}
