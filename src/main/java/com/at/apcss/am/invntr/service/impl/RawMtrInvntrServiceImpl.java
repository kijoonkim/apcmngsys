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
	public HashMap<String, Object> insertRawMtrInvntr(RawMtrInvntrVO rawMtrInvntrVO) throws Exception {

		rawMtrInvntrMapper.insertRawMtrInvntr(rawMtrInvntrVO);
		List<RawMtrStdGrdVO> stdGrdList = rawMtrInvntrVO.getStdGrdList();

		if (stdGrdList != null) {

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
			return ComUtil.getResultMap("W0005", "원물재고정보");	// W0005	{0}이/가 없습니다.
		}

		if (invntrInfo.getInvntrWght() < invntrInfo.getWrhsWght()) {
			return ComUtil.getResultMap("W0009", "진행량");	// W0009	{0}이/가 있습니다.
		}

		// 선별지시 확인 추가
		if (invntrInfo.getCmndWght() > 0 || invntrInfo.getCmndQntt() > 0) {
			return ComUtil.getResultMap("W0009", "투입지시");	// W0009	{0}이/가 있습니다.
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
			return ComUtil.getResultMap("W0005", "원물재고정보");	// W0005	{0}이/가 없습니다.
		}

		if (invntrInfo.getInvntrWght() < invntrInfo.getWrhsWght()) {
			return ComUtil.getResultMap("W0009", "진행량");	// W0009	{0}이/가 있습니다.
		}

		// 선별지시 확인 추가
		if (invntrInfo.getCmndWght() > 0 || invntrInfo.getCmndQntt() > 0) {
			return ComUtil.getResultMap("W0009", "투입지시");	// W0009	{0}이/가 있습니다.
		}

		rawMtrInvntrMapper.updateRawMtrInvntrDelY(rawMtrInvntrVO);
		rawMtrInvntrMapper.updateRawMtrStdGrdDelY(rawMtrInvntrVO);

		return null;
	}


	@Override
	public HashMap<String, Object> updateInvntrSortPrfmnc(RawMtrInvntrVO rawMtrInvntrVO) throws Exception {

		RawMtrInvntrVO invntrInfo = rawMtrInvntrMapper.selectRawMtrInvntr(rawMtrInvntrVO);

		if (invntrInfo == null || !StringUtils.hasText(invntrInfo.getWrhsno())) {
			logger.debug("원물재고 없음");
			return ComUtil.getResultMap("W0005", "원물재고");
		}

		if (rawMtrInvntrVO.getInptWght() > invntrInfo.getInvntrWght()) {
			logger.debug("원물재고 대비 투입량 over");
			return ComUtil.getResultMap("W0008", "재고량||투입량");		// W0008	{0} 보다 {1}이/가 큽니다.
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

		int updatedCnt = rawMtrInvntrMapper.updateInvntrSortPrfmnc(rawMtrInvntrVO);

		if (updatedCnt != 1) {

		}

		return null;
	}

	@Override
	public HashMap<String, Object> multiSaveRawMtrInvntrList(List<RawMtrInvntrVO> rawMtrInvntrList) throws Exception {

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
				rawMtrInvntrVO.setPltno(wrhsno);

				for (RawMtrStdGrdVO rawMtrStdGrdVO : rawMtrInvntrVO.getStdGrdList()) {
					rawMtrStdGrdVO.setWrhsno(wrhsno);;
				}

				insertRawMtrInvntr(rawMtrInvntrVO);
				// 원물 재고 등록 이력 부분 추가

			}
		}


		// 원물재고 변경
		for (RawMtrInvntrVO rawMtrInvntrVO : updateList) {

			// 원물 재고변경 이력 부분 추가 예정

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

		int updatedCnt = rawMtrInvntrMapper.updateInvntrSortPrfmnc(rawMtrInvntrVO);

		if (updatedCnt != 1) {

		}

		return null;
	}

	@Override
	public HashMap<String, Object> updateInvntrTrmsf(RawMtrInvntrVO rawMtrInvntrVO) throws Exception {

		RawMtrInvntrVO invntrInfo = rawMtrInvntrMapper.selectRawMtrInvntr(rawMtrInvntrVO);

		if (invntrInfo == null || !StringUtils.hasText(invntrInfo.getWrhsno())) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "원물재고");
		}

		if (rawMtrInvntrVO.getTrnsfQntt() > invntrInfo.getInvntrQntt()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_GREATER_THAN, "취소량||선별량");		// W0008	{0} 보다 {1}이/가 큽니다.
		}


		// 선별량
		int invntrQntt = invntrInfo.getInvntrQntt() - rawMtrInvntrVO.getTrnsfQntt();
		double invntrWght = invntrInfo.getInvntrWght() - rawMtrInvntrVO.getTrnsfWght();
		rawMtrInvntrVO.setInvntrQntt(invntrQntt);
		rawMtrInvntrVO.setInvntrWght(invntrWght);

		int updatedCnt = rawMtrInvntrMapper.updateInvntrTrnsf(rawMtrInvntrVO);

		if (updatedCnt != 1) {

		}

		return null;
	}



}
