package com.at.apcss.am.trnsf.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.am.trnsf.vo.InvntrMngVO;

@Mapper
public interface InvntrMngMapper {
	
	 /**
     * 재고기준 조회
     * @param invntrMngVO
     * @return List<InvntrMngVO>
     * @throws Exception
     */
	public List<InvntrMngVO> selectInvntrCrtr(InvntrMngVO invntrMngVO) throws Exception;

	 /**
     * 재고기준 등록
     * @param invntrCrtrList
     * @return int
     * @throws Exception
     */
	public int insertInvntrCrtr(InvntrMngVO vo) throws Exception;

	/**
	 * 재고기준 변경
	 * @param invntrCrtrList
	 * @return int
	 * @throws Exception
	 */
	public int updateInvntrCrtr(InvntrMngVO vo) throws Exception;

	/**
	 * 재고기준 삭제
	 * @param invntrMngVO
	 * @return int
	 * @throws Exception
	 */
	public int deleteInvntrCrtr(InvntrMngVO invntrMngVO)throws Exception;

	/**
	 * 재고기준 상세 조회
	 * @param invntrMngVO
	 * @return List<InvntrMngVO>
	 * @throws Exception
	 */
	public List<InvntrMngVO> selectInvntrCrtrDtl(InvntrMngVO invntrMngVO) throws Exception;

	/**
	 * 재고기준 상세 등록
	 * @param invntrMngVO
	 * @return int
	 * @throws Exception
	 */
	public int insertInvntrCrtrDtl(InvntrMngVO invntrMngVO) throws Exception;

	/**
	 * 재고기준 상세 변경
	 * @param invntrMngVO
	 * @return int
	 * @throws Exception
	 */
	public int updateInvntrCrtrDtl(InvntrMngVO invntrMngVO) throws Exception;

	/**
	 * 재고기준 상세 삭제
	 * @param invntrMngVO
	 * @return int
	 * @throws Exception
	 */
	public int deleteInvntrCrtrDtl(InvntrMngVO invntrMngVO) throws Exception;

	/**
	 * 기초재고 조회
	 * @param invntrMngVO
	 * @return List<InvntrMngVO>
	 * @throws Exception
	 */
	public List<InvntrMngVO> selectInvntrApcBss(InvntrMngVO invntrMngVO) throws Exception;

	/**
	 * 기초재고 등록
	 * @param invntrMngVO
	 * @return int
	 * @throws Exception
	 */
	public int insertInvntrApcBss(InvntrMngVO invntrMngVO) throws Exception;

	/**
	 * 기초재고 변경
	 * @param invntrMngVO
	 * @return int
	 * @throws Exception
	 */
	public int updateInvntrApcBss(InvntrMngVO invntrMngVO) throws Exception;

	/**
	 * 기초재고 삭제
	 * @param invntrMngVO
	 * @return int
	 * @throws Exception
	 */
	public int deleteInvntrApcBss(InvntrMngVO invntrMngVO) throws Exception;
}
