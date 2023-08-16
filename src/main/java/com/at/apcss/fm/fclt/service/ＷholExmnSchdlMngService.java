package com.at.apcss.fm.fclt.service;

import java.util.List;
import java.util.Map;

import com.at.apcss.fm.fclt.vo.ＷholExmnSchdlMngVO;


/**
 * 전수조사일정관리 Service 인터페이스
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
public interface ＷholExmnSchdlMngService {

	/**
	 * 전수조사일정관리정보를 조회한다.
	 * @param wholExmnSchdlMngVO
	 * @return
	 * @throws Exception
	 */
	public ＷholExmnSchdlMngVO selectＷholExmnSchdlMng(ＷholExmnSchdlMngVO wholExmnSchdlMngVO) throws Exception;

	/**
	 * 전수조사일정관리정보를 조회한다.
	 * @param msgKey
	 * @return
	 * @throws Exception
	 */
	public ＷholExmnSchdlMngVO selectＷholExmnSchdlMng(String msgKey) throws Exception;

	/**
	 * 전수조사일정관리 목록을 조회한다.
	 * @param wholExmnSchdlMngVO
	 * @return
	 * @throws Exception
	 */
	public List<ＷholExmnSchdlMngVO> selectＷholExmnSchdlMngList(ＷholExmnSchdlMngVO wholExmnSchdlMngVO) throws Exception;


	/**
	 * 전수조사일정관리정보를 등록한다.
	 * @param wholExmnSchdlMngVO
	 * @return
	 * @throws Exception
	 */
	public int insertＷholExmnSchdlMng(ＷholExmnSchdlMngVO wholExmnSchdlMngVO) throws Exception;

	/**
	 * 전수조사일정관리정보를 변경한다.
	 * @param wholExmnSchdlMngVO
	 * @return
	 * @throws Exception
	 */
	public int updateＷholExmnSchdlMng(ＷholExmnSchdlMngVO wholExmnSchdlMngVO) throws Exception;

	/**
	 * 전수조사일정관리정보를 삭제한다.
	 * @param wholExmnSchdlMngVO
	 * @return
	 * @throws Exception
	 */
	public int deleteＷholExmnSchdlMng(ＷholExmnSchdlMngVO wholExmnSchdlMngVO) throws Exception;

	/**
	 * 전수조사일정관리 목록을 삭제한다.
	 * @param wholExmnSchdlMngList
	 * @return
	 * @throws Exception
	 */
	public int deleteＷholExmnSchdlMngList(List<ＷholExmnSchdlMngVO> wholExmnSchdlMngList) throws Exception;

}
