package com.at.apcss.am.invntr.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.at.apcss.am.invntr.vo.RawMtrInvntrVO;
import com.at.apcss.am.invntr.vo.RawMtrStdGrdVO;

/**
 * 원물재고 Mapper 인터페이스
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
public interface RawMtrInvntrMapper {

	/**
	 * 원물재고 단건 조회
	 * @param rawMtrInvntrVO
	 * @return
	 * @throws Exception
	 */
	public RawMtrInvntrVO selectRawMtrInvntr(RawMtrInvntrVO rawMtrInvntrVO) throws Exception;

	/**
	 * 원물재고 표준등급 목록 조회
	 * @param rawMtrInvntrVO
	 * @return
	 * @throws Exception
	 */
	public List<RawMtrStdGrdVO> selectRawMtrStdGrdList(RawMtrInvntrVO rawMtrInvntrVO) throws Exception;

	/**
	 * 원물재고 목록 조회
	 * @param rawMtrInvntrVO
	 * @return
	 * @throws Exception
	 */
	public List<RawMtrInvntrVO> selectRawMtrInvntrList(RawMtrInvntrVO rawMtrInvntrVO) throws Exception;

	/**
	 * 원물재고 등록
	 * @param rawMtrInvntrVO
	 * @return
	 * @throws Exception
	 */
	public int insertRawMtrInvntr(RawMtrInvntrVO rawMtrInvntrVO) throws Exception;

	/**
	 * 원물재고 변경
	 * @param rawMtrInvntrVO
	 * @return
	 * @throws Exception
	 */
	public int updateRawMtrInvntr(RawMtrInvntrVO rawMtrInvntrVO) throws Exception;

	/**
	 * 원물재고내역 변경
	 * @param rawMtrInvntrVO
	 * @return
	 * @throws Exception
	 */
	public int updateRawMtrInvntrChg(RawMtrInvntrVO rawMtrInvntrVO) throws Exception;

	/**
	 * 원물재고 삭제
	 * @param rawMtrInvntrVO
	 * @return
	 * @throws Exception
	 */
	public int deleteRawMtrInvntr(RawMtrInvntrVO rawMtrInvntrVO) throws Exception;

	/**
	 * 원물재고 변경 - 선별등록
	 * @param rawMtrInvntrVO
	 * @return
	 * @throws Exception
	 */
	public int updateInvntrSortPrfmnc(RawMtrInvntrVO rawMtrInvntrVO) throws Exception;

	/**
	 * 원물재고 표준등급 등록
	 * @param rawMtrStdGrdVO
	 * @return
	 * @throws Exception
	 */
	public int insertRawMtrStdGrd(RawMtrStdGrdVO rawMtrStdGrdVO) throws Exception;

	/**
	 * 원물재고 표준등급 삭제
	 * @param rawMtrInvntrVO
	 * @return
	 * @throws Exception
	 */
	public int deleteRawMtrStdGrd(RawMtrInvntrVO rawMtrInvntrVO) throws Exception;


	/**
	 * 원물재고 변경 : delYn => Y
	 * @param rawMtrInvntrVO
	 * @return
	 * @throws Exception
	 */
	public int updateRawMtrInvntrDelY(RawMtrInvntrVO rawMtrInvntrVO) throws Exception;

	/**
	 * 원물재고 표준등급 변경 : delYn => Y
	 * @param rawMtrInvntrVO
	 * @return
	 * @throws Exception
	 */
	public int updateRawMtrStdGrdDelY(RawMtrInvntrVO rawMtrInvntrVO) throws Exception;
}
