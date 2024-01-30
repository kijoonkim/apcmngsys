package com.at.apcss.am.oprtr.service;

import java.util.HashMap;
import java.util.List;

import com.at.apcss.am.oprtr.vo.OprtrVO;
/**
 * 작업생산자 Service 인터페이스
 * @author 김호
 * @since 2023.07.13
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.07.13  김호        최초 생성
 * </pre>
 */
public interface OprtrService {

	/**
	 * 작업생산자 조회
	 * @param OprtrVO
	 * @return OprtrVO
	 */
	public OprtrVO selectOprtr(OprtrVO oprtrVO) throws Exception;

	/**
	 * 작업생산자 목록 조회
	 * @param OprtrVO
	 * @return List<OprtrVO>
	 */
	public List<OprtrVO> selectOprtrList(OprtrVO oprtrVO) throws Exception;

	/**
	 * 작업생산자 등록, 변경
	 * @param OprtrVO
	 * @return Integer
	 */
	public HashMap<String, Object> multiSaveOprtrList(List<OprtrVO> optrtList) throws Exception;

	/**
	 * 작업생산자 등록
	 * @param OprtrVO
	 * @return Integer
	 */
	public int insertOprtr(OprtrVO oprtrVO) throws Exception;
	/**
	 * 작업생산자 변경
	 * @param OprtrVO
	 * @return Integer
	 */
	public int updateOprtr(OprtrVO oprtrVO) throws Exception;
	/**
	 * 작업생산자 삭제
	 * @param OprtrVO
	 * @return Integer
	 */
	public HashMap<String, Object> deleteOprtr(OprtrVO oprtrVO) throws Exception;

	/**
	 * 작업생산자 삭제 가능 여부
	 * @param OprtrVO
	 * @return String
	 * @throws Exception
	 */
	public String oprtrDelible(OprtrVO oprtrVO) throws Exception;

}
