package com.at.apcss.am.invntr.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.at.apcss.am.invntr.vo.GdsInvntrVO;
import com.at.apcss.am.invntr.vo.GdsStdGrdVO;

/**
 * 상품재고관리 Mapper 인터페이스
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
public interface GdsInvntrMapper {

	/**
	 * 상품재고 단건 조회
	 * @param gdsInvntrVO
	 * @return
	 * @throws Exception
	 */
	public GdsInvntrVO selectGdsInvntr(GdsInvntrVO gdsInvntrVO) throws Exception;

	/**
	 * 상품재고 목록 조회
	 * @param gdsInvntrVO
	 * @return
	 * @throws Exception
	 */
	public List<GdsInvntrVO> selectGdsInvntrList(GdsInvntrVO gdsInvntrVO) throws Exception;
	
	/**
	 * 상품재고 목록 조회
	 * @param gdsInvntrVO
	 * @return
	 * @throws Exception
	 */
	public List<GdsInvntrVO> selectUpdateGdsInvntrList(GdsInvntrVO gdsInvntrVO) throws Exception;
	
	/**
	 * 상품입고등록 목록 조회
	 * @param gdsInvntrVO
	 * @return
	 * @throws Exception
	 */
	public List<GdsInvntrVO> selectGdsWrhsList(GdsInvntrVO gdsInvntrVO) throws Exception;

	/**
	 * 상품재고 등록
	 * @param gdsInvntrVO
	 * @return
	 * @throws Exception
	 */
	public int insertGdsInvntr(GdsInvntrVO gdsInvntrVO) throws Exception;

	/**
	 * 상품재고 변경
	 * @param gdsInvntrVO
	 * @return
	 * @throws Exception
	 */
	public int updateGdsInvntr(GdsInvntrVO gdsInvntrVO) throws Exception;
	/**
	 * 상품재고 변경
	 * @param gdsInvntrVO
	 * @return
	 * @throws Exception
	 */
	public int updateGdsInvntrList(GdsInvntrVO gdsInvntrVO) throws Exception;

	/**
	 * 상품재고 삭제
	 * @param gdsInvntrVO
	 * @return
	 * @throws Exception
	 */
	public int deleteGdsInvntr(GdsInvntrVO gdsInvntrVO) throws Exception;

	/**
	 * 상품재고 변경 : 출하실적 처리
	 * @param gdsInvntrVO
	 * @return
	 * @throws Exception
	 */
	public int updateGdsInvntrSpmtPrfmnc(GdsInvntrVO gdsInvntrVO) throws Exception;

	/**
	 * 상품재고 표준등급 등록
	 * @param gdsInvntrVO
	 * @return
	 * @throws Exception
	 */
	public int insertGdsStdGrd(GdsStdGrdVO gdsStdGrdVO) throws Exception;

}
