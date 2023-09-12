package com.at.apcss.fm.clt.service;

import java.util.List;
import java.util.Map;

import com.at.apcss.fm.clt.vo.CltvtnApcItemVO;
import com.at.apcss.fm.clt.vo.CltvtnEnggtAplyMngVO;


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
public interface CltvtnEnggtAplyMngService {

	/**
	 * 재배약정신청관리를 조회한다.
	 * @param cltvtnEnggtAplyMngVO
	 * @return
	 * @throws Exception
	 */
	public CltvtnEnggtAplyMngVO selectCltvtnEnggtAplyMng(CltvtnEnggtAplyMngVO cltvtnEnggtAplyMngVO) throws Exception;

	/**
	 * 재배약정신청관리를 조회한다.
	 * @param msgKey
	 * @return
	 * @throws Exception
	 */
	public CltvtnEnggtAplyMngVO selectCltvtnEnggtAplyMng(String msgKey) throws Exception;

	/**
	 * 재배약정신청관리 목록을 조회한다.
	 * @param cltvtnEnggtAplyMngVO
	 * @return
	 * @throws Exception
	 */
	public List<CltvtnEnggtAplyMngVO> selectCltvtnEnggtAplyMngList(CltvtnEnggtAplyMngVO cltvtnEnggtAplyMngVO) throws Exception;


	/**
	 * 재배약정신청관리를 등록한다.
	 * @param cltvtnEnggtAplyMngVO
	 * @return
	 * @throws Exception
	 */
	public int insertCltvtnEnggtAplyMng(CltvtnEnggtAplyMngVO cltvtnEnggtAplyMngVO) throws Exception;

	/**
	 * 재배약정신청관리를 변경한다.
	 * @param cltvtnEnggtAplyMngVO
	 * @return
	 * @throws Exception
	 */
	public int updateCltvtnEnggtAplyMng(CltvtnEnggtAplyMngVO cltvtnEnggtAplyMngVO) throws Exception;

	/**
	 * 재배약정신청관리를 삭제한다.
	 * @param cltvtnEnggtAplyMngVO
	 * @return
	 * @throws Exception
	 */
	public int deleteCltvtnEnggtAplyMng(CltvtnEnggtAplyMngVO cltvtnEnggtAplyMngVO) throws Exception;

	/**
	 * 재배약정신청관리 목록을 삭제한다.
	 * @param cltvtnEnggtAplyMngList
	 * @return
	 * @throws Exception
	 */
	public int deleteCltvtnEnggtAplyMngList(List<CltvtnEnggtAplyMngVO> cltvtnEnggtAplyMngList) throws Exception;

	/**
	 * APC 목록 조회
	 * @param CltvtnApcItemVO
	 * @return
	 * @throws Exception
	 */
	public List<CltvtnApcItemVO> selectApcList(CltvtnApcItemVO cltvtnApcItemVO) throws Exception;

}
