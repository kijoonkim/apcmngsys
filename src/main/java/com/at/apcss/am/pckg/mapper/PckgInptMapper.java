package com.at.apcss.am.pckg.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.at.apcss.am.pckg.vo.PckgInptVO;

/**
 * 포장투입 Mapper 인터페이스
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
public interface PckgInptMapper {
	
	/**
	 * 포장투입실적 단건 조회
	 * @param pckgInptVO
	 * @return
	 * @throws Exception
	 */
	public PckgInptVO selectPckgInpt(PckgInptVO pckgInptVO) throws Exception;

	/**
	 * 포장투입실적 목록 조회
	 * @param pckgInptVO
	 * @return
	 * @throws Exception
	 */
	public List<PckgInptVO> selectPckgInptList(PckgInptVO pckgInptVO) throws Exception;

	/**
	 * 포장투입실적 등록
	 * @param pckgInptVO
	 * @return
	 * @throws Exception
	 */
	public int insertPckgInpt(PckgInptVO pckgInptVO) throws Exception;

	/**
	 * 포장투입실적 변경
	 * @param pckgInptVO
	 * @return
	 * @throws Exception
	 */
	public int updatePckgInpt(PckgInptVO pckgInptVO) throws Exception;

	/**
	 * 포장투입실적 삭제
	 * @param pckgInptVO
	 * @return
	 * @throws Exception
	 */
	public int deletePckgInpt(PckgInptVO pckgInptVO) throws Exception;
	
	/**
	 * 포장투입실적 삭제 : set delyn Y
	 * @param pckgInptVO
	 * @return
	 * @throws Exception
	 */
	public int updatePckgInptForDelY(PckgInptVO pckgInptVO) throws Exception;

}
