package com.at.apcss.co.user.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import com.at.apcss.co.sys.service.LoginService;
import com.at.apcss.co.sys.vo.LoginVO;
import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.at.apcss.am.apc.service.ApcEvrmntStngService;
import com.at.apcss.am.apc.vo.ApcEvrmntStngVO;
import com.at.apcss.co.authrt.service.ComAuthrtService;
import com.at.apcss.co.authrt.vo.ComAuthrtUserVO;
import com.at.apcss.co.authrt.vo.ComAuthrtVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;
import com.at.apcss.co.user.mapper.ComUserMapper;
import com.at.apcss.co.user.service.ComUserService;
import com.at.apcss.co.user.vo.ComUserApcVO;
import com.at.apcss.co.user.vo.ComUserAtchflVO;
import com.at.apcss.co.user.vo.ComUserVO;

/**
 * 사용자정보에 대한 서비스 구현 클래스를 정의한다
 * @author 신정철
 * @since 2023.05.16
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일      	수정자          수정내용
 *  ----------  ----------    ---------------------------
 *  2023.05.16  신정철          최초 생성
 *
 * </pre>
 */
@Service("comUserService")
public class ComUserServiceImpl extends BaseServiceImpl implements ComUserService {

	@Autowired
	private ComUserMapper comUserMapper;
	@Autowired
	private LoginService loginService;

	@Resource(name = "comAuthrtService")
	private ComAuthrtService comAuthrtService;

	@Resource(name = "apcEvrmntStngService")
	private ApcEvrmntStngService apcEvrmntStngService;


	@Override
	public ComUserVO selectComUser(ComUserVO comUserVO) throws Exception {

		ComUserVO comUserRsltVO = comUserMapper.selectComUser(comUserVO);
		return comUserRsltVO;
	}

	@Override
	public ComUserVO selectComUser(String userId) throws Exception {

		ComUserVO comUserVO = new ComUserVO();
		comUserVO.setUserId(userId);

		return selectComUser(comUserVO);
	}

	@Override
	public List<ComUserVO> selectComUserList(ComUserVO comUserVO) throws Exception {

		List<ComUserVO> resultList = comUserMapper.selectComUserList(comUserVO);
		return resultList;
	}

	@Override
	public List<ComUserVO> selectComUserApcList(ComUserVO comUserVO) throws Exception {

		List<ComUserVO> resultList = comUserMapper.selectComUserApcList(comUserVO);
		return resultList;
	}


	@Override
	public List<ComUserVO> selectUntyUserAprvList(ComUserVO comUserVO) throws Exception {
		
		List<ComUserVO> resultList = comUserMapper.selectUntyUserAprvList(comUserVO);
		return resultList;
	}
	
	
	@Override
	public HashMap<String, Object> updateUserSttsList(List<ComUserVO> comUserList) throws Exception {
		HashMap<String, Object> rtnObj = new HashMap<>();

		for ( ComUserVO comUserVO : comUserList ) {
			rtnObj = updateComUserStts(comUserVO);
			if (rtnObj != null) {
				// error throw exception;
				throw new EgovBizException(getMessageForMap(rtnObj));
			}
		}

		return null;
	}

	@Override
	public int updateUserType(ComUserVO comUserVO) throws Exception {
		return comUserMapper.updateUserType(comUserVO);
	}

	@Override
	public HashMap<String, Object> updateComUserStts(ComUserVO comUserVO) throws Exception {

		// validation check
		String userId = comUserVO.getUserId();
		if (!StringUtils.hasText(userId)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "사용자ID");
		}

		comUserMapper.updateComUserStts(comUserVO);

		return null;
	}

	@Override
	public HashMap<String, Object> updateComUserList(List<ComUserVO> comUserList) throws Exception {
		HashMap<String, Object> rtnObj = new HashMap<>();

		for ( ComUserVO comUserVO : comUserList ) {
			rtnObj = updateComUser(comUserVO);
			if (rtnObj != null) {
				// error throw exception;
				throw new EgovBizException(getMessageForMap(rtnObj));
			}
		}

		return null;
	}
	
	
	@Override
	public HashMap<String, Object> updateComUser(ComUserVO comUserVO) throws Exception {

		// validation check
		String userId = comUserVO.getUserId();
		if (!StringUtils.hasText(userId)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "사용자ID");
		}

		comUserMapper.updateComUser(comUserVO);

		return null;
	}

	@Override
	public int updateComUserAprv(ComUserVO comUserVO) throws Exception {
		return comUserMapper.updateComUserAprv(comUserVO);
	}

	@Override
	public HashMap<String, Object> updateApcUserAprv(ComUserVO comUserVO) throws Exception {

		if (ComConstants.CON_USER_STTS_VALID.equals(comUserVO.getUserStts())) {
			return insertApcUserAprv(comUserVO);
		} else {
			return deleteApcUserAprv(comUserVO);
		}
	}


	@Override
	public HashMap<String, Object> insertApcUserAprv(ComUserVO comUserVO) throws Exception {

		ComAuthrtUserVO authrtUserVO = new ComAuthrtUserVO();

		BeanUtils.copyProperties(comUserVO, authrtUserVO);

		HashMap<String, Object> rtnObj = comAuthrtService.insertApcUserAuthrt(authrtUserVO);
		if (rtnObj != null) {
			// error throw exception;
			throw new EgovBizException(getMessageForMap(rtnObj));
		}

		comUserMapper.updateComUserAprv(comUserVO);

		return null;
	}

	@Override
	public HashMap<String, Object> deleteApcUserAprv(ComUserVO comUserVO) throws Exception {

		ComAuthrtUserVO authrtUserVO = new ComAuthrtUserVO();

		BeanUtils.copyProperties(comUserVO, authrtUserVO);

		HashMap<String, Object> rtnObj = comAuthrtService.deleteApcUserAuthrt(authrtUserVO);
		if (rtnObj != null) {
			// error throw exception;
			throw new EgovBizException(getMessageForMap(rtnObj));
		}

		comUserMapper.updateComUserAprv(comUserVO);

		return null;
	}



	@Override
	public HashMap<String, Object> insertUserAprvList(List<ComUserVO> comUserList) throws Exception {

		HashMap<String, Object> rtnObj = new HashMap<>();

		// validation check
		for ( ComUserVO user : comUserList ) {

			ComUserVO userInfo = selectComUser(user);

			if (userInfo == null || !StringUtils.hasText(userInfo.getUserId())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "사용자정보");
			}
			if (!StringUtils.hasText(userInfo.getApcCd())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드");
			}
			if (ComConstants.CON_USER_STTS_VALID.equals(userInfo.getUserStts())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_ALEADY_DONE, "승인||사용자");	// W0010	이미 {0}된 {1} 입니다.
			}

			user.setApcCd(userInfo.getApcCd());
		}

		for ( ComUserVO user : comUserList ) {

			String sysUserId = user.getSysLastChgUserId();
			String sysPrgrmId = user.getSysLastChgPrgrmId();

			user.setUserStts(ComConstants.CON_USER_STTS_VALID);
			comUserMapper.updateComUserAprv(user);

			// 승인 후 권한id 등록.
			ComAuthrtVO comAuthrtVO = new ComAuthrtVO();
			comAuthrtVO.setSysFrstInptUserId(sysUserId);
			comAuthrtVO.setSysFrstInptPrgrmId(sysPrgrmId);
			comAuthrtVO.setSysLastChgUserId(sysUserId);
			comAuthrtVO.setSysLastChgPrgrmId(sysPrgrmId);
			comAuthrtVO.setApcCd(user.getApcCd());
			comAuthrtVO.setUserId(user.getUserId());

			rtnObj = comAuthrtService.insertApcAuthrtId(comAuthrtVO);
			if (rtnObj != null) {
				throw new EgovBizException(getMessageForMap(rtnObj));
			}

			ApcEvrmntStngVO stngVO = new ApcEvrmntStngVO();
			stngVO.setSysFrstInptUserId(sysUserId);
			stngVO.setSysFrstInptPrgrmId(sysPrgrmId);
			stngVO.setSysLastChgUserId(sysUserId);
			stngVO.setSysLastChgPrgrmId(sysPrgrmId);
			stngVO.setApcCd(user.getApcCd());

			// APC 초기정보가 없으면 APC 환경설정 초기정보 설정
			ApcEvrmntStngVO apcStngInfo = apcEvrmntStngService.selectApcEvrmntStng(stngVO);
			if (apcStngInfo == null || !StringUtils.hasText(apcStngInfo.getApcCd())) {
				rtnObj = apcEvrmntStngService.insertApcInitInfo(stngVO);
				if (rtnObj != null) {
					throw new EgovBizException(getMessageForMap(rtnObj));
				}
			}
		}

		return null;
	}

	@Override
	public int updComUserPwd(ComUserVO comUserVO) throws Exception {
		LoginVO loginVo = new LoginVO();
		loginVo.setId(comUserVO.getUserId());
		loginService.updateResetFailCount(loginVo);
		return comUserMapper.updComUserPwd(comUserVO);
	}

	/**
	 * 계정 추가
	 * @param comUserVO
	 * @return int
	 * @throws Exception
	 */
	public int insertAccount(ComUserVO comUserVO) throws Exception{

		return comUserMapper.insertAccount(comUserVO);
	};
	/**
	 * 계정 정책 추가
	 * @param comUserVO
	 * @return int
	 * @throws Exception
	 */
	public int insertLgnPlcy(ComUserVO comUserVO) throws Exception{
		return comUserMapper.insertLgnPlcy(comUserVO);
	};
	/**
	 * 계정 중복 체크
	 * @param comUserVO
	 * @return comUserVO
	 * @throws Exception
	 */
	@Override
	public ComUserVO selectAccountDupChk(ComUserVO comUserVO) throws Exception {

		return comUserMapper.selectAccountDupChk(comUserVO);
	}
	/**
     * 생산농가 계정관리 요청목록 조회
     * @param hashMap
     * @return
     * @throws Exception
     */
    @Override
    public List<HashMap<String, Object>> selectComUserPrdcrAprvList(HashMap<String, Object> comUserVO) throws Exception {
        List<HashMap<String, Object>> resultVO = comUserMapper.selectComUserPrdcrAprvList(comUserVO);
        return resultVO;
    }
    /**
     * 생산농가 계정관리 생산농가목록 조회
     * @param hashMap
     * @return
     * @throws Exception
     */
    @Override
    public List<HashMap<String, Object>> selectComUserPrdcrList(HashMap<String, Object> comUserVO) throws Exception {
        List<HashMap<String, Object>> resultVO = comUserMapper.selectComUserPrdcrList(comUserVO);
        return resultVO;
    }
    /**
     *  생산농가 계정등록 승인목록 조회
     * @param HashMap
     * @return
     * @throws Exception
     */
    @Override
    public List<HashMap<String, Object>> selectComUserPrdcrRegList(HashMap<String, Object> comUserVO) throws Exception {
        List<HashMap<String, Object>> resultVO = comUserMapper.selectComUserPrdcrRegList(comUserVO);
        return resultVO;
    }

	/**
	 * 생산농가가 속한 생산자 정보 및 APC목록 조회
	 * @param HashMap
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<HashMap<String, Object>> selectAprvPrdcrUserApcList(HashMap<String, Object> comUserVO) throws Exception {
		List<HashMap<String, Object>> resultVO = comUserMapper.selectAprvPrdcrUserApcList(comUserVO);
		return resultVO;
	}

    /**
     * 생산농가 계정관리 승인요청 수정
     * @param HashMap
     * @return
     * @throws Exception
     */
    @Override
	public int updateUserAprv(HashMap<String,Object> comUserVO) throws Exception {
		return comUserMapper.updateUserAprv(comUserVO);
	}
    /**
     * 생산농가 계정관리 승인요청 신규등록, 수정
     * @param HashMap
     * @return
     * @throws Exception
     */
    @Override
	public int savePrdcrUserId(HashMap<String,Object> comUserVO) throws Exception {
    	int result = 0;
    	String chk = (String) comUserVO.get("chk");
    	if(chk.equals("I")) {
    		result = comUserMapper.insertPrdcrUserId(comUserVO);
    	}else if(chk.equals("U")) {
    		result = comUserMapper.updatePrdcrUserId(comUserVO);
    	}
		return result;
	}

    /**
     * 생산농가 계정등록 요청목록 조회
     * @param HashMap
     * @return
     * @throws Exception
     */
    @Override
    public List<HashMap<String, Object>> selectComUserAprvList(HashMap<String, Object> comUserVO) throws Exception {
        List<HashMap<String, Object>> resultVO = comUserMapper.selectComUserAprvList(comUserVO);
        return resultVO;
    }

    /**
     * 생산농가 계정관리 승인요청 삭제
     * @param HashMap
     * @return
     * @throws Exception
     */
    public int deletePrdcrUserId(HashMap<String,Object> comUserVO) throws Exception{
    	int result = 0;

		result = comUserMapper.deletePrdcrUserId(comUserVO);

		return result;

    }
    /**
     * 생산농가 계정관리 요청목록 조회
     * @param hashMap
     * @return
     * @throws Exception
     */
    @Override
    public List<HashMap<String, Object>> selectUserPrdcrList(HashMap<String, Object> comUserVO) throws Exception {
        List<HashMap<String, Object>> resultVO = comUserMapper.selectUserPrdcrList(comUserVO);
        return resultVO;
    }

    @Override
	public HashMap<String, Object> selectUserAprv(HashMap<String,Object> aprvUserList) throws Exception {
		HashMap<String, Object> rtnObj = new HashMap<>();
		rtnObj = comUserMapper.selectUserAprv(aprvUserList);
		return rtnObj;
	}

    @Override
	public int delComUserAprv(HashMap<String,Object> comUserVO) throws Exception {
		int rtnObj = comUserMapper.delComUserAprv(comUserVO);
		return rtnObj;
	}

	@Override
	public HashMap<String, Object> insertUntyAprvList(List<ComUserVO> comUserList) throws Exception {
		
		for ( ComUserVO user : comUserList ) {
			
			comUserMapper.insertSpUntyAuthAprv(user);
			if (StringUtils.hasText(user.getRtnCd())) {
				HashMap<String, Object> rtnObj = ComUtil.getResultMap(user.getRtnCd(), user.getRtnMsg());
				throw new EgovBizException(getMessageForMap(rtnObj));
			}
		}

		return null;
	}

	@Override
	public HashMap<String, Object> insertCorpAprvList(List<ComUserVO> comUserList) throws Exception {
		
		for ( ComUserVO user : comUserList ) {
			user.setMbrTypeCd(ComConstants.CON_MBR_TYPE_CD_CORP);
			comUserMapper.insertSpUserAuthAprv(user);
			if (StringUtils.hasText(user.getRtnCd())) {
				HashMap<String, Object> rtnObj = ComUtil.getResultMap(user.getRtnCd(), user.getRtnMsg());
				throw new EgovBizException(getMessageForMap(rtnObj));
			}
		}

		return null;
	}

	@Override
	public HashMap<String, Object> insertLocgovAprvList(List<ComUserVO> comUserList) throws Exception {

		for ( ComUserVO user : comUserList ) {
			user.setMbrTypeCd(ComConstants.CON_MBR_TYPE_CD_LOCGOV);
			comUserMapper.insertSpUserAuthAprv(user);
			if (StringUtils.hasText(user.getRtnCd())) {
				HashMap<String, Object> rtnObj = ComUtil.getResultMap(user.getRtnCd(), user.getRtnMsg());
				throw new EgovBizException(getMessageForMap(rtnObj));
			}
		}

		return null;
	}

	@Override
	public List<ComUserVO> selectCorpUserAprvList(ComUserVO comUserVO) throws Exception {
		List<ComUserVO> resultList = comUserMapper.selectCorpUserAprvList(comUserVO);
		return resultList;
	}

	@Override
	public List<ComUserVO> selectLocgovUserAprvList(ComUserVO comUserVO) throws Exception {
		List<ComUserVO> resultList = comUserMapper.selectLocgovUserAprvList(comUserVO);
		return resultList;
	}

	@Override
	public HashMap<String, Object> deleteCorpAprvList(List<ComUserVO> comUserList) throws Exception {
		
		for ( ComUserVO user : comUserList ) {
			user.setMbrTypeCd(ComConstants.CON_MBR_TYPE_CD_CORP);
			comUserMapper.deleteSpUserAuthAprv(user);
			if (StringUtils.hasText(user.getRtnCd())) {
				HashMap<String, Object> rtnObj = ComUtil.getResultMap(user.getRtnCd(), user.getRtnMsg());
				throw new EgovBizException(getMessageForMap(rtnObj));
			}
		}

		return null;
	}

	@Override
	public HashMap<String, Object> deleteLocgovAprvList(List<ComUserVO> comUserList) throws Exception {
		
		for ( ComUserVO user : comUserList ) {
			user.setMbrTypeCd(ComConstants.CON_MBR_TYPE_CD_LOCGOV);
			comUserMapper.deleteSpUserAuthAprv(user);
			if (StringUtils.hasText(user.getRtnCd())) {
				HashMap<String, Object> rtnObj = ComUtil.getResultMap(user.getRtnCd(), user.getRtnMsg());
				throw new EgovBizException(getMessageForMap(rtnObj));
			}
		}
		
		return null;
	}

	@Override
	public List<ComUserVO> selectUserApcList(ComUserVO comUserVO) throws Exception {

		List<ComUserVO> resultList = comUserMapper.selectUserApcList(comUserVO);
		return resultList;
	}
	
	@Override
	public HashMap<String, Object> insertUserApcAply(ComUserVO comUserVO) throws Exception {
		
		List<ComUserApcVO> userApcList = comUserVO.getUserApcList();
		
		if (userApcList == null || userApcList.isEmpty()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND_TARGET_TODO, "등록");
		}
		
		String sysUserId = comUserVO.getSysLastChgUserId();
		String sysPrgrmId = comUserVO.getSysLastChgPrgrmId();
		
		for ( ComUserApcVO userApc : userApcList ) {
			
			userApc.setSysFrstInptUserId(sysUserId);
			userApc.setSysFrstInptPrgrmId(sysPrgrmId);
			userApc.setSysLastChgUserId(sysUserId);
			userApc.setSysLastChgPrgrmId(sysPrgrmId);
			
			if (!StringUtils.hasText(userApc.getApcCd())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC정보");
			}
			
			// 기등록 APC 인지 확인
			ComUserApcVO chkVO = comUserMapper.selectUserApc(userApc);
			if (chkVO != null && StringUtils.hasText(chkVO.getApcCd())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_ALEADY_DONE, "등록||APC");
			}

			//chkOgnzYn
			// 해당 조직에 등록된 APC인지 확인
			//selectComOgnzApcList
			ComUserApcVO chkOgnzInfo = comUserMapper.selectCorpApc(userApc);
			if (!ComConstants.CON_YES.equals(comUserVO.getSuperUserYn())) {
				if (
						chkOgnzInfo != null
								&& StringUtils.hasText(chkOgnzInfo.getApcCd())
								&& ComConstants.CON_YES.equals(chkOgnzInfo.getAprvYn())) {
				} else {
					return ComUtil.getResultMap(ComConstants.MSGCD_NOT_PARAM_THREE, "조직||승인||APC");
				}
			}
		}
		
		for ( ComUserApcVO userApc : userApcList ) {
			
			comUserMapper.insertUserApc(userApc);
			
			// 이력 등록
			userApc.setAprvPrgrsCd(ComConstants.CON_APRV_PRGRS_CD_APLY);
			insertUserApcHstry(userApc);
		}
		
		return null;		
	}

	@Override
	public HashMap<String, Object> deleteUserApcAply(ComUserVO comUserVO) throws Exception {
		
		List<ComUserApcVO> userApcList = comUserVO.getUserApcList();
		
		if (userApcList == null || userApcList.isEmpty()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND_TARGET_TODO, "삭제");
		}
		
		String sysUserId = comUserVO.getSysLastChgUserId();
		String sysPrgrmId = comUserVO.getSysLastChgPrgrmId();
		
		// String superUserYn = comUserVO.getSuperUserYn();
		
		for ( ComUserApcVO userApc : userApcList ) {
			
			userApc.setSysFrstInptUserId(sysUserId);
			userApc.setSysFrstInptPrgrmId(sysPrgrmId);
			userApc.setSysLastChgUserId(sysUserId);
			userApc.setSysLastChgPrgrmId(sysPrgrmId);
			
			if (!StringUtils.hasText(userApc.getApcCd())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC정보");
			}
			
			// 해당 조직에 등록된 APC인지 확인
			//selectComOgnzApcList
			
			// 기등록 APC 인지 확인
			ComUserApcVO chkVO = comUserMapper.selectUserApc(userApc);
			if (chkVO != null && StringUtils.hasText(chkVO.getApcCd())) {
				
			} else {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND_TARGET, "등록");
			}
		}
		
		for ( ComUserApcVO userApc : userApcList ) {
			
			// 이력 등록
			userApc.setAprvPrgrsCd(ComConstants.CON_APRV_PRGRS_CD_APLY_CNCL);
			insertUserApcHstry(userApc);
			
			comUserMapper.deleteUserApc(userApc);
		}
		
		return null;	
	}

	@Override
	public HashMap<String, Object> insertUserApcAprv(ComUserVO comUserVO) throws Exception {

		List<ComUserApcVO> userApcList = comUserVO.getUserApcList();
		
		if (userApcList == null || userApcList.isEmpty()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND_TARGET_TODO, "등록");
		}
		
		String sysUserId = comUserVO.getSysLastChgUserId();
		String sysPrgrmId = comUserVO.getSysLastChgPrgrmId();
		
		for ( ComUserApcVO userApc : userApcList ) {
			
			userApc.setSysFrstInptUserId(sysUserId);
			userApc.setSysFrstInptPrgrmId(sysPrgrmId);
			userApc.setSysLastChgUserId(sysUserId);
			userApc.setSysLastChgPrgrmId(sysPrgrmId);
			
			if (!StringUtils.hasText(userApc.getApcCd())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC정보");
			}
			
			// 기등록 APC 인지 확인
			ComUserApcVO chkVO = comUserMapper.selectUserApc(userApc);
			if (chkVO != null && StringUtils.hasText(chkVO.getApcCd())) {
				
			} else {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "신청정보");
			}

			//chkOgnzYn
			// 해당 조직에 등록된 APC인지 확인
			//selectComOgnzApcList
			ComUserApcVO chkOgnzInfo = comUserMapper.selectCorpApc(userApc);

			if (!ComConstants.CON_YES.equals(comUserVO.getSuperUserYn())) {
				if (
						chkOgnzInfo != null
								&& StringUtils.hasText(chkOgnzInfo.getApcCd())
								&& ComConstants.CON_YES.equals(chkOgnzInfo.getAprvYn())) {
				} else {
					return ComUtil.getResultMap(ComConstants.MSGCD_NOT_PARAM_THREE, "조직||승인||APC");
				}
			}

		}
		
		for ( ComUserApcVO userApc : userApcList ) {
			
			// 이력 등록
			userApc.setAprvPrgrsCd(ComConstants.CON_APRV_PRGRS_CD_APRV);
			insertUserApcHstry(userApc);
			
			comUserMapper.updateUserApcAprv(userApc);

			// sys auth 호출
			comUserMapper.insertSpUserApcSysAuth(userApc);
			if (StringUtils.hasText(userApc.getRtnCd())) {
				HashMap<String, Object> rtnObj = ComUtil.getResultMap(userApc.getRtnCd(), userApc.getRtnMsg());
				throw new EgovBizException(getMessageForMap(rtnObj));
			}
		}
		
		return null;
	}

	@Override
	public HashMap<String, Object> deleteUserApcAprv(ComUserVO comUserVO) throws Exception {

		List<ComUserApcVO> userApcList = comUserVO.getUserApcList();
		
		if (userApcList == null || userApcList.isEmpty()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND_TARGET_TODO, "승인취소");
		}
		
		String sysUserId = comUserVO.getSysLastChgUserId();
		String sysPrgrmId = comUserVO.getSysLastChgPrgrmId();
		
		for ( ComUserApcVO userApc : userApcList ) {
			
			userApc.setSysFrstInptUserId(sysUserId);
			userApc.setSysFrstInptPrgrmId(sysPrgrmId);
			userApc.setSysLastChgUserId(sysUserId);
			userApc.setSysLastChgPrgrmId(sysPrgrmId);
			
			if (!StringUtils.hasText(userApc.getApcCd())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC정보");
			}
			
			// 해당 조직에 등록된 APC인지 확인
			//selectComOgnzApcList
			
			// 기등록 APC 인지 확인
			ComUserApcVO chkVO = comUserMapper.selectUserApc(userApc);
			if (chkVO != null && StringUtils.hasText(chkVO.getApcCd())) {
				if (!ComConstants.CON_YES.equals(chkVO.getAprvYn())) {
					return ComUtil.getResultMap(ComConstants.MSGCD_TARGET_STATUS, "미승인||신청");
				}
				
			} else {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND_TARGET, "등록");
			}
		}
		
		for ( ComUserApcVO userApc : userApcList ) {
			// 이력 등록
			userApc.setAprvPrgrsCd(ComConstants.CON_APRV_PRGRS_CD_APRV_CNCL);
			insertUserApcHstry(userApc);
			// 승인취소 처리
			comUserMapper.updateUserApcAprvCncl(userApc);

			// sys auth 호출
			comUserMapper.insertSpUserApcSysAuth(userApc);
			if (StringUtils.hasText(userApc.getRtnCd())) {
				HashMap<String, Object> rtnObj = ComUtil.getResultMap(userApc.getRtnCd(), userApc.getRtnMsg());
				throw new EgovBizException(getMessageForMap(rtnObj));
			}
		}
		
		return null;
	}

	@Override
	public HashMap<String, Object> insertUserApcMngrAprv(ComUserVO comUserVO) throws Exception {

		List<ComUserApcVO> userApcList = comUserVO.getUserApcList();

		if (userApcList == null || userApcList.isEmpty()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND_TARGET_TODO, "등록");
		}

		String sysUserId = comUserVO.getSysLastChgUserId();
		String sysPrgrmId = comUserVO.getSysLastChgPrgrmId();

		for ( ComUserApcVO userApc : userApcList ) {

			userApc.setSysFrstInptUserId(sysUserId);
			userApc.setSysFrstInptPrgrmId(sysPrgrmId);
			userApc.setSysLastChgUserId(sysUserId);
			userApc.setSysLastChgPrgrmId(sysPrgrmId);

			if (!StringUtils.hasText(userApc.getApcCd())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC정보");
			}

			// 기등록 APC 인지 확인
			ComUserApcVO chkVO = comUserMapper.selectUserApc(userApc);
			if (chkVO != null && StringUtils.hasText(chkVO.getApcCd()) && ComConstants.CON_YES.equals(chkVO.getAprvYn())) {
				userApc.setApcMngrYn(ComConstants.CON_YES);
			} else {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "신청정보");
			}
		}

		HashMap<String, Object> rtnObj = new HashMap<>();

		for ( ComUserApcVO userApc : userApcList ) {

			// 이력 등록
			userApc.setAprvPrgrsCd(ComConstants.CON_APRV_PRGRS_CD_APRV);
			insertUserApcHstry(userApc);

			comUserMapper.updateUserApcMngrAprv(userApc);


			// 승인 후 권한id 등록.
			ComAuthrtVO comAuthrtVO = new ComAuthrtVO();
			comAuthrtVO.setSysFrstInptUserId(sysUserId);
			comAuthrtVO.setSysFrstInptPrgrmId(sysPrgrmId);
			comAuthrtVO.setSysLastChgUserId(sysUserId);
			comAuthrtVO.setSysLastChgPrgrmId(sysPrgrmId);
			comAuthrtVO.setApcCd(userApc.getApcCd());
			comAuthrtVO.setUserId(userApc.getUserId());

			rtnObj = comAuthrtService.insertApcAuthrtId(comAuthrtVO);
			if (rtnObj != null) {
				throw new EgovBizException(getMessageForMap(rtnObj));
			}

			ApcEvrmntStngVO stngVO = new ApcEvrmntStngVO();
			stngVO.setSysFrstInptUserId(sysUserId);
			stngVO.setSysFrstInptPrgrmId(sysPrgrmId);
			stngVO.setSysLastChgUserId(sysUserId);
			stngVO.setSysLastChgPrgrmId(sysPrgrmId);
			stngVO.setApcCd(userApc.getApcCd());

			// APC 초기정보가 없으면 APC 환경설정 초기정보 설정
			ApcEvrmntStngVO apcStngInfo = apcEvrmntStngService.selectApcEvrmntStng(stngVO);
			if (apcStngInfo == null || !StringUtils.hasText(apcStngInfo.getApcCd())) {
				rtnObj = apcEvrmntStngService.insertApcInitInfo(stngVO);
				if (rtnObj != null) {
					throw new EgovBizException(getMessageForMap(rtnObj));
				}
			}

		}

		return null;
	}


	@Override
	public List<ComUserVO> selectApcUserPopList(ComUserVO comUserVO) throws Exception {
		
		List<ComUserVO> resultList = comUserMapper.selectApcUserPopList(comUserVO);
		
		return resultList;
	}


	
	
	@Override
	public HashMap<String, Object> insertUserApcHstry(ComUserApcVO comUserApcVO) throws Exception {
		comUserMapper.insertUserApcHstry(comUserApcVO);
		return null;
	}

	@Override
	public ComUserAtchflVO getUserAtchfl(ComUserVO comUserVO) throws Exception {
		ComUserAtchflVO returnVO = comUserMapper.selectComUserAtchfl(comUserVO);
		return returnVO;
	}

}
