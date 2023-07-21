package com.at.apcss.co.authrt.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.at.apcss.co.authrt.vo.ComAuthrtMenuVO;
import com.at.apcss.co.authrt.vo.ComAuthrtUiVO;
import com.at.apcss.co.authrt.vo.ComAuthrtUserVO;
import com.at.apcss.co.authrt.vo.ComAuthrtVO;

@Mapper
public interface ComAuthrtMapper {
	
	/**
	 * 권한정보 조회
	 * @param comAuthVO
	 * @return
	 */
	public ComAuthrtVO selectComAuthrt(ComAuthrtVO comAuthVO);
	
	/**
	 * 권한정보 등록
	 * @param comAuthVO
	 * @return
	 */
	public int insertComAuthrt(ComAuthrtVO comAuthVO);
	
	/**
	 * 권한정보 변경
	 * @param comAuthVO
	 * @return
	 */
	public int updateComAuthrt(ComAuthrtVO comAuthVO);
	
	/**
	 * 권한정보 삭제
	 * @param comAuthVO
	 * @return
	 */
	public int deleteComAuthrt(ComAuthrtVO comAuthVO);
	
	
	/**
	 * 권한정보 목록 조회
	 * @param comAuthVO
	 * @return List<>
	 */
	public List<ComAuthrtVO> selectComAuthrtList(ComAuthrtVO comAuthVO);
	
	/**
	 * 권한메뉴 단건 조회
	 * @param comAuthrtMenuVO
	 * @return
	 * @throws Exception
	 */
	public ComAuthrtMenuVO selectComAuthrtMenu(ComAuthrtMenuVO comAuthrtMenuVO) throws Exception;
	
	/**
	 * 권한 메뉴 목록 조회
	 * @param comAuthrtMenuVO
	 * @return
	 */
	public List<ComAuthrtMenuVO> selectComAuthrtMenuList(ComAuthrtMenuVO comAuthMenuVO);
	
	/**
	 * 권한 화면 목록 조회
	 * @param comAuthVO
	 * @return
	 */
	public List<ComAuthrtUiVO> selectComAuthrtUiList(ComAuthrtUiVO comAuthUiVO);
	
	/**
	 * 권한 메뉴트리 목록 조회
	 * @param comAuthMenuVO
	 * @return
	 */
	public List<ComAuthrtMenuVO> selectComAuthrtMenuTreeList(ComAuthrtMenuVO comAuthMenuVO);
	
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
	public List<ComAuthrtUserVO> selectComAuthrtUserList(ComAuthrtUserVO comAuthUserVO);
}
