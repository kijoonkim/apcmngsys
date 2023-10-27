package com.at.apcss.am.wgh.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.at.apcss.am.cmns.service.CmnsTaskNoService;
import com.at.apcss.am.constants.AmConstants;
import com.at.apcss.am.wgh.mapper.WghPrfmncMapper;
import com.at.apcss.am.wgh.service.WghPrfmncService;
import com.at.apcss.am.wgh.vo.WghPrfmncDtlVO;
import com.at.apcss.am.wgh.vo.WghPrfmncVO;
import com.at.apcss.am.wrhs.service.RawMtrWrhsService;
import com.at.apcss.am.wrhs.vo.RawMtrWrhsVO;
import com.at.apcss.co.constants.ApcConstants;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;

/**
 * @Class Name : WghPrfmncServiceImpl.java
 * @Description : 원물계량 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("wghPrfmncService")
public class WghPrfmncServiceImpl extends BaseServiceImpl implements WghPrfmncService {

	@Autowired
	private WghPrfmncMapper wghPrfmncMapper;

	@Resource(name="cmnsTaskNoService")
	private CmnsTaskNoService cmnsTaskNoService;

	@Resource(name="rawMtrWrhsService")
	private RawMtrWrhsService rawMtrWrhsService;

	@Override
	public WghPrfmncVO selectWghPrfmnc(WghPrfmncVO wghPrfmncVO) throws Exception {

		WghPrfmncVO resultVO = wghPrfmncMapper.selectWghPrfmncCom(wghPrfmncVO);

		if (resultVO != null) {
			WghPrfmncDtlVO paramDtl = new WghPrfmncDtlVO();
			paramDtl.setApcCd(resultVO.getApcCd());
			paramDtl.setWghno(resultVO.getWghno());

			List<WghPrfmncDtlVO> dtlList = wghPrfmncMapper.selectWghPrfmncDtlList(paramDtl);

			resultVO.setWghPrfmncDtlList(dtlList);
		}

		return resultVO;
	}

	@Override
	public List<WghPrfmncVO> selectWghPrfmncList(WghPrfmncVO wghPrfmncVO) throws Exception {

		List<WghPrfmncVO> resultList = wghPrfmncMapper.selectWghPrfmncList(wghPrfmncVO);

		return resultList;
	}

	@Override
	public HashMap<String, Object> insertWghPrfmnc(WghPrfmncVO wghPrfmncVO) throws Exception {

		List<WghPrfmncDtlVO> wghPrfmncDtlList = wghPrfmncVO.getWghPrfmncDtlList();

		int pltQntt = wghPrfmncDtlList.size();
		if (pltQntt == 0) {
			return ComUtil.getResultMap("W0005", "팔레트정보");	// W0005	{0}이/가 없습니다.
		}

		double totalWght = wghPrfmncVO.getWrhsWght();
		double remainWght = totalWght;
		int totalBxQntt = 0;

		for ( WghPrfmncDtlVO dtl : wghPrfmncDtlList ) {
			totalBxQntt += dtl.getBxQntt();
		}

		if (totalBxQntt <= 0) {
			return ComUtil.getResultMap("W0005", "박스수량");	// W0005	{0}이/가 없습니다.
		}

		for ( WghPrfmncDtlVO dtl : wghPrfmncDtlList ) {
			int allocWght = (int)(dtl.getBxQntt() * totalWght / totalBxQntt);
			remainWght -= allocWght;
			dtl.setWrhsWght(allocWght);
		}

		String wghno = ComConstants.CON_BLANK;	//wghPrfmncVO.getWghno();

		boolean needsWghComInsert = false;
		if (!StringUtils.hasText(wghno)) {
			needsWghComInsert = true;
			wghno = cmnsTaskNoService.selectWghno(wghPrfmncVO.getApcCd(), wghPrfmncVO.getWghYmd());
			wghPrfmncVO.setWghno(wghno);
		}

		if (needsWghComInsert) {
			wghPrfmncMapper.insertWghPrfmncCom(wghPrfmncVO);
		} else {
			wghPrfmncMapper.updateWghPrfmncCom(wghPrfmncVO);
		}

		int seq = 0;
		for ( WghPrfmncDtlVO dtl : wghPrfmncDtlList ) {

			seq++;
			WghPrfmncDtlVO wghPrfmncDtlVO = new WghPrfmncDtlVO();
			BeanUtils.copyProperties(wghPrfmncVO, wghPrfmncDtlVO);
			BeanUtils.copyProperties(dtl, wghPrfmncDtlVO,
						ApcConstants.PROP_APC_CD,
						ApcConstants.PROP_WGHNO,
						ComConstants.PROP_SYS_FRST_INPT_DT,
						ComConstants.PROP_SYS_FRST_INPT_USER_ID,
						ComConstants.PROP_SYS_FRST_INPT_PRGRM_ID,
						ComConstants.PROP_SYS_LAST_CHG_DT,
						ComConstants.PROP_SYS_LAST_CHG_USER_ID,
						ComConstants.PROP_SYS_LAST_CHG_PRGRM_ID
					);
			wghPrfmncDtlVO.setWghSn(seq);

			RawMtrWrhsVO rawMtrWrhsVO = new RawMtrWrhsVO();
			BeanUtils.copyProperties(wghPrfmncVO, rawMtrWrhsVO);
			rawMtrWrhsVO.setWrhsYmd(wghPrfmncVO.getWghYmd());
			rawMtrWrhsVO.setWghSn(seq);
			rawMtrWrhsVO.setGrdCd(wghPrfmncDtlVO.getGrdCd());
			rawMtrWrhsVO.setPltno(wghPrfmncDtlVO.getPltno());
			rawMtrWrhsVO.setBxKnd(wghPrfmncDtlVO.getBxKnd());
			rawMtrWrhsVO.setBxQntt(wghPrfmncDtlVO.getBxQntt());
			rawMtrWrhsVO.setWrhsQntt(wghPrfmncDtlVO.getBxQntt());
			rawMtrWrhsVO.setStdGrdList(wghPrfmncDtlVO.getStdGrdList());

			double wrhsWght = dtl.getWrhsWght();

			if (seq > 0) {
				rawMtrWrhsVO.setWrhsWght(wrhsWght);
			} else {
				rawMtrWrhsVO.setWrhsWght(wrhsWght + remainWght);
			}

			HashMap<String, Object> rtnObj = rawMtrWrhsService.insertRawMtrWrhs(rawMtrWrhsVO);
			if (rtnObj != null) {
				throw new EgovBizException(getMessageForMap(rtnObj));
			}
			// 입고번호 설정
			wghPrfmncDtlVO.setWrhsno(rawMtrWrhsVO.getWrhsno());

			wghPrfmncMapper.insertWghPrfmncDtl(wghPrfmncDtlVO);
		}

		return null;
	}

	@Override
	public HashMap<String, Object> updateWghPrfmnc(WghPrfmncVO wghPrfmncVO) throws Exception {

		HashMap<String, Object> rtnObj = new HashMap<>();
		// 상세 변경 후 공통 변경
		// int updatedCnt = wghPrfmncMapper.updateWghPrfmncCom(wghPrfmncVO);

		// 상세는 삭제 후 재등록
		WghPrfmncVO wghPrfmncInfo = selectWghPrfmnc(wghPrfmncVO);

		if (wghPrfmncInfo == null || !StringUtils.hasText(wghPrfmncInfo.getWghno())) {
			return ComUtil.getResultMap("W0005", "계량정보");	// W0005	{0}이/가 없습니다.
		}

		// 원물입고 실적 삭제 : 재고, 입고실적
		RawMtrWrhsVO wrhsVO = new RawMtrWrhsVO();
		BeanUtils.copyProperties(wghPrfmncVO, wrhsVO);
		rtnObj = rawMtrWrhsService.deleteRawMtrWrhsByWghno(wrhsVO);
		
		if (rtnObj != null) {
			throw new EgovBizException(getMessageForMap(rtnObj));
		}

		// 계량 실적 삭제 : 상세, 공통
		List<WghPrfmncDtlVO> dtlList = wghPrfmncInfo.getWghPrfmncDtlList();
		if (dtlList != null && !dtlList.isEmpty()) {
			int deletedDtlCnt = 0;
			for ( WghPrfmncDtlVO dtl : dtlList) {
				WghPrfmncDtlVO wghPrfmncDtlVO = new WghPrfmncDtlVO();
				BeanUtils.copyProperties(wghPrfmncVO, wghPrfmncDtlVO);
				BeanUtils.copyProperties(dtl, wghPrfmncDtlVO,
							ApcConstants.PROP_APC_CD,
							ApcConstants.PROP_WGHNO,
							ComConstants.PROP_SYS_FRST_INPT_DT,
							ComConstants.PROP_SYS_FRST_INPT_USER_ID,
							ComConstants.PROP_SYS_FRST_INPT_PRGRM_ID,
							ComConstants.PROP_SYS_LAST_CHG_DT,
							ComConstants.PROP_SYS_LAST_CHG_USER_ID,
							ComConstants.PROP_SYS_LAST_CHG_PRGRM_ID
						);
				deletedDtlCnt = wghPrfmncMapper.deleteWghPrfmncDtl(wghPrfmncDtlVO);
				if (deletedDtlCnt != 1) {
				}
			}
		}

		rtnObj = insertWghPrfmnc(wghPrfmncVO);
		if (rtnObj != null) {
			throw new EgovBizException(getMessageForMap(rtnObj));
		}

		return null;
	}

	@Override
	public HashMap<String, Object> deleteWghPrfmnc(WghPrfmncVO wghPrfmncVO) throws Exception {

		HashMap<String, Object> rtnObj = new HashMap<>();

		WghPrfmncVO wghPrfmncInfo = selectWghPrfmnc(wghPrfmncVO);

		if (wghPrfmncInfo == null || !StringUtils.hasText(wghPrfmncInfo.getWghno())) {
			return ComUtil.getResultMap("W0005", "계량정보");	// W0005	{0}이/가 없습니다.
		}

		// 원물입고 실적 삭제 : 재고, 입고실적
		RawMtrWrhsVO wrhsVO = new RawMtrWrhsVO();
		BeanUtils.copyProperties(wghPrfmncVO, wrhsVO);
		rtnObj = rawMtrWrhsService.deleteRawMtrWrhsByWghno(wrhsVO);
		if (rtnObj != null) {
			throw new EgovBizException(getMessageForMap(rtnObj));
		}

		// 계량 실적 삭제 : 상세, 공통
		List<WghPrfmncDtlVO> dtlList = wghPrfmncInfo.getWghPrfmncDtlList();
		if (dtlList != null && !dtlList.isEmpty()) {
			int deletedDtlCnt = 0;
			for ( WghPrfmncDtlVO dtl : dtlList) {
				WghPrfmncDtlVO wghPrfmncDtlVO = new WghPrfmncDtlVO();
				BeanUtils.copyProperties(wghPrfmncVO, wghPrfmncDtlVO);
				BeanUtils.copyProperties(dtl, wghPrfmncDtlVO,
							ApcConstants.PROP_APC_CD,
							ApcConstants.PROP_WGHNO,
							ComConstants.PROP_SYS_FRST_INPT_DT,
							ComConstants.PROP_SYS_FRST_INPT_USER_ID,
							ComConstants.PROP_SYS_FRST_INPT_PRGRM_ID,
							ComConstants.PROP_SYS_LAST_CHG_DT,
							ComConstants.PROP_SYS_LAST_CHG_USER_ID,
							ComConstants.PROP_SYS_LAST_CHG_PRGRM_ID
						);
				deletedDtlCnt = wghPrfmncMapper.updateWghPrfmncDtlForDelY(wghPrfmncDtlVO);
				if (deletedDtlCnt != 1) {
				}
			}
		}

		int deletedCnt = wghPrfmncMapper.updateWghPrfmncComForDelY(wghPrfmncVO);

		if (deletedCnt != 1) {
		}

		return null;
	}


	@Override
	public WghPrfmncDtlVO selectWghPrfmncDtl(WghPrfmncDtlVO wghPrfmncDtlVO) throws Exception {

		WghPrfmncDtlVO resultVO = wghPrfmncMapper.selectWghPrfmncDtl(wghPrfmncDtlVO);

		return resultVO;
	}

	@Override
	public List<WghPrfmncDtlVO> selectWghPrfmncDtlList(WghPrfmncDtlVO wghPrfmncDtlVO) throws Exception {

		List<WghPrfmncDtlVO> resultList = wghPrfmncMapper.selectWghPrfmncDtlList(wghPrfmncDtlVO);

		return resultList;
	}

	@Override
	public HashMap<String, Object> insertWghPrfmncDtl(WghPrfmncDtlVO wghPrfmncDtlVO) throws Exception {

		int insertedCnt = wghPrfmncMapper.insertWghPrfmncDtl(wghPrfmncDtlVO);
		if (insertedCnt != 1) {
			throw new EgovBizException(getMessage("E0003", "계량상세등록".split("\\|\\|")), new Exception());	// "E0003 {0} 시 오류가 발생하였습니다.
		}
		return null;
	}

	@Override
	public HashMap<String, Object> updateWghPrfmncDtl(WghPrfmncDtlVO wghPrfmncDtlVO) throws Exception {
		int updatedCnt = wghPrfmncMapper.updateWghPrfmncDtl(wghPrfmncDtlVO);
		if (updatedCnt != 1) {
			throw new EgovBizException(getMessage("E0003", "계량상세변경".split("\\|\\|")), new Exception());	// "E0003 {0} 시 오류가 발생하였습니다.
		}
		return null;
	}

	@Override
	public HashMap<String, Object> deleteWghPrfmncDtl(WghPrfmncDtlVO wghPrfmncDtlVO) throws Exception {
		int deletedCnt = wghPrfmncMapper.deleteWghPrfmncDtl(wghPrfmncDtlVO);
		if (deletedCnt != 1) {
			throw new EgovBizException(getMessage("E0003", "계량상세삭제".split("\\|\\|")), new Exception());	// "E0003 {0} 시 오류가 발생하였습니다.
		}
		return null;
	}

	@Override
	public HashMap<String, Object> deleteWghPrfmncList(List<WghPrfmncVO> wghPrfmncList) throws Exception {

		HashMap<String, Object> rtnObj = new HashMap<>();

		for ( WghPrfmncVO wghPrfmncVO : wghPrfmncList ) {
			rtnObj = deleteWghPrfmnc(wghPrfmncVO);
			if (rtnObj != null) {
				throw new EgovBizException(getMessageForMap(rtnObj));
			}
		}

		return null;
	}
}
