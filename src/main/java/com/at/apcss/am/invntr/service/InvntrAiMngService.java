package com.at.apcss.am.invntr.service;

import java.util.HashMap;
import java.util.List;

import com.at.apcss.am.invntr.vo.InvntrAiMngVO;
import com.at.apcss.am.invntr.vo.InvntrMngVO;

/**
 * 실사기준 Service 인터페이스
 * @author 박승진
 * @since 2025.01.13
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2025.01.13  박승진        최초 생성
 * </pre>
 */
public interface InvntrAiMngService {

	/**
	 * 실사기준 조회
	 * @param invntrVO
	 * @return
	 * @throws Exception
	 */
	public List<InvntrAiMngVO> selectInvntrAiCrtr(InvntrAiMngVO invntrMngVO) throws Exception;


	/**
	 * 실사기준 삭제
	 * @param invntrVO
	 * @return
	 * @throws Exception
	 */
	public int deleteInvntrAiCrtr(InvntrAiMngVO invntrMngVO) throws Exception;


	/**
	 * 실사기준 등록
	 * @param invntrVO
	 * @return
	 * @throws Exception
	 */
	public int insertInvntrAiCrtr(List<InvntrAiMngVO> invntrAiMngVOList) throws Exception;

	/**
	 * 실사계획조회
	 *
	 * @param InvntrMngVO
	 * @return
	 * @throws Exception
	 */
	public List<InvntrAiMngVO> selectInvntrAiPlan(InvntrAiMngVO invntrAiMngVO) throws Exception;

	/**
	 * 실사계획 삭제
	 * @param invntrVO
	 * @return
	 * @throws Exception
	 */
	public int deleteInvntrAiPlan(InvntrAiMngVO invntrMngVO) throws Exception;


	/**
	 * 실사계획 등록
	 * @param invntrVO
	 * @return
	 * @throws Exception
	 */
	public int insertInvntrAiPlan(InvntrAiMngVO invntrAiMngVO) throws Exception;

	/**
	 * 실사재고관리 조회
	 *
	 * @param InvntrMngVO
	 * @return
	 * @throws Exception
	 */
	public List<InvntrAiMngVO> selectInvntrAiMng(InvntrAiMngVO invntrAiMngVO);

	/**
	 * 실사재고관리 등록
	 *
	 * @param InvntrMngVO
	 * @return
	 * @throws Exception
	 */
	public int insertInvntrAiMng(InvntrAiMngVO invntrAiMngVO);



	/**
	 * 실사재고관리 삭제
	 *
	 * @param InvntrMngVO
	 * @return
	 * @throws Exception
	 */
	public int deleteInvntrAiMng(InvntrAiMngVO invntrAiMngVO);




}
