package com.at.apcss.am.pckg.service;

import java.util.List;

import com.at.apcss.am.pckg.vo.PckgCmndVO;

/**
 * 포장지시 Service 인터페이스
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
public interface PckgCmndService {

	/**
	 * 포장지시 단건 조회
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
	 * 포장지시 등록
	 * @param pckgCmndVO
	 * @return
	 * @throws Exception
	 */
	public int insertPckgCmnd(PckgCmndVO pckgCmndVO) throws Exception;

	/**
	 * 포장지시 수정
	 * @param pckgCmndVO
	 * @return
	 * @throws Exception
	 */
	public int updatePckgCmnd(PckgCmndVO pckgCmndVO) throws Exception;

	/**
	 * 포장지시 삭제
	 * @param pckgCmndVO
	 * @return
	 * @throws Exception
	 */
	public int deletePckgCmnd(PckgCmndVO pckgCmndVO) throws Exception;

	/**
	 * 포장지시 리스트 등록
	 * @param pckgCmndVO
	 * @return
	 * @throws Exception
	 */
	public int insertPckgCmndList(List<PckgCmndVO> pckgCmndList) throws Exception;

	/**
	 * 포장지시 리스트 삭제
	 * @param pckgCmndVO
	 * @return
	 * @throws Exception
	 */
	public int deletePckgCmndList(List<PckgCmndVO> pckgCmndList) throws Exception;
}
