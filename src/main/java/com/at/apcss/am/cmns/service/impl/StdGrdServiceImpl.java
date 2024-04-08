package com.at.apcss.am.cmns.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.at.apcss.am.cmns.mapper.StdGrdMapper;
import com.at.apcss.am.cmns.service.CmnsValidationService;
import com.at.apcss.am.cmns.service.StdGrdService;
import com.at.apcss.am.cmns.vo.StdGrdDtlVO;
import com.at.apcss.am.cmns.vo.StdGrdJgmtVO;
import com.at.apcss.am.cmns.vo.StdGrdListVO;
import com.at.apcss.am.cmns.vo.StdGrdVO;
import com.at.apcss.am.constants.AmConstants;
import com.at.apcss.co.cd.service.ComCdService;
import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.co.constants.ApcConstants;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;

/**
 * @Class Name : StdGrdServiceImpl.java
 * @Description : 등급정보관리 서비스를 정의하기 위한 서비스 구현 클래스
 * @author 신정철
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21  신정철        최초 생성
 * </pre>
 */
@Service("stdGrdService")
public class StdGrdServiceImpl extends BaseServiceImpl implements StdGrdService {

	@Autowired
	private StdGrdMapper stdGrdMapper;

	@Resource(name = "cmnsValidationService")
	private CmnsValidationService cmnsValidationService;

	@Resource(name ="comCdService")
	private ComCdService comCdService;

	@Override
	public StdGrdVO selectStdGrd(StdGrdVO StdGrdVO) throws Exception {
		StdGrdVO resultVO = stdGrdMapper.selectStdGrd(StdGrdVO);
		return resultVO;
	}

	@Override
	public List<StdGrdVO> selectStdGrdList(StdGrdVO stdGrdVO) throws Exception {
		List<StdGrdVO> resultList = stdGrdMapper.selectStdGrdList(stdGrdVO);
		return resultList;
	}

	@Override
	public int insertStdGrd(StdGrdVO stdGrdVO) throws Exception {

		if (stdGrdVO != null && !StringUtils.hasText(stdGrdVO.getGrdKnd())) {
			StdGrdVO returnVO = stdGrdMapper.selectNewGrdKnd(stdGrdVO);
			stdGrdVO.setGrdKnd(returnVO.getGrdKnd());
		}

		int insertedCnt = stdGrdMapper.insertStdGrd(stdGrdVO);
		return insertedCnt;
	}

	@Override
	public HashMap<String, Object> insertStdGrdAuto(StdGrdVO stdGrdVO) throws Exception {

		ComCdVO comCdVO = new ComCdVO();
		comCdVO.setApcCd(ApcConstants.APC_CD_SYSTEM);

		// 상품등급
		comCdVO.setCdId(AmConstants.CON_CD_ID_GDS_GRD);

		ComCdVO gdsGrdInfo = comCdService.selectComCd(comCdVO);
		if (gdsGrdInfo == null || !StringUtils.hasText(gdsGrdInfo.getCdId())) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "기본등급정보");
		}

		stdGrdVO.setGrdSeCd(AmConstants.CON_CD_ID_GRD_SE_CD_GDS);

		StdGrdVO returnVO = stdGrdMapper.selectNewGrdKnd(stdGrdVO);
		String gdsGrdKnd = returnVO.getGrdKnd();

		StdGrdVO gdsGrdVO = new StdGrdVO();
		BeanUtils.copyProperties(stdGrdVO, gdsGrdVO);
		gdsGrdVO.setGrdKnd(gdsGrdKnd);
		gdsGrdVO.setGrdKndNm(gdsGrdInfo.getCdNm());
		gdsGrdVO.setGrdSeCd(AmConstants.CON_CD_ID_GRD_SE_CD_GDS);
		gdsGrdVO.setSn(1);

		// insert master
		insertStdGrd(gdsGrdVO);

		int sn = 0;
		List<ComCdVO> gdsGrdDtlList = comCdService.selectComCdDtlList(comCdVO);
		for ( ComCdVO gdsGrdDtlInfo : gdsGrdDtlList ) {

			sn++;

			StdGrdDtlVO gdsGrdDtlVO = new StdGrdDtlVO();
			BeanUtils.copyProperties(gdsGrdVO, gdsGrdDtlVO);

			gdsGrdDtlVO.setGrdNm(gdsGrdDtlInfo.getCdVlNm());
			gdsGrdDtlVO.setSn(sn);

			insertStdGrdDtl(gdsGrdDtlVO);
		}

		// 선별등급
		comCdVO.setCdId(AmConstants.CON_CD_ID_SORT_GRD);

		ComCdVO sortGrdInfo = comCdService.selectComCd(comCdVO);
		if (sortGrdInfo == null || !StringUtils.hasText(sortGrdInfo.getCdId())) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "선별기본등급정보");
		}

		stdGrdVO.setGrdSeCd(AmConstants.CON_CD_ID_GRD_SE_CD_SORT);
		StdGrdVO sortReturnVO = stdGrdMapper.selectNewGrdKnd(stdGrdVO);
		String sortGrdKnd = sortReturnVO.getGrdKnd();

		StdGrdVO sortGrdVO = new StdGrdVO();
		BeanUtils.copyProperties(stdGrdVO, sortGrdVO);
		sortGrdVO.setGrdKnd(sortGrdKnd);
		sortGrdVO.setGrdKndNm(sortGrdInfo.getCdNm());
		sortGrdVO.setGrdSeCd(AmConstants.CON_CD_ID_GRD_SE_CD_SORT);
		sortGrdVO.setSn(1);

		// insert master : sort
		insertStdGrd(sortGrdVO);

		sn = 0;
		List<ComCdVO> sortGrdDtlList = comCdService.selectComCdDtlList(comCdVO);
		for ( ComCdVO sortGrdDtlInfo : sortGrdDtlList ) {
			sn++;
			StdGrdDtlVO sortGrdDtlVO = new StdGrdDtlVO();
			BeanUtils.copyProperties(sortGrdVO, sortGrdDtlVO);

			sortGrdDtlVO.setGrdNm(sortGrdDtlInfo.getCdVlNm());
			sortGrdDtlVO.setSn(sn);
			insertStdGrdDtl(sortGrdDtlVO);
		}

		// 입고등급
		comCdVO.setCdId(AmConstants.CON_CD_ID_STD_GRD);
		List<ComCdVO> stdGrdList = comCdService.selectComCdDtlList(comCdVO);
		
		comCdVO.setCdId(AmConstants.CON_CD_ID_WRHS_GRD);
		List<ComCdVO> wrhsGrdDtlList = comCdService.selectComCdDtlList(comCdVO);

		sn = 0;
		for ( ComCdVO stdGrd : stdGrdList ) {

			sn++;
			StdGrdVO wrhsGrdVO = new StdGrdVO();
			BeanUtils.copyProperties(stdGrdVO, wrhsGrdVO);
			wrhsGrdVO.setGrdKnd(stdGrd.getCdVl());
			wrhsGrdVO.setGrdKndNm(stdGrd.getCdVlNm());
			wrhsGrdVO.setGrdSeCd(AmConstants.CON_CD_ID_GRD_SE_CD_WRHS);
			wrhsGrdVO.setSn(sn);

			insertStdGrd(wrhsGrdVO);
			int dtlSn = 0;
			for ( ComCdVO wrhsGrdDtlInfo : wrhsGrdDtlList ) {
				dtlSn++;
				StdGrdDtlVO wrhsGrdDtlVO = new StdGrdDtlVO();
				BeanUtils.copyProperties(wrhsGrdVO, wrhsGrdDtlVO);
				
				wrhsGrdDtlVO.setGrdCd(wrhsGrdDtlInfo.getCdVl());
				wrhsGrdDtlVO.setGrdNm(wrhsGrdDtlInfo.getCdVlNm());
				wrhsGrdDtlVO.setSn(dtlSn);
				insertStdGrdDtl(wrhsGrdDtlVO);
			}
		}

		return null;
	}



	@Override
	public int updateStdGrd(StdGrdVO stdGrdVO) throws Exception {
		int updatedCnt = stdGrdMapper.updateStdGrd(stdGrdVO);
		return updatedCnt;
	}

	@Override
	public HashMap<String, Object> multiStdGrdList(List<StdGrdListVO> stdGrdLists) throws Exception {

		List<StdGrdVO> stdGrdList = stdGrdLists.get(0).getStdGrdList();
		List<StdGrdDtlVO> stdGrdDtlList = stdGrdLists.get(0).getStdGrdDtlList();
		List<StdGrdJgmtVO> stdGrdJgmtList = stdGrdLists.get(0).getStdGrdJgmtList();

		String sysFrstInptPrgrmId = stdGrdLists.get(0).getSysFrstInptPrgrmId();
		String sysFrstInptUserId = stdGrdLists.get(0).getSysFrstInptUserId();
		String sysLastChgPrgrmId = stdGrdLists.get(0).getSysLastChgPrgrmId();
		String sysLastChgUserId = stdGrdLists.get(0).getSysLastChgUserId();

		for (StdGrdVO stdGrdVO : stdGrdList) {

			stdGrdVO.setSysFrstInptPrgrmId(sysFrstInptPrgrmId);;
			stdGrdVO.setSysFrstInptUserId(sysFrstInptUserId);
			stdGrdVO.setSysLastChgPrgrmId(sysLastChgPrgrmId);
			stdGrdVO.setSysLastChgUserId(sysLastChgUserId);

			if(ComConstants.ROW_STS_INSERT.equals(stdGrdVO.getRowSts())) {

				if(0 == insertStdGrd(stdGrdVO)) {
					throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
				}
			}
			if(ComConstants.ROW_STS_UPDATE.equals(stdGrdVO.getRowSts())) {

				if(0 == updateStdGrd(stdGrdVO)) {
					throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
				}
			}
		}

		for (StdGrdDtlVO stdGrdDtlVO : stdGrdDtlList) {

			stdGrdDtlVO.setSysFrstInptPrgrmId(sysFrstInptPrgrmId);;
			stdGrdDtlVO.setSysFrstInptUserId(sysFrstInptUserId);
			stdGrdDtlVO.setSysLastChgPrgrmId(sysLastChgPrgrmId);
			stdGrdDtlVO.setSysLastChgUserId(sysLastChgUserId);

			if(ComConstants.ROW_STS_INSERT.equals(stdGrdDtlVO.getRowSts())) {
				if(0 == insertStdGrdDtl(stdGrdDtlVO)) {
					throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
				}
			}
			if(ComConstants.ROW_STS_UPDATE.equals(stdGrdDtlVO.getRowSts())) {

				if(0 == updateStdGrdDtl(stdGrdDtlVO)) {
					throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
				}
			}
		}


		for (StdGrdJgmtVO stdGrdJgmtVO : stdGrdJgmtList) {

			stdGrdJgmtVO.setSysFrstInptPrgrmId(sysFrstInptPrgrmId);
			stdGrdJgmtVO.setSysFrstInptUserId(sysFrstInptUserId);
			stdGrdJgmtVO.setSysLastChgPrgrmId(sysLastChgPrgrmId);
			stdGrdJgmtVO.setSysLastChgUserId(sysLastChgUserId);

			if(ComConstants.ROW_STS_INSERT.equals(stdGrdJgmtVO.getRowSts())) {

				if(0 == insertStdGrdJgmt(stdGrdJgmtVO)) {
					throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
				}
			}
			if(ComConstants.ROW_STS_UPDATE.equals(stdGrdJgmtVO.getRowSts())) {

				if(0 == updateStdGrdJgmt(stdGrdJgmtVO)) {
					throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
				}
			}
		}

		return null;
	}

	@Override
	public HashMap<String, Object> deleteStdGrd(StdGrdVO stdGrdVO) throws Exception {

		StdGrdDtlVO stdGrdDtlVO = new StdGrdDtlVO();
		stdGrdDtlVO.setApcCd(stdGrdVO.getApcCd());
		stdGrdDtlVO.setItemCd(stdGrdVO.getItemCd());
		stdGrdDtlVO.setGrdSeCd(stdGrdVO.getGrdSeCd());
		stdGrdDtlVO.setGrdKnd(stdGrdVO.getGrdKnd());
		List<StdGrdDtlVO> stdGrdDtlList = selectStdGrdDtlList(stdGrdDtlVO);

		for (StdGrdDtlVO stdGrdDtl : stdGrdDtlList) {

			HashMap<String, Object> rtnObj = deleteStdGrdDtl(stdGrdDtl);
			if(rtnObj != null ) {
				return rtnObj;
			}
		}

		if(0 == stdGrdMapper.deleteStdGrd(stdGrdVO)) {
			throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "삭제 중 오류가 발생 했습니다."))); // E0000	{0}
		}

		return null;

	}

	@Override
	public int deleteStdGrdAll(StdGrdVO stdGrdVO) throws Exception {
		int deletedCnt = stdGrdMapper.deleteStdGrdAll(stdGrdVO);

		return deletedCnt;
	}

	@Override
	public StdGrdDtlVO selectStdGrdDtl(StdGrdDtlVO stdGrdDtlVO) throws Exception {
		StdGrdDtlVO resultVO = stdGrdMapper.selectStdGrdDtl(stdGrdDtlVO);
		return resultVO;
	}

	@Override
	public List<StdGrdDtlVO> selectStdGrdDtlList(StdGrdDtlVO stdGrdDtlVO) throws Exception {
		List<StdGrdDtlVO> resultList = stdGrdMapper.selectStdGrdDtlList(stdGrdDtlVO);
		return resultList;
	}

	@Override
	public int insertStdGrdDtl(StdGrdDtlVO stdGrdDtlVO) throws Exception {
		int insertedCnt = stdGrdMapper.insertStdGrdDtl(stdGrdDtlVO);
		return insertedCnt;
	}

	@Override
	public int updateStdGrdDtl(StdGrdDtlVO stdGrdDtlVO) throws Exception {
		int updatedCnt = stdGrdMapper.updateStdGrdDtl(stdGrdDtlVO);
		return updatedCnt;
	}

	@Override
	public HashMap<String, Object> deleteStdGrdDtl(StdGrdDtlVO stdGrdDtlVO) throws Exception {

		String errMsg = grdDtlInvntrDelible(stdGrdDtlVO);
		if(errMsg == null ) {

			if(0 == stdGrdMapper.deleteStdGrdDtl(stdGrdDtlVO)) {
				throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "삭제 중 오류가 발생 했습니다."))); // E0000	{0}
			}

		}else {
			return ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, errMsg); // E0000	{0}
		}
		return null;
	}

	@Override
	public int deleteStdGrdDtlAll(StdGrdDtlVO stdGrdDtlVO) throws Exception {
		int deletedCnt = stdGrdMapper.deleteStdGrdDtlAll(stdGrdDtlVO);
		return deletedCnt;
	}

	@Override
	public StdGrdJgmtVO selectStdGrdJgmt(StdGrdJgmtVO StdGrdJgmtVO) throws Exception {
		StdGrdJgmtVO resultVO = stdGrdMapper.selectStdGrdJgmt(StdGrdJgmtVO);

		return resultVO;
	}

	@Override
	public List<StdGrdJgmtVO> selectStdGrdJgmtList(StdGrdJgmtVO StdGrdJgmtVO) throws Exception {
		List<StdGrdJgmtVO> resultList = stdGrdMapper.selectStdGrdJgmtList(StdGrdJgmtVO);

		return resultList;
	}

	@Override
	public int insertStdGrdJgmt(StdGrdJgmtVO StdGrdJgmtVO) throws Exception {

		int insertedCnt = stdGrdMapper.insertStdGrdJgmt(StdGrdJgmtVO);

		return insertedCnt;
	}

	@Override
	public int updateStdGrdJgmt(StdGrdJgmtVO StdGrdJgmtVO) throws Exception {

		int updatedCnt = stdGrdMapper.updateStdGrdJgmt(StdGrdJgmtVO);

		return updatedCnt;
	}

	@Override
	public HashMap<String, Object> deleteStdGrdJgmt(StdGrdJgmtVO StdGrdJgmtVO) throws Exception {
		String errMsg = grdJgmtInvntrDelible(StdGrdJgmtVO);
		if(errMsg == null ) {

			if (0 == stdGrdMapper.deleteStdGrdJgmt(StdGrdJgmtVO)) {
				throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000 {0}
			}


		}else {
			return ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, errMsg); // E0000	{0}
		}
		return null;
	}

	@Override
	public int deleteStdGrdJgmtAll(StdGrdJgmtVO StdGrdJgmtVO) throws Exception {
		int deletedCnt = stdGrdMapper.deleteStdGrdJgmtAll(StdGrdJgmtVO);
		return deletedCnt;
	}

	@Override
	public String grdDtlInvntrDelible(StdGrdDtlVO stdGrdDtlVO) throws Exception {
		List<StdGrdVO> resultList = new ArrayList<>();
		int jgmtCnt = stdGrdMapper.grdJgmtCheck(stdGrdDtlVO);
		String grdSeCd = stdGrdDtlVO.getGrdSeCd();
		if (jgmtCnt > 0) {
			resultList = stdGrdMapper.grdDtlInvntrDelible(stdGrdDtlVO);
		}else {
			if("01".equals(grdSeCd) || "02".equals(grdSeCd)) {
				resultList = stdGrdMapper.grdDtlInvntrDelibleNotJgmt(stdGrdDtlVO);
			}
		}

		if(resultList.size() > 0) {
			String delible = "해당 상세 등급은 ";
			for (int i = 0; i < resultList.size(); i++) {
				if(i == 0) {
					delible += resultList.get(i).getDelible();
				}else {
					delible += ", "+resultList.get(i).getDelible();
				}
			}
			delible += "이/가 존재 합니다.";

			return delible;
		}

		return null;
	}

	@Override
	public String grdJgmtInvntrDelible(StdGrdJgmtVO stdGrdJgmtVO) throws Exception {

		List<StdGrdJgmtVO> resultList = stdGrdMapper.grdJgmtInvntrDelible(stdGrdJgmtVO);

		if(resultList.size() > 0) {
			String delible = "해당 판정 등급은 ";
			for (int i = 0; i < resultList.size(); i++) {
				if(i == 0) {
					delible += resultList.get(i).getDelible();
				}else {
					delible += ", "+resultList.get(i).getDelible();
				}
			}
			delible += "이/가 존재 합니다.";

			return delible;
		}

		return null;
	}

	@Override
	public int updateGrd(StdGrdDtlVO stdGrdDtl) throws Exception {
		int updatedCnt = 0;
		
		updatedCnt += stdGrdMapper.updateGrd(stdGrdDtl);
		
		return updatedCnt;
	}
	
	@Override
	public HashMap<String, Object> updateGrdList(List<StdGrdDtlVO> stdGrdDtlList) throws Exception {
		for (StdGrdDtlVO stdGrdDtlVO : stdGrdDtlList) {
			updateGrd(stdGrdDtlVO);
		}
		return null;
	}

	

}
