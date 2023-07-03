package com.at.apcss.co.menu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.at.apcss.co.menu.vo.ComMenuVO;
import com.at.apcss.co.menu.vo.ComUiVO;

@Mapper
public interface ComMenuMapper {

	/**
	 * 메뉴정보 조회
	 * @param comMenuVO
	 * @return
	 */
	public ComMenuVO selectComMenu(ComMenuVO comMenuVO);

	/**
	 * 메뉴정보 목록 조회
	 * @param comMenuVO
	 * @return
	 */
	public List<ComMenuVO> selectComMenuList(ComMenuVO comMenuVO);

	/**
	 * 메뉴트리 목록 조회
	 * @param comMenuVO
	 * @return
	 */
	public List<ComMenuVO> selectMenuTreeList(ComMenuVO comMenuVO);

	/**
	 * 대메뉴 목록 조회
	 * @param comMenuVO
	 * @return
	 */
	public List<ComMenuVO> selectTopMenuList(ComMenuVO comMenuVO);

	/**
	 * 대메뉴 목록 조회
	 * @param comMenuVO
	 * @return
	 */
	public List<ComMenuVO> selectLeftMenuList(ComMenuVO comMenuVO);

	/**
	 * 메뉴 등록
	 * @param comMenuVO
	 * @return
	 */
	public int insertMenu(ComMenuVO comMenuVO);

	/**
	 * 메뉴 수정
	 * @param comMenuVO
	 * @return
	 */
	public int updateMenu(ComMenuVO comMenuVO);

	/**
	 * 메뉴 목록 조회
	 * @param comMenuVO
	 * @return
	 */
	public List<ComMenuVO> selectMenuList(ComMenuVO comMenuVO);

	/**
	 * 메뉴 삭제
	 * @param comMenuVO
	 * @return
	 */
	public int deleteMenu(ComMenuVO comMenuVO);

	/**
	 * 화면관리 목록 조회
	 * @param comMenuVO
	 * @return List<ComMenuVO>
	 */
	public List<ComMenuVO> selectMenuUiList(ComMenuVO comMenuVO);

	/**
	 * 화면관리 UI 목록 조회
	 * @param comMenuVO
	 * @return List<ComMenuVO>
	 */
	public List<ComUiVO> selectUiList(ComUiVO comUiVO);

	/**
	 * 화면관리 UI 등록
	 * @param comMenuVO
	 * @return ComUiVO
	 */
	public int insertComUi(ComUiVO comUiVO);


}
