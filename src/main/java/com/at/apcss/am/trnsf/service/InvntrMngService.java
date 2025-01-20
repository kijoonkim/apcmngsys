package com.at.apcss.am.trnsf.service;

import java.util.List;

import com.at.apcss.am.trnsf.vo.InvntrMngVO;

public interface InvntrMngService {

	/**
     * 재고기준 조회
     * @param invntrMngVO
     * @return List<InvntrMngVO>
     * @throws Exception
     */
	public List<InvntrMngVO> selectInvntrCrtr (InvntrMngVO invntrMngVO) throws Exception;

	/**
     * 재고기준 등록
     * @param invntrCrtrList
     * @return int
     * @throws Exception
     */
	public int insertInvntrCrtr(List<InvntrMngVO> invntrCrtrList)throws Exception;

	/**
	 * 재고기준 삭제
	 * @param invntrMngVO
	 * @return int
	 * @throws Exception
	 */
	public int deleteInvntrCrtr(InvntrMngVO invntrMngVO) throws Exception;

	/**
	 * 재고기준 상세 조회
	 * @param invntrMngVO
	 * @return List<InvntrMngVO>
	 * @throws Exception
	 */
	public List<InvntrMngVO> selectInvntrCrtrDtl(InvntrMngVO invntrMngVO) throws Exception;

	/**
	 * 재고기준 상세 등록
	 * @param invntrCrtrList
	 * @return int
	 * @throws Exception
	 */
	public int insertInvntrCrtrDtl(List<InvntrMngVO> invntrCrtrList) throws Exception;

	/**
	 * 재고기준 상세 삭제
	 * @param invntrMngVO
	 * @return int
	 * @throws Exception
	 */
	public int deleteInvntrCrtrDtl(InvntrMngVO invntrMngVO) throws Exception;
}
