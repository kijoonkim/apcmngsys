package com.at.apcss.fm.clt.service;

import java.util.List;
import java.util.Map;

import com.at.apcss.fm.clt.vo.CltvtnEngttRsltMngVO;


/**
 * 재배약정결과관리 Service 인터페이스
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
public interface CltvtnEngttRsltMngService {

	/**
	 * 메시지정보를 조회한다.
	 * @param cltvtnEngttRsltMngVO
	 * @return
	 * @throws Exception
	 */
	public CltvtnEngttRsltMngVO selectCltvtnEngttRsltMng(CltvtnEngttRsltMngVO cltvtnEngttRsltMngVO) throws Exception;

	/**
	 * 메시지정보를 조회한다.
	 * @param msgKey
	 * @return
	 * @throws Exception
	 */
	public CltvtnEngttRsltMngVO selectCltvtnEngttRsltMng(String msgKey) throws Exception;

	/**
	 * 메시지 목록을 조회한다.
	 * @param cltvtnEngttRsltMngVO
	 * @return
	 * @throws Exception
	 */
	public List<CltvtnEngttRsltMngVO> selectCltvtnEngttRsltMngList(CltvtnEngttRsltMngVO cltvtnEngttRsltMngVO) throws Exception;


	/**
	 * 메시지정보를 등록한다.
	 * @param cltvtnEngttRsltMngVO
	 * @return
	 * @throws Exception
	 */
	public int insertCltvtnEngttRsltMng(CltvtnEngttRsltMngVO cltvtnEngttRsltMngVO) throws Exception;

	/**
	 * 메시지정보를 변경한다.
	 * @param cltvtnEngttRsltMngVO
	 * @return
	 * @throws Exception
	 */
	public int updateCltvtnEngttRsltMng(CltvtnEngttRsltMngVO cltvtnEngttRsltMngVO) throws Exception;

	/**
	 * 메시지정보를 삭제한다.
	 * @param cltvtnEngttRsltMngVO
	 * @return
	 * @throws Exception
	 */
	public int deleteCltvtnEngttRsltMng(CltvtnEngttRsltMngVO cltvtnEngttRsltMngVO) throws Exception;

	/**
	 * 메시지 목록을 삭제한다.
	 * @param cltvtnEngttRsltMngList
	 * @return
	 * @throws Exception
	 */
	public int deleteCltvtnEngttRsltMngList(List<CltvtnEngttRsltMngVO> cltvtnEngttRsltMngList) throws Exception;

}
