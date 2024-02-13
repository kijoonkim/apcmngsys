package com.at.apcss.co.authrt.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.at.apcss.am.apc.vo.ApcEvrmntStngVO;
import com.at.apcss.co.authrt.mapper.ComAuthrtMapper;
import com.at.apcss.co.authrt.service.ComAuthrtService;
import com.at.apcss.co.authrt.vo.ComAuthrtMenuVO;
import com.at.apcss.co.authrt.vo.ComAuthrtUiVO;
import com.at.apcss.co.authrt.vo.ComAuthrtUserVO;
import com.at.apcss.co.authrt.vo.ComAuthrtVO;
import com.at.apcss.co.constants.ApcConstants;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.menu.service.ComMenuService;
import com.at.apcss.co.menu.vo.ComMenuVO;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;
import com.at.apcss.co.user.mapper.ComUserMapper;
import com.at.apcss.co.user.vo.ComUserVO;

@Service("comAuthrtService")
public class ComAuthrtServiceImpl extends BaseServiceImpl implements ComAuthrtService {

	@Autowired
	private ComAuthrtMapper comAuthrtMapper;


	@Autowired
	private ComUserMapper comUserMapper;

	@Resource(name = "comMenuService")
	private ComMenuService comMenuService;

	@Override
	public ComAuthrtVO selectComAuthrt(ComAuthrtVO comAuthrtVO) throws Exception {

		ComAuthrtVO rtnVO = comAuthrtMapper.selectComAuthrt(comAuthrtVO);

		return rtnVO;
	}

	@Override
	public ComAuthrtVO selectComAuthrt(String authrtId) throws Exception {

		ComAuthrtVO comAuthrtVO = new ComAuthrtVO();
		comAuthrtVO.setAuthrtId(authrtId);

		ComAuthrtVO rtnVO = comAuthrtMapper.selectComAuthrt(comAuthrtVO);

		return rtnVO;
	}

	@Override
	public List<ComAuthrtVO> selectComAuthrtList(ComAuthrtVO comAuthrtVO) throws Exception {

		List<ComAuthrtVO> rtnList = comAuthrtMapper.selectComAuthrtList(comAuthrtVO);

		return rtnList;
	}


	@Override
	public int insertComAuthrt(ComAuthrtVO comAuthVO) throws Exception {

		int insertedCnt = comAuthrtMapper.insertComAuthrt(comAuthVO);

		return insertedCnt;
	}

	@Override
	public int updateComAuthrt(ComAuthrtVO comAuthVO) throws Exception {

		int updatedCnt = comAuthrtMapper.updateComAuthrt(comAuthVO);

		return updatedCnt;
	}

	@Override
	public HashMap<String, Object> deleteComAuthrt(ComAuthrtVO comAuthVO) throws Exception {

		// 권한 사용자 삭제
		comAuthrtMapper.deleteComAuthrtUserByAuthrtId(comAuthVO);

		// 권한 메뉴 삭제
		comAuthrtMapper.deleteComAuthrtMenuByAuthrtId(comAuthVO);

		// 권한 삭제
		comAuthrtMapper.deleteComAuthrt(comAuthVO);

		return null;
	}

	@Override
	public ComAuthrtMenuVO selectComAuthrtMenu(ComAuthrtMenuVO comAuthrtMenuVO) throws Exception {

		return comAuthrtMapper.selectComAuthrtMenu(comAuthrtMenuVO);
	}

	@Override
	public List<ComAuthrtMenuVO> selectComAuthrtMenuList(ComAuthrtMenuVO comAuthrtMenuVO) throws Exception {

		List<ComAuthrtMenuVO> rtnList = comAuthrtMapper.selectComAuthrtMenuList(comAuthrtMenuVO);

		return rtnList;
	}

	@Override
	public List<ComAuthrtUiVO> selectComAuthrtUiList(ComAuthrtUiVO comAuthrtUiVO) throws Exception {

		List<ComAuthrtUiVO> rtnList = comAuthrtMapper.selectComAuthrtUiList(comAuthrtUiVO);

		return rtnList;
	}

	@Override
	public List<ComAuthrtMenuVO> selectComAuthrtMenuTreeList(ComAuthrtMenuVO comAuthrtMenuVO) throws Exception {

		List<ComAuthrtMenuVO> rtnList = comAuthrtMapper.selectComAuthrtMenuTreeList(comAuthrtMenuVO);

		return rtnList;
	}

	@Override
	public List<ComAuthrtUserVO> selectComAuthrtUserList(ComAuthrtUserVO comAuthrtUserVO) throws Exception {

		List<ComAuthrtUserVO> rtnList = comAuthrtMapper.selectComAuthrtUserList(comAuthrtUserVO);

		return rtnList;
	}

	@Override
	public int insertComAuthrtMenu(ComAuthrtMenuVO comAuthrtMenuVO) throws Exception {

		int insertedCnt = 0;

		ComAuthrtMenuVO orgnAuthMenu = comAuthrtMapper.selectComAuthrtMenu(comAuthrtMenuVO);

		ComMenuVO menuInfo = comMenuService.selectComMenu(comAuthrtMenuVO.getMenuId());

		if (	menuInfo == null
				|| !StringUtils.hasText(menuInfo.getMenuId())
				|| !ComConstants.CON_NONE.equals(menuInfo.getDelYn())) {
			return 0;
		}

		String authrtType = ComUtil.nullToEmpty(comAuthrtMenuVO.getAuthrtType());
		if (StringUtils.hasText(authrtType)) {
			String menuAuthrtType = ComUtil.nullToEmpty(menuInfo.getAuthrtType());

			if (ComConstants.CON_AUTHRT_TYPE_ADMIN.equals(authrtType)) {
				if (	ComConstants.CON_AUTHRT_TYPE_SYS.equals(menuAuthrtType)
						|| ComConstants.CON_AUTHRT_TYPE_AT.equals(menuAuthrtType)) {
					return 0;
				}
			} else if (ComConstants.CON_AUTHRT_TYPE_USER.equals(authrtType)) {
				if (	ComConstants.CON_AUTHRT_TYPE_SYS.equals(menuAuthrtType)
						|| ComConstants.CON_AUTHRT_TYPE_AT.equals(menuAuthrtType)
						|| ComConstants.CON_AUTHRT_TYPE_ADMIN.equals(menuAuthrtType)
						) {
					return 0;
				}
			} else {}
		}

		if (orgnAuthMenu == null || !StringUtils.hasText(orgnAuthMenu.getMenuId())) {

			insertedCnt = comAuthrtMapper.insertComAuthrtMenu(comAuthrtMenuVO);
			orgnAuthMenu = comAuthrtMapper.selectComAuthrtMenu(comAuthrtMenuVO);

			if (orgnAuthMenu != null && StringUtils.hasText(orgnAuthMenu.getUpMenuId())) {
				ComAuthrtMenuVO upParam = new ComAuthrtMenuVO();
				upParam.setMenuId(orgnAuthMenu.getUpMenuId());
				upParam.setAuthrtId(comAuthrtMenuVO.getAuthrtId());
				ComAuthrtMenuVO upAuthMenu = comAuthrtMapper.selectComAuthrtMenu(upParam);
				if (upAuthMenu == null || !StringUtils.hasText(upAuthMenu.getMenuId())) {
					comAuthrtMenuVO.setMenuId(orgnAuthMenu.getUpMenuId());
					insertComAuthrtMenu(comAuthrtMenuVO);
				}
			}
		}

		return insertedCnt;
	}

	@Override
	public int updateComAuthrtMenu(ComAuthrtMenuVO comAuthrtMenuVO) throws Exception {

		int updatedCnt = comAuthrtMapper.updateComAuthrtMenu(comAuthrtMenuVO);

		return updatedCnt;
	}

	@Override
	public int deleteComAuthrtMenu(ComAuthrtMenuVO comAuthrtMenuVO) throws Exception {

		int deletedCnt = 0;

		ComAuthrtMenuVO orgnAuthMenu = comAuthrtMapper.selectComAuthrtMenu(comAuthrtMenuVO);

		if (orgnAuthMenu != null && StringUtils.hasText(orgnAuthMenu.getMenuId())) {
			deletedCnt = comAuthrtMapper.deleteComAuthrtMenu(comAuthrtMenuVO);
			if (StringUtils.hasText(orgnAuthMenu.getUpMenuId())) {
				ComAuthrtMenuVO upParam = new ComAuthrtMenuVO();
				upParam.setUpMenuId(orgnAuthMenu.getUpMenuId());
				upParam.setAuthrtId(comAuthrtMenuVO.getAuthrtId());
				List<ComAuthrtMenuVO> subAuthMenuList = comAuthrtMapper.selectComAuthrtMenuList(upParam);
				if (subAuthMenuList == null || subAuthMenuList.isEmpty()) {
					comAuthrtMenuVO.setMenuId(orgnAuthMenu.getUpMenuId());
					deleteComAuthrtMenu(comAuthrtMenuVO);
				}
			}
		}

		return deletedCnt;
	}

	@Override
	public ComAuthrtUserVO selectComAuthrtUser(ComAuthrtUserVO comAuthrtUserVO) throws Exception {

		ComAuthrtUserVO rtnVO = comAuthrtMapper.selectComAuthrtUser(comAuthrtUserVO);

		return rtnVO;
	}

	@Override
	public int insertComAuthrtUser(ComAuthrtUserVO comAuthrtUserVO) throws Exception {

		int insertedCnt = comAuthrtMapper.insertComAuthrtUser(comAuthrtUserVO);

		return insertedCnt;
	}

	@Override
	public int updateComAuthrtUser(ComAuthrtUserVO comAuthrtUserVO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteComAuthrtUser(ComAuthrtUserVO comAuthrtUserVO) throws Exception {

		int deletedCnt = comAuthrtMapper.deleteComAuthrtUser(comAuthrtUserVO);

		return deletedCnt;
	}

	@Override
	public HashMap<String, Object> insertComAuthrtMenuList(ComAuthrtVO comAuthrtVO) throws Exception {

		List<ComAuthrtMenuVO> comAuthrtMenuList = comAuthrtVO.getComAuthrtMenuList();

		for ( ComAuthrtMenuVO menu : comAuthrtMenuList ) {
			if (ComConstants.CON_YES.equals(menu.getUseYn()) && StringUtils.hasText(menu.getUpMenuId())) {
				setUseAuthrtList(comAuthrtMenuList, menu.getUpMenuId());
			}
		}

		for ( ComAuthrtMenuVO menu : comAuthrtMenuList ) {

			ComAuthrtMenuVO comAuthrtMenuVO = new ComAuthrtMenuVO();
			BeanUtils.copyProperties(comAuthrtVO, comAuthrtMenuVO);

			BeanUtils.copyProperties(menu, comAuthrtMenuVO,
						ComConstants.PROP_COL_AUTHRT_ID,
						ComConstants.PROP_SYS_FRST_INPT_DT,
						ComConstants.PROP_SYS_FRST_INPT_USER_ID,
						ComConstants.PROP_SYS_FRST_INPT_PRGRM_ID,
						ComConstants.PROP_SYS_LAST_CHG_DT,
						ComConstants.PROP_SYS_LAST_CHG_USER_ID,
						ComConstants.PROP_SYS_LAST_CHG_PRGRM_ID
					);

			ComAuthrtMenuVO orgnVO = selectComAuthrtMenu(comAuthrtMenuVO);
			boolean voExists = orgnVO != null && StringUtils.hasText(orgnVO.getAuthrtId());

			// FIXME ComAuthUi 정보 등록
			if (ComConstants.CON_YES.equals(menu.getUseYn())) {
				// 기등록 메뉴id 인지 확인
				if (voExists) {
					// update
					// updateComAuthrtMenu(comAuthrtMenuVO);
				} else {
					// insert
					insertComAuthrtMenu(comAuthrtMenuVO);
				}
			} else {
				if (voExists) {
					// delete 권한메뉴
					deleteComAuthrtMenu(comAuthrtMenuVO);
				}
			}

			logger.debug("$$$$$	aaaa	$$$$$$$$$$$$$$");
		}

		return null;
	}

	/**
	 * 하위메뉴 권한 등록 시 상위메뉴 사용 설정
	 * @param menuList
	 * @param upMenuId
	 */
	private void setUseAuthrtList(List<ComAuthrtMenuVO> menuList, String upMenuId) {
		if (!StringUtils.hasText(upMenuId)) {
			return;
		}

		for ( ComAuthrtMenuVO menu : menuList ) {
			if (upMenuId.equals(menu.getMenuId()) && !ComConstants.CON_YES.equals(menu.getUseYn()) ) {
				menu.setUseYn(ComConstants.CON_YES);
				if (StringUtils.hasText(menu.getUpMenuId())) {
					setUseAuthrtList(menuList, menu.getUpMenuId());
					break;
				}
			}
		}
	}


	@Override
	public List<ComAuthrtMenuVO> selectTopMenuTreeList(ComAuthrtMenuVO comAuthrtMenuVO) throws Exception {

		if (StringUtils.hasText(comAuthrtMenuVO.getUserId())) {

			List<String> authrtIdList = new ArrayList<>();

			ComAuthrtVO comAuthrtVO = new ComAuthrtVO();
			comAuthrtVO.setUserId(comAuthrtMenuVO.getUserId());

			List<ComAuthrtVO> comAuthrtList = selectComAuthrtListByUserId(comAuthrtVO);
			for ( ComAuthrtVO authrt : comAuthrtList ) {
				authrtIdList.add(authrt.getAuthrtId());
			}

			if (authrtIdList.isEmpty()) {
				return new ArrayList<ComAuthrtMenuVO>();
			}

			comAuthrtMenuVO.setAuthrtIdList(authrtIdList);
		}

		List<ComAuthrtMenuVO> rtnList = comAuthrtMapper.selectTopMenuTreeList(comAuthrtMenuVO);

		return rtnList;
	}

	@Override
	public List<ComAuthrtMenuVO> selectSideMenuTreeList(ComAuthrtMenuVO comAuthrtMenuVO) throws Exception {

		if (StringUtils.hasText(comAuthrtMenuVO.getUserId())) {

			List<String> authrtIdList = new ArrayList<>();

			ComAuthrtVO comAuthrtVO = new ComAuthrtVO();
			comAuthrtVO.setUserId(comAuthrtMenuVO.getUserId());

			List<ComAuthrtVO> comAuthrtList = selectComAuthrtListByUserId(comAuthrtVO);
			for ( ComAuthrtVO authrt : comAuthrtList ) {
				authrtIdList.add(authrt.getAuthrtId());
			}

			if (authrtIdList.isEmpty()) {
				return new ArrayList<ComAuthrtMenuVO>();
			}

			comAuthrtMenuVO.setAuthrtIdList(authrtIdList);
		}

		List<ComAuthrtMenuVO> rtnList = comAuthrtMapper.selectSideMenuTreeList(comAuthrtMenuVO);

		return rtnList;
	}

	@Override
	public List<ComAuthrtVO> selectComAuthrtListByUserId(ComAuthrtVO comAuthrtVO) throws Exception {

		List<ComAuthrtVO> rtnList = comAuthrtMapper.selectComAuthrtListByUserId(comAuthrtVO);

		return rtnList;
	}

	@Override
	public List<ComAuthrtUserVO> selectAuthrtTrgtUserList(ComAuthrtUserVO comAuthrtUserVO) throws Exception {

		List<ComAuthrtUserVO> rtnList = comAuthrtMapper.selectAuthrtTrgtUserList(comAuthrtUserVO);

		return rtnList;
	}

	@Override
	public HashMap<String, Object> insertComAuthrtUserList(ComAuthrtVO comAuthrtVO) throws Exception {

		List<ComAuthrtUserVO> comAuthrtUserList = comAuthrtVO.getComAuthrtUserList();

		for ( ComAuthrtUserVO user : comAuthrtUserList ) {

			ComAuthrtUserVO comAuthrtUserVO = new ComAuthrtUserVO();
			BeanUtils.copyProperties(comAuthrtVO, comAuthrtUserVO);

			BeanUtils.copyProperties(user, comAuthrtUserVO,
						ComConstants.PROP_COL_AUTHRT_ID,
						ComConstants.PROP_SYS_FRST_INPT_DT,
						ComConstants.PROP_SYS_FRST_INPT_USER_ID,
						ComConstants.PROP_SYS_FRST_INPT_PRGRM_ID,
						ComConstants.PROP_SYS_LAST_CHG_DT,
						ComConstants.PROP_SYS_LAST_CHG_USER_ID,
						ComConstants.PROP_SYS_LAST_CHG_PRGRM_ID
					);
			int insertedCnt = insertComAuthrtUser(comAuthrtUserVO);
			if (insertedCnt != 1) {
				throw new EgovBizException(getMessage(ComConstants.MSGCD_ERR_PARAM_ONE, "사용자 권한등록".split("\\|\\|")), new Exception());	// "E0003 {0} 시 오류가 발생하였습니다.
			}
			comAuthrtUserVO.setFlfmtTaskSeCd("04");

			if(1 != insertComAuthrtUserHsrty(comAuthrtUserVO)) {
				throw new EgovBizException(getMessage(ComConstants.MSGCD_ERR_PARAM_ONE, "사용자권한 내역등록".split("\\|\\|")), new Exception());	// "E0003 {0} 시 오류가 발생하였습니다.
			}
		}

		return null;
	}

	@Override
	public HashMap<String, Object> deleteComAuthrtUserList(ComAuthrtVO comAuthrtVO) throws Exception {

		List<ComAuthrtUserVO> comAuthrtUserList = comAuthrtVO.getComAuthrtUserList();

		for ( ComAuthrtUserVO user : comAuthrtUserList ) {

			ComAuthrtUserVO comAuthrtUserVO = new ComAuthrtUserVO();
			BeanUtils.copyProperties(comAuthrtVO, comAuthrtUserVO);

			BeanUtils.copyProperties(user, comAuthrtUserVO,
						ComConstants.PROP_COL_AUTHRT_ID,
						ComConstants.PROP_SYS_FRST_INPT_DT,
						ComConstants.PROP_SYS_FRST_INPT_USER_ID,
						ComConstants.PROP_SYS_FRST_INPT_PRGRM_ID,
						ComConstants.PROP_SYS_LAST_CHG_DT,
						ComConstants.PROP_SYS_LAST_CHG_USER_ID,
						ComConstants.PROP_SYS_LAST_CHG_PRGRM_ID
					);

			if(1 != deleteComAuthrtUser(comAuthrtUserVO)) {
				throw new EgovBizException(getMessage(ComConstants.MSGCD_ERR_PARAM_ONE, "사용자권한 삭제".split("\\|\\|")), new Exception());	// "E0003 {0} 시 오류가 발생하였습니다.
			}
			comAuthrtUserVO.setFlfmtTaskSeCd("03");
			if(1 != insertComAuthrtUserHsrty(comAuthrtUserVO)) {
				throw new EgovBizException(getMessage(ComConstants.MSGCD_ERR_PARAM_ONE, "사용자권한 내역등록".split("\\|\\|")), new Exception());	// "E0003 {0} 시 오류가 발생하였습니다.
			}
		}

		return null;
	}

	@Override
	public HashMap<String, Object> insertApcAuthrtId(ComAuthrtVO comAuthrtVO) throws Exception {

		// audit
		String sysUserId = comAuthrtVO.getSysLastChgUserId();
		String sysPrgrmId = comAuthrtVO.getSysLastChgPrgrmId();

		// parameter
		String apcCd = comAuthrtVO.getApcCd();
		String userId = comAuthrtVO.getUserId();

		// APC 관리자 승인 등록 시
		// 10. 해당 APC의 권한그룹 등록 (관리자 승인 시 1회)
		// 11. 관리자 권한에 권한메뉴 등록 (업무지원 + APC 환경설정)
		// 20. 해당 userId 권한사용자 등록

		// 00. validation check
		if (!StringUtils.hasText(apcCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드");
		}

		if (!StringUtils.hasText(userId)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "사용자ID");
		}

		// 사용자 유형 확인
		ComUserVO paramUser = new ComAuthrtUserVO();
		paramUser.setUserId(userId);

		ComUserVO comUserVO = comUserMapper.selectComUser(paramUser);
		if (comUserVO == null || !StringUtils.hasText(comUserVO.getUserId())) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "사용자정보");
		}

		if (!ComConstants.CON_USER_STTS_VALID.equals(comUserVO.getUserStts())) {
			return ComUtil.getResultMap(ComConstants.MSGCD_ALEADY_DONE, "승인||사용자");	// W0010	이미 {0}된 {1} 입니다.
		}

		String apcNm = comUserVO.getApcNm();
		String userType = comUserVO.getUserType();
		String authrtType = ComConstants.CON_BLANK;

		if (ComConstants.CON_USER_TYPE_ADMIN.equals(userType)) {
			authrtType = ComConstants.CON_AUTHRT_TYPE_ADMIN;
		} else if (ComConstants.CON_USER_TYPE_USER.equals(userType)) {
			authrtType = ComConstants.CON_AUTHRT_TYPE_USER;
		} else {
			HashMap<String, Object> resultMap = ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "사용자유형");
			return resultMap;
		}

		// apc 권한 정보 조회
		ComAuthrtVO authrtParam = new ComAuthrtVO();
		authrtParam.setApcCd(apcCd);
		List<ComAuthrtVO> authrtList = selectComAuthrtList(authrtParam);

		// 01. 해당 APC의 권한그룹 등록 (관리자 승인 시 1회)
		// 권한그룹 등록 확인
		if (ComConstants.CON_AUTHRT_TYPE_ADMIN.equals(authrtType)
				|| ComConstants.CON_AUTHRT_TYPE_USER.equals(authrtType)
				) {

			if (authrtList == null || authrtList.isEmpty()) {
				// 권한 그룹 생성 admin + user
				ComAuthrtVO newAuthrtVO = new ComAuthrtVO();

				newAuthrtVO.setSysFrstInptUserId(sysUserId);
				newAuthrtVO.setSysFrstInptPrgrmId(sysPrgrmId);
				newAuthrtVO.setSysLastChgUserId(sysUserId);
				newAuthrtVO.setSysLastChgPrgrmId(sysPrgrmId);

				newAuthrtVO.setApcCd(apcCd);

				String apcAdminAuthrtNm = String.format("%s %s", apcNm, ApcConstants.PREFIX_AUTHRT_NM_ADMIN);
				String apcUserAuthrtNm = String.format("%s %s", apcNm, ApcConstants.PREFIX_AUTHRT_NM_USER);

				// admin
				newAuthrtVO.setAuthrtNm(apcAdminAuthrtNm);
				newAuthrtVO.setAuthrtType(ComConstants.CON_AUTHRT_TYPE_ADMIN);
				int insertedCnt = insertComAuthrt(newAuthrtVO);
				if (insertedCnt != 1) {
					throw new EgovBizException(getMessage(ComConstants.MSGCD_ERR_PARAM_ONE, "APC관리자 권한등록".split("\\|\\|")), new Exception());	// "E0003 {0} 시 오류가 발생하였습니다.
				}

				// user
				newAuthrtVO.setAuthrtNm(apcUserAuthrtNm);
				newAuthrtVO.setAuthrtType(ComConstants.CON_AUTHRT_TYPE_USER);
				insertedCnt = insertComAuthrt(newAuthrtVO);
				if (insertedCnt != 1) {
					throw new EgovBizException(getMessage(ComConstants.MSGCD_ERR_PARAM_ONE, "APC사용자 권한등록".split("\\|\\|")), new Exception());	// "E0003 {0} 시 오류가 발생하였습니다.
				}

				// 등록 후 권한그룹 재조회
				authrtList = selectComAuthrtList(authrtParam);
				// 관리자 권한에 권한메뉴 등록
				String adminAuthrtId = ComConstants.CON_BLANK;
				for ( ComAuthrtVO auth : authrtList ) {
					if (!StringUtils.hasText(adminAuthrtId)
							&& ComConstants.CON_AUTHRT_TYPE_ADMIN.equals(auth.getAuthrtType())) {
						adminAuthrtId = auth.getAuthrtId();
						break;
					}
				}

				if (StringUtils.hasText(adminAuthrtId)) {
					ComAuthrtMenuVO newAuthrtMenuVO = new ComAuthrtMenuVO();
					newAuthrtMenuVO.setSysFrstInptUserId(sysUserId);
					newAuthrtMenuVO.setSysFrstInptPrgrmId(sysPrgrmId);
					newAuthrtMenuVO.setSysLastChgUserId(sysUserId);
					newAuthrtMenuVO.setSysLastChgPrgrmId(sysPrgrmId);

					// 업무지원시스템 메뉴등록
					newAuthrtMenuVO.setAuthrtId(adminAuthrtId);
					newAuthrtMenuVO.setMenuId(ApcConstants.MENU_ID_AM);
					insertedCnt = insertComAuthrtMenu(newAuthrtMenuVO);
					if (insertedCnt != 1) {
						throw new EgovBizException(getMessage(ComConstants.MSGCD_ERR_PARAM_ONE, "업무메뉴 권한등록".split("\\|\\|")), new Exception());	// "E0003 {0} 시 오류가 발생하였습니다.
					}

					// APC환경설정 메뉴등록
					newAuthrtMenuVO.setAuthrtId(adminAuthrtId);
					newAuthrtMenuVO.setMenuId(ApcConstants.MENU_ID_AM_APC_EVRMNT_STNG);

					insertedCnt = insertComAuthrtMenu(newAuthrtMenuVO);
					if (insertedCnt != 1) {
						throw new EgovBizException(getMessage(ComConstants.MSGCD_ERR_PARAM_ONE, "업무메뉴 권한등록".split("\\|\\|")), new Exception());	// "E0003 {0} 시 오류가 발생하였습니다.
					}

				}
			} else {

			}
		}

		// 20. 해당 userId 권한사용자 등록
		String newAuthrtId = ComConstants.CON_BLANK;
		for ( ComAuthrtVO auth : authrtList ) {
			if (!StringUtils.hasText(newAuthrtId)
					&& authrtType.equals(auth.getAuthrtType())) {
				newAuthrtId = auth.getAuthrtId();
				break;
			}
		}


		if (StringUtils.hasText(newAuthrtId)) {
			ComAuthrtUserVO newAuthrtUserVO = new ComAuthrtUserVO();
			newAuthrtUserVO.setSysFrstInptUserId(sysUserId);
			newAuthrtUserVO.setSysFrstInptPrgrmId(sysPrgrmId);
			newAuthrtUserVO.setSysLastChgUserId(sysUserId);
			newAuthrtUserVO.setSysLastChgPrgrmId(sysPrgrmId);

			newAuthrtUserVO.setAuthrtId(newAuthrtId);
			newAuthrtUserVO.setUserId(userId);

			// 등록 확인
			ComAuthrtUserVO authrtUserInfo = selectComAuthrtUser(newAuthrtUserVO);
			if (authrtUserInfo == null || StringUtils.hasText(authrtUserInfo.getUserId())) {
				int insertedCnt = insertComAuthrtUser(newAuthrtUserVO);
				if (insertedCnt != 1) {
					throw new EgovBizException(getMessage(ComConstants.MSGCD_ERR_PARAM_ONE, "사용자 권한등록".split("\\|\\|")), new Exception());	// "E0003 {0} 시 오류가 발생하였습니다.
				}
				newAuthrtUserVO.setFlfmtTaskSeCd("04");
				if(1 != insertComAuthrtUserHsrty(newAuthrtUserVO)) {
					throw new EgovBizException(getMessage(ComConstants.MSGCD_ERR_PARAM_ONE, "사용자권한 내역등록".split("\\|\\|")), new Exception());	// "E0003 {0} 시 오류가 발생하였습니다.
				}
			}
		}

		return null;
	}

	@Override
	public HashMap<String, Object> insertApcSimpleAuthrt(ComAuthrtVO comAuthrtVO) throws Exception {

		String sysUserId = comAuthrtVO.getSysLastChgUserId();
		String sysPrgrmId = comAuthrtVO.getSysLastChgPrgrmId();

		// APC코드, CASE 정보를 받아 권한메뉴, 권한UI 정보를 등록한다 (Template)

		String refAuthrtIdAdmin = ComConstants.CON_BLANK;
		String refAuthrtIdUser = ComConstants.CON_BLANK;

		String authrtCaseId = comAuthrtVO.getAuthrtCaseId();
		String apcCd = comAuthrtVO.getApcCd();

		if (!StringUtils.hasText(authrtCaseId)) {
			HashMap<String, Object> resultMap = ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "권한 CASE");
			return resultMap;
		}
		if (!StringUtils.hasText(apcCd)) {
			HashMap<String, Object> resultMap = ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드");
			return resultMap;
		}

		if (ApcConstants.AUTHRT_CASE_01.equals(authrtCaseId)) {
			refAuthrtIdAdmin = ApcConstants.AUTHRT_ID_CASE_01_ADMIN;
			refAuthrtIdUser = ApcConstants.AUTHRT_ID_CASE_01_USER;
		} else if (ApcConstants.AUTHRT_CASE_02.equals(authrtCaseId)) {
			refAuthrtIdAdmin = ApcConstants.AUTHRT_ID_CASE_02_ADMIN;
			refAuthrtIdUser = ApcConstants.AUTHRT_ID_CASE_02_USER;
		} else if (ApcConstants.AUTHRT_CASE_03.equals(authrtCaseId)) {
			refAuthrtIdAdmin = ApcConstants.AUTHRT_ID_CASE_03_ADMIN;
			refAuthrtIdUser = ApcConstants.AUTHRT_ID_CASE_03_USER;
		} else if (ApcConstants.AUTHRT_CASE_04.equals(authrtCaseId)) {
			refAuthrtIdAdmin = ApcConstants.AUTHRT_ID_CASE_04_ADMIN;
			refAuthrtIdUser = ApcConstants.AUTHRT_ID_CASE_04_USER;
		} else if (ApcConstants.AUTHRT_CASE_05.equals(authrtCaseId)) {
			refAuthrtIdAdmin = ApcConstants.AUTHRT_ID_CASE_05_ADMIN;
			refAuthrtIdUser = ApcConstants.AUTHRT_ID_CASE_05_USER;
		} else if (ApcConstants.AUTHRT_CASE_06.equals(authrtCaseId)) {
			refAuthrtIdAdmin = ApcConstants.AUTHRT_ID_CASE_06_ADMIN;
			refAuthrtIdUser = ApcConstants.AUTHRT_ID_CASE_06_USER;
		} else if (ApcConstants.AUTHRT_CASE_07.equals(authrtCaseId)) {
			refAuthrtIdAdmin = ApcConstants.AUTHRT_ID_CASE_07_ADMIN;
			refAuthrtIdUser = ApcConstants.AUTHRT_ID_CASE_07_USER;
		} else if (ApcConstants.AUTHRT_CASE_08.equals(authrtCaseId)) {
			refAuthrtIdAdmin = ApcConstants.AUTHRT_ID_CASE_08_ADMIN;
			refAuthrtIdUser = ApcConstants.AUTHRT_ID_CASE_08_USER;
		} else if (ApcConstants.AUTHRT_CASE_09.equals(authrtCaseId)) {
			refAuthrtIdAdmin = ApcConstants.AUTHRT_ID_CASE_09_ADMIN;
			refAuthrtIdUser = ApcConstants.AUTHRT_ID_CASE_09_USER;
		} else if (ApcConstants.AUTHRT_CASE_10.equals(authrtCaseId)) {
			refAuthrtIdAdmin = ApcConstants.AUTHRT_ID_CASE_10_ADMIN;
			refAuthrtIdUser = ApcConstants.AUTHRT_ID_CASE_10_USER;
		} else if (ApcConstants.AUTHRT_CASE_11.equals(authrtCaseId)) {
			refAuthrtIdAdmin = ApcConstants.AUTHRT_ID_CASE_11_ADMIN;
			refAuthrtIdUser = ApcConstants.AUTHRT_ID_CASE_11_USER;
		} else {
			refAuthrtIdAdmin = ComConstants.CON_BLANK;
			refAuthrtIdUser = ComConstants.CON_BLANK;
		}


		// 기본 관리자 권한 SETTING 필요

		if (!StringUtils.hasText(authrtCaseId)) {
			HashMap<String, Object> resultMap = ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "참조 권한ID");
			return resultMap;
		}

		// apc 권한 정보 조회 관리자
		ComAuthrtVO authrtParam = new ComAuthrtVO();
		authrtParam.setApcCd(apcCd);
		authrtParam.setAuthrtType(ComConstants.CON_AUTHRT_TYPE_ADMIN);
		List<ComAuthrtVO> adminAuthrtList = selectComAuthrtList(authrtParam);

		ComAuthrtMenuVO menuParam = new ComAuthrtMenuVO();
		menuParam.setAuthrtId(refAuthrtIdAdmin);
		List<ComAuthrtMenuVO> adminAuthrtMenuList = selectComAuthrtMenuList(menuParam);

		// admin 권한메뉴 select
		// 권한 delete && insert
		for ( ComAuthrtVO authrt : adminAuthrtList ) {

			String authrtId = authrt.getAuthrtId();

			// 기존 menu 삭제
			ComAuthrtMenuVO pMenu = new ComAuthrtMenuVO();
			pMenu.setAuthrtId(authrtId);
			List<ComAuthrtMenuVO> orgnMenuList = selectComAuthrtMenuList(pMenu);

			// delete menu
			for ( ComAuthrtMenuVO orgnMenu : orgnMenuList ) {
				orgnMenu.setSysLastChgUserId(sysUserId);
				orgnMenu.setSysLastChgPrgrmId(sysPrgrmId);
				deleteComAuthrtMenu(orgnMenu);
			}

			// insert menu
			for ( ComAuthrtMenuVO newMenu : adminAuthrtMenuList ) {
				newMenu.setAuthrtId(authrtId);
				newMenu.setSysFrstInptUserId(sysUserId);
				newMenu.setSysFrstInptPrgrmId(sysPrgrmId);
				newMenu.setSysLastChgUserId(sysUserId);
				newMenu.setSysLastChgPrgrmId(sysPrgrmId);
				insertComAuthrtMenu(newMenu);
			}
		}

		// apc 권한 정보 조회 ##사용자
		authrtParam.setAuthrtType(ComConstants.CON_AUTHRT_TYPE_USER);
		List<ComAuthrtVO> userAuthrtList = selectComAuthrtList(authrtParam);

		menuParam.setAuthrtId(refAuthrtIdUser);
		List<ComAuthrtMenuVO> userAuthrtMenuList = selectComAuthrtMenuList(menuParam);

		// user 권한메뉴 select
		// 권한 delete && insert
		for ( ComAuthrtVO authrt : userAuthrtList ) {

			String authrtId = authrt.getAuthrtId();

			// 기존 menu 삭제
			ComAuthrtMenuVO pMenu = new ComAuthrtMenuVO();
			pMenu.setAuthrtId(authrtId);
			List<ComAuthrtMenuVO> orgnMenuList = selectComAuthrtMenuList(pMenu);

			// delete menu
			for ( ComAuthrtMenuVO orgnMenu : orgnMenuList ) {
				orgnMenu.setSysLastChgUserId(sysUserId);
				orgnMenu.setSysLastChgPrgrmId(sysPrgrmId);
				deleteComAuthrtMenu(orgnMenu);
			}

			// insert menu
			for ( ComAuthrtMenuVO newMenu : userAuthrtMenuList ) {
				newMenu.setAuthrtId(authrtId);
				newMenu.setSysFrstInptUserId(sysUserId);
				newMenu.setSysFrstInptPrgrmId(sysPrgrmId);
				newMenu.setSysLastChgUserId(sysUserId);
				newMenu.setSysLastChgPrgrmId(sysPrgrmId);
				insertComAuthrtMenu(newMenu);
			}
		}

		return null;
	}

	@Override
	public HashMap<String, Object> insertApcNormalAuthrt(ApcEvrmntStngVO apcEvrmntStngVO) throws Exception {
		String sysUserId = apcEvrmntStngVO.getSysLastChgUserId();
		String sysPrgrmId = apcEvrmntStngVO.getSysLastChgPrgrmId();

		String apcCd = apcEvrmntStngVO.getApcCd();

		if (!StringUtils.hasText(apcCd)) {
			HashMap<String, Object> resultMap = ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드");
			return resultMap;
		}

		// apc 권한 정보 조회 관리자
		ComAuthrtVO authrtParam = new ComAuthrtVO();
		authrtParam.setApcCd(apcCd);
		authrtParam.setAuthrtType(ComConstants.CON_AUTHRT_TYPE_ADMIN);
		List<ComAuthrtVO> adminAuthrtList = selectComAuthrtList(authrtParam);

		List<String> authrtTypeList = new ArrayList<>();
		ComMenuVO menuParam = new ComMenuVO();
		menuParam.setSysId(ComConstants.CON_SYS_ID_CO);

		authrtTypeList.add(ComConstants.CON_AUTHRT_TYPE_ADMIN);
		authrtTypeList.add(ComConstants.CON_AUTHRT_TYPE_USER);
		menuParam.setAuthrtTypeList(authrtTypeList);

		List<ComMenuVO> apcAdminCoMenuList = comMenuService.selectMenuListByType(menuParam);

		// admin 권한메뉴 select
		// 권한 delete && insert
		for ( ComAuthrtVO authrt : adminAuthrtList ) {

			String authrtId = authrt.getAuthrtId();

			ComAuthrtMenuVO authMenu = new ComAuthrtMenuVO();
			authMenu.setSysFrstInptUserId(sysUserId);
			authMenu.setSysFrstInptPrgrmId(sysPrgrmId);
			authMenu.setSysLastChgUserId(sysUserId);
			authMenu.setSysLastChgPrgrmId(sysPrgrmId);
			authMenu.setAuthrtId(authrtId);

			authMenu.setAuthrtType(ComConstants.CON_AUTHRT_TYPE_ADMIN);

			// 시스템관리 메뉴 권한 등록
			if (apcAdminCoMenuList != null && !apcAdminCoMenuList.isEmpty()) {
				for ( ComMenuVO coMenu : apcAdminCoMenuList ) {
					authMenu.setMenuId(coMenu.getMenuId());
					insertComAuthrtMenu(authMenu);
				}
			}

			// 기본 권한메뉴 등록
			for ( String menuId : ComConstants.MENU_ID_AM_CMNS ) {
				authMenu.setMenuId(menuId);
				insertComAuthrtMenu(authMenu);
			}

			//	wghMngYn 계량정보관리유무	MENU_ID_WGH
			for ( String menuId : ComConstants.MENU_ID_WGH ) {

				authMenu.setMenuId(menuId);
				if (ComConstants.CON_YES.equals(apcEvrmntStngVO.getWghMngYn())) {
					insertComAuthrtMenu(authMenu);
				} else {
					deleteComAuthrtMenu(authMenu);
				}
			}

			//	wghMblUseYn 계량테블릿사용유무	MENU_ID_WGH_MBL
			for ( String menuId : ComConstants.MENU_ID_WGH_MBL ) {

				authMenu.setMenuId(menuId);
				if (ComConstants.CON_YES.equals(apcEvrmntStngVO.getWghMblUseYn())) {
					insertComAuthrtMenu(authMenu);
				} else {
					deleteComAuthrtMenu(authMenu);
				}
			}
			//	wghIdntyDocPblcnYn 계량확인서발행유무

			//	rawMtrWrhsMngYn 원물입고관리유무	MENU_ID_RAW_MTR_WRHS
			for ( String menuId : ComConstants.MENU_ID_RAW_MTR_WRHS ) {

				authMenu.setMenuId(menuId);
				if (ComConstants.CON_YES.equals(apcEvrmntStngVO.getRawMtrWrhsMngYn())) {
					insertComAuthrtMenu(authMenu);
				} else {
					deleteComAuthrtMenu(authMenu);
				}
			}

			//	rawMtrWrhsMblUseYn 원물입고테블릿사용유무	MENU_ID_RAW_MTR_WRHS_MBL
			for ( String menuId : ComConstants.MENU_ID_RAW_MTR_WRHS_MBL ) {

				authMenu.setMenuId(menuId);
				if (ComConstants.CON_YES.equals(apcEvrmntStngVO.getRawMtrWrhsMblUseYn())) {
					insertComAuthrtMenu(authMenu);
				} else {
					deleteComAuthrtMenu(authMenu);
				}
			}

			//	rawMtrIdentTagPblcnYn 원물인식표발행유무

			//	pltBxMngYn 팔레트박스정보관리유무	MENU_ID_PLT_BX
			for ( String menuId : ComConstants.MENU_ID_PLT_BX ) {
				authMenu.setMenuId(menuId);
				if (ComConstants.CON_YES.equals(apcEvrmntStngVO.getPltBxMngYn())) {
					insertComAuthrtMenu(authMenu);
				} else {
					deleteComAuthrtMenu(authMenu);
				}
			}

			//	rawMtrWrhsPlanMngYn 원물입고계획관리유무	MENU_ID_RAW_MTR_WRHS_PLAN
			for ( String menuId : ComConstants.MENU_ID_RAW_MTR_WRHS_PLAN ) {
				authMenu.setMenuId(menuId);
				if (ComConstants.CON_YES.equals(apcEvrmntStngVO.getRawMtrWrhsPlanMngYn())) {
					insertComAuthrtMenu(authMenu);
				} else {
					deleteComAuthrtMenu(authMenu);
				}
			}

			//	rawMtrWrhsPrcsMngYn 원물입고재처리		MENU_ID_RAW_MTR_WRHS_PRCS
			for ( String menuId : ComConstants.MENU_ID_RAW_MTR_WRHS_PRCS ) {
				authMenu.setMenuId(menuId);
				if (ComConstants.CON_YES.equals(apcEvrmntStngVO.getRawMtrWrhsPrcsMngYn())) {
					insertComAuthrtMenu(authMenu);
				} else {
					deleteComAuthrtMenu(authMenu);
				}
			}
			//	gdsWrhsMngYn 상품입고관리유무		MENU_ID_GDS_WRHS
			for ( String menuId : ComConstants.MENU_ID_GDS_WRHS ) {
				authMenu.setMenuId(menuId);
				if (ComConstants.CON_YES.equals(apcEvrmntStngVO.getGdsWrhsMngYn())) {
					insertComAuthrtMenu(authMenu);
				} else {
					deleteComAuthrtMenu(authMenu);
				}
			}

			//	sortCmndMngYn 선별지시관리유무		MENU_ID_SORT_CMND
			for ( String menuId : ComConstants.MENU_ID_SORT_CMND ) {
				authMenu.setMenuId(menuId);
				if (ComConstants.CON_YES.equals(apcEvrmntStngVO.getSortCmndMngYn())) {
					insertComAuthrtMenu(authMenu);
				} else {
					deleteComAuthrtMenu(authMenu);
				}
			}

			//	sortCmndDocPblcnYn 선별지시서발행유무

			//	pckgCmndMngYn 포장지시관리유무		MENU_ID_PCKG_CMND
			for ( String menuId : ComConstants.MENU_ID_PCKG_CMND ) {
				authMenu.setMenuId(menuId);
				if (ComConstants.CON_YES.equals(apcEvrmntStngVO.getPckgCmndMngYn())) {
					insertComAuthrtMenu(authMenu);
				} else {
					deleteComAuthrtMenu(authMenu);
				}
			}

			//	pckgCmndDocPblcnYn 포장지시서발행유무

			//	sortMngYn 선별관리유무		MENU_ID_SORT
			for ( String menuId : ComConstants.MENU_ID_SORT ) {
				authMenu.setMenuId(menuId);
				if (ComConstants.CON_YES.equals(apcEvrmntStngVO.getSortMngYn())) {
					insertComAuthrtMenu(authMenu);
				} else {
					deleteComAuthrtMenu(authMenu);
				}
			}

			//	sortMblUseYn 선별테블릿사용유무		MENU_ID_SORT_MBL
			for ( String menuId : ComConstants.MENU_ID_SORT_MBL ) {
				authMenu.setMenuId(menuId);
				if (ComConstants.CON_YES.equals(apcEvrmntStngVO.getSortMblUseYn())) {
					insertComAuthrtMenu(authMenu);
				} else {
					deleteComAuthrtMenu(authMenu);
				}
			}

			//	sortLabelPblcnYn 선별라벨발행유무
			//	sortIdntyDocPblcnYn 선별확인서발행유무

			//	pckgMngYn 포장관리유무	MENU_ID_PCKG
			for ( String menuId : ComConstants.MENU_ID_PCKG ) {
				authMenu.setMenuId(menuId);
				if (ComConstants.CON_YES.equals(apcEvrmntStngVO.getPckgMngYn())) {
					insertComAuthrtMenu(authMenu);
				} else {
					deleteComAuthrtMenu(authMenu);
				}
			}

			//	pckgMblUseYn 포장테블릿사용유무		MENU_ID_PCKG_MBL
			for ( String menuId : ComConstants.MENU_ID_PCKG_MBL ) {
				authMenu.setMenuId(menuId);
				if (ComConstants.CON_YES.equals(apcEvrmntStngVO.getPckgMblUseYn())) {
					insertComAuthrtMenu(authMenu);
				} else {
					deleteComAuthrtMenu(authMenu);
				}
			}

			//	gdsLblPblcnYn 상품라벨발행유무

			//	spmtCmndMngYn 출하지시관리유무		MENU_ID_SPMT_CMND
			for ( String menuId : ComConstants.MENU_ID_SPMT_CMND ) {
				authMenu.setMenuId(menuId);
				if (ComConstants.CON_YES.equals(apcEvrmntStngVO.getSpmtCmndMngYn())) {
					insertComAuthrtMenu(authMenu);
				} else {
					deleteComAuthrtMenu(authMenu);
				}
			}

			//	spmtCmndDocPblcnYn 출하지시서발행유무

			//	spmtMngYn 출하관리유무	MENU_ID_SPMT
			for ( String menuId : ComConstants.MENU_ID_SPMT ) {
				authMenu.setMenuId(menuId);
				if (ComConstants.CON_YES.equals(apcEvrmntStngVO.getSpmtMngYn())) {
					insertComAuthrtMenu(authMenu);
				} else {
					deleteComAuthrtMenu(authMenu);
				}
			}

			//	spmtMblUseYn 출하테블릿사용유무		MENU_ID_SPMT_MBL
			for ( String menuId : ComConstants.MENU_ID_SPMT_MBL ) {
				authMenu.setMenuId(menuId);
				if (ComConstants.CON_YES.equals(apcEvrmntStngVO.getSpmtMblUseYn())) {
					insertComAuthrtMenu(authMenu);
				} else {
					deleteComAuthrtMenu(authMenu);
				}
			}

			//	slsMngYn 매출관리		MENU_ID_SLS
			for ( String menuId : ComConstants.MENU_ID_SLS ) {

				authMenu.setMenuId(menuId);
				if (ComConstants.CON_YES.equals(apcEvrmntStngVO.getSlsMngYn())) {
					insertComAuthrtMenu(authMenu);
				} else {
					deleteComAuthrtMenu(authMenu);
				}
			}

			//	spmtDocPblcnYn 송품장발행유무

			//	clclnMngYn 정산관리유무		MENU_ID_CLCLN
			for ( String menuId : ComConstants.MENU_ID_CLCLN ) {

				authMenu.setMenuId(menuId);
				if (ComConstants.CON_YES.equals(apcEvrmntStngVO.getClclnMngYn())) {
					insertComAuthrtMenu(authMenu);
				} else {
					deleteComAuthrtMenu(authMenu);
				}
			}

			//	outordrMngYn 발주정보관리유무		MENU_ID_OUTORDR
			for ( String menuId : ComConstants.MENU_ID_OUTORDR ) {

				authMenu.setMenuId(menuId);
				if (ComConstants.CON_YES.equals(apcEvrmntStngVO.getOutordrMngYn())) {
					insertComAuthrtMenu(authMenu);
				} else {
					deleteComAuthrtMenu(authMenu);
				}
			}
			//	invntrMngYn 재고관리유무		MENU_ID_INVNTR
			for ( String menuId : ComConstants.MENU_ID_INVNTR ) {

				authMenu.setMenuId(menuId);
				if (ComConstants.CON_YES.equals(apcEvrmntStngVO.getInvntrMngYn())) {
					insertComAuthrtMenu(authMenu);
				} else {
					deleteComAuthrtMenu(authMenu);
				}
			}

			//	invntrTrnsfMngYn 재고이송관리유무		MENU_ID_INVNTR_TRNSF
			for ( String menuId : ComConstants.MENU_ID_INVNTR_TRNSF ) {

				authMenu.setMenuId(menuId);
				if (ComConstants.CON_YES.equals(apcEvrmntStngVO.getInvntrTrnsfMngYn())) {
					insertComAuthrtMenu(authMenu);
				} else {
					deleteComAuthrtMenu(authMenu);
				}
			}

			//	outordrPckgCmndLnkgYn 발주정보포장지시연결유무

			//	trsmMngYn 전송관리유무

			//	sortDataTrsmYn 선별정보전송유무

			//	clclnDataTrsmYn 정산자료전송유무

			//	oprtrUseYn 생산작업자사용유무	MENU_ID_OPRTR
			for ( String menuId : ComConstants.MENU_ID_OPRTR ) {

				authMenu.setMenuId(menuId);
				if (ComConstants.CON_YES.equals(apcEvrmntStngVO.getOprtrUseYn())) {
					insertComAuthrtMenu(authMenu);
				} else {
					deleteComAuthrtMenu(authMenu);
				}
			}

			//	oprtrSortPrfmncTrsmYn 생산작업자선별실적전송유무
			//	oprtrPckgPrfmncTrsmYn 생산작업자포장실적전송유무
		}

		// apc 권한 정보 조회 ##사용자
		authrtParam.setAuthrtType(ComConstants.CON_AUTHRT_TYPE_USER);
		List<ComAuthrtVO> userAuthrtList = selectComAuthrtList(authrtParam);

		// user 권한메뉴 select
		// 권한 delete && insert
		for ( ComAuthrtVO authrt : userAuthrtList ) {

			String authrtId = authrt.getAuthrtId();

			ComAuthrtMenuVO authMenu = new ComAuthrtMenuVO();
			authMenu.setSysFrstInptUserId(sysUserId);
			authMenu.setSysFrstInptPrgrmId(sysPrgrmId);
			authMenu.setSysLastChgUserId(sysUserId);
			authMenu.setSysLastChgPrgrmId(sysPrgrmId);
			authMenu.setAuthrtId(authrtId);

			authMenu.setAuthrtType(ComConstants.CON_AUTHRT_TYPE_USER);

			// 기본 권한메뉴 등록
			for ( String menuId : ComConstants.MENU_ID_AM_CMNS ) {
				authMenu.setMenuId(menuId);
				insertComAuthrtMenu(authMenu);
			}

			//	wghMngYn 계량정보관리유무	MENU_ID_WGH
			for ( String menuId : ComConstants.MENU_ID_WGH ) {

				authMenu.setMenuId(menuId);
				if (ComConstants.CON_YES.equals(apcEvrmntStngVO.getWghMngYn())) {
					insertComAuthrtMenu(authMenu);
				} else {
					deleteComAuthrtMenu(authMenu);
				}
			}

			//	wghMblUseYn 계량테블릿사용유무	MENU_ID_WGH_MBL
			for ( String menuId : ComConstants.MENU_ID_WGH_MBL ) {

				authMenu.setMenuId(menuId);
				if (ComConstants.CON_YES.equals(apcEvrmntStngVO.getWghMblUseYn())) {
					insertComAuthrtMenu(authMenu);
				} else {
					deleteComAuthrtMenu(authMenu);
				}
			}
			//	wghIdntyDocPblcnYn 계량확인서발행유무

			//	rawMtrWrhsMngYn 원물입고관리유무	MENU_ID_RAW_MTR_WRHS
			for ( String menuId : ComConstants.MENU_ID_RAW_MTR_WRHS ) {

				authMenu.setMenuId(menuId);
				if (ComConstants.CON_YES.equals(apcEvrmntStngVO.getRawMtrWrhsMngYn())) {
					insertComAuthrtMenu(authMenu);
				} else {
					deleteComAuthrtMenu(authMenu);
				}
			}

			//	rawMtrWrhsMblUseYn 원물입고테블릿사용유무	MENU_ID_RAW_MTR_WRHS_MBL
			for ( String menuId : ComConstants.MENU_ID_RAW_MTR_WRHS_MBL ) {

				authMenu.setMenuId(menuId);
				if (ComConstants.CON_YES.equals(apcEvrmntStngVO.getRawMtrWrhsMblUseYn())) {
					insertComAuthrtMenu(authMenu);
				} else {
					deleteComAuthrtMenu(authMenu);
				}
			}

			//				rawMtrIdentTagPblcnYn 원물인식표발행유무

			//	pltBxMngYn 팔레트박스정보관리유무	MENU_ID_PLT_BX
			for ( String menuId : ComConstants.MENU_ID_PLT_BX ) {

				authMenu.setMenuId(menuId);
				if (ComConstants.CON_YES.equals(apcEvrmntStngVO.getPltBxMngYn())) {
					insertComAuthrtMenu(authMenu);
				} else {
					deleteComAuthrtMenu(authMenu);
				}
			}

			//	rawMtrWrhsPlanMngYn 원물입고계획관리유무	MENU_ID_RAW_MTR_WRHS_PLAN
			for ( String menuId : ComConstants.MENU_ID_RAW_MTR_WRHS_PLAN ) {

				authMenu.setMenuId(menuId);
				if (ComConstants.CON_YES.equals(apcEvrmntStngVO.getRawMtrWrhsPlanMngYn())) {
					insertComAuthrtMenu(authMenu);
				} else {
					deleteComAuthrtMenu(authMenu);
				}
			}

			//	gdsWrhsMngYn 상품입고관리유무		MENU_ID_GDS_WRHS
			for ( String menuId : ComConstants.MENU_ID_GDS_WRHS ) {

				authMenu.setMenuId(menuId);
				if (ComConstants.CON_YES.equals(apcEvrmntStngVO.getGdsWrhsMngYn())) {
					insertComAuthrtMenu(authMenu);
				} else {
					deleteComAuthrtMenu(authMenu);
				}
			}

			//	sortCmndMngYn 선별지시관리유무		MENU_ID_SORT_CMND
			for ( String menuId : ComConstants.MENU_ID_SORT_CMND ) {

				authMenu.setMenuId(menuId);
				if (ComConstants.CON_YES.equals(apcEvrmntStngVO.getSortCmndMngYn())) {
					insertComAuthrtMenu(authMenu);
				} else {
					deleteComAuthrtMenu(authMenu);
				}
			}

			//	sortCmndDocPblcnYn 선별지시서발행유무

			//	pckgCmndMngYn 포장지시관리유무		MENU_ID_PCKG_CMND
			for ( String menuId : ComConstants.MENU_ID_PCKG_CMND ) {

				authMenu.setMenuId(menuId);
				if (ComConstants.CON_YES.equals(apcEvrmntStngVO.getPckgCmndMngYn())) {
					insertComAuthrtMenu(authMenu);
				} else {
					deleteComAuthrtMenu(authMenu);
				}
			}

			//	pckgCmndDocPblcnYn 포장지시서발행유무

			//	sortMngYn 선별관리유무		MENU_ID_SORT
			for ( String menuId : ComConstants.MENU_ID_SORT ) {

				authMenu.setMenuId(menuId);
				if (ComConstants.CON_YES.equals(apcEvrmntStngVO.getSortMngYn())) {
					insertComAuthrtMenu(authMenu);
				} else {
					deleteComAuthrtMenu(authMenu);
				}
			}

			//	sortMblUseYn 선별테블릿사용유무		MENU_ID_SORT_MBL
			for ( String menuId : ComConstants.MENU_ID_SORT_MBL ) {

				authMenu.setMenuId(menuId);
				if (ComConstants.CON_YES.equals(apcEvrmntStngVO.getSortMblUseYn())) {
					insertComAuthrtMenu(authMenu);
				} else {
					deleteComAuthrtMenu(authMenu);
				}
			}

			//				sortLabelPblcnYn 선별라벨발행유무
			//				sortIdntyDocPblcnYn 선별확인서발행유무

			//	pckgMngYn 포장관리유무	MENU_ID_PCKG
			for ( String menuId : ComConstants.MENU_ID_PCKG ) {

				authMenu.setMenuId(menuId);
				if (ComConstants.CON_YES.equals(apcEvrmntStngVO.getPckgMngYn())) {
					insertComAuthrtMenu(authMenu);
				} else {
					deleteComAuthrtMenu(authMenu);
				}
			}

			//	pckgMblUseYn 포장테블릿사용유무		MENU_ID_PCKG_MBL
			for ( String menuId : ComConstants.MENU_ID_PCKG_MBL ) {

				authMenu.setMenuId(menuId);
				if (ComConstants.CON_YES.equals(apcEvrmntStngVO.getPckgMblUseYn())) {
					insertComAuthrtMenu(authMenu);
				} else {
					deleteComAuthrtMenu(authMenu);
				}
			}

			//				gdsLblPblcnYn 상품라벨발행유무

			//	spmtCmndMngYn 출하지시관리유무		MENU_ID_SPMT_CMND
			for ( String menuId : ComConstants.MENU_ID_SPMT_CMND ) {

				authMenu.setMenuId(menuId);
				if (ComConstants.CON_YES.equals(apcEvrmntStngVO.getSpmtCmndMngYn())) {
					insertComAuthrtMenu(authMenu);
				} else {
					deleteComAuthrtMenu(authMenu);
				}
			}

			//				spmtCmndDocPblcnYn 출하지시서발행유무

			//	spmtMngYn 출하관리유무	MENU_ID_SPMT
			for ( String menuId : ComConstants.MENU_ID_SPMT ) {

				authMenu.setMenuId(menuId);
				if (ComConstants.CON_YES.equals(apcEvrmntStngVO.getSpmtMngYn())) {
					insertComAuthrtMenu(authMenu);
				} else {
					deleteComAuthrtMenu(authMenu);
				}
			}

			//	spmtMblUseYn 출하테블릿사용유무		MENU_ID_SPMT_MBL
			for ( String menuId : ComConstants.MENU_ID_SPMT_MBL ) {

				authMenu.setMenuId(menuId);
				if (ComConstants.CON_YES.equals(apcEvrmntStngVO.getSpmtMblUseYn())) {
					insertComAuthrtMenu(authMenu);
				} else {
					deleteComAuthrtMenu(authMenu);
				}
			}

			//	spmtDocPblcnYn 송품장발행유무

			//	clclnMngYn 정산관리유무		MENU_ID_CLCLN
			for ( String menuId : ComConstants.MENU_ID_CLCLN ) {

				authMenu.setMenuId(menuId);
				if (ComConstants.CON_YES.equals(apcEvrmntStngVO.getClclnMngYn())) {
					insertComAuthrtMenu(authMenu);
				} else {
					deleteComAuthrtMenu(authMenu);
				}
			}

			//	outordrMngYn 발주정보관리유무		MENU_ID_OUTORDR
			for ( String menuId : ComConstants.MENU_ID_OUTORDR ) {

				authMenu.setMenuId(menuId);
				if (ComConstants.CON_YES.equals(apcEvrmntStngVO.getOutordrMngYn())) {
					insertComAuthrtMenu(authMenu);
				} else {
					deleteComAuthrtMenu(authMenu);
				}
			}

			//				outordrPckgCmndLnkgYn 발주정보포장지시연결유무

			//				trsmMngYn 전송관리유무

			//				sortDataTrsmYn 선별정보전송유무

			//				clclnDataTrsmYn 정산자료전송유무

			//	oprtrUseYn 생산작업자사용유무	MENU_ID_OPRTR
			for ( String menuId : ComConstants.MENU_ID_OPRTR ) {

				authMenu.setMenuId(menuId);
				if (ComConstants.CON_YES.equals(apcEvrmntStngVO.getOprtrUseYn())) {
					insertComAuthrtMenu(authMenu);
				} else {
					deleteComAuthrtMenu(authMenu);
				}
			}

			//				oprtrSortPrfmncTrsmYn 생산작업자선별실적전송유무
			//				oprtrPckgPrfmncTrsmYn 생산작업자포장실적전송유무
		}

		return null;
	}

	@Override
	public List<ComAuthrtUiVO> selectUserAuthrtUiList(String userId, String menuId) throws Exception {

		ComAuthrtUiVO comAuthrtUiVO = new ComAuthrtUiVO();

		comAuthrtUiVO.setUserId(userId);
		comAuthrtUiVO.setMenuId(menuId);

		List<ComAuthrtUiVO> userAuthrtUiList = comAuthrtMapper.selectUserAuthrtUiList(comAuthrtUiVO);

		return userAuthrtUiList;
	}


	@Override
	public HashMap<String, Object> insertComAuthrtUi(ComAuthrtMenuVO comAuthrtMenuVO) throws Exception {

		String authrtId = comAuthrtMenuVO.getAuthrtId();
		String menuId = comAuthrtMenuVO.getMenuId();


		if (!StringUtils.hasText(authrtId)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "권한ID");
		}
		if (!StringUtils.hasText(menuId)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "메뉴ID");
		}

		List<ComAuthrtUiVO> comAuthrtUiList = comAuthrtMenuVO.getComAuthrtUiList();

		if (comAuthrtUiList == null || comAuthrtUiList.isEmpty()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "변경대상");
		}

		for ( ComAuthrtUiVO authrtUi : comAuthrtUiList ) {

			authrtUi.setAuthrtId(authrtId);
			authrtUi.setMenuId(menuId);

			ComAuthrtUiVO chkInfo =	comAuthrtMapper.selectComAuthrtUi(authrtUi);

			ComAuthrtUiVO comAuthrtUiVO = new ComAuthrtUiVO();
			BeanUtils.copyProperties(comAuthrtMenuVO, comAuthrtUiVO);

			BeanUtils.copyProperties(authrtUi, comAuthrtUiVO,
						ComConstants.PROP_COL_AUTHRT_ID,
						ComConstants.PROP_COL_MENU_ID,
						ComConstants.PROP_SYS_FRST_INPT_DT,
						ComConstants.PROP_SYS_FRST_INPT_USER_ID,
						ComConstants.PROP_SYS_FRST_INPT_PRGRM_ID,
						ComConstants.PROP_SYS_LAST_CHG_DT,
						ComConstants.PROP_SYS_LAST_CHG_USER_ID,
						ComConstants.PROP_SYS_LAST_CHG_PRGRM_ID
					);

			if (ComConstants.CON_YES.equals(comAuthrtUiVO.getUseYn())) {
				if (chkInfo != null && StringUtils.hasText(chkInfo.getAuthrtId())) {
					comAuthrtMapper.updateComAuthrtUi(comAuthrtUiVO);
				} else {
					comAuthrtMapper.insertComAuthrtUi(comAuthrtUiVO);
				}
			} else {
				if (chkInfo != null && StringUtils.hasText(chkInfo.getAuthrtId())) {
					comAuthrtMapper.updateComAuthrtUiForDelY(comAuthrtUiVO);
				}
			}
		}

		return null;
	}

	@Override
	public int insertComAuthrtUserHsrty(ComAuthrtUserVO comAuthrtUserVO) throws Exception {
		int insertedCnt = comAuthrtMapper.insertComAuthrtUserHsrty(comAuthrtUserVO);
		return insertedCnt;
	}

	@Override
	public HashMap<String, Object> insertBmk(ComAuthrtVO comAuthrtVO) throws Exception {

		if (0 == comAuthrtMapper.insertBmk(comAuthrtVO)) {
			throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_PARAM_ONE, "즐겨찾기 등록")));		// E0003	{0} 시 오류가 발생하였습니다.
		}

		return null;
	}

	@Override
	public HashMap<String, Object> deleteBmk(ComAuthrtVO comAuthrtVO) throws Exception {
		if (0 == comAuthrtMapper.deleteBmk(comAuthrtVO)) {
			throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_PARAM_ONE, "즐겨찾기 삭제")));		// E0003	{0} 시 오류가 발생하였습니다.
		}

		return null;
	}

	@Override
	public HashMap<String, Object> insertApcUserAuthrt(ComAuthrtUserVO comAuthrtUserVO) throws Exception {
		
		if (!StringUtils.hasText(comAuthrtUserVO.getAuthrtId())) {
			comAuthrtUserVO.setAuthrtType(ComConstants.CON_AUTHRT_TYPE_USER);
			List<ComAuthrtUserVO> list = comAuthrtMapper.selectApcAuthrtUserList(comAuthrtUserVO);
			
			if (list == null || list.isEmpty()) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC사용자권한그룹");
			}
			
			String authrtId = ComConstants.CON_BLANK;
			String authrtUserId = ComConstants.CON_BLANK;
			int authrtFg;
			
			for ( ComAuthrtUserVO authrt : list ) {
				authrtFg = authrt.getAuthrtFg();
				authrtUserId = authrt.getUserId();
				authrtId = authrt.getAuthrtId();
				if (authrtFg <= 2) {
					break;
				}
			}
			
			if (!StringUtils.hasText(authrtId)) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC사용자권한그룹");
			}
			
			if (!StringUtils.hasText(authrtUserId)) {
				comAuthrtUserVO.setAuthrtId(authrtId);
				comAuthrtMapper.insertComAuthrtUser(comAuthrtUserVO);
			}
			
		}
		
		return null;
	}

	@Override
	public HashMap<String, Object> deleteApcUserAuthrt(ComAuthrtUserVO comAuthrtUserVO) throws Exception {
		
		comAuthrtMapper.deleteApcUserAuthrt(comAuthrtUserVO);
		
		return null;
	}
}
