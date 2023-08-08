package com.at.apcss.fm.clt.service;

import java.util.List;
import java.util.Map;

import com.at.apcss.fm.clt.vo.CltvtnEngttSptMngVO;


/**
 * 재배약정신청관리 Service 인터페이스
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
public interface CltvtnEngttSptMngService {

	/**
	 * 메시지정보를 조회한다.
	 * @param cltvtnEngttSptMngVO
	 * @return
	 * @throws Exception
	 */
	public CltvtnEngttSptMngVO selectCltvtnEngttSptMng(CltvtnEngttSptMngVO cltvtnEngttSptMngVO) throws Exception;

	/**
	 * 메시지정보를 조회한다.
	 * @param msgKey
	 * @return
	 * @throws Exception
	 */
	public CltvtnEngttSptMngVO selectCltvtnEngttSptMng(String msgKey) throws Exception;

	/**
	 * 메시지 목록을 조회한다.
	 * @param cltvtnEngttSptMngVO
	 * @return
	 * @throws Exception
	 */
	public List<CltvtnEngttSptMngVO> selectCltvtnEngttSptMngList(CltvtnEngttSptMngVO cltvtnEngttSptMngVO) throws Exception;


	/**
	 * 메시지정보를 등록한다.
	 * @param cltvtnEngttSptMngVO
	 * @return
	 * @throws Exception
	 */
	public int insertCltvtnEngttSptMng(CltvtnEngttSptMngVO cltvtnEngttSptMngVO) throws Exception;

	/**
	 * 메시지정보를 변경한다.
	 * @param cltvtnEngttSptMngVO
	 * @return
	 * @throws Exception
	 */
	public int updateCltvtnEngttSptMng(CltvtnEngttSptMngVO cltvtnEngttSptMngVO) throws Exception;

	/**
	 * 메시지정보를 삭제한다.
	 * @param cltvtnEngttSptMngVO
	 * @return
	 * @throws Exception
	 */
	public int deleteCltvtnEngttSptMng(CltvtnEngttSptMngVO cltvtnEngttSptMngVO) throws Exception;

	/**
	 * 메시지 목록을 삭제한다.
	 * @param cltvtnEngttSptMngList
	 * @return
	 * @throws Exception
	 */
	public int deleteCltvtnEngttSptMngList(List<CltvtnEngttSptMngVO> cltvtnEngttSptMngList) throws Exception;

}
