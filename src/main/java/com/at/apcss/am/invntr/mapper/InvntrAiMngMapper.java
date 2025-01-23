package com.at.apcss.am.invntr.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.am.invntr.vo.InvntrAiMngVO;
import com.at.apcss.am.invntr.vo.InvntrMngVO;

/**
 * 재고관리 Mapper 인터페이스
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
public interface InvntrAiMngMapper {
	/**
	 * 실사기준조회
	 *
	 * @param InvntrMngVO
	 * @return
	 * @throws Exception
	 */
	public List<InvntrAiMngVO> selectInvntrAiCrtr(InvntrAiMngVO invntrAiMngVO) throws Exception;

	/**
	 * 실사기준 삭제
	 * @param invntrVO
	 * @return
	 * @throws Exception
	 */
	public int deleteInvntrAiCrtr(InvntrAiMngVO invntrMngVO);

	/**
	 * 실사기준 수정
	 * @param invntrVO
	 * @return
	 * @throws Exception
	 */
	public int updateInvntrAiCrtr(InvntrAiMngVO invntrMngVO);

	/**
	 * 실사기준 등록
	 * @param invntrVO
	 * @return
	 * @throws Exception
	 */
	public int insertInvntrAiCrtr(InvntrAiMngVO invntrMngVO);

	/**
	 * 실사계획조회
	 *
	 * @param InvntrMngVO
	 * @return
	 * @throws Exception
	 */
	public List<InvntrAiMngVO> selectInvntrAiPlan(InvntrAiMngVO invntrAiMngVO);

	/**
	 * 실사계획 삭제
	 * @param invntrVO
	 * @return
	 * @throws Exception
	 */
	public int deleteInvntrAiPlan(InvntrAiMngVO invntrMngVO);

	/**
	 * 실사계획 수정
	 * @param invntrVO
	 * @return
	 * @throws Exception
	 */
	public int updateInvntrAiPlan(InvntrAiMngVO invntrMngVO);

	/**
	 * 실사계획 실사여부 수정
	 * @param invntrVO
	 * @return
	 * @throws Exception
	 */
	public int updateInvntrAiMngYn(InvntrAiMngVO invntrMngVO);

	/**
	 * 실사계획 실사여부수정
	 * @param invntrVO
	 * @return
	 * @throws Exception
	 */
	public int updateInvntrAiPlanYn(InvntrAiMngVO invntrMngVO);

	/**
	 * 실사계획 등록
	 * @param invntrVO
	 * @return
	 * @throws Exception
	 */
	public int insertInvntrAiPlan(InvntrAiMngVO invntrMngVO);

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
	 * 실사재고관리 수정
	 *
	 * @param InvntrMngVO
	 * @return
	 * @throws Exception
	 */
	public int updateInvntrAiMng(InvntrAiMngVO invntrAiMngVO);

	/**
	 * 실사재고관리 삭제
	 *
	 * @param InvntrMngVO
	 * @return
	 * @throws Exception
	 */
	public int deleteInvntrAiMng(InvntrAiMngVO invntrAiMngVO);


}
