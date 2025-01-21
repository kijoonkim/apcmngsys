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
public interface InvntrTypeMapper {
	/**
	 * 원물재고 유형 수정
	 *
	 * @param InvntrMngVO
	 * @return
	 * @throws Exception
	 */
	public int updateRawMtrInvntrType(InvntrMngVO invntrMngVO);

	/**
	 * 선별재고 유형 수정
	 *
	 * @param InvntrMngVO
	 * @return
	 * @throws Exception
	 */
	public int updateSortInvntrType(InvntrMngVO invntrMngVO);

	/**
	 * 상품재고 유형 수정
	 *
	 * @param InvntrMngVO
	 * @return
	 * @throws Exception
	 */
	public int updateGdsInvntrType(InvntrMngVO invntrMngVO);



}
