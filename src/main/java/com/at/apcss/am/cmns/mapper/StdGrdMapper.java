package com.at.apcss.am.cmns.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.at.apcss.am.cmns.vo.StdGrdDtlVO;
import com.at.apcss.am.cmns.vo.StdGrdVO;

/**
 * 등급 정보 Mapper 인터페이스
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
@Mapper
public interface StdGrdMapper {

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
	 * @return integer
	 * @throws Exception
	 */
	public int insertStdGrd(StdGrdVO stdGrdVO) throws Exception;

	/**
	 * APC 등급 정보 변경
	 * @param StdGrdVO
	 * @return integer
	 * @throws Exception
	 */
	public int updateStdGrd(StdGrdVO stdGrdVO) throws Exception;

	/**
	 * APC 등급 정보 삭제
	 * @param StdGrdVO
	 * @return integer
	 * @throws Exception
	 */
	public int deleteStdGrd(StdGrdVO stdGrdVO) throws Exception;

	/**
	 * APC 등급 정보 전체 삭제
	 * @param cmnsGrdVO
	 * @return integer
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
	 * @return integer
	 * @throws Exception
	 */
	public int insertStdGrdDtl(StdGrdDtlVO stdGrdDtlVO) throws Exception;

	/**
	 * APC 등급 정보 상세 변경
	 * @param StdGrdDtlVO
	 * @return integer
	 * @throws Exception
	 */
	public int updateStdGrdDtl(StdGrdDtlVO stdGrdDtlVO) throws Exception;

	/**
	 * APC 등급 정보 상세 삭제
	 * @param StdGrdDtlVO
	 * @return integer
	 * @throws Exception
	 */
	public int deleteStdGrdDtl(StdGrdDtlVO stdGrdDtlVO) throws Exception;

	/**
	 * APC 등급 정보 상세 전체 삭제
	 * @param StdGrdDtlVO
	 * @return integer
	 * @throws Exception
	 */
	public int deleteStdGrdDtlAll(StdGrdDtlVO stdGrdDtlVO) throws Exception;
}
