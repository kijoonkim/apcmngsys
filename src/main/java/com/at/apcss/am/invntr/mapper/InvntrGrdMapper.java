package com.at.apcss.am.invntr.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.am.invntr.vo.GdsStdGrdVO;
import com.at.apcss.am.invntr.vo.InvntrMngVO;
import com.at.apcss.am.invntr.vo.RawMtrStdGrdVO;
import com.at.apcss.am.invntr.vo.SortStdGrdVO;

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
public interface InvntrGrdMapper {
	/**
	 * 원물재고 등급 수정
	 *
	 * @param InvntrMngVO
	 * @return
	 * @throws Exception
	 */
	public int updateRawMtrInvntrGrd(InvntrMngVO invntrMngVO) throws Exception;

	/**
	 * 선별재고 등급 수정
	 *
	 * @param InvntrMngVO
	 * @return
	 * @throws Exception
	 */
	public int updateSortInvntrGrd(InvntrMngVO invntrMngVO) throws Exception;

	/**
	 * 상품재고 등급 수정
	 *
	 * @param InvntrMngVO
	 * @return
	 * @throws Exception
	 */
	public int updateGdsInvntrGrd(InvntrMngVO invntrMngVO) throws Exception;

	/**
	 * 원물재고 등급수정 이력
	 *
	 * @param InvntrMngVO
	 * @return
	 * @throws Exception
	 */
	public int insertRawMtrInvntrChgHstry(InvntrMngVO invntrMngVO) throws Exception;

	/**
	 * 원물표준등급 등급수정
	 *
	 * @param InvntrMngVO
	 * @return
	 * @throws Exception
	 */
	public int updateRawMtrStdGrd(RawMtrStdGrdVO invntrMngVO);

	/**
	 * 선별표준등급 등급수정
	 *
	 * @param InvntrMngVO
	 * @return
	 * @throws Exception
	 */
	public int updateSortStdGrd(SortStdGrdVO invntrMngVO);

	/**
	 * 상품표준등급 등급수정
	 *
	 * @param InvntrMngVO
	 * @return
	 * @throws Exception
	 */
	public int updateGdsStdGrd(GdsStdGrdVO invntrMngVO);

}
