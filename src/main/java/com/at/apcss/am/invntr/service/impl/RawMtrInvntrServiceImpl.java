package com.at.apcss.am.invntr.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.BeanUtils;

import com.at.apcss.am.cmns.service.CmnsTaskNoService;
import com.at.apcss.am.cmns.service.StdGrdService;
import com.at.apcss.am.cmns.vo.StdGrdDtlVO;
import com.at.apcss.am.cmns.vo.StdGrdVO;
import com.at.apcss.am.constants.AmConstants;
import com.at.apcss.am.invntr.mapper.RawMtrInvntrMapper;
import com.at.apcss.am.invntr.service.RawMtrInvntrService;
import com.at.apcss.am.invntr.vo.RawMtrInvntrVO;
import com.at.apcss.am.invntr.vo.RawMtrStdGrdVO;
import com.at.apcss.co.constants.ApcConstants;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;

/**
 * @Class Name : RawMtrInvntrServiceImpl.java
 * @Description : 원물재고관리 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("rawMtrInvntrService")
public class RawMtrInvntrServiceImpl extends BaseServiceImpl implements RawMtrInvntrService {

	@Autowired
	private RawMtrInvntrMapper rawMtrInvntrMapper;

	@Resource(name= "cmnsTaskNoService")
	private CmnsTaskNoService cmnsTaskNoService;

	@Resource(name= "stdGrdService")
	private StdGrdService stdGrdService;
		
	@Override
	public RawMtrInvntrVO selectRawMtrInvntr(RawMtrInvntrVO rawMtrInvntrVO) throws Exception {

		RawMtrInvntrVO resultVO = rawMtrInvntrMapper.selectRawMtrInvntr(rawMtrInvntrVO);

		if (resultVO != null && StringUtils.hasText(resultVO.getWrhsno())) {
			List<RawMtrStdGrdVO> stdGrdList = rawMtrInvntrMapper.selectRawMtrStdGrdList(rawMtrInvntrVO);
			resultVO.setStdGrdList(stdGrdList);
		}

		return resultVO;
	}

	@Override
	public List<RawMtrInvntrVO> selectRawMtrInvntrList(RawMtrInvntrVO rawMtrInvntrVO) throws Exception {

		List<RawMtrInvntrVO> resultList = rawMtrInvntrMapper.selectRawMtrInvntrList(rawMtrInvntrVO);

		return resultList;
	}


	@Override
	public List<RawMtrInvntrVO> selectRawMtrInvntrListForPrcs(RawMtrInvntrVO rawMtrInvntrVO) throws Exception {
		List<RawMtrInvntrVO> resultList = rawMtrInvntrMapper.selectRawMtrInvntrListForPrcs(rawMtrInvntrVO);

		return resultList;
	}
	
	@Override
	public List<RawMtrInvntrVO> selectRawMtrInvntrListForSort(RawMtrInvntrVO rawMtrInvntrVO) throws Exception {
		
		List<RawMtrInvntrVO> resultList = rawMtrInvntrMapper.selectRawMtrInvntrListForSort(rawMtrInvntrVO);

		return resultList;
	}

	@Override
	public HashMap<String, Object> insertRawMtrInvntr(RawMtrInvntrVO rawMtrInvntrVO) throws Exception {

		List<RawMtrStdGrdVO> stdGrdList = rawMtrInvntrVO.getStdGrdList();
		if (stdGrdList != null && !stdGrdList.isEmpty()) {
			
			String apcCd = rawMtrInvntrVO.getApcCd();
			int wrhsQntt = rawMtrInvntrVO.getWrhsQntt();
			double wrhsWght = rawMtrInvntrVO.getWrhsQntt();
			
			double sumGrdNv = 0;
			int rmnQntt = wrhsQntt;
			double rmnWght = wrhsWght;
			
			int cntCalc = 0;

			for ( RawMtrStdGrdVO stdGrd : stdGrdList ) {

				StdGrdVO paramVO = new StdGrdVO();
				paramVO.setApcCd(apcCd);
				paramVO.setItemCd(stdGrd.getItemCd());
				paramVO.setGrdSeCd(stdGrd.getGrdSeCd());
				paramVO.setGrdKnd(stdGrd.getGrdKnd());
				
				StdGrdVO grdKndVO = stdGrdService.selectStdGrd(paramVO);
				if (grdKndVO == null || !StringUtils.hasText(grdKndVO.getGrdKnd())) {
					return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "등급정보");	// W0005	{0}이/가 없습니다. 
				}
				
				stdGrd.setStdGrdType(grdKndVO.getStdGrdType());
				
				if (StringUtils.hasText(stdGrd.getGrdCd())) {
					// 일반
					StdGrdDtlVO paramDtlVO = new StdGrdDtlVO();
					paramDtlVO.setApcCd(apcCd);
					paramDtlVO.setItemCd(stdGrd.getItemCd());
					paramDtlVO.setGrdSeCd(stdGrd.getGrdSeCd());
					paramDtlVO.setGrdKnd(stdGrd.getGrdKnd());
					paramDtlVO.setGrdCd(stdGrd.getGrdCd());
					
					StdGrdDtlVO grdDtlVO = stdGrdService.selectStdGrdDtl(paramDtlVO);
					if (grdDtlVO == null || !StringUtils.hasText(grdDtlVO.getGrdCd())) {
						return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "등급정보");	// W0005	{0}이/가 없습니다. 
					}
					
					stdGrd.setGrdNv(grdDtlVO.getGrdVl());
					
					if (AmConstants.CON_STD_GRD_TYPE_VL.equals(stdGrd.getStdGrdType())) {
						
						cntCalc++;
						sumGrdNv += stdGrd.getGrdNv();
						
						int qntt = (int)(wrhsQntt * stdGrd.getGrdNv() / 100);
						int wght = (int)(wrhsWght * stdGrd.getGrdNv() / 100);
						
						stdGrd.setGrdQntt(qntt);
						stdGrd.setGrdWght(wght);
						rmnQntt -= qntt;
						rmnWght -= wght;
					}
					
				} else {
					// CON_STD_GRD_CD_EMPTY
					if (AmConstants.CON_STD_GRD_TYPE_RT.equals(stdGrd.getStdGrdType())) {
						
						cntCalc++;
						// 비율적용 : 등급상세 없음 * 로 등록
						stdGrd.setGrdCd(AmConstants.CON_STD_GRD_CD_EMPTY);
						sumGrdNv += stdGrd.getGrdNv();
						
						
						int qntt = (int)(wrhsQntt * stdGrd.getGrdNv() / 100);
						int wght = (int)(wrhsWght * stdGrd.getGrdNv() / 100);
						stdGrd.setGrdQntt(qntt);
						stdGrd.setGrdWght(wght);
						rmnQntt -= qntt;
						rmnWght -= wght;
						
					} else {
						return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "등급값");
					}
				}
			}
			

			if (cntCalc > 0) {
				
				if (sumGrdNv > 100) {
					return ComUtil.getResultMap(ComConstants.MSGCD_TGT_GREATER_THAN, "비율합산||100");
				} else if (sumGrdNv < 100) {
					return ComUtil.getResultMap(ComConstants.MSGCD_TGT_LESS_THAN, "비율합산||100");
				} else {}
				
				// 잔여량 마지막에 몰아주기
				int divQntt = rmnQntt / cntCalc;
				int divWght = (int) rmnWght / cntCalc; 
				
				int oddQntt = rmnQntt - (divQntt * cntCalc);
				double oddWght = rmnWght - (divWght * cntCalc);
				
				int calcSn = 0;
				for ( RawMtrStdGrdVO stdGrd : stdGrdList ) {
					
					if (	!AmConstants.CON_STD_GRD_TYPE_RT.equals(stdGrd.getStdGrdType()) &&
							!AmConstants.CON_STD_GRD_TYPE_VL.equals(stdGrd.getStdGrdType())) {
						continue;
					}
					
					calcSn++;
					
					if (calcSn < cntCalc) {
						stdGrd.setGrdQntt(stdGrd.getGrdQntt() + divQntt);
						stdGrd.setGrdWght(stdGrd.getGrdWght() + divWght);
					} else {
						stdGrd.setGrdQntt(stdGrd.getGrdQntt() + divQntt + oddQntt);
						stdGrd.setGrdWght(stdGrd.getGrdWght() + divWght + oddWght);
					}
				}
			}
			
			for ( RawMtrStdGrdVO stdGrd : stdGrdList ) {
				RawMtrStdGrdVO rawMtrStdGrdVO = new RawMtrStdGrdVO();
				BeanUtils.copyProperties(rawMtrInvntrVO, rawMtrStdGrdVO);
				BeanUtils.copyProperties(stdGrd, rawMtrStdGrdVO,
						ApcConstants.PROP_APC_CD,
						ApcConstants.PROP_WRHSNO,
						ComConstants.PROP_SYS_FRST_INPT_DT,
						ComConstants.PROP_SYS_FRST_INPT_USER_ID,
						ComConstants.PROP_SYS_FRST_INPT_PRGRM_ID,
						ComConstants.PROP_SYS_LAST_CHG_DT,
						ComConstants.PROP_SYS_LAST_CHG_USER_ID,
						ComConstants.PROP_SYS_LAST_CHG_PRGRM_ID);
				rawMtrInvntrMapper.insertRawMtrStdGrd(rawMtrStdGrdVO);
			}
		}

		rawMtrInvntrMapper.insertRawMtrInvntr(rawMtrInvntrVO);
		
		return null;
	}


	@Override
	public HashMap<String, Object> insertRawMtrInvntrList(List<RawMtrInvntrVO> rawMtrInvntrList) throws Exception {

		for ( RawMtrInvntrVO rawMtrInvntrVO : rawMtrInvntrList ) {

			HashMap<String, Object> rtnObj = insertRawMtrInvntr(rawMtrInvntrVO);

			if (rtnObj != null) {
				throw new EgovBizException(getMessageForMap(rtnObj));
			}
		}

		return null;
	}

	@Override
	public HashMap<String, Object> deleteRawMtrInvntr(RawMtrInvntrVO rawMtrInvntrVO) throws Exception {

		// 재고상태 확인
		RawMtrInvntrVO invntrInfo = selectRawMtrInvntr(rawMtrInvntrVO);
		if (invntrInfo == null
				|| !StringUtils.hasText(invntrInfo.getWrhsno())
				|| ComConstants.CON_YES.equals(invntrInfo.getDelYn())) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "원물재고정보");	// W0005	{0}이/가 없습니다.
		}

		if (invntrInfo.getInvntrWght() < invntrInfo.getWrhsWght()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_TARGET_EXIST, "진행량");	// W0009	{0}이/가 있습니다.
		}

		// 선별지시 확인 추가
		if (invntrInfo.getCmndWght() > 0 || invntrInfo.getCmndQntt() > 0) {
			return ComUtil.getResultMap(ComConstants.MSGCD_TARGET_EXIST, "투입지시");	// W0009	{0}이/가 있습니다.
		}

		rawMtrInvntrMapper.deleteRawMtrInvntr(rawMtrInvntrVO);
		rawMtrInvntrMapper.deleteRawMtrStdGrd(rawMtrInvntrVO);

		return null;
	}

	@Override
	public HashMap<String, Object> updateRawMtrInvntrForDelY(RawMtrInvntrVO rawMtrInvntrVO) throws Exception {

		// 재고상태 확인
		RawMtrInvntrVO invntrInfo = selectRawMtrInvntr(rawMtrInvntrVO);
		if (invntrInfo == null
				|| !StringUtils.hasText(invntrInfo.getWrhsno())
				|| ComConstants.CON_YES.equals(invntrInfo.getDelYn())) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "원물재고정보");	// W0005	{0}이/가 없습니다.
		}

		if (invntrInfo.getInvntrWght() < invntrInfo.getWrhsWght()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_TARGET_EXIST, "진행량");	// W0009	{0}이/가 있습니다.
		}

		// 선별지시 확인 추가
		if (invntrInfo.getCmndWght() > 0 || invntrInfo.getCmndQntt() > 0) {
			return ComUtil.getResultMap(ComConstants.MSGCD_TARGET_EXIST, "투입지시");	// W0009	{0}이/가 있습니다.
		}

		rawMtrInvntrMapper.updateRawMtrInvntrDelY(rawMtrInvntrVO);
		rawMtrInvntrMapper.updateRawMtrStdGrdDelY(rawMtrInvntrVO);

		return null;
	}


	@Override
	public HashMap<String, Object> updateInvntrSortPrfmnc(RawMtrInvntrVO rawMtrInvntrVO) throws Exception {

		RawMtrInvntrVO invntrInfo = rawMtrInvntrMapper.selectRawMtrInvntr(rawMtrInvntrVO);

		if (invntrInfo == null || !StringUtils.hasText(invntrInfo.getWrhsno())) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "원물재고");
		}

		if (rawMtrInvntrVO.getInptWght() > invntrInfo.getInvntrWght()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_GREATER_THAN, "재고량||투입량");		// W0008	{0} 보다 {1}이/가 큽니다.
		}

		// 재고량
		int invntrQntt = invntrInfo.getInvntrQntt() - rawMtrInvntrVO.getInptQntt();
		double invntrWght = invntrInfo.getInvntrWght() - rawMtrInvntrVO.getInptWght();
		rawMtrInvntrVO.setInvntrQntt(invntrQntt);
		rawMtrInvntrVO.setInvntrWght(invntrWght);

		// 투입량
		int inptQntt = invntrInfo.getInptQntt() + rawMtrInvntrVO.getInptQntt();
		double inptWght = invntrInfo.getInptWght() + rawMtrInvntrVO.getInptWght();
		rawMtrInvntrVO.setInptQntt(inptQntt);
		rawMtrInvntrVO.setInptWght(inptWght);

		// 원물 재고변경 이력 등록 (투입)
		rawMtrInvntrVO.setChgRsnCd(AmConstants.CON_INVNTR_CHG_RSN_CD_P1);
		HashMap<String, Object> rtnObj = insertRawMtrChgHstry(rawMtrInvntrVO);

		if (rtnObj != null) {
			// error throw exception;
			throw new EgovBizException(getMessageForMap(rtnObj));
		}

		rawMtrInvntrMapper.updateInvntrSortPrfmnc(rawMtrInvntrVO);

		return null;
	}

	@Override
	public HashMap<String, Object> multiSaveRawMtrInvntrList(List<RawMtrInvntrVO> rawMtrInvntrList) throws Exception {

		HashMap<String, Object> rtnObj;

		List<RawMtrInvntrVO> updateList = new ArrayList<>();
		List<RawMtrInvntrVO> insertList = new ArrayList<>();

		for (RawMtrInvntrVO rawMtrInvntrVO : rawMtrInvntrList) {

			RawMtrInvntrVO vo = new RawMtrInvntrVO();
			BeanUtils.copyProperties(rawMtrInvntrVO, vo);

			if (ComConstants.ROW_STS_INSERT.equals(rawMtrInvntrVO.getRowSts())) {
				insertList.add(vo);
			}
			if (ComConstants.ROW_STS_UPDATE.equals(rawMtrInvntrVO.getRowSts())) {
				updateList.add(vo);
			}
		}

		if(insertList.size() > 0) {

			// 원물재고 등록
			for (RawMtrInvntrVO rawMtrInvntrVO : insertList) {
				// 재고 등록 부분
				String wrhsno = cmnsTaskNoService.selectWrhsno(rawMtrInvntrVO.getApcCd(), rawMtrInvntrVO.getWrhsYmd());
				rawMtrInvntrVO.setWrhsno(wrhsno);
				if (!StringUtils.hasText(rawMtrInvntrVO.getPltno())) {
					rawMtrInvntrVO.setPltno(wrhsno);
				}

				insertRawMtrInvntr(rawMtrInvntrVO);
				// 원물 재고 등록 이력 부분 추가

			}
		}


		// 원물재고 변경
		for (RawMtrInvntrVO rawMtrInvntrVO : updateList) {

			// 원물 재고변경 이력 등록
			rawMtrInvntrVO.setChgRsnCd(AmConstants.CON_INVNTR_CHG_RSN_CD_C1);
			rtnObj = insertRawMtrChgHstry(rawMtrInvntrVO);
			if (rtnObj != null) {
				// error throw exception;
				throw new EgovBizException(getMessageForMap(rtnObj));
			}

			// 원물 재고 변경
			rawMtrInvntrMapper.updateRawMtrInvntrChg(rawMtrInvntrVO);
		}

		return null;
	}

	@Override
	public HashMap<String, Object> updateRawMtrInvntr(List<RawMtrInvntrVO> rawMtrInvntrList) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public HashMap<String, Object> updateInvntrSortPrfmncCncl(RawMtrInvntrVO rawMtrInvntrVO) throws Exception {

		RawMtrInvntrVO invntrInfo = rawMtrInvntrMapper.selectRawMtrInvntr(rawMtrInvntrVO);

		if (invntrInfo == null || !StringUtils.hasText(invntrInfo.getWrhsno())) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "원물재고");
		}

		if (rawMtrInvntrVO.getInptWght() > invntrInfo.getSortWght()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_GREATER_THAN, "취소량||선별량");		// W0008	{0} 보다 {1}이/가 큽니다.
		}

		// 재고량
		int invntrQntt = invntrInfo.getInvntrQntt() + rawMtrInvntrVO.getInptQntt();
		double invntrWght = invntrInfo.getInvntrWght() + rawMtrInvntrVO.getInptWght();
		rawMtrInvntrVO.setInvntrQntt(invntrQntt);
		rawMtrInvntrVO.setInvntrWght(invntrWght);

		// 선별량
		int sortQntt = invntrInfo.getSortQntt() - rawMtrInvntrVO.getInptQntt();
		double sortWght = invntrInfo.getSortWght() - rawMtrInvntrVO.getInptWght();
		rawMtrInvntrVO.setInptQntt(sortQntt);
		rawMtrInvntrVO.setInptWght(sortWght);

		// 원물 재고변경 이력 등록 (투입취소)
		rawMtrInvntrVO.setChgRsnCd(AmConstants.CON_INVNTR_CHG_RSN_CD_P2);
		HashMap<String, Object> rtnObj = insertRawMtrChgHstry(rawMtrInvntrVO);

		if (rtnObj != null) {
			// error throw exception;
			throw new EgovBizException(getMessageForMap(rtnObj));
		}

		rawMtrInvntrMapper.updateInvntrSortPrfmnc(rawMtrInvntrVO);

		return null;
	}

	@Override
	public HashMap<String, Object> updateInvntrTrmsf(RawMtrInvntrVO rawMtrInvntrVO) throws Exception {

		RawMtrInvntrVO invntrInfo = rawMtrInvntrMapper.selectRawMtrInvntr(rawMtrInvntrVO);

		if (invntrInfo == null || !StringUtils.hasText(invntrInfo.getWrhsno())) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "원물재고");
		}

		if (rawMtrInvntrVO.getTrnsfQntt() > invntrInfo.getInvntrQntt()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_GREATER_THAN, "이송량||재고량");		// W0008	{0} 보다 {1}이/가 큽니다.
		}

		// 재고량
		int invntrQntt = invntrInfo.getInvntrQntt() - rawMtrInvntrVO.getTrnsfQntt();
		double invntrWght = invntrInfo.getInvntrWght() - rawMtrInvntrVO.getTrnsfWght();
		rawMtrInvntrVO.setInvntrQntt(invntrQntt);
		rawMtrInvntrVO.setInvntrWght(invntrWght);

		int trnsfQntt = invntrInfo.getTrnsfQntt() + rawMtrInvntrVO.getTrnsfQntt();
		double trnsfWght = invntrInfo.getTrnsfWght() + rawMtrInvntrVO.getTrnsfWght();
		rawMtrInvntrVO.setTrnsfQntt(trnsfQntt);
		rawMtrInvntrVO.setTrnsfWght(trnsfWght);

		// 원물 재고변경 이력 등록 (이송)
		rawMtrInvntrVO.setChgRsnCd(AmConstants.CON_INVNTR_CHG_RSN_CD_T1);
		HashMap<String, Object> rtnObj = insertRawMtrChgHstry(rawMtrInvntrVO);

		if (rtnObj != null) {
			// error throw exception;
			throw new EgovBizException(getMessageForMap(rtnObj));
		}

		rawMtrInvntrMapper.updateInvntrTrnsf(rawMtrInvntrVO);

		return null;
	}

	@Override
	public List<RawMtrInvntrVO> selectDailyRawMtrInvntrList(RawMtrInvntrVO rawMtrInvntrVO) throws Exception {
		List<RawMtrInvntrVO> resultList = rawMtrInvntrMapper.selectDailyRawMtrInvntrList(rawMtrInvntrVO);
		return resultList;
	}


	@Override
	public HashMap<String, Object> updateInvntrSortInpt(RawMtrInvntrVO rawMtrInvntrVO) throws Exception {

		RawMtrInvntrVO invntrInfo = rawMtrInvntrMapper.selectRawMtrInvntr(rawMtrInvntrVO);

		if (invntrInfo == null
				|| !StringUtils.hasText(invntrInfo.getWrhsno())
				|| !ComConstants.CON_NONE.equals(invntrInfo.getDelYn())) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "원물재고");
		}

		if (rawMtrInvntrVO.getInptPrgrsQntt() > invntrInfo.getInvntrQntt()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_GREATER_THAN, "재고량||투입량");		// W0008	{0} 보다 {1}이/가 큽니다.
		}

		int invntrQntt = invntrInfo.getInvntrQntt() - rawMtrInvntrVO.getInptPrgrsQntt();
		double invntrWght = invntrInfo.getInvntrWght() - rawMtrInvntrVO.getInptPrgrsWght();
		int inptPrgrsQntt = invntrInfo.getInptPrgrsQntt() + rawMtrInvntrVO.getInptPrgrsQntt();
		double inptPrgrsWght = invntrInfo.getInptPrgrsWght() + rawMtrInvntrVO.getInptPrgrsWght();

		rawMtrInvntrVO.setInvntrQntt(invntrQntt);
		rawMtrInvntrVO.setInvntrWght(invntrWght);

		rawMtrInvntrVO.setInptPrgrsQntt(inptPrgrsQntt);
		rawMtrInvntrVO.setInptPrgrsWght(inptPrgrsWght);

		// 원물 재고변경 이력 등록 (투입)
		rawMtrInvntrVO.setChgRsnCd(AmConstants.CON_INVNTR_CHG_RSN_CD_P1);
		HashMap<String, Object> rtnObj = insertRawMtrChgHstry(rawMtrInvntrVO);

		if (rtnObj != null) {
			// error throw exception;
			throw new EgovBizException(getMessageForMap(rtnObj));
		}

		rawMtrInvntrMapper.updateInvntrInptPrgrs(rawMtrInvntrVO);

		return null;
	}

	@Override
	public HashMap<String, Object> deleteInvntrSortInpt(RawMtrInvntrVO rawMtrInvntrVO) throws Exception {

		RawMtrInvntrVO invntrInfo = rawMtrInvntrMapper.selectRawMtrInvntr(rawMtrInvntrVO);

		if (invntrInfo == null
				|| !StringUtils.hasText(invntrInfo.getWrhsno())
				|| !ComConstants.CON_NONE.equals(invntrInfo.getDelYn())) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "원물재고정보");
		}

		if (rawMtrInvntrVO.getInptPrgrsQntt() > invntrInfo.getInptPrgrsQntt()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_GREATER_THAN, "진행량||취소량");		// W0008	{0} 보다 {1}이/가 큽니다.
		}

		int invntrQntt = invntrInfo.getInvntrQntt() + rawMtrInvntrVO.getInptPrgrsQntt();
		double invntrWght = invntrInfo.getInvntrWght() + rawMtrInvntrVO.getInptPrgrsWght();
		int inptPrgrsQntt = invntrInfo.getInptPrgrsQntt() - rawMtrInvntrVO.getInptPrgrsQntt();
		double inptPrgrsWght = invntrInfo.getInptPrgrsWght() - rawMtrInvntrVO.getInptPrgrsWght();

		rawMtrInvntrVO.setInvntrQntt(invntrQntt);
		rawMtrInvntrVO.setInvntrWght(invntrWght);

		rawMtrInvntrVO.setInptPrgrsQntt(inptPrgrsQntt);
		rawMtrInvntrVO.setInptPrgrsWght(inptPrgrsWght);

		// 원물 재고변경 이력 등록 (투입취소)
		rawMtrInvntrVO.setChgRsnCd(AmConstants.CON_INVNTR_CHG_RSN_CD_P2);
		HashMap<String, Object> rtnObj = insertRawMtrChgHstry(rawMtrInvntrVO);

		if (rtnObj != null) {
			// error throw exception;
			throw new EgovBizException(getMessageForMap(rtnObj));
		}

		rawMtrInvntrMapper.updateInvntrInptPrgrs(rawMtrInvntrVO);

		return null;
	}

	@Override
	public HashMap<String, Object> updateInvntrPrcs(RawMtrInvntrVO rawMtrInvntrVO) throws Exception {
		
		RawMtrInvntrVO invntrInfo = rawMtrInvntrMapper.selectRawMtrInvntr(rawMtrInvntrVO);

		if (invntrInfo == null || !StringUtils.hasText(invntrInfo.getWrhsno())) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "원물재고");
		}

		if (rawMtrInvntrVO.getInptWght() > invntrInfo.getInvntrWght()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_GREATER_THAN, "재고량||투입량");		// W0008	{0} 보다 {1}이/가 큽니다.
		}

		// 재고량
		int invntrQntt = invntrInfo.getInvntrQntt() - rawMtrInvntrVO.getPrcsQntt();
		double invntrWght = invntrInfo.getInvntrWght() - rawMtrInvntrVO.getPrcsWght();
		rawMtrInvntrVO.setInvntrQntt(invntrQntt);
		rawMtrInvntrVO.setInvntrWght(invntrWght);

		// 재처리량
		int prcsQntt = invntrInfo.getPrcsQntt() + rawMtrInvntrVO.getPrcsQntt();
		double prcsWght = invntrInfo.getPrcsWght() + rawMtrInvntrVO.getPrcsWght();
		rawMtrInvntrVO.setPrcsQntt(prcsQntt);
		rawMtrInvntrVO.setPrcsWght(prcsWght);

		// 원물 재고변경 이력 등록 (재처리)
		rawMtrInvntrVO.setChgRsnCd(AmConstants.CON_INVNTR_CHG_RSN_CD_P3);
		HashMap<String, Object> rtnObj = insertRawMtrChgHstry(rawMtrInvntrVO);

		if (rtnObj != null) {
			// error throw exception;
			throw new EgovBizException(getMessageForMap(rtnObj));
		}

		rawMtrInvntrMapper.updateInvntrPrcs(rawMtrInvntrVO);

		return null;
	}

	@Override
	public HashMap<String, Object> deleteInvntrPrcs(RawMtrInvntrVO rawMtrInvntrVO) throws Exception {
		
		RawMtrInvntrVO invntrInfo = rawMtrInvntrMapper.selectRawMtrInvntr(rawMtrInvntrVO);

		if (invntrInfo == null || !StringUtils.hasText(invntrInfo.getWrhsno())) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "원물재고");
		}

		if (rawMtrInvntrVO.getPrcsWght() > invntrInfo.getPrcsWght()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_GREATER_THAN, "취소량||처리량");		// W0008	{0} 보다 {1}이/가 큽니다.
		}

		// 재고량
		int invntrQntt = invntrInfo.getInvntrQntt() + rawMtrInvntrVO.getPrcsQntt();
		double invntrWght = invntrInfo.getInvntrWght() + rawMtrInvntrVO.getPrcsWght();
		rawMtrInvntrVO.setInvntrQntt(invntrQntt);
		rawMtrInvntrVO.setInvntrWght(invntrWght);

		// 재처리량
		int prcsQntt = invntrInfo.getPrcsQntt() - rawMtrInvntrVO.getPrcsQntt();
		double prcsWght = invntrInfo.getPrcsWght() - rawMtrInvntrVO.getPrcsWght();
		rawMtrInvntrVO.setPrcsQntt(prcsQntt);
		rawMtrInvntrVO.setPrcsWght(prcsWght);

		// 원물 재고변경 이력 등록 (처리취소)
		rawMtrInvntrVO.setChgRsnCd(AmConstants.CON_INVNTR_CHG_RSN_CD_P4);
		HashMap<String, Object> rtnObj = insertRawMtrChgHstry(rawMtrInvntrVO);

		if (rtnObj != null) {
			// error throw exception;
			throw new EgovBizException(getMessageForMap(rtnObj));
		}

		rawMtrInvntrMapper.updateInvntrPrcs(rawMtrInvntrVO);
		
		return null;
	}
	
	@Override
	public HashMap<String, Object> insertRawMtrChgHstry(RawMtrInvntrVO rawMtrInvntrVO) throws Exception {

		RawMtrInvntrVO invntrInfo = rawMtrInvntrMapper.selectRawMtrInvntr(rawMtrInvntrVO);

		if (invntrInfo == null || !StringUtils.hasText(invntrInfo.getWrhsno())) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "원물재고");
		}

		RawMtrInvntrVO chgHstryVO = new RawMtrInvntrVO();
		BeanUtils.copyProperties(rawMtrInvntrVO, chgHstryVO);
		chgHstryVO.setChgBfrQntt(invntrInfo.getInvntrQntt());
		chgHstryVO.setChgBfrWght(invntrInfo.getInvntrWght());
		chgHstryVO.setChgAftrQntt(rawMtrInvntrVO.getInvntrQntt());
		chgHstryVO.setChgAftrWght(rawMtrInvntrVO.getInvntrWght());

		if (!StringUtils.hasText(rawMtrInvntrVO.getWarehouseSeCd())
				|| rawMtrInvntrVO.getWarehouseSeCd().equals(invntrInfo.getWarehouseSeCd())) {
			chgHstryVO.setWarehouseSeCd(ComConstants.CON_BLANK);
		}

		// 이력 insert
		rawMtrInvntrMapper.insertRawMtrChgHstry(chgHstryVO);

		return null;
	}

}
