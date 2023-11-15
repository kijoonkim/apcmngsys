package com.at.apcss.co.menu.service;

import java.util.List;

import com.at.apcss.co.menu.vo.ComMenuVO;
import com.at.apcss.co.menu.vo.ComUiVO;

public interface ComMenuService {

	/**
	 * 메뉴정보 조회
	 * @param comMenuVO
	 * @return
	 */
	public ComMenuVO selectComMenu(ComMenuVO comMenuVO) throws Exception;

	public ComMenuVO selectComMenu(String menuId) throws Exception;

	/**
	 * 메뉴목록 조회
	 * @param comMenuVO
	 * @return
	 */
	public List<ComMenuVO> selectComMenuList(ComMenuVO comMenuVO) throws Exception;

	/**
	 * 메뉴트리 목록 조회
	 * @param comMenuVO
	 * @return
	 */
	public List<ComMenuVO> selectMenuTreeList(ComMenuVO comMenuVO) throws Exception;

	/**
	 * 대메뉴 목록 조회
	 * @param comMenuVO
	 * @return
	 */
	public List<ComMenuVO> selectTopMenuList(ComMenuVO comMenuVO) throws Exception;

	/**
	 * 메뉴트리 목록 조회
	 * @param comMenuVO
	 * @return
	 */
	public List<ComMenuVO> selectLeftMenuList(ComMenuVO comMenuVO) throws Exception;

	/**
	 * 메뉴 등록
	 * @param comMenuVO
	 * @return
	 */
	public int insertMenu(ComMenuVO comMenuVO) throws Exception;

	/**
	 * 메뉴 수정
	 * @param comMenuVO
	 * @return
	 */
	public int updateMenu(ComMenuVO comMenuVO) throws Exception;

	/**
	 * 메뉴 목록 조회
	 * @param comMenuVO
	 * @return
	 */
	public List<ComMenuVO> selectMenuList(ComMenuVO comMenuVO) throws Exception;

	/**
	 * 메뉴 삭제
	 * @param comMenuVO
	 * @return
	 */
	public int deleteMenu(ComMenuVO comMenuVO) throws Exception;

	/**
	 * 화면 목록을 조회한다.
	 * @param comUiVO
	 * @return List<ComUiVO>
	 */
	public List<ComUiVO> selectComUiList(ComUiVO comUiVO) throws Exception;

	/**
	 * 화면 정보를 조회한다.
	 * @param comUiVO
	 * @return ComUiVO
	 */
	public ComUiVO selectComUi(ComUiVO comUiVO) throws Exception;

	/**
	 * 화면 정보를 등록한다.
	 * @param comUiVO
	 * @return
	 */
	public int insertComUi(ComUiVO comUiVO) throws Exception;

	/**
	 * 화면 정보를 변경한다.
	 * @param comUiVO
	 * @return
	 */
	public int updateComUi(ComUiVO comUiVO) throws Exception;

	/**
	 * 화면 정보를 삭제한다.
	 * @param comUiVO
	 * @return
	 */
	public int deleteComUi(ComUiVO comUiVO) throws Exception;

	/**
	 * 화면관리 목록 조회한다.
	 * @param comMenuVO
	 * @return List<ComMenuVO>
	 */
	public List<ComMenuVO> selectMenuUiList(ComMenuVO comMenuVO) throws Exception;

	/**
	 * 화면관리 UI 저장한다.
	 * @param List<ComUiVO>
	 * @return Integer
	 */
	public int multiSaveComUiList(List<ComUiVO> comUiList) throws Exception;


	/**
	 * 유형별 메뉴 목록 조회
	 * @param comMenuVO
	 * @return
	 */
	public List<ComMenuVO> selectMenuListByType(ComMenuVO comMenuVO) throws Exception;

}
