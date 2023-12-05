package com.at.apcss.co.authrt.service;

import java.util.HashMap;
import java.util.List;

import com.at.apcss.am.apc.vo.ApcEvrmntStngVO;
import com.at.apcss.co.authrt.vo.ComAuthrtMenuVO;
import com.at.apcss.co.authrt.vo.ComAuthrtUiVO;
import com.at.apcss.co.authrt.vo.ComAuthrtUserVO;
import com.at.apcss.co.authrt.vo.ComAuthrtVO;

public interface ComAuthrtService {

	/**
	 * 권한 정보 조회
	 * @param comAuthVO
	 * @return
	 */
	public ComAuthrtVO selectComAuthrt(ComAuthrtVO comAuthrtVO) throws Exception;
	public ComAuthrtVO selectComAuthrt(String authrtId) throws Exception;

	/**
	 * 권한 정보 목록 조회
	 * @param comAuthVO
	 * @return
	 */
	public List<ComAuthrtVO> selectComAuthrtList(ComAuthrtVO comAuthrtVO) throws Exception;

	/**
	 * 권한정보 등록
	 * @param comAuthVO
	 * @return
	 */
	public int insertComAuthrt(ComAuthrtVO comAuthVO) throws Exception;

	/**
	 * 권한정보 변경
	 * @param comAuthVO
	 * @return
	 */
	public int updateComAuthrt(ComAuthrtVO comAuthVO) throws Exception;

	/**
	 * 권한정보 삭제
	 * @param comAuthVO
	 * @return
	 */
	public HashMap<String, Object> deleteComAuthrt(ComAuthrtVO comAuthVO) throws Exception;
	
	/**
	 * 권한메뉴 단건 조회
	 * @param comAuthrtMenuVO
	 * @return
	 * @throws Exception
	 */
	public ComAuthrtMenuVO selectComAuthrtMenu(ComAuthrtMenuVO comAuthrtMenuVO) throws Exception;

	/**
	 * 권한 메뉴 목록 조회
	 * @param ComAuthrtMenuVO
	 * @return
	 */
	public List<ComAuthrtMenuVO> selectComAuthrtMenuList(ComAuthrtMenuVO comAuthrtMenuVO) throws Exception;

	/**
	 * 권한 화면 목록 조회
	 * @param ComAuthrtUiVO
	 * @return
	 */
	public List<ComAuthrtUiVO> selectComAuthrtUiList(ComAuthrtUiVO comAuthrtUiVO) throws Exception;

	/**
	 * 권한 메뉴트리 목록 조회
	 * @param ComAuthrtMenuVO
	 * @return
	 */
	public List<ComAuthrtMenuVO> selectComAuthrtMenuTreeList(ComAuthrtMenuVO comAuthrtMenuVO) throws Exception;

	/**
	 * 권한 메뉴 목록 등록
	 * @param comAuthrtVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertComAuthrtMenuList(ComAuthrtVO comAuthrtVO) throws Exception;

	/**
	 * 화면UI 권한 등록
	 * @param comAuthrtVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertComAuthrtUi(ComAuthrtMenuVO comAuthrtMenuVO) throws Exception;

	/**
	 * 권한별 메뉴정보를 등록한다.
	 * @param comAuthMenuVO
	 * @return
	 */
	public int insertComAuthrtMenu(ComAuthrtMenuVO comAuthrtMenuVO) throws Exception;

	/**
	 * 권한별 메뉴정보를 변경한다.
	 * @param comAuthMenuVO
	 * @return
	 */
	public int updateComAuthrtMenu(ComAuthrtMenuVO comAuthrtMenuVO) throws Exception;

	/**
	 * 권한별 메뉴정보를 삭제한다.
	 * @param comAuthMenuVO
	 * @return
	 */
	public int deleteComAuthrtMenu(ComAuthrtMenuVO comAuthrtMenuVO) throws Exception;


	/**
	 * 권한 사용자 목록 조회
	 * @param comAuthUserVO
	 * @return
	 */
	public List<ComAuthrtUserVO> selectComAuthrtUserList(ComAuthrtUserVO comAuthrtUserVO) throws Exception;

	/**
	 * 권한 등록 대상 사용자 목록 조회
	 * @param comAuthUserVO
	 * @return
	 */
	public List<ComAuthrtUserVO> selectAuthrtTrgtUserList(ComAuthrtUserVO comAuthUserVO) throws Exception;

	/**
	 * 권한 사용자정보를 조회한다.
	 * @param comAuthUserVO
	 * @return
	 */
	public ComAuthrtUserVO selectComAuthrtUser(ComAuthrtUserVO comAuthrtUserVO) throws Exception;

	/**
	 * 권한 사용자정보를 등록한다.
	 * @param comAuthrtUserVO
	 * @return
	 */
	public int insertComAuthrtUser(ComAuthrtUserVO comAuthrtUserVO) throws Exception;

	/**
	 * 권한 사용자정보를 변경한다.
	 * @param comAuthrtUserVO
	 * @return
	 */
	public int updateComAuthrtUser(ComAuthrtUserVO comAuthrtUserVO) throws Exception;

	/**
	 * 권한 사용자정보를 삭제한다.
	 * @param comAuthrtUserVO
	 * @return
	 */
	public int deleteComAuthrtUser(ComAuthrtUserVO comAuthrtUserVO) throws Exception;

	/**
	 * 권한 top 메뉴트리 목록 조회	: depth 2까지
	 * @param comAuthMenuVO
	 * @return
	 */
	public List<ComAuthrtMenuVO> selectTopMenuTreeList(ComAuthrtMenuVO comAuthrtMenuVO) throws Exception;

	/**
	 * 권한 Side 메뉴트리 목록 조회
	 * @param comAuthMenuVO
	 * @return
	 */
	public List<ComAuthrtMenuVO> selectSideMenuTreeList(ComAuthrtMenuVO comAuthrtMenuVO) throws Exception;

	/**
	 * 권한목록 조회 by userId
	 * @param comAuthrtVO
	 * @return
	 * @throws Exception
	 */
	public List<ComAuthrtVO> selectComAuthrtListByUserId(ComAuthrtVO comAuthrtVO) throws Exception;

	/**
	 * 화면권한 조회 by userId, menuId
	 * @param userId
	 * @param menuId
	 * @return
	 * @throws Exception
	 */
	public List<ComAuthrtUiVO> selectUserAuthrtUiList(String userId, String menuId) throws Exception;
	
	/**
	 * 권한 사용자 목록 등록
	 * @param comAuthrtVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertComAuthrtUserList(ComAuthrtVO comAuthrtVO) throws Exception;

	/**
	 * 권한 사용자 목록 삭제
	 * @param comAuthrtVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> deleteComAuthrtUserList(ComAuthrtVO comAuthrtVO) throws Exception;



	/**
	 * APC 사용 등록 시 APC의 권한그룹 등록 (관리자, 사용자)
	 * @param comAuthrtVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertApcAuthrtId(ComAuthrtVO comAuthrtVO) throws Exception;

	/**
	 * APC 메뉴간편설정 등록 시 APC의 권한 등록 (관리자, 사용자)
	 * @param comAuthrtVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertApcSimpleAuthrt(ComAuthrtVO comAuthrtVO) throws Exception;

	/**
	 * APC 메뉴설정 등록 시 APC의 권한 등록 (관리자, 사용자)
	 * @param comAuthrtVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertApcNormalAuthrt(ApcEvrmntStngVO apcEvrmntStngVO) throws Exception;

}
