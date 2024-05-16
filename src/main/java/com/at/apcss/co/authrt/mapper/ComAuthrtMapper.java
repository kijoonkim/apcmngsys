package com.at.apcss.co.authrt.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

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
	public ComAuthrtVO selectComAuthrt(ComAuthrtVO comAuthVO) throws Exception;

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
	public int deleteComAuthrt(ComAuthrtVO comAuthVO) throws Exception;
	/**
	 * 권한메뉴 삭제 by 권한id
	 * @param comAuthVO
	 * @return
	 * @throws Exception
	 */
	public int deleteComAuthrtMenuByAuthrtId(ComAuthrtVO comAuthVO) throws Exception;
	/**
	 * 권한사용자 삭제 by 권한id
	 * @param comAuthVO
	 * @return
	 * @throws Exception
	 */
	public int deleteComAuthrtUserByAuthrtId(ComAuthrtVO comAuthVO) throws Exception;


	/**
	 * 권한정보 목록 조회
	 * @param comAuthVO
	 * @return List<>
	 */
	public List<ComAuthrtVO> selectComAuthrtList(ComAuthrtVO comAuthVO) throws Exception;

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
	public List<ComAuthrtMenuVO> selectComAuthrtMenuList(ComAuthrtMenuVO comAuthMenuVO) throws Exception;


	/**
	 * 권한 화면 조회
	 * @param comAuthVO
	 * @return
	 */
	public ComAuthrtUiVO selectComAuthrtUi(ComAuthrtUiVO comAuthUiVO) throws Exception;

	/**
	 * 권한 화면 목록 조회
	 * @param comAuthVO
	 * @return
	 */
	public List<ComAuthrtUiVO> selectComAuthrtUiList(ComAuthrtUiVO comAuthUiVO) throws Exception;

	/**
	 * 사용자별 화면UI 권한 조회
	 * @param comAuthUiVO
	 * @return
	 */
	public List<ComAuthrtUiVO> selectUserAuthrtUiList(ComAuthrtUiVO comAuthUiVO) throws Exception;

	/**
	 * 사용자별 화면공통버튼 UI 권한 조회
	 * @param comAuthUiVO
	 * @return
	 */
	public List<ComAuthrtUiVO> selectUserAuthrtCmnsBtnList(ComAuthrtUiVO comAuthUiVO) throws Exception;

	/**
	 * 화면UI 권한 등록
	 * @param comAuthUiVO
	 * @return
	 * @throws Exception
	 */
	public int insertComAuthrtUi(ComAuthrtUiVO comAuthUiVO) throws Exception;

	/**
	 * 화면UI 권한 변경
	 * @param comAuthUiVO
	 * @return
	 * @throws Exception
	 */
	public int updateComAuthrtUi(ComAuthrtUiVO comAuthUiVO) throws Exception;

	/**
	 * 화면UI 권한 변경 : delYn >> Y
	 * @param comAuthUiVO
	 * @return
	 * @throws Exception
	 */
	public int updateComAuthrtUiForDelY(ComAuthrtUiVO comAuthUiVO) throws Exception;

	/**
	 * 화면UI 권한 삭제
	 * @param comAuthUiVO
	 * @return
	 * @throws Exception
	 */
	public int deleteComAuthrtUi(ComAuthrtUiVO comAuthUiVO) throws Exception;

	/**
	 * 권한 메뉴트리 목록 조회
	 * @param comAuthMenuVO
	 * @return
	 */
	public List<ComAuthrtMenuVO> selectComAuthrtMenuTreeList(ComAuthrtMenuVO comAuthMenuVO) throws Exception;

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
	 * 권한 사용자정보를 조회한다.
	 * @param comAuthUserVO
	 * @return
	 */
	public ComAuthrtUserVO selectComAuthrtUser(ComAuthrtUserVO comAuthrtUserVO) throws Exception;

	/**
	 * 
	 * @param comAuthrtUserVO
	 * @return
	 * @throws Exception
	 */
	public List<ComAuthrtUserVO> selectApcAuthrtUserList(ComAuthrtUserVO comAuthrtUserVO) throws Exception;
	
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
	public List<ComAuthrtUserVO> selectAuthrtTrgtUserList(ComAuthrtUserVO comAuthrtUserVO) throws Exception;

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
	 * 권한 사용자정보를 등록한다.
	 * @param ComAuthrtUserVO
	 * @return
	 */
	public int insertComAuthrtUser(ComAuthrtUserVO comAuthrtUserVO) throws Exception;

	/**
	 * 권한 사용자정보를 삭제한다.
	 * @param ComAuthrtUserVO
	 * @return
	 */
	public int deleteComAuthrtUser(ComAuthrtUserVO comAuthrtUserVO) throws Exception;

	
	/**
	 * 
	 * @param comAuthrtUserVO
	 * @return
	 * @throws Exception
	 */
	public int deleteApcUserAuthrt(ComAuthrtUserVO comAuthrtUserVO) throws Exception;
	
	
	/**
	 * 권한 내역 등록.
	 * @param ComAuthrtUserVO
	 * @return
	 */
	public int insertComAuthrtUserHsrty(ComAuthrtUserVO comAuthrtUserVO) throws Exception;

	/**
	 * 메뉴 즐겨찾기 등록
	 * @param comAuthrtUserVO
	 * @return
	 */
	public int insertBmk(ComAuthrtVO comAuthrtVO) throws Exception;
	/**
	 * 메뉴 즐겨찾기 삭제
	 * @param comAuthrtUserVO
	 * @return
	 */
	public int deleteBmk(ComAuthrtVO comAuthrtVO) throws Exception;
}
