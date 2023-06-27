package com.at.apcss.am.trnsf.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.at.apcss.am.trnsf.vo.InvntrTrnsfVO;

/**
 * 재고이송 Mapper 인터페이스
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
public interface InvntrTrnsfMapper {
	
	/**
	 * 재고이송 단건 조회
	 * @param invntrTrnsfVO
	 * @return
	 * @throws Exception
	 */
	public InvntrTrnsfVO selectInvntrTrnsf(InvntrTrnsfVO invntrTrnsfVO) throws Exception;

	/**
	 * 재고이송 목록 조회
	 * @param invntrTrnsfVO
	 * @return
	 * @throws Exception
	 */
	public List<InvntrTrnsfVO> selectInvntrTrnsfList(InvntrTrnsfVO invntrTrnsfVO) throws Exception;

	/**
	 * 재고이송 등록
	 * @param invntrTrnsfVO
	 * @return
	 * @throws Exception
	 */
	public int insertInvntrTrnsf(InvntrTrnsfVO invntrTrnsfVO) throws Exception;

	/**
	 * 재고이송 변경
	 * @param invntrTrnsfVO
	 * @return
	 * @throws Exception
	 */
	public int updateInvntrTrnsf(InvntrTrnsfVO invntrTrnsfVO) throws Exception;

	/**
	 * 재고이송 삭제
	 * @param invntrTrnsfVO
	 * @return
	 * @throws Exception
	 */
	public int deleteInvntrTrnsf(InvntrTrnsfVO invntrTrnsfVO) throws Exception;
}
