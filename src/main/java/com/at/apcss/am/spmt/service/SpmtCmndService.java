package com.at.apcss.am.spmt.service;

import java.util.HashMap;
import java.util.List;

import com.at.apcss.am.ordr.vo.OrdrVO;
import com.at.apcss.am.spmt.vo.SpmtCmndVO;

/**
 * 출고지시 Service 인터페이스
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
public interface SpmtCmndService {

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
	 * 출하지시 등록 내역 조회
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
	 * 출고지시 목록 등록
	 * @param spmtCmndVO
	 * @return
	 * @throws Exception
	 */
	public int insertSpmtCmndList(List<SpmtCmndVO> spmtCmndList) throws Exception;

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
	public int deleteSpmtCmndList(List<SpmtCmndVO> spmtCmndList) throws Exception;
	
	/**
	 * 발주정보 출하지시번호 저장
	 * @param List<OrdrVO>
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> regSpmtCmndList(List<OrdrVO> ordrList) throws Exception;
}
