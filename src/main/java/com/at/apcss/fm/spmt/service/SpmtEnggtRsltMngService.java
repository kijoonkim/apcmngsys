package com.at.apcss.fm.spmt.service;

import java.util.List;
import java.util.Map;

import com.at.apcss.fm.spmt.vo.SpmtEnggtInfoMngVO;
import com.at.apcss.fm.spmt.vo.SpmtEnggtRsltMngVO;


/**
 * 출하약정신청관리 Service 인터페이스
 * @author 정연두
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21  정연두        최초 생성
 * </pre>
 */
public interface SpmtEnggtRsltMngService {

	/**
	 * 메시지정보를 조회한다.
	 * @param spmtEnggtRsltMngVO
	 * @return
	 * @throws Exception
	 */
	public SpmtEnggtRsltMngVO selectSpmtEnggtRsltMng(SpmtEnggtRsltMngVO spmtEnggtRsltMngVO) throws Exception;

	/**
	 * 메시지정보를 조회한다.
	 * @param msgKey
	 * @return
	 * @throws Exception
	 */
	public SpmtEnggtRsltMngVO selectSpmtEnggtRsltMng(String msgKey) throws Exception;

	/**
	 * 메시지 목록을 조회한다.
	 * @param spmtEnggtRsltMngVO
	 * @return
	 * @throws Exception
	 */
	public List<SpmtEnggtRsltMngVO> selectSpmtEnggtRsltMngList(SpmtEnggtRsltMngVO spmtEnggtRsltMngVO) throws Exception;


	/**
	 * 메시지정보를 등록한다.
	 * @param spmtEnggtRsltMngVO
	 * @return
	 * @throws Exception
	 */
	public int insertSpmtEnggtRsltMng(SpmtEnggtRsltMngVO spmtEnggtRsltMngVO) throws Exception;

	/**
	 * 메시지정보를 변경한다.
	 * @param spmtEnggtRsltMngVO
	 * @return
	 * @throws Exception
	 */
	public int updateSpmtEnggtRsltMng(SpmtEnggtRsltMngVO spmtEnggtRsltMngVO) throws Exception;

	/**
	 * 메시지정보를 삭제한다.
	 * @param spmtEnggtRsltMngVO
	 * @return
	 * @throws Exception
	 */
	public int deleteSpmtEnggtRsltMng(SpmtEnggtRsltMngVO spmtEnggtRsltMngVO) throws Exception;

	/**
	 * 메시지 목록을 삭제한다.
	 * @param spmtEnggtRsltMngList
	 * @return
	 * @throws Exception
	 */
	public int deleteSpmtEnggtRsltMngList(List<SpmtEnggtRsltMngVO> spmtEnggtRsltMngList) throws Exception;

}
