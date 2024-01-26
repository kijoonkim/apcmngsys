package com.at.apcss.am.cmns.service;

import java.util.HashMap;
import java.util.List;

import com.at.apcss.am.cmns.vo.StdGrdDtlVO;
import com.at.apcss.am.cmns.vo.StdGrdJgmtVO;
import com.at.apcss.am.cmns.vo.StdGrdListVO;
import com.at.apcss.am.cmns.vo.StdGrdVO;

/**
 * 등급 정보 Service 인터페이스
 * @author 신정철
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21  신정철        최초 생성
 * </pre>
 */
public interface StdGrdService {

	/**
	 * APC 등급 정보 단건 조회
	 * @param StdGrdVO
	 * @return StdGrdVO
	 * @throws Exception
	 */
	public StdGrdVO selectStdGrd(StdGrdVO stdGrdVO) throws Exception;

	/**
	 * APC 등급 정보 목록 조회
	 * @param StdGrdVO
	 * @return List<StdGrdVO>
	 * @throws Exception
	 */
	public List<StdGrdVO> selectStdGrdList(StdGrdVO stdGrdVO) throws Exception;

	/**
	 * APC 등급 정보 등록
	 * @param StdGrdVO
	 * @return Integer
	 * @throws Exception
	 */
	public int insertStdGrd(StdGrdVO stdGrdVO) throws Exception;

	/**
	 * APC 등급 자동 등록 : 입고, 상품 (품목등록 시)
	 * @param StdGrdVO
	 * @return HashMap<String, Object>
	 * @throws Exception
	 */
	public HashMap<String, Object> insertStdGrdAuto(StdGrdVO stdGrdVO) throws Exception;

	/**
	 * APC 등급 정보 변경
	 * @param StdGrdVO
	 * @return Integer
	 * @throws Exception
	 */
	public int updateStdGrd(StdGrdVO stdGrdVO) throws Exception;

	/**
	 * APC 등급 정보 저장
	 * @param List<StdGrdListVO>
	 * @return HashMap<String, Object>
	 * @throws Exception
	 */
	public HashMap<String, Object> multiStdGrdList(List<StdGrdListVO> stdGrdLists) throws Exception;

	/**
	 * APC 등급 정보 삭제
	 * @param StdGrdVO
	 * @return HashMap<String, Object>
	 * @throws Exception
	 */
	public HashMap<String, Object> deleteStdGrd(StdGrdVO stdGrdVO) throws Exception;

	/**
	 * APC 등급 정보 전체 삭제
	 * @param StdGrdVO
	 * @return Integer
	 * @throws Exception
	 */
	public int deleteStdGrdAll(StdGrdVO stdGrdVO) throws Exception;

	/**
	 * APC 등급 정보 상세 단건 조회
	 * @param StdGrdDtlVO
	 * @return StdGrdDtlVO
	 * @throws Exception
	 */
	public StdGrdDtlVO selectStdGrdDtl(StdGrdDtlVO stdGrdDtlVO) throws Exception;

	/**
	 * APC 등급 정보 상세 목록 조회
	 * @param StdGrdDtlVO
	 * @return List<StdGrdDtlVO>
	 * @throws Exception
	 */
	public List<StdGrdDtlVO> selectStdGrdDtlList(StdGrdDtlVO stdGrdDtlVO) throws Exception;

	/**
	 * APC 등급 정보 상세 등록
	 * @param StdGrdDtlVO
	 * @return Integer
	 * @throws Exception
	 */
	public int insertStdGrdDtl(StdGrdDtlVO stdGrdDtlVO) throws Exception;

	/**
	 * APC 등급 정보 상세 변경
	 * @param StdGrdDtlVO
	 * @return Integer
	 * @throws Exception
	 */
	public int updateStdGrdDtl(StdGrdDtlVO stdGrdDtlVO) throws Exception;

	/**
	 * APC 등급 정보 상세 삭제
	 * @param StdGrdDtlVO
	 * @return HashMap<String, Object>
	 * @throws Exception
	 */
	public HashMap<String, Object> deleteStdGrdDtl(StdGrdDtlVO stdGrdDtlVO) throws Exception;

	/**
	 * APC 등급 정보 상세 전체 삭제
	 * @param StdGrdDtlVO
	 * @return Integer
	 * @throws Exception
	 */
	public int deleteStdGrdDtlAll(StdGrdDtlVO stdGrdDtlVO) throws Exception;

	/**
	 * APC 등급 세부 정보 단건 조회
	 * @param StdGrdJgmtVO
	 * @return StdGrdJgmtVO
	 * @throws Exception
	 */
	public StdGrdJgmtVO selectStdGrdJgmt(StdGrdJgmtVO stdGrdJgmtVO) throws Exception;

	/**
	 * APC 등급 세부 정보 목록 조회
	 * @param StdGrdJgmtVO
	 * @return List<StdGrdJgmtVO>
	 * @throws Exception
	 */
	public List<StdGrdJgmtVO> selectStdGrdJgmtList(StdGrdJgmtVO stdGrdJgmtVO) throws Exception;

	/**
	 * APC 등급 세부 정보 등록
	 * @param StdGrdJgmtVO
	 * @return Integer
	 * @throws Exception
	 */
	public int insertStdGrdJgmt(StdGrdJgmtVO stdGrdJgmtVO) throws Exception;

	/**
	 * APC 등급 세부 정보 변경
	 * @param StdGrdJgmtVO
	 * @return Integer
	 * @throws Exception
	 */
	public int updateStdGrdJgmt(StdGrdJgmtVO stdGrdJgmtVO) throws Exception;

	/**
	 * APC 등급 세부 정보  삭제
	 * @param StdGrdJgmtVO
	 * @return HashMap<String, Object>
	 * @throws Exception
	 */
	public HashMap<String, Object> deleteStdGrdJgmt(StdGrdJgmtVO stdGrdJgmtVO) throws Exception;

	/**
	 * APC 등급 세부 정보 전체 삭제
	 * @param StdGrdJgmtVO
	 * @return Integer
	 * @throws Exception
	 */
	public int deleteStdGrdJgmtAll(StdGrdJgmtVO stdGrdJgmtVO) throws Exception;

	/**
	 * APC 등급 삭제 가능 여부
	 * @param StdGrdVO
	 * @return
	 * @throws Exception
	 */
	public String grdDtlInvntrDelible(StdGrdDtlVO stdGrdDtlVO) throws Exception;
	/**
	 * APC 판정 등급 삭제 가능 여부
	 * @param StdGrdVO
	 * @return
	 * @throws Exception
	 */
	public String grdJgmtInvntrDelible(StdGrdJgmtVO stdGrdJgmtVO) throws Exception;
}
