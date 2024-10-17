package com.at.apcss.am.clcln.service.impl;

import java.util.HashMap;
import java.util.List;

import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.at.apcss.am.clcln.mapper.ClclnUntprcMapper;
import com.at.apcss.am.clcln.service.ClclnUntprcService;
import com.at.apcss.am.clcln.vo.ClclnMngVO;
import com.at.apcss.am.clcln.vo.ClclnUntprcVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;

/**
 * @Class Name : ClclnUntprcServiceImpl.java
 * @Description : 정산단가 서비스를 정의하기 위한 서비스 구현 클래스
 * @author 신정철
 * @since 2023.10.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.10.21  신정철        최초 생성
 * </pre>
 */
@Service("clclnUntprcService")
public class ClclnUntprcServiceImpl extends BaseServiceImpl implements ClclnUntprcService {

	@Autowired
	private ClclnUntprcMapper clclnUntprcMapper;

	@Override
	public ClclnUntprcVO selectClclnUntprc(ClclnUntprcVO clclnUntprcVO) throws Exception {
		
		ClclnUntprcVO rtnVO = clclnUntprcMapper.selectClclnUntprc(clclnUntprcVO);
		
		return rtnVO;
	}

	@Override
	public List<ClclnUntprcVO> selectClclnUntprcList(ClclnUntprcVO clclnUntprcVO) throws Exception {

		List<ClclnUntprcVO> rtnList = clclnUntprcMapper.selectClclnUntprcList(clclnUntprcVO);
		
		return rtnList;
	}

	@Override
	public HashMap<String, Object> updateClclnUntprcList(List<ClclnUntprcVO> clclnUntprcList) throws Exception {
		
		for ( ClclnUntprcVO clclnUntprcVO : clclnUntprcList ) {
			
			ClclnUntprcVO chkVO = selectClclnUntprc(clclnUntprcVO);
			
			if (chkVO == null || !StringUtils.hasText(chkVO.getApcCd())) {
				if(0 == clclnUntprcMapper.insertClclnUntprc(clclnUntprcVO)) {
					throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
				}
			} else {
				if(0 == clclnUntprcMapper.updateClclnUntprc(clclnUntprcVO)) {
					throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
				}
			}
		}
		
		return null;
	}

	@Override
	public List<ClclnUntprcVO> selectApcClclnUntprcList(ClclnUntprcVO clclnUntprcVO) throws Exception {
		
		List<ClclnUntprcVO> resultList = clclnUntprcMapper.selectApcClclnUntprcList(clclnUntprcVO);

		return resultList;
	}

	@Override
	public HashMap<String, Object> insertApcUntprc(ClclnMngVO clclnMngVO) throws Exception {
		
		String apcCd = clclnMngVO.getApcCd();
		String clclnYr = clclnMngVO.getClclnYr();
		int clclnSn = clclnMngVO.getClclnSn();
		
		if (!StringUtils.hasLength(apcCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드");
		}
		
		if (!StringUtils.hasLength(clclnYr)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "정산연도");
		}
		
		if (clclnSn < 1) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "정산차수");
		}
		
		List<ClclnUntprcVO> clclnUntprcList = clclnMngVO.getClclnUntprcList();
		
		if (clclnUntprcList == null || clclnUntprcList.isEmpty()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND_TARGET_TODO, "단가등록");
		}
		
		String sysUserId = clclnMngVO.getSysLastChgUserId();
		String sysPrgrmId = clclnMngVO.getSysLastChgPrgrmId();
		
		
		ClclnUntprcVO untprcMstVO = new ClclnUntprcVO();
		untprcMstVO.setSysFrstInptUserId(sysUserId);
		untprcMstVO.setSysFrstInptPrgrmId(sysPrgrmId);
		untprcMstVO.setSysLastChgUserId(sysUserId);
		untprcMstVO.setSysLastChgPrgrmId(sysPrgrmId);
		
		untprcMstVO.setApcCd(apcCd);
		untprcMstVO.setClclnYr(clclnYr);
		untprcMstVO.setClclnSn(clclnSn);
		
		int untprcSn = 0;
		
		// 단가 마스터 정보 확인
		ClclnUntprcVO untprcMst = clclnUntprcMapper.selectClclnUntprcMstr(untprcMstVO);
		if (untprcMst != null && StringUtils.hasLength(untprcMst.getClclnYr())) {
			untprcSn = untprcMst.getMaxUntprcSn();
			
			untprcMstVO.setNeedsInsert(false);
		} else {
			untprcMstVO.setNeedsInsert(true);
		}
		
		for ( ClclnUntprcVO untprc : clclnUntprcList ) {
			
			untprc.setSysFrstInptUserId(sysUserId);
			untprc.setSysFrstInptPrgrmId(sysPrgrmId);
			untprc.setSysLastChgUserId(sysUserId);
			untprc.setSysLastChgPrgrmId(sysPrgrmId);
			
			// 
			untprc.setApcCd(apcCd);
			untprc.setClclnYr(clclnYr);
			untprc.setClclnSn(clclnSn);
			
			ClclnUntprcVO untprcInfo = clclnUntprcMapper.selectClclnUntprcDtl(untprc);
			if (untprcInfo != null && StringUtils.hasText(untprcInfo.getClclnYr())) {
				if (!ComConstants.CON_NONE.equals(untprcInfo.getDelYn())) {
					return ComUtil.getResultMap(ComConstants.MSGCD_TARGET_EXIST, "중복자료");
				}
				
				untprc.setNeedsInsert(false);
				
			} else {
				
				untprcSn++;
				untprc.setUntprcSn(untprcSn);
				
				untprc.setNeedsInsert(true);
			}
		}
		
		for ( ClclnUntprcVO untprc : clclnUntprcList ) {
			
			if (untprc.isNeedsInsert()) {
				clclnUntprcMapper.insertClclnUntprcDtl(untprc);
			} else {
				clclnUntprcMapper.updateClclnUntprcDtl(untprc);
			}
		}
		
		// 단가마스터 없으면 생성
		if (untprcMstVO.isNeedsInsert()) {
			clclnUntprcMapper.insertClclnUntprcDtl(untprcMstVO);
		}
		
		return null;
	}


	@Override
	public HashMap<String, Object> deleteApcUntprc(ClclnMngVO clclnMngVO) throws Exception {
		
		String apcCd = clclnMngVO.getApcCd();
		
		if (!StringUtils.hasLength(apcCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드");
		}
		
		List<ClclnUntprcVO> clclnUntprcList = clclnMngVO.getClclnUntprcList();
		
		if (clclnUntprcList == null || clclnUntprcList.isEmpty()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND_TARGET_TODO, "단가삭제");
		}
		
		String sysUserId = clclnMngVO.getSysLastChgUserId();
		String sysPrgrmId = clclnMngVO.getSysLastChgPrgrmId();
		
		for ( ClclnUntprcVO untprc : clclnUntprcList ) {
			
			untprc.setSysFrstInptUserId(sysUserId);
			untprc.setSysFrstInptPrgrmId(sysPrgrmId);
			untprc.setSysLastChgUserId(sysUserId);
			untprc.setSysLastChgPrgrmId(sysPrgrmId);
			 
			untprc.setApcCd(apcCd);
			ClclnUntprcVO untprcInfo = clclnUntprcMapper.selectClclnUntprcDtl(untprc);
			if (untprcInfo == null || !StringUtils.hasText(untprcInfo.getClclnYr())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND_TARGET_TODO, "삭제");
			}
		}
		
		for ( ClclnUntprcVO untprc : clclnUntprcList ) {
			clclnUntprcMapper.deleteClclnUntprcDtl(untprc);
		}
		
		return null;
	}

	@Override
	public ClclnUntprcVO selectClclnUntprcMstr(ClclnUntprcVO clclnUntprcVO) throws Exception {
		ClclnUntprcVO resultVO = clclnUntprcMapper.selectClclnUntprcMstr(clclnUntprcVO);
		return resultVO;
	}

	@Override
	public List<ClclnUntprcVO> selectClclnUntprcMstrList(ClclnUntprcVO clclnUntprcVO) throws Exception {
		List<ClclnUntprcVO> resultList = clclnUntprcMapper.selectClclnUntprcMstrList(clclnUntprcVO);
		return resultList;
	}

	@Override
	public HashMap<String, Object> insertClclnUntprcMstr(ClclnUntprcVO clclnUntprcVO) throws Exception {
		
		String apcCd = clclnUntprcVO.getApcCd();		
		if (!StringUtils.hasLength(apcCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드");
		}
		
		String clclnYr = clclnUntprcVO.getClclnYr();
		if (!StringUtils.hasLength(clclnYr)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "정산연도");
		}
		
		String bgngYmd = clclnUntprcVO.getBgngYmd();
		if (!StringUtils.hasLength(bgngYmd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "시작일자");
		}
		
		String endYmd = clclnUntprcVO.getEndYmd();
		if (!StringUtils.hasLength(endYmd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "종료일자");
		}
		
		clclnUntprcMapper.insertClclnUntprcMstr(clclnUntprcVO);
		
		return null;
	}

	@Override
	public HashMap<String, Object> updateClclnUntprcMstr(ClclnUntprcVO clclnUntprcVO) throws Exception {
		
		String apcCd = clclnUntprcVO.getApcCd();		
		if (!StringUtils.hasLength(apcCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드");
		}
		
		String clclnYr = clclnUntprcVO.getClclnYr();
		if (!StringUtils.hasLength(clclnYr)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "정산연도");
		}
		
		int clclnSn = clclnUntprcVO.getClclnSn();
		if (clclnSn < 1) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "정산차수");
		}
		
		
		String bgngYmd = clclnUntprcVO.getBgngYmd();
		if (!StringUtils.hasLength(bgngYmd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "시작일자");
		}
		
		String endYmd = clclnUntprcVO.getEndYmd();
		if (!StringUtils.hasLength(endYmd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "종료일자");
		}
		
		clclnUntprcMapper.updateClclnUntprcMstr(clclnUntprcVO);
		
		
		return null;
	}

}
