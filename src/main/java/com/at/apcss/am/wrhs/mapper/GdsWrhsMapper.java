package com.at.apcss.am.wrhs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.at.apcss.am.invntr.vo.GdsInvntrVO;

/**
 * 상품입고 Mapper 인터페이스
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
public interface GdsWrhsMapper {
	
	/**
	 * 상품입고등록 목록 조회
	 * @param gdsInvntrVO
	 * @return
	 * @throws Exception
	 */
	public List<GdsInvntrVO> selectGdsWrhsList(GdsInvntrVO gdsInvntrVO) throws Exception;
	
	/**
	 * 상품입고등록 등록
	 * @param gdsInvntrVO
	 * @return
	 * @throws Exception
	 */
	public int insertGdsInvntr(GdsInvntrVO gdsInvntrVO) throws Exception;
	
	/**
	 * 상품입고등록 삭제
	 * @param gdsInvntrVO
	 * @return
	 * @throws Exception
	 */
	public int deleteGdsInvntr(GdsInvntrVO gdsInvntrVO) throws Exception;
	
}
