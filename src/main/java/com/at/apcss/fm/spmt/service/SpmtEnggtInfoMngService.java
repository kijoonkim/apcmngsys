package com.at.apcss.fm.spmt.service;

import java.util.List;
import java.util.Map;

import com.at.apcss.fm.clt.vo.CltvtnEnggtAplyMngVO;
import com.at.apcss.fm.spmt.vo.SpmtEnggtInfoMngVO;


/**
 * 스마트자동화 Service 인터페이스
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
public interface SpmtEnggtInfoMngService {

	/**
	 * 메시지정보를 조회한다.
	 * @param spmtEnggtInfoMngVO
	 * @return
	 * @throws Exception
	 */
	public SpmtEnggtInfoMngVO selectSpmtEnggtInfoMng(SpmtEnggtInfoMngVO spmtEnggtInfoMngVO) throws Exception;

	/**
	 * 메시지정보를 조회한다.
	 * @param msgKey
	 * @return
	 * @throws Exception
	 */
	public SpmtEnggtInfoMngVO selectSpmtEnggtInfoMng(String msgKey) throws Exception;

	/**
	 * 메시지 목록을 조회한다.
	 * @param spmtEnggtInfoMngVO
	 * @return
	 * @throws Exception
	 */
	public List<SpmtEnggtInfoMngVO> selectSpmtEnggtInfoMngList(SpmtEnggtInfoMngVO spmtEnggtInfoMngVO) throws Exception;


	/**
	 * 메시지정보를 등록한다.
	 * @param spmtEnggtInfoMngVO
	 * @return
	 * @throws Exception
	 */
	public int insertSpmtEnggtInfoMng(SpmtEnggtInfoMngVO spmtEnggtInfoMngVO) throws Exception;

	/**
	 * 메시지정보를 변경한다.
	 * @param spmtEnggtInfoMngVO
	 * @return
	 * @throws Exception
	 */
	public int updateSpmtEnggtInfoMng(SpmtEnggtInfoMngVO spmtEnggtInfoMngVO) throws Exception;

	/**
	 * 메시지정보를 삭제한다.
	 * @param spmtEnggtInfoMngVO
	 * @return
	 * @throws Exception
	 */
	public int deleteSpmtEnggtInfoMng (List<SpmtEnggtInfoMngVO> spmtEnggtInfoMngList) throws Exception; 

	/**
	 * 메시지 목록을 삭제한다.
	 * @param spmtEnggtInfoMngList
	 * @return
	 * @throws Exception
	 */ 
	public int deleteSpmtEnggtInfoMngList(List<SpmtEnggtInfoMngVO> spmtEnggtInfoMngList) throws Exception;

}
