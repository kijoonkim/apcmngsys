package com.at.apcss.am.spmt.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.at.apcss.am.ordr.vo.OrdrVO;
import com.at.apcss.am.spmt.vo.SpmtCmndVO;

/**
 * 출고지시 Mapper 인터페이스
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
public interface SpmtCmndMapper {

	/**
	 * 출고지시 단건 조회
	 * @param spmtCmndVO
	 * @return
	 * @throws Exception
	 */
	public SpmtCmndVO selectSpmtCmnd(SpmtCmndVO spmtCmndVO) throws Exception;

	/**
	 * 출고지시 목록 조회
	 * @param spmtCmndVO
	 * @return
	 * @throws Exception
	 */
	public List<SpmtCmndVO> selectSpmtCmndList(SpmtCmndVO spmtCmndVO) throws Exception;

	/**
	 * 출하지시번호 목록 조회
	 * @param spmtCmndVO
	 * @return
	 * @throws Exception
	 */
	public List<SpmtCmndVO> selectSpmtCmndnoList(SpmtCmndVO spmtCmndVO) throws Exception;

	/**
	 * 출하지시 내역 조회
	 *
	 * @param spmtCmndVO
	 * @return
	 * @throws Exception
	 */
	public List<SpmtCmndVO> selectRegSpmtCmndList(SpmtCmndVO spmtCmndVO) throws Exception;

	/**
	 * 출고지시대상내역 조회
	 *
	 * @param spmtCmndVO
	 * @return
	 * @throws Exception
	 */
	public List<OrdrVO> selectSpmtCmndTrgList(OrdrVO ordrVO) throws Exception;


	/**
	 * 출고지시 등록
	 * @param spmtCmndVO
	 * @return
	 * @throws Exception
	 */
	public int insertSpmtCmnd(SpmtCmndVO spmtCmndVO) throws Exception;

	/**
	 * 출고지시 변경
	 * @param spmtCmndVO
	 * @return
	 * @throws Exception
	 */
	public int updateSpmtCmnd(SpmtCmndVO spmtCmndVO) throws Exception;

	/**
	 * 출고지시 삭제
	 * @param spmtCmndVO
	 * @return
	 * @throws Exception
	 */
	public int deleteSpmtCmnd(SpmtCmndVO spmtCmndVO) throws Exception;

	/**
	 * 출고지시 삭제
	 *
	 * @param spmtCmndVO
	 * @return
	 * @throws Exception
	 */
	public int deleteSpmtCmnd2(SpmtCmndVO spmtCmndVO) throws Exception;
}
