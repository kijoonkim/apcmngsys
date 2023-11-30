package com.at.apcss.fm.bbs.service;

import java.util.List;
import java.util.Map;

import com.at.apcss.fm.bbs.vo.BbsFileVO;
import com.at.apcss.fm.bbs.vo.BbsVO;


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
public interface BbsService {

	/**
	 * 게시판정보를 조회한다.
	 * @param bbsVO
	 * @return
	 * @throws Exception
	 */
	public BbsVO selectBbs(BbsVO bbsVO) throws Exception;

	/**
	 * 게시판정보를 조회한다.
	 * @param bbsNo
	 * @return
	 * @throws Exception
	 */
	public BbsVO selectBbs(String bbsNo) throws Exception;

	/**
	 * 게시판 목록을 조회한다.
	 * @param bbsVO
	 * @return
	 * @throws Exception
	 */
	public List<BbsVO> selectBbsList(BbsVO bbsVO) throws Exception;


	/**
	 * 게시판정보를 등록한다.
	 * @param bbsVO
	 * @return
	 * @throws Exception
	 */
	public int insertBbs(BbsVO bbsVO) throws Exception;

	/**
	 * 게시판정보를 변경한다.
	 * @param bbsVO
	 * @return
	 * @throws Exception
	 */
	public int updateBbs(BbsVO bbsVO) throws Exception;

	/**
	 * 게시판정보를 삭제한다.
	 * @param bbsVO
	 * @return
	 * @throws Exception
	 */
	public int deleteBbs(BbsVO bbsVO) throws Exception;

	/**
	 * 게시판 목록을 삭제한다.
	 * @param bbsList
	 * @return
	 * @throws Exception
	 */
	public int deleteBbsList(List<BbsVO> bbsList) throws Exception;

	/**
	 * 첨부파일을 조회한다.
	 * @param bbsFileVO
	 * @return
	 * @throws Exception
	 */
	public BbsFileVO selectBbsAttaches (BbsFileVO bbsFileVO) throws Exception;

	/**
	 * 첨부파일을 조회한다.
	 * @param bbsFileVO
	 * @return
	 * @throws Exception
	 */
	public List<BbsFileVO> selectBbsAttachesList(BbsVO bbsVO) throws Exception;

	/**
	 * 첨부파일을 등록한다.
	 * @param bbsFileVO
	 * @return
	 * @throws Exception
	 */
	public int insertAttach(BbsFileVO bbsFileVO) throws Exception;

	/**
	 * 첨부파일을 삭제한다.
	 * @param bbsList
	 * @return
	 * @throws Exception
	 */
	public int deleteBbsAttache(BbsFileVO bbsFileVO) throws Exception;

}
