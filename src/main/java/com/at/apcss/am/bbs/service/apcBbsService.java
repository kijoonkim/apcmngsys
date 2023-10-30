package com.at.apcss.am.bbs.service;

import java.util.List;
import java.util.Map;

import com.at.apcss.am.bbs.vo.apcBbsCmntVO;
import com.at.apcss.am.bbs.vo.apcBbsVO;


/**
 * 게시판 Service 인터페이스
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
public interface apcBbsService {

	/**
	 * 게시판정보를 조회한다.
	 * @param bbsVO
	 * @return
	 * @throws Exception
	 */
	public apcBbsVO selectBbs(apcBbsVO bbsVO) throws Exception;

	/**
	 * 게시판정보를 조회한다.
	 * @param bbsNo
	 * @return
	 * @throws Exception
	 */
	public apcBbsVO selectBbs(String bbsNo) throws Exception;

	/**
	 * 게시판 목록을 조회한다.
	 * @param bbsVO
	 * @return
	 * @throws Exception
	 */
	public List<apcBbsVO> selectBbsList(apcBbsVO bbsVO) throws Exception;


	/**
	 * 게시판정보를 등록한다.
	 * @param bbsVO
	 * @return
	 * @throws Exception
	 */
	public int insertBbs(apcBbsVO bbsVO) throws Exception;

	/**
	 * 게시판댓글를 등록한다.
	 * @param bbsVO
	 * @return
	 * @throws Exception
	 */
	public int insertBbsCmnt(apcBbsCmntVO bbsCmntVO) throws Exception;

	/**
	 * 게시판대댓글를 등록한다.
	 * @param bbsVO
	 * @return
	 * @throws Exception
	 */
	public int insertBbsChildCmnt(apcBbsCmntVO bbsCmntVO) throws Exception;
	/**
	 * 게시판댓글정보를 삭제한다.
	 * @param bbsVO
	 * @return
	 * @throws Exception
	 */
	public int deleteBbsCmnt(apcBbsCmntVO bbsCmntVO) throws Exception;
	/**
	 * 게시판댓글전체정보를 삭제한다.
	 * @param bbsVO
	 * @return
	 * @throws Exception
	 */
	public int deleteBbsAllCmnt(apcBbsVO apcBbsVO) throws Exception;
	/**
	 * 게시판댓글를 조회한다.
	 * @param bbsVO
	 * @return
	 * @throws Exception
	 */
	public List<apcBbsCmntVO> selectBbsCmntList(apcBbsVO bbsVO) throws Exception;

	/**
	 * 게시판정보를 변경한다.
	 * @param bbsVO
	 * @return
	 * @throws Exception
	 */
	public int updateBbs(apcBbsVO bbsVO) throws Exception;




	/**
	 * 게시판정보를 삭제한다.
	 * @param bbsVO
	 * @return
	 * @throws Exception
	 */
	public int deleteBbs(apcBbsVO bbsVO) throws Exception;

	/**
	 * 게시판 목록을 삭제한다.
	 * @param bbsList
	 * @return
	 * @throws Exception
	 */
	public int deleteBbsList(List<apcBbsVO> bbsList) throws Exception;


}
