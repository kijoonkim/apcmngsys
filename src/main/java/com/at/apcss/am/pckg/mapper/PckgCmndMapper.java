package com.at.apcss.am.pckg.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.am.pckg.vo.PckgCmndVO;

/**
 * 포장지시 Mapper 인터페이스
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
public interface PckgCmndMapper {

	/**
	 * 포장지시
	 * @param pckgCmndVO
	 * @return
	 * @throws Exception
	 */
	public PckgCmndVO selectPckgCmnd(PckgCmndVO pckgCmndVO) throws Exception;

	/**
	 * 포장지시 목록 조회
	 * @param pckgCmndVO
	 * @return
	 * @throws Exception
	 */
	public List<PckgCmndVO> selectPckgCmndList(PckgCmndVO pckgCmndVO) throws Exception;

	/**
	 * 포장지시 내역 목록 조회
	 * @param PckgCmndVO
	 * @return List<PckgCmndVO>
	 * @throws Exception
	 */
	public List<PckgCmndVO> selectRegPckgCmndList(PckgCmndVO pckgCmndVO) throws Exception;

	/**
	 * 포장지시
	 * @param pckgCmndVO
	 * @return
	 * @throws Exception
	 */
	public int insertPckgCmnd(PckgCmndVO pckgCmndVO) throws Exception;

	/**
	 * 포장지시
	 * @param pckgCmndVO
	 * @return
	 * @throws Exception
	 */
	public int updatePckgCmnd(PckgCmndVO pckgCmndVO) throws Exception;

	/**
	 * 포장지시
	 * @param pckgCmndVO
	 * @return
	 * @throws Exception
	 */
	public int deletePckgCmnd(PckgCmndVO pckgCmndVO) throws Exception;
}
