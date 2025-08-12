package com.at.apcss.am.wgh.service.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import com.at.apcss.am.invntr.mapper.PltWrhsSpmtMapper;
import com.at.apcss.am.invntr.service.PltWrhsSpmtService;
import com.at.apcss.am.invntr.vo.PltWrhsSpmtVO;
import com.at.apcss.am.spmt.vo.SpmtPrfmncComVO;
import com.at.apcss.am.wgh.vo.WghHstryVO;
import com.at.apcss.am.wgh.vo.WghInspPrfmncVO;
import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.at.apcss.am.cmns.service.CmnsGdsService;
import com.at.apcss.am.cmns.service.CmnsTaskNoService;
import com.at.apcss.am.cmns.service.WrhsVhclService;
import com.at.apcss.am.cmns.vo.CmnsGdsVO;
import com.at.apcss.am.cmns.vo.WrhsVhclVO;
import com.at.apcss.am.invntr.service.GdsInvntrService;
import com.at.apcss.am.invntr.vo.GdsInvntrVO;
import com.at.apcss.am.spmt.service.SpmtPrfmncService;
import com.at.apcss.am.spmt.vo.SpmtPrfmncVO;
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

	@Autowired
	private PltWrhsSpmtMapper pltWrhsSpmtMapper;

	@Resource(name="cmnsTaskNoService")
	private CmnsTaskNoService cmnsTaskNoService;

	@Resource(name="rawMtrWrhsService")
	private RawMtrWrhsService rawMtrWrhsService;

	@Resource(name="wrhsVhclService")
	private WrhsVhclService wrhsVhclService;

	// 재고서비스
	@Resource(name= "gdsInvntrService")
	private GdsInvntrService gdsInvntrService;

	// 출하서비스
	@Resource(name= "spmtPrfmncService")
	private SpmtPrfmncService spmtPrfmncService;

	// 상품코드 서비스
	@Resource(name = "cmnsGdsService")
	private CmnsGdsService cmnsGdsService;

	// 팔레트 서비스
	@Resource(name="pltWrhsSpmtService")
	private PltWrhsSpmtService pltWrhsSpmtService;

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
	public HashMap<String, Object> insertWghVhclPrfmnc(WghPrfmncVO wghPrfmncVO) throws Exception {

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

		//String wghno = wghPrfmncVO.getWghno();	//wghPrfmncVO.getWghno();

		WghPrfmncVO wghPrfmc = wghPrfmncMapper.selectWghPrfmncCom(wghPrfmncVO);

		if (wghPrfmc == null) {
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
	public HashMap<String, Object> updateWghVhclPrfmnc(WghPrfmncVO wghPrfmncVO) throws Exception {

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

		rtnObj = insertWghVhclPrfmnc(wghPrfmncVO);
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

		if ("DT".equals(wghPrfmncVO.getWrhsSpmtType())) {
			if ("Y".equals(wghPrfmncVO.getSpmtPrfmncYn())) {
				List<SpmtPrfmncVO> spmtPrfmncList = new ArrayList<>();
				SpmtPrfmncVO spmtDeleteVO = new SpmtPrfmncVO();
				BeanUtils.copyProperties(wghPrfmncVO, spmtDeleteVO);
				spmtDeleteVO.setSpmtYmd(wghPrfmncVO.getWghYmd());
				spmtDeleteVO.setSpmtno(wghPrfmncVO.getWrhsno());
				spmtPrfmncList.add(spmtDeleteVO);
				spmtPrfmncService.deleteSpmtPrfmnc(spmtPrfmncList);
			}
		} else {

			// 원물입고 실적 삭제 : 재고, 입고실적
			RawMtrWrhsVO wrhsVO = new RawMtrWrhsVO();
			BeanUtils.copyProperties(wghPrfmncVO, wrhsVO);
			rtnObj = rawMtrWrhsService.deleteRawMtrWrhsByWghno(wrhsVO);
			if (rtnObj != null) {
				throw new EgovBizException(getMessageForMap(rtnObj));
			}
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

	@Override
	public List<WghPrfmncVO> selectWghInfoWrhsMngList(WghPrfmncVO wghPrfmncVO) throws Exception {
		List<WghPrfmncVO> resultList = wghPrfmncMapper.selectWghInfoWrhsMngList(wghPrfmncVO);
		return resultList;
	}

	@Override
	public List<WghPrfmncVO> selectWghInfoSpmtMngList(WghPrfmncVO wghPrfmncVO) throws Exception {
		List<WghPrfmncVO> resultList = wghPrfmncMapper.selectWghInfoMngSpmtList(wghPrfmncVO);
		return resultList;
	}

	@Override
	public HashMap<String, Object> updateStrgLoctnCd(WghPrfmncVO wghPrfmncVO) throws Exception {
		int updatedCnt = wghPrfmncMapper.updateStrgLoctnCd(wghPrfmncVO);
		if (updatedCnt != 1) {
			throw new EgovBizException(getMessage("E0003", "계량정보변경".split("\\|\\|")), new Exception());	// "E0003 {0} 시 오류가 발생하였습니다.
		}
		return null;
	}

	@Override
	public HashMap<String, Object> updateStrgLoctnCdList(List<WghPrfmncVO> wghPrfmncList) throws Exception {

		for (WghPrfmncVO wghPrfmncVO : wghPrfmncList) {

			HashMap<String, Object> rtnObj = new HashMap<>();

			rtnObj = updateStrgLoctnCd(wghPrfmncVO);
			if (rtnObj != null) {
				throw new EgovBizException(getMessageForMap(rtnObj));
			}

			rtnObj = updateRdcdRt(wghPrfmncVO);
			if (rtnObj != null) {
				throw new EgovBizException(getMessageForMap(rtnObj));
			}

		}

		return null;
	}

	@Override
	public HashMap<String, Object> updateRdcdRt(WghPrfmncVO wghPrfmncVO) throws Exception {
		int updatedCnt = wghPrfmncMapper.updateRdcdRt(wghPrfmncVO);
		if (updatedCnt != 1) {
			throw new EgovBizException(getMessage("E0003", "계량정보변경".split("\\|\\|")), new Exception());	// "E0003 {0} 시 오류가 발생하였습니다.
		}
		return null;
	}

	@Override
	public List<WghPrfmncVO> selectWghRcptWrhsList(WghPrfmncVO wghPrfmncVO) throws Exception {
		List<WghPrfmncVO> resultList = wghPrfmncMapper.selectWghRcptWrhsList(wghPrfmncVO);
		return resultList;
	}

	@Override
	public List<WghPrfmncVO> selectWghRcptSpmtList(WghPrfmncVO wghPrfmncVO) throws Exception {
		List<WghPrfmncVO> resultList = wghPrfmncMapper.selectWghRcptSpmtList(wghPrfmncVO);
		return resultList;
	}

	@Override
	public HashMap<String, Object> multiWghPrfmncList(List<WghPrfmncVO> wghPrfmncList, List<PltWrhsSpmtVO> pltWrhsSpmtList, List<WghHstryVO> wghHstryVOList, List<WghInspPrfmncVO> wghInspPrfmncVOList, List<PltWrhsSpmtVO> pltDelList) throws Exception {
		HashMap<String, Object> rtnObj = multiWghPrfmncList(wghPrfmncList);
		if(rtnObj != null){
			throw new EgovBizException();
		}

		/** 검품등급 삭제 **/
		if(wghInspPrfmncVOList.size() > 0){
			int delCnt = wghPrfmncMapper.deleteWghInspPrfmncList(wghInspPrfmncVOList);
			if(delCnt != wghInspPrfmncVOList.size()){
				throw new EgovBizException(getMessage(ComConstants.RESULT_STATUS_ERROR));
			}
		}
		/** plt/box 삭제 **/
		if(pltDelList.size() > 0){
			int delCnt = pltWrhsSpmtMapper.deletePltWrhsSpmt(pltDelList);
		}

		String prcsNo = wghPrfmncList.get(0).getWghno();
		if(pltWrhsSpmtList.size() > 0){
			for(PltWrhsSpmtVO pltWrhsSpmtVO : pltWrhsSpmtList){
				if(pltWrhsSpmtVO.getSn() == 0){
					int sn = pltWrhsSpmtMapper.selectPltWrhsSpmtSN(pltWrhsSpmtVO);
					pltWrhsSpmtVO.setSn(sn);
				}
				pltWrhsSpmtVO.setPrcsNo(prcsNo);
				rtnObj = pltWrhsSpmtService.insertPltWrhsSpmt(pltWrhsSpmtVO, true);
				if(rtnObj != null){
					throw new EgovBizException(getMessageForMap(rtnObj));
				}
			}
		}
		/** 계량이력 실적 생성 및 수정 **/
		for(WghHstryVO vo : wghHstryVOList){
			vo.setWghno(prcsNo);
		}
		try{
			int hstryCnt = wghPrfmncMapper.mergeWghHstry(wghHstryVOList);

		}catch (SQLException e){
			throw new EgovBizException(getMessage("계량이력 생성중 에러가 발생했습니다."));
		}catch (Exception e){
			throw new EgovBizException();
		}
		return null;
	}

	@Override
	public HashMap<String, Object> multiWghPrfmncList(List<WghPrfmncVO> wghPrfmncList) throws Exception {

		List<WghPrfmncVO> insertWrhsList = new ArrayList<>();
		List<WghPrfmncVO> insertSpmtList = new ArrayList<>();
		List<WghPrfmncVO> updateWrhsList = new ArrayList<>();
		List<WghPrfmncVO> updateSpmtList = new ArrayList<>();
		HashMap<String, Object> resultMap;


		for (WghPrfmncVO wghPrfmncVO : wghPrfmncList) {

			if (ComConstants.ROW_STS_INSERT.equals(wghPrfmncVO.getRowSts())) {

				if ("RT".equals(wghPrfmncVO.getWrhsSpmtType())) {

					insertWrhsList.add(wghPrfmncVO);
				}

				if ("DT".equals(wghPrfmncVO.getWrhsSpmtType())) {

					insertSpmtList.add(wghPrfmncVO);
				}


			}

			if (ComConstants.ROW_STS_UPDATE.equals(wghPrfmncVO.getRowSts())) {

				if ("RT".equals(wghPrfmncVO.getWrhsSpmtType())) {

					updateWrhsList.add(wghPrfmncVO);
				}
				if ("DT".equals(wghPrfmncVO.getWrhsSpmtType())) {

					updateSpmtList.add(wghPrfmncVO);
				}
			}
		}

		if (insertWrhsList != null && insertWrhsList.size() > 0) {

			int groupId = 0;
			int start = 1;
			String wghno = "";
			int seq = 1;

			for (WghPrfmncVO wghPrfmncVO : insertWrhsList) {

				if (start == 1) {
					groupId = wghPrfmncVO.getGroupId();
					wghno = cmnsTaskNoService.selectWghno(wghPrfmncVO.getApcCd(), wghPrfmncVO.getWghYmd());
					wghPrfmncVO.setWghno(wghno);

					wghPrfmncMapper.insertWghPrfmncCom(wghPrfmncVO);

					String vhclno = wghPrfmncVO.getVhclno();

					if (StringUtils.hasText(vhclno)) {

						WrhsVhclVO wrhsVhclVO = new WrhsVhclVO();
						BeanUtils.copyProperties(wghPrfmncVO, wrhsVhclVO);

						wrhsVhclService.insertMergeWrhsVhcl(wrhsVhclVO);

					}
					/** 검품등급 insert **/
					/** 검품등급 wghno set **/
					List<WghInspPrfmncVO> inspList = wghPrfmncVO.getInspPrfmncList();
					if(inspList.size() > 0){
						for(WghInspPrfmncVO vo : inspList){
							vo.setWghno(wghno);
						}
						wghPrfmncMapper.insertUpdateInspList(inspList);
					}
				} else {
					if (groupId != wghPrfmncVO.getGroupId()) {
						seq = 1;
						groupId = wghPrfmncVO.getGroupId();
						wghno = cmnsTaskNoService.selectWghno(wghPrfmncVO.getApcCd(), wghPrfmncVO.getWghYmd());
						wghPrfmncVO.setWghno(wghno);
						wghPrfmncMapper.insertWghPrfmncCom(wghPrfmncVO);

						String vhclno = wghPrfmncVO.getVhclno();

						if (StringUtils.hasText(vhclno)) {

							WrhsVhclVO wrhsVhclVO = new WrhsVhclVO();
							BeanUtils.copyProperties(wghPrfmncVO, wrhsVhclVO);

							wrhsVhclService.insertMergeWrhsVhcl(wrhsVhclVO);

						}

					} else {
						wghPrfmncVO.setWghno(wghno);
						/** 검품등급 insert **/
						/** 검품등급 wghno set **/
						List<WghInspPrfmncVO> inspList = wghPrfmncVO.getInspPrfmncList();
						if(inspList.size() > 0){
							for(WghInspPrfmncVO vo : inspList){
								vo.setWghno(wghno);
							}
							wghPrfmncMapper.insertUpdateInspList(inspList);
						}

						if ("Y".equals(wghPrfmncVO.getDistributionYn())) {

						} else {

							wghPrfmncVO.setPltQntt(0);
							wghPrfmncVO.setWholWght(0);
						}
					}
				}

				String wrhsSecd = wghPrfmncVO.getWrhsSeCd();
				String gdsSecd = wghPrfmncVO.getGdsSeCd();
				String trsprtSecd = wghPrfmncVO.getTrsprtSeCd();

				if (!StringUtils.hasText(wrhsSecd)) {
					wghPrfmncVO.setWrhsSeCd(ApcConstants.WRHS_SE_CD_BASIC);
				}

				if (!StringUtils.hasText(gdsSecd)) {
					wghPrfmncVO.setGdsSeCd(ApcConstants.GDS_SE_CD_BASIC);
				}

				if (!StringUtils.hasText(trsprtSecd)) {
					wghPrfmncVO.setTrsprtSeCd(ApcConstants.TRSPRT_SE_CD_BASIC);
				}

				double dtlWrhsWght = wghPrfmncVO.getDtlWrhsWght();
				if (dtlWrhsWght > 0) {
					wghPrfmncVO.setWrhsWght(dtlWrhsWght);
				}

				WghPrfmncDtlVO wghPrfmncDtlVO = new WghPrfmncDtlVO();
				BeanUtils.copyProperties(wghPrfmncVO, wghPrfmncDtlVO);

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

				HashMap<String, Object> rtnObj = rawMtrWrhsService.insertRawMtrWrhs(rawMtrWrhsVO);
				if (rtnObj != null) {
					throw new EgovBizException(getMessageForMap(rtnObj));
				}

				// 입고번호 설정
				wghPrfmncDtlVO.setWrhsno(rawMtrWrhsVO.getWrhsno());
				wghPrfmncDtlVO.setPltno(rawMtrWrhsVO.getPltno());

				wghPrfmncMapper.insertWghPrfmncDtl(wghPrfmncDtlVO);

				start++;
				seq++;

			}

		}

		if (insertSpmtList != null && insertSpmtList.size() > 0) {
			int groupId = 0;
			int start = 1;
			String wghno = "";
			int seq = 1;
			String pckgno = "";
			String spmtno = "";
			List<GdsInvntrVO> insertgdsInvntrList = new ArrayList<>();


			for (WghPrfmncVO wghPrfmncVO : insertSpmtList) {

				if (start == 1) {
					groupId = wghPrfmncVO.getGroupId();
					wghno = cmnsTaskNoService.selectWghno(wghPrfmncVO.getApcCd(), wghPrfmncVO.getWghYmd());
					wghPrfmncVO.setWghno(wghno);

					wghPrfmncMapper.insertWghPrfmncCom(wghPrfmncVO);

					String vhclno = wghPrfmncVO.getVhclno();

					if (StringUtils.hasText(vhclno)) {

						WrhsVhclVO wrhsVhclVO = new WrhsVhclVO();
						BeanUtils.copyProperties(wghPrfmncVO, wrhsVhclVO);

						wrhsVhclService.insertMergeWrhsVhcl(wrhsVhclVO);

					}
					/** 검품등급 insert **/
					/** 검품등급 wghno set **/
					List<WghInspPrfmncVO> inspList = wghPrfmncVO.getInspPrfmncList();
					if(inspList.size() > 0){
						for(WghInspPrfmncVO vo : inspList){
							vo.setWghno(wghno);
						}
						wghPrfmncMapper.insertUpdateInspList(inspList);
					}

				} else {
					if (groupId != wghPrfmncVO.getGroupId()) {
						seq = 1;
						groupId = wghPrfmncVO.getGroupId();
						wghno = cmnsTaskNoService.selectWghno(wghPrfmncVO.getApcCd(), wghPrfmncVO.getWghYmd());
						wghPrfmncVO.setWghno(wghno);
						wghPrfmncMapper.insertWghPrfmncCom(wghPrfmncVO);

						String vhclno = wghPrfmncVO.getVhclno();

						if (StringUtils.hasText(vhclno)) {

							WrhsVhclVO wrhsVhclVO = new WrhsVhclVO();
							BeanUtils.copyProperties(wghPrfmncVO, wrhsVhclVO);

							wrhsVhclService.insertMergeWrhsVhcl(wrhsVhclVO);

						}

					} else {
						wghPrfmncVO.setWghno(wghno);
						/** 검품등급 insert **/
						/** 검품등급 wghno set **/
						List<WghInspPrfmncVO> inspList = wghPrfmncVO.getInspPrfmncList();
						if(inspList.size() > 0){
							for(WghInspPrfmncVO vo : inspList){
								vo.setWghno(wghno);
							}
							wghPrfmncMapper.insertUpdateInspList(inspList);
						}

						if ("Y".equals(wghPrfmncVO.getDistributionYn())) {

						} else {

							wghPrfmncVO.setPltQntt(0);
							wghPrfmncVO.setWholWght(0);
						}
					}
				}

				String wrhsSecd = wghPrfmncVO.getWrhsSeCd();
				String gdsSecd = wghPrfmncVO.getGdsSeCd();
				String trsprtSecd = wghPrfmncVO.getTrsprtSeCd();

				if (!StringUtils.hasText(wrhsSecd)) {
					wghPrfmncVO.setWrhsSeCd(ApcConstants.WRHS_SE_CD_BASIC);
				}

				if (!StringUtils.hasText(gdsSecd)) {
					wghPrfmncVO.setGdsSeCd(ApcConstants.GDS_SE_CD_BASIC);
				}

				if (!StringUtils.hasText(trsprtSecd)) {
					wghPrfmncVO.setTrsprtSeCd(ApcConstants.TRSPRT_SE_CD_BASIC);
				}

				double dtlWrhsWght = wghPrfmncVO.getDtlWrhsWght();
				if (dtlWrhsWght > 0) {
					wghPrfmncVO.setWrhsWght(dtlWrhsWght);
				}

				WghPrfmncDtlVO wghPrfmncDtlVO = new WghPrfmncDtlVO();
				BeanUtils.copyProperties(wghPrfmncVO, wghPrfmncDtlVO);
				wghPrfmncDtlVO.setWghSn(seq);

				if ("Y".equals(wghPrfmncVO.getSpmtPrfmncYn())) {

					SpmtPrfmncVO spmtPrfmncVO = new SpmtPrfmncVO();

					BeanUtils.copyProperties(wghPrfmncVO, spmtPrfmncVO);

					spmtPrfmncVO.setCnptCd(wghPrfmncVO.getPrdcrCd());
					spmtPrfmncVO.setSpmtYmd(wghPrfmncVO.getWghYmd());
					spmtPrfmncVO.setSpmtSeCd("01");

					if (start == 1) {
						spmtno = cmnsTaskNoService.selectSpmtno(insertSpmtList.get(0).getApcCd(), insertSpmtList.get(0).getWghYmd());
						pckgno = cmnsTaskNoService.selectPckgno(insertSpmtList.get(0).getApcCd(), insertSpmtList.get(0).getWghYmd());
						spmtPrfmncVO.setSpmtno(spmtno);
						spmtPrfmncService.insertSpmtPrfmncCom(spmtPrfmncVO);
					} else {
						if (groupId != wghPrfmncVO.getGroupId()) {
							spmtno = cmnsTaskNoService.selectSpmtno(insertSpmtList.get(0).getApcCd(), insertSpmtList.get(0).getWghYmd());
							pckgno = cmnsTaskNoService.selectPckgno(insertSpmtList.get(0).getApcCd(), insertSpmtList.get(0).getWghYmd());
							spmtPrfmncVO.setSpmtno(spmtno);
							spmtPrfmncService.insertSpmtPrfmncCom(spmtPrfmncVO);
						} else {
							spmtPrfmncVO.setSpmtno(spmtno);
						}
					}
					spmtPrfmncVO.setSortGrdCd(wghPrfmncVO.getGrdCd());
					spmtPrfmncVO.setSpmtQntt(wghPrfmncVO.getBxQntt());
					spmtPrfmncVO.setSpmtSn(seq);

					GdsInvntrVO gdsInvntrVO = new GdsInvntrVO();
					gdsInvntrVO.setApcCd(wghPrfmncVO.getApcCd());
					gdsInvntrVO.setItemCd(wghPrfmncVO.getItemCd());
					gdsInvntrVO.setVrtyCd(wghPrfmncVO.getVrtyCd());
					gdsInvntrVO.setGdsGrd(wghPrfmncVO.getGrdCd());

					List<GdsInvntrVO> gdsInvntrList = gdsInvntrService.selectGdsInvntrList(gdsInvntrVO);

					if (gdsInvntrList.size() > 0) {
						int remainderSpmtQntt = spmtPrfmncVO.getSpmtQntt();
						// 출하량 만큼 재고 리스트에서 순차적으로 차감
						for (GdsInvntrVO gdsInvntr : gdsInvntrList) {

							// 출하량 만큼 재고 차감인 경우
							if (remainderSpmtQntt == 0) {
								break;
							}

							// 출하량 보다 재고 차감을 덜 한 경우
							if (remainderSpmtQntt > 0) {

								// 현재 n번째 재고가 출하량보다 많을 경우
								if (gdsInvntr.getInvntrQntt() - remainderSpmtQntt >= 0) {
									spmtPrfmncVO.setPckgno(gdsInvntr.getPckgno());
									spmtPrfmncVO.setPckgSn(gdsInvntr.getPckgSn());
									spmtPrfmncVO.setBrndNm(gdsInvntr.getBrndNm());
									spmtPrfmncVO.setSpcfctCd(gdsInvntr.getSpcfctCd());
									spmtPrfmncVO.setSpmtPckgUnitCd(gdsInvntr.getSpmtPckgUnitCd());

									spmtPrfmncVO.setSpmtQntt(remainderSpmtQntt);

									if (!StringUtils.hasText(spmtPrfmncVO.getGdsCd())) {
										CmnsGdsVO cmnsGdsVO = new CmnsGdsVO();
										cmnsGdsVO.setApcCd(spmtPrfmncVO.getApcCd());
										cmnsGdsVO.setItemCd(spmtPrfmncVO.getItemCd());
										cmnsGdsVO.setVrtyCd(spmtPrfmncVO.getVrtyCd());
										cmnsGdsVO.setSpcfctCd(spmtPrfmncVO.getSpcfctCd());
										cmnsGdsVO.setSpmtPckgUnitCd(spmtPrfmncVO.getSpmtPckgUnitCd());
										cmnsGdsVO.setSysLastChgPrgrmId(spmtPrfmncVO.getSysLastChgPrgrmId());
										cmnsGdsVO.setSysLastChgUserId(spmtPrfmncVO.getSysLastChgUserId());

										cmnsGdsService.insertCheckGdsCd(cmnsGdsVO);
										spmtPrfmncVO.setGdsCd(cmnsGdsVO.getNewGdsCd());
										spmtPrfmncVO.setBrndNm(cmnsGdsVO.getBrndNm());
									}

									if (0 == spmtPrfmncService.insertSpmtPrfmncDtl(spmtPrfmncVO)) {
										throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_PARAM_ONE, "출하실적 등록")));		// E0003	{0} 시 오류가 발생하였습니다.
									}

									GdsInvntrVO updateGdsInvntrVO = new GdsInvntrVO();
									updateGdsInvntrVO.setApcCd(spmtPrfmncVO.getApcCd());
									updateGdsInvntrVO.setPckgno(spmtPrfmncVO.getPckgno());
									updateGdsInvntrVO.setPckgSn(spmtPrfmncVO.getPckgSn());
									updateGdsInvntrVO.setSpmtQntt(spmtPrfmncVO.getSpmtQntt());
									updateGdsInvntrVO.setSpmtPckgUnitCd(spmtPrfmncVO.getSpmtPckgUnitCd());
									updateGdsInvntrVO.setGdsGrd(spmtPrfmncVO.getGdsGrd());
									updateGdsInvntrVO.setSysLastChgPrgrmId(spmtPrfmncVO.getSysLastChgPrgrmId());
									updateGdsInvntrVO.setSysLastChgUserId(spmtPrfmncVO.getSysLastChgUserId());

									resultMap = gdsInvntrService.updateGdsInvntrSpmtPrfmnc(updateGdsInvntrVO);

									if (resultMap != null) {
										throw new EgovBizException(getMessageForMap(resultMap));
									}
									remainderSpmtQntt = remainderSpmtQntt - spmtPrfmncVO.getSpmtQntt();
								} else { // 현재 n번째 재고가 출하량 보다 적을 경우
									spmtPrfmncVO.setPckgno(gdsInvntr.getPckgno());
									spmtPrfmncVO.setPckgSn(gdsInvntr.getPckgSn());
									spmtPrfmncVO.setBrndNm(gdsInvntr.getBrndNm());
									spmtPrfmncVO.setSpcfctCd(gdsInvntr.getSpcfctCd());
									spmtPrfmncVO.setSpmtPckgUnitCd(gdsInvntr.getSpmtPckgUnitCd());

									spmtPrfmncVO.setSpmtQntt(gdsInvntr.getInvntrQntt());

									if (!StringUtils.hasText(spmtPrfmncVO.getGdsCd())) {
										CmnsGdsVO cmnsGdsVO = new CmnsGdsVO();
										cmnsGdsVO.setApcCd(spmtPrfmncVO.getApcCd());
										cmnsGdsVO.setItemCd(spmtPrfmncVO.getItemCd());
										cmnsGdsVO.setVrtyCd(spmtPrfmncVO.getVrtyCd());
										cmnsGdsVO.setSpcfctCd(spmtPrfmncVO.getSpcfctCd());
										cmnsGdsVO.setSpmtPckgUnitCd(spmtPrfmncVO.getSpmtPckgUnitCd());
										cmnsGdsVO.setSysLastChgPrgrmId(spmtPrfmncVO.getSysLastChgPrgrmId());
										cmnsGdsVO.setSysLastChgUserId(spmtPrfmncVO.getSysLastChgUserId());

										cmnsGdsService.insertCheckGdsCd(cmnsGdsVO);
										spmtPrfmncVO.setGdsCd(cmnsGdsVO.getNewGdsCd());
										spmtPrfmncVO.setBrndNm(cmnsGdsVO.getBrndNm());
									}

									if (0 == spmtPrfmncService.insertSpmtPrfmncDtl(spmtPrfmncVO)) {
										throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_PARAM_ONE, "출하실적 등록")));		// E0003	{0} 시 오류가 발생하였습니다.
									}

									GdsInvntrVO updateGdsInvntrVO = new GdsInvntrVO();
									updateGdsInvntrVO.setApcCd(spmtPrfmncVO.getApcCd());
									updateGdsInvntrVO.setPckgno(spmtPrfmncVO.getPckgno());
									updateGdsInvntrVO.setPckgSn(spmtPrfmncVO.getPckgSn());
									updateGdsInvntrVO.setSpmtQntt(spmtPrfmncVO.getSpmtQntt());
									updateGdsInvntrVO.setSpmtPckgUnitCd(spmtPrfmncVO.getSpmtPckgUnitCd());
									updateGdsInvntrVO.setGdsGrd(spmtPrfmncVO.getGdsGrd());
									updateGdsInvntrVO.setSysLastChgPrgrmId(spmtPrfmncVO.getSysLastChgPrgrmId());
									updateGdsInvntrVO.setSysLastChgUserId(spmtPrfmncVO.getSysLastChgUserId());
									resultMap = gdsInvntrService.updateGdsInvntrSpmtPrfmnc(updateGdsInvntrVO);

									if (resultMap != null) {
										throw new EgovBizException(getMessageForMap(resultMap));
									}

									remainderSpmtQntt = remainderSpmtQntt - spmtPrfmncVO.getSpmtQntt();
								}
							}
						}

						/* 조회된 재고리스트 재고 보다 출하량이 많은 경우
						 * 출하 재고 생성
						 */
						if (remainderSpmtQntt > 0) {
							GdsInvntrVO insertGdsInvntrVO = new GdsInvntrVO();
							insertGdsInvntrVO.setSysFrstInptPrgrmId(wghPrfmncVO.getSysFrstInptPrgrmId());
							insertGdsInvntrVO.setSysFrstInptUserId(wghPrfmncVO.getSysFrstInptUserId());
							insertGdsInvntrVO.setSysLastChgPrgrmId(wghPrfmncVO.getSysLastChgPrgrmId());
							insertGdsInvntrVO.setSysLastChgUserId(wghPrfmncVO.getSysLastChgUserId());
							insertGdsInvntrVO.setInvntrSttsCd("D1");
							insertGdsInvntrVO.setApcCd(spmtPrfmncVO.getApcCd());
							insertGdsInvntrVO.setItemCd(spmtPrfmncVO.getItemCd());
							insertGdsInvntrVO.setVrtyCd(spmtPrfmncVO.getVrtyCd());
							insertGdsInvntrVO.setGdsGrd(spmtPrfmncVO.getGdsGrd());

							insertGdsInvntrVO.setInvntrQntt(remainderSpmtQntt * -1);
							insertGdsInvntrVO.setSpmtQntt(spmtPrfmncVO.getSpmtQntt());

							insertGdsInvntrVO.setPckgno(pckgno);
							insertGdsInvntrVO.setPckgSn(seq);

							insertgdsInvntrList.add(insertGdsInvntrVO);

							spmtPrfmncVO.setPckgno(insertGdsInvntrVO.getPckgno());
							spmtPrfmncVO.setPckgSn(insertGdsInvntrVO.getPckgSn());
							spmtPrfmncVO.setSpmtQntt(remainderSpmtQntt);

							if (0 == spmtPrfmncService.insertSpmtPrfmncDtl(spmtPrfmncVO)) {
								throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_PARAM_ONE, "출하실적 등록")));		// E0003	{0} 시 오류가 발생하였습니다.
							}
						}
					} else {

						GdsInvntrVO insertGdsInvntrVO = new GdsInvntrVO();
						insertGdsInvntrVO.setSysFrstInptPrgrmId(wghPrfmncVO.getSysFrstInptPrgrmId());
						insertGdsInvntrVO.setSysFrstInptUserId(wghPrfmncVO.getSysFrstInptUserId());
						insertGdsInvntrVO.setSysLastChgPrgrmId(wghPrfmncVO.getSysLastChgPrgrmId());
						insertGdsInvntrVO.setSysLastChgUserId(wghPrfmncVO.getSysLastChgUserId());
						insertGdsInvntrVO.setInvntrSttsCd("D1");
						insertGdsInvntrVO.setApcCd(wghPrfmncVO.getApcCd());
						insertGdsInvntrVO.setItemCd(wghPrfmncVO.getItemCd());
						insertGdsInvntrVO.setVrtyCd(wghPrfmncVO.getVrtyCd());
						insertGdsInvntrVO.setGdsGrd(wghPrfmncVO.getGrdCd());

						insertGdsInvntrVO.setInvntrQntt(wghPrfmncVO.getBxQntt() * -1);
						insertGdsInvntrVO.setPckgYmd(wghPrfmncVO.getWghYmd());
						insertGdsInvntrVO.setSpmtQntt(wghPrfmncVO.getBxQntt());

						insertGdsInvntrVO.setPckgno(pckgno);
						insertGdsInvntrVO.setPckgSn(seq);

						insertgdsInvntrList.add(insertGdsInvntrVO);

						spmtPrfmncVO.setPckgno(insertGdsInvntrVO.getPckgno());
						spmtPrfmncVO.setPckgSn(insertGdsInvntrVO.getPckgSn());

						if (0 == spmtPrfmncService.insertSpmtPrfmncDtl(spmtPrfmncVO)) {
							throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_PARAM_ONE, "출하실적 등록")));		// E0003	{0} 시 오류가 발생하였습니다.
						}
					}
					wghPrfmncDtlVO.setSpmtno(spmtno);
				}

				wghPrfmncMapper.insertWghPrfmncDtl(wghPrfmncDtlVO);

				start++;
				seq++;

			}

			// 출하시 강제 생성된 재고 등록
			if (insertgdsInvntrList.size() > 0) {

				gdsInvntrService.insertGdsInvntrList(insertgdsInvntrList);

			}

		}

		if (updateWrhsList != null && updateWrhsList.size() > 0) {

			int groupId = 0;
			int start = 1;
			for (WghPrfmncVO wghPrfmncVO : updateWrhsList) {

				if (start == 1) {
					groupId = wghPrfmncVO.getGroupId();

					wghPrfmncMapper.updateWghPrfmncCom(wghPrfmncVO);
					String vhclno = wghPrfmncVO.getVhclno();

					if (StringUtils.hasText(vhclno)) {

						WrhsVhclVO wrhsVhclVO = new WrhsVhclVO();
						BeanUtils.copyProperties(wghPrfmncVO, wrhsVhclVO);

						wrhsVhclService.insertMergeWrhsVhcl(wrhsVhclVO);
					}
					/** 검품등급 insert **/
					/** 검품등급 wghno set **/
					String wghno = wghPrfmncVO.getWghno();
					List<WghInspPrfmncVO> inspList = wghPrfmncVO.getInspPrfmncList();
					if(inspList.size() > 0){
						for(WghInspPrfmncVO vo : inspList){
							vo.setWghno(wghno);
						}
						wghPrfmncMapper.insertUpdateInspList(inspList);
					}
				} else {

					if (groupId != wghPrfmncVO.getGroupId()) {
						groupId = wghPrfmncVO.getGroupId();
						wghPrfmncMapper.updateWghPrfmncCom(wghPrfmncVO);

						String vhclno = wghPrfmncVO.getVhclno();

						if (StringUtils.hasText(vhclno)) {

							WrhsVhclVO wrhsVhclVO = new WrhsVhclVO();
							BeanUtils.copyProperties(wghPrfmncVO, wrhsVhclVO);

							wrhsVhclService.insertMergeWrhsVhcl(wrhsVhclVO);
						}

					} else {
						/** 검품등급 insert **/
						/** 검품등급 wghno set **/
						String wghno = wghPrfmncVO.getWghno();
						List<WghInspPrfmncVO> inspList = wghPrfmncVO.getInspPrfmncList();
						if(inspList.size() > 0){
							for(WghInspPrfmncVO vo : inspList){
								vo.setWghno(wghno);
							}
							wghPrfmncMapper.insertUpdateInspList(inspList);
						}

						if ("Y".equals(wghPrfmncVO.getDistributionYn())) {

						} else {

							wghPrfmncVO.setPltQntt(0);
							wghPrfmncVO.setWholWght(0);
						}
					}
				}

				if ("Y".equals(wghPrfmncVO.getNewYn())) {
					String wrhsSecd = wghPrfmncVO.getWrhsSeCd();
					String gdsSecd = wghPrfmncVO.getGdsSeCd();
					String trsprtSecd = wghPrfmncVO.getTrsprtSeCd();

					if (!StringUtils.hasText(wrhsSecd)) {
						wghPrfmncVO.setWrhsSeCd(ApcConstants.WRHS_SE_CD_BASIC);
					}

					if (!StringUtils.hasText(gdsSecd)) {
						wghPrfmncVO.setGdsSeCd(ApcConstants.GDS_SE_CD_BASIC);
					}

					if (!StringUtils.hasText(trsprtSecd)) {
						wghPrfmncVO.setTrsprtSeCd(ApcConstants.TRSPRT_SE_CD_BASIC);
					}

					double dtlWrhsWght = wghPrfmncVO.getDtlWrhsWght();
					if (dtlWrhsWght > 0) {
						wghPrfmncVO.setWrhsWght(dtlWrhsWght);
					}

					WghPrfmncDtlVO wghPrfmncDtlVO = new WghPrfmncDtlVO();
					BeanUtils.copyProperties(wghPrfmncVO, wghPrfmncDtlVO);

					RawMtrWrhsVO rawMtrWrhsVO = new RawMtrWrhsVO();
					BeanUtils.copyProperties(wghPrfmncVO, rawMtrWrhsVO);
					rawMtrWrhsVO.setWrhsYmd(wghPrfmncVO.getWghYmd());
					rawMtrWrhsVO.setGrdCd(wghPrfmncDtlVO.getGrdCd());
					rawMtrWrhsVO.setPltno(wghPrfmncDtlVO.getPltno());
					rawMtrWrhsVO.setBxKnd(wghPrfmncDtlVO.getBxKnd());
					rawMtrWrhsVO.setBxQntt(wghPrfmncDtlVO.getBxQntt());
					rawMtrWrhsVO.setWrhsQntt(wghPrfmncDtlVO.getBxQntt());
					rawMtrWrhsVO.setStdGrdList(wghPrfmncDtlVO.getStdGrdList());


					HashMap<String, Object> rtnObj = rawMtrWrhsService.insertRawMtrWrhs(rawMtrWrhsVO);
					if (rtnObj != null) {
						throw new EgovBizException(getMessageForMap(rtnObj));
					}
					// 입고번호 설정
					wghPrfmncDtlVO.setWrhsno(rawMtrWrhsVO.getWrhsno());
					wghPrfmncMapper.insertWghPrfmncDtl(wghPrfmncDtlVO);
				} else if ("Y".equals(wghPrfmncVO.getDtlDelYn())) {

					WghPrfmncDtlVO wghPrfmncDtlVO = new WghPrfmncDtlVO();
					BeanUtils.copyProperties(wghPrfmncVO, wghPrfmncDtlVO);

					HashMap<String, Object> rtnObj = deleteWghPrfmncDtl(wghPrfmncDtlVO);
					if (rtnObj != null) {
						throw new EgovBizException(getMessageForMap(rtnObj));
					}

					RawMtrWrhsVO rawMtrWrhsVO = new RawMtrWrhsVO();
					BeanUtils.copyProperties(wghPrfmncVO, rawMtrWrhsVO);
					rawMtrWrhsVO.setWrhsYmd(wghPrfmncVO.getWghYmd());
					rawMtrWrhsVO.setGrdCd(wghPrfmncDtlVO.getGrdCd());
					rawMtrWrhsVO.setPltno(wghPrfmncDtlVO.getPltno());
					rawMtrWrhsVO.setBxKnd(wghPrfmncDtlVO.getBxKnd());
					rawMtrWrhsVO.setBxQntt(wghPrfmncDtlVO.getBxQntt());
					rawMtrWrhsVO.setWrhsQntt(wghPrfmncDtlVO.getBxQntt());
					rawMtrWrhsVO.setStdGrdList(wghPrfmncDtlVO.getStdGrdList());

					HashMap<String, Object> rtnObjWrhs = rawMtrWrhsService.deleteRawMtrWrhs(rawMtrWrhsVO);
					if (rtnObjWrhs != null) {
						throw new EgovBizException(getMessageForMap(rtnObjWrhs));
					}
				} else {

					String wrhsSecd = wghPrfmncVO.getWrhsSeCd();
					String gdsSecd = wghPrfmncVO.getGdsSeCd();
					String trsprtSecd = wghPrfmncVO.getTrsprtSeCd();

					if (!StringUtils.hasText(wrhsSecd)) {
						wghPrfmncVO.setWrhsSeCd(ApcConstants.WRHS_SE_CD_BASIC);
					}

					if (!StringUtils.hasText(gdsSecd)) {
						wghPrfmncVO.setGdsSeCd(ApcConstants.GDS_SE_CD_BASIC);
					}

					if (!StringUtils.hasText(trsprtSecd)) {
						wghPrfmncVO.setTrsprtSeCd(ApcConstants.TRSPRT_SE_CD_BASIC);
					}

					double dtlWrhsWght = wghPrfmncVO.getDtlWrhsWght();
					if (dtlWrhsWght > 0) {
						wghPrfmncVO.setWrhsWght(dtlWrhsWght);
					}

					WghPrfmncDtlVO wghPrfmncDtlVO = new WghPrfmncDtlVO();
					BeanUtils.copyProperties(wghPrfmncVO, wghPrfmncDtlVO);

					HashMap<String, Object> rtnObj = updateWghPrfmncDtl(wghPrfmncDtlVO);
					if (rtnObj != null) {
						throw new EgovBizException(getMessageForMap(rtnObj));
					}

					RawMtrWrhsVO rawMtrWrhsVO = new RawMtrWrhsVO();
					BeanUtils.copyProperties(wghPrfmncVO, rawMtrWrhsVO);
					rawMtrWrhsVO.setWrhsYmd(wghPrfmncVO.getWghYmd());
					rawMtrWrhsVO.setGrdCd(wghPrfmncDtlVO.getGrdCd());
					rawMtrWrhsVO.setPltno(wghPrfmncDtlVO.getPltno());
					rawMtrWrhsVO.setBxKnd(wghPrfmncDtlVO.getBxKnd());
					rawMtrWrhsVO.setBxQntt(wghPrfmncDtlVO.getBxQntt());
					rawMtrWrhsVO.setWrhsQntt(wghPrfmncDtlVO.getBxQntt());
					rawMtrWrhsVO.setStdGrdList(wghPrfmncDtlVO.getStdGrdList());

					HashMap<String, Object> rtnObjWrhs = rawMtrWrhsService.updateRawMtrWrhs(rawMtrWrhsVO);
					if (rtnObjWrhs != null) {
						throw new EgovBizException(getMessageForMap(rtnObjWrhs));
					}

				}

				start++;

			}

		}

		if (updateSpmtList != null && updateSpmtList.size() > 0) {
			int groupId = 0;
			int start = 1;

			String pckgno = "";
			String spmtno = "";

			List<SpmtPrfmncVO> spmtPrfmncList = new ArrayList<>();
			List<GdsInvntrVO> insertgdsInvntrList = new ArrayList<>();

			for (WghPrfmncVO wghPrfmncVO : updateSpmtList) {

				if (start == 1) {
					groupId = wghPrfmncVO.getGroupId();

					wghPrfmncMapper.updateWghPrfmncCom(wghPrfmncVO);

					if ("Y".equals(wghPrfmncVO.getSpmtPrfmncYn())) {

						SpmtPrfmncVO spmtDeleteVO = new SpmtPrfmncVO();
						BeanUtils.copyProperties(wghPrfmncVO, spmtDeleteVO);
						spmtDeleteVO.setSpmtYmd(wghPrfmncVO.getWghYmd());
						spmtDeleteVO.setSpmtno(wghPrfmncVO.getWrhsno());
						spmtPrfmncList.add(spmtDeleteVO);
					}


					String vhclno = wghPrfmncVO.getVhclno();

					if (StringUtils.hasText(vhclno)) {

						WrhsVhclVO wrhsVhclVO = new WrhsVhclVO();
						BeanUtils.copyProperties(wghPrfmncVO, wrhsVhclVO);

						wrhsVhclService.insertMergeWrhsVhcl(wrhsVhclVO);
					}
					/** 검품등급 insert **/
					/** 검품등급 wghno set **/
					String wghno = wghPrfmncVO.getWghno();
					List<WghInspPrfmncVO> inspList = wghPrfmncVO.getInspPrfmncList();
					if(inspList.size() > 0){
						for(WghInspPrfmncVO vo : inspList){
							vo.setWghno(wghno);
						}
						wghPrfmncMapper.insertUpdateInspList(inspList);
					}
				} else {

					if (groupId != wghPrfmncVO.getGroupId()) {
						groupId = wghPrfmncVO.getGroupId();
						wghPrfmncMapper.updateWghPrfmncCom(wghPrfmncVO);

						if ("Y".equals(wghPrfmncVO.getSpmtPrfmncYn())) {

							SpmtPrfmncVO spmtDeleteVO = new SpmtPrfmncVO();
							BeanUtils.copyProperties(wghPrfmncVO, spmtDeleteVO);
							spmtDeleteVO.setSpmtno(wghPrfmncVO.getWrhsno());
							spmtPrfmncList.add(spmtDeleteVO);
						}


						String vhclno = wghPrfmncVO.getVhclno();

						if (StringUtils.hasText(vhclno)) {

							WrhsVhclVO wrhsVhclVO = new WrhsVhclVO();
							BeanUtils.copyProperties(wghPrfmncVO, wrhsVhclVO);

							wrhsVhclService.insertMergeWrhsVhcl(wrhsVhclVO);
						}

					} else {
						/** 검품등급 insert **/
						/** 검품등급 wghno set **/
						String wghno = wghPrfmncVO.getWghno();
						List<WghInspPrfmncVO> inspList = wghPrfmncVO.getInspPrfmncList();
						if(inspList.size() > 0){
							for(WghInspPrfmncVO vo : inspList){
								vo.setWghno(wghno);
							}
							wghPrfmncMapper.insertUpdateInspList(inspList);
						}

						if ("Y".equals(wghPrfmncVO.getDistributionYn())) {

						} else {

							wghPrfmncVO.setPltQntt(0);
							wghPrfmncVO.setWholWght(0);
						}
					}
				}

				double dtlWrhsWght = wghPrfmncVO.getDtlWrhsWght();
				if (dtlWrhsWght > 0) {
					wghPrfmncVO.setWrhsWght(dtlWrhsWght);
				}

				WghPrfmncDtlVO wghPrfmncDtlVO = new WghPrfmncDtlVO();
				BeanUtils.copyProperties(wghPrfmncVO, wghPrfmncDtlVO);

				if ("Y".equals(wghPrfmncVO.getSpmtPrfmncYn())) {
					SpmtPrfmncVO spmtPrfmncVO = new SpmtPrfmncVO();

					BeanUtils.copyProperties(wghPrfmncVO, spmtPrfmncVO);

					spmtPrfmncVO.setCnptCd(wghPrfmncVO.getPrdcrCd());
					spmtPrfmncVO.setSpmtYmd(wghPrfmncVO.getWghYmd());
					spmtPrfmncVO.setSpmtSeCd("01");

					if (start == 1) {
						spmtno = cmnsTaskNoService.selectSpmtno(updateSpmtList.get(0).getApcCd(), updateSpmtList.get(0).getWghYmd());
						pckgno = cmnsTaskNoService.selectPckgno(updateSpmtList.get(0).getApcCd(), updateSpmtList.get(0).getWghYmd());
						spmtPrfmncVO.setSpmtno(spmtno);
						spmtPrfmncService.insertSpmtPrfmncCom(spmtPrfmncVO);
					} else {
						if (groupId != wghPrfmncVO.getGroupId()) {
							spmtno = cmnsTaskNoService.selectSpmtno(updateSpmtList.get(0).getApcCd(), updateSpmtList.get(0).getWghYmd());
							pckgno = cmnsTaskNoService.selectPckgno(updateSpmtList.get(0).getApcCd(), updateSpmtList.get(0).getWghYmd());
							spmtPrfmncVO.setSpmtno(spmtno);
							spmtPrfmncService.insertSpmtPrfmncCom(spmtPrfmncVO);
						} else {
							spmtPrfmncVO.setSpmtno(spmtno);
						}
					}
					spmtPrfmncVO.setSortGrdCd(wghPrfmncVO.getGrdCd());
					spmtPrfmncVO.setSpmtQntt(wghPrfmncVO.getBxQntt());
					spmtPrfmncVO.setSpmtSn(wghPrfmncVO.getWghSn());

					GdsInvntrVO gdsInvntrVO = new GdsInvntrVO();
					gdsInvntrVO.setApcCd(wghPrfmncVO.getApcCd());
					gdsInvntrVO.setItemCd(wghPrfmncVO.getItemCd());
					gdsInvntrVO.setVrtyCd(wghPrfmncVO.getVrtyCd());
					gdsInvntrVO.setGdsGrd(wghPrfmncVO.getGrdCd());

					List<GdsInvntrVO> gdsInvntrList = gdsInvntrService.selectGdsInvntrList(gdsInvntrVO);

					if (gdsInvntrList.size() > 0) {
						int remainderSpmtQntt = spmtPrfmncVO.getSpmtQntt();
						// 출하량 만큼 재고 리스트에서 순차적으로 차감
						for (GdsInvntrVO gdsInvntr : gdsInvntrList) {

							// 출하량 만큼 재고 차감인 경우
							if (remainderSpmtQntt == 0) {
								break;
							}

							// 출하량 보다 재고 차감을 덜 한 경우
							if (remainderSpmtQntt > 0) {

								// 현재 n번째 재고가 출하량보다 많을 경우
								if (gdsInvntr.getInvntrQntt() - remainderSpmtQntt >= 0) {
									spmtPrfmncVO.setPckgno(gdsInvntr.getPckgno());
									spmtPrfmncVO.setPckgSn(gdsInvntr.getPckgSn());
									spmtPrfmncVO.setBrndNm(gdsInvntr.getBrndNm());
									spmtPrfmncVO.setSpcfctCd(gdsInvntr.getSpcfctCd());
									spmtPrfmncVO.setSpmtPckgUnitCd(gdsInvntr.getSpmtPckgUnitCd());

									spmtPrfmncVO.setSpmtQntt(remainderSpmtQntt);

									if (!StringUtils.hasText(spmtPrfmncVO.getGdsCd())) {
										CmnsGdsVO cmnsGdsVO = new CmnsGdsVO();
										cmnsGdsVO.setApcCd(spmtPrfmncVO.getApcCd());
										cmnsGdsVO.setItemCd(spmtPrfmncVO.getItemCd());
										cmnsGdsVO.setVrtyCd(spmtPrfmncVO.getVrtyCd());
										cmnsGdsVO.setSpcfctCd(spmtPrfmncVO.getSpcfctCd());
										cmnsGdsVO.setSpmtPckgUnitCd(spmtPrfmncVO.getSpmtPckgUnitCd());
										cmnsGdsVO.setSysLastChgPrgrmId(spmtPrfmncVO.getSysLastChgPrgrmId());
										cmnsGdsVO.setSysLastChgUserId(spmtPrfmncVO.getSysLastChgUserId());

										cmnsGdsService.insertCheckGdsCd(cmnsGdsVO);
										spmtPrfmncVO.setGdsCd(cmnsGdsVO.getNewGdsCd());
										spmtPrfmncVO.setBrndNm(cmnsGdsVO.getBrndNm());
									}

									if (0 == spmtPrfmncService.insertSpmtPrfmncDtl(spmtPrfmncVO)) {
										throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_PARAM_ONE, "출하실적 등록")));		// E0003	{0} 시 오류가 발생하였습니다.
									}

									GdsInvntrVO updateGdsInvntrVO = new GdsInvntrVO();
									updateGdsInvntrVO.setApcCd(spmtPrfmncVO.getApcCd());
									updateGdsInvntrVO.setPckgno(spmtPrfmncVO.getPckgno());
									updateGdsInvntrVO.setPckgSn(spmtPrfmncVO.getPckgSn());
									updateGdsInvntrVO.setSpmtQntt(wghPrfmncVO.getBxQntt());
									updateGdsInvntrVO.setSpmtPckgUnitCd(spmtPrfmncVO.getSpmtPckgUnitCd());
									updateGdsInvntrVO.setGdsGrd(spmtPrfmncVO.getGdsGrd());
									updateGdsInvntrVO.setSysLastChgPrgrmId(spmtPrfmncVO.getSysLastChgPrgrmId());
									updateGdsInvntrVO.setSysLastChgUserId(spmtPrfmncVO.getSysLastChgUserId());

									resultMap = gdsInvntrService.updateGdsInvntrSpmtPrfmnc(updateGdsInvntrVO);

									if (resultMap != null) {
										throw new EgovBizException(getMessageForMap(resultMap));
									}
									remainderSpmtQntt = remainderSpmtQntt - spmtPrfmncVO.getSpmtQntt();
								} else { // 현재 n번째 재고가 출하량 보다 적을 경우
									spmtPrfmncVO.setPckgno(gdsInvntr.getPckgno());
									spmtPrfmncVO.setPckgSn(gdsInvntr.getPckgSn());
									spmtPrfmncVO.setBrndNm(gdsInvntr.getBrndNm());
									spmtPrfmncVO.setSpcfctCd(gdsInvntr.getSpcfctCd());
									spmtPrfmncVO.setSpmtPckgUnitCd(gdsInvntr.getSpmtPckgUnitCd());

									spmtPrfmncVO.setSpmtQntt(gdsInvntr.getInvntrQntt());

									if (!StringUtils.hasText(spmtPrfmncVO.getGdsCd())) {
										CmnsGdsVO cmnsGdsVO = new CmnsGdsVO();
										cmnsGdsVO.setApcCd(spmtPrfmncVO.getApcCd());
										cmnsGdsVO.setItemCd(spmtPrfmncVO.getItemCd());
										cmnsGdsVO.setVrtyCd(spmtPrfmncVO.getVrtyCd());
										cmnsGdsVO.setSpcfctCd(spmtPrfmncVO.getSpcfctCd());
										cmnsGdsVO.setSpmtPckgUnitCd(spmtPrfmncVO.getSpmtPckgUnitCd());
										cmnsGdsVO.setSysLastChgPrgrmId(spmtPrfmncVO.getSysLastChgPrgrmId());
										cmnsGdsVO.setSysLastChgUserId(spmtPrfmncVO.getSysLastChgUserId());

										cmnsGdsService.insertCheckGdsCd(cmnsGdsVO);
										spmtPrfmncVO.setGdsCd(cmnsGdsVO.getNewGdsCd());
										spmtPrfmncVO.setBrndNm(cmnsGdsVO.getBrndNm());
									}

									if (0 == spmtPrfmncService.insertSpmtPrfmncDtl(spmtPrfmncVO)) {
										throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_PARAM_ONE, "출하실적 등록")));		// E0003	{0} 시 오류가 발생하였습니다.
									}

									GdsInvntrVO updateGdsInvntrVO = new GdsInvntrVO();
									updateGdsInvntrVO.setApcCd(spmtPrfmncVO.getApcCd());
									updateGdsInvntrVO.setPckgno(spmtPrfmncVO.getPckgno());
									updateGdsInvntrVO.setPckgSn(spmtPrfmncVO.getPckgSn());
									updateGdsInvntrVO.setSpmtQntt(wghPrfmncVO.getBxQntt());
									updateGdsInvntrVO.setSpmtPckgUnitCd(spmtPrfmncVO.getSpmtPckgUnitCd());
									updateGdsInvntrVO.setGdsGrd(spmtPrfmncVO.getGdsGrd());
									updateGdsInvntrVO.setSysLastChgPrgrmId(spmtPrfmncVO.getSysLastChgPrgrmId());
									updateGdsInvntrVO.setSysLastChgUserId(spmtPrfmncVO.getSysLastChgUserId());
									resultMap = gdsInvntrService.updateGdsInvntrSpmtPrfmnc(updateGdsInvntrVO);

									if (resultMap != null) {
										throw new EgovBizException(getMessageForMap(resultMap));
									}

									remainderSpmtQntt = remainderSpmtQntt - spmtPrfmncVO.getSpmtQntt();
								}
							}
						}

						/* 조회된 재고리스트 재고 보다 출하량이 많은 경우
						 * 출하 재고 생성
						 */
						if (remainderSpmtQntt > 0) {
							GdsInvntrVO insertGdsInvntrVO = new GdsInvntrVO();
							insertGdsInvntrVO.setSysFrstInptPrgrmId(wghPrfmncVO.getSysFrstInptPrgrmId());
							insertGdsInvntrVO.setSysFrstInptUserId(wghPrfmncVO.getSysFrstInptUserId());
							insertGdsInvntrVO.setSysLastChgPrgrmId(wghPrfmncVO.getSysLastChgPrgrmId());
							insertGdsInvntrVO.setSysLastChgUserId(wghPrfmncVO.getSysLastChgUserId());
							insertGdsInvntrVO.setInvntrSttsCd("D1");
							insertGdsInvntrVO.setApcCd(spmtPrfmncVO.getApcCd());
							insertGdsInvntrVO.setItemCd(spmtPrfmncVO.getItemCd());
							insertGdsInvntrVO.setVrtyCd(spmtPrfmncVO.getVrtyCd());
							insertGdsInvntrVO.setGdsGrd(spmtPrfmncVO.getGdsGrd());

							insertGdsInvntrVO.setInvntrQntt(remainderSpmtQntt * -1);
							insertGdsInvntrVO.setSpmtQntt(wghPrfmncVO.getBxQntt());

							insertGdsInvntrVO.setPckgno(pckgno);
							insertGdsInvntrVO.setPckgSn(wghPrfmncVO.getWghSn());

							insertgdsInvntrList.add(insertGdsInvntrVO);

							spmtPrfmncVO.setPckgno(insertGdsInvntrVO.getPckgno());
							spmtPrfmncVO.setPckgSn(insertGdsInvntrVO.getPckgSn());
							spmtPrfmncVO.setSpmtQntt(remainderSpmtQntt);

							if (0 == spmtPrfmncService.insertSpmtPrfmncDtl(spmtPrfmncVO)) {
								throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_PARAM_ONE, "출하실적 등록")));		// E0003	{0} 시 오류가 발생하였습니다.
							}
						}
					} else {

						GdsInvntrVO insertGdsInvntrVO = new GdsInvntrVO();
						insertGdsInvntrVO.setSysFrstInptPrgrmId(wghPrfmncVO.getSysFrstInptPrgrmId());
						insertGdsInvntrVO.setSysFrstInptUserId(wghPrfmncVO.getSysFrstInptUserId());
						insertGdsInvntrVO.setSysLastChgPrgrmId(wghPrfmncVO.getSysLastChgPrgrmId());
						insertGdsInvntrVO.setSysLastChgUserId(wghPrfmncVO.getSysLastChgUserId());
						insertGdsInvntrVO.setInvntrSttsCd("D1");
						insertGdsInvntrVO.setApcCd(wghPrfmncVO.getApcCd());
						insertGdsInvntrVO.setItemCd(wghPrfmncVO.getItemCd());
						insertGdsInvntrVO.setVrtyCd(wghPrfmncVO.getVrtyCd());
						insertGdsInvntrVO.setGdsGrd(wghPrfmncVO.getGrdCd());

						insertGdsInvntrVO.setInvntrQntt(wghPrfmncVO.getBxQntt() * -1);
						insertGdsInvntrVO.setSpmtQntt(wghPrfmncVO.getBxQntt());
						insertGdsInvntrVO.setPckgYmd(wghPrfmncVO.getWghYmd());

						insertGdsInvntrVO.setPckgno(pckgno);
						insertGdsInvntrVO.setPckgSn(wghPrfmncVO.getWghSn());

						insertgdsInvntrList.add(insertGdsInvntrVO);

						spmtPrfmncVO.setPckgno(insertGdsInvntrVO.getPckgno());
						spmtPrfmncVO.setPckgSn(insertGdsInvntrVO.getPckgSn());

						if (0 == spmtPrfmncService.insertSpmtPrfmncDtl(spmtPrfmncVO)) {
							throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_PARAM_ONE, "출하실적 등록")));		// E0003	{0} 시 오류가 발생하였습니다.
						}
					}

					wghPrfmncDtlVO.setSpmtno(spmtno);
				}

				if ("Y".equals(wghPrfmncVO.getNewYn())) {
					String wrhsSecd = wghPrfmncVO.getWrhsSeCd();
					String gdsSecd = wghPrfmncVO.getGdsSeCd();
					String trsprtSecd = wghPrfmncVO.getTrsprtSeCd();

					if (!StringUtils.hasText(wrhsSecd)) {
						wghPrfmncVO.setWrhsSeCd(ApcConstants.WRHS_SE_CD_BASIC);
					}

					if (!StringUtils.hasText(gdsSecd)) {
						wghPrfmncVO.setGdsSeCd(ApcConstants.GDS_SE_CD_BASIC);
					}

					if (!StringUtils.hasText(trsprtSecd)) {
						wghPrfmncVO.setTrsprtSeCd(ApcConstants.TRSPRT_SE_CD_BASIC);
					}

					wghPrfmncMapper.insertWghPrfmncDtl(wghPrfmncDtlVO);
				} else {

					String wrhsSecd = wghPrfmncVO.getWrhsSeCd();
					String gdsSecd = wghPrfmncVO.getGdsSeCd();
					String trsprtSecd = wghPrfmncVO.getTrsprtSeCd();

					if (!StringUtils.hasText(wrhsSecd)) {
						wghPrfmncVO.setWrhsSeCd(ApcConstants.WRHS_SE_CD_BASIC);
					}

					if (!StringUtils.hasText(gdsSecd)) {
						wghPrfmncVO.setGdsSeCd(ApcConstants.GDS_SE_CD_BASIC);
					}

					if (!StringUtils.hasText(trsprtSecd)) {
						wghPrfmncVO.setTrsprtSeCd(ApcConstants.TRSPRT_SE_CD_BASIC);
					}

					HashMap<String, Object> rtnObj = updateWghPrfmncDtl(wghPrfmncDtlVO);
					if (rtnObj != null) {
						throw new EgovBizException(getMessageForMap(rtnObj));
					}

				}
				start++;
			}

			// 기존 출하 실적 삭제
			if (spmtPrfmncList.size() > 0) {

				spmtPrfmncService.deleteSpmtPrfmnc(spmtPrfmncList);
			}


			// 출하시 강제 생성된 재고 등록
			if (insertgdsInvntrList.size() > 0) {
				gdsInvntrService.insertGdsInvntrList(insertgdsInvntrList);
			}

		}


		return null;
	}

	@Override
	public List<HashMap<String, Object>> selectMultiWghPrfmncList(WghPrfmncVO wghPrfmnc) throws Exception {
		return wghPrfmncMapper.selectMultiWghPrfmncList(wghPrfmnc);
	}

	@Override
	public int insertWghEntrVhcl(WghPrfmncVO wghPrfmncVO) throws Exception {
		String orgWghno = wghPrfmncVO.getWghno();
		if (!StringUtils.hasText(orgWghno)) {
			String wghno = cmnsTaskNoService.selectWghno(wghPrfmncVO.getApcCd(), wghPrfmncVO.getWghYmd());
			wghPrfmncVO.setWghno(wghno);
			wghPrfmncMapper.insertWghPrfmncCom(wghPrfmncVO);
			wghPrfmncMapper.insertWghVhcl(wghPrfmncVO);
		} else {
			wghPrfmncMapper.updateWghPrfmncCom(wghPrfmncVO);
			wghPrfmncMapper.updateWghVhcl(wghPrfmncVO);
		}
		return 0;
	}

	@Override
	public int insertWghOutVhcl(WghPrfmncVO wghPrfmncVO) throws Exception {
			String wghno = wghPrfmncVO.getWghno();
			WghPrfmncVO wghVO = wghPrfmncMapper.selectWghVhcl(wghPrfmncVO);
			if(wghVO != null) {
				wghPrfmncMapper.updateWghPrfmncCom(wghPrfmncVO);
				wghPrfmncMapper.updateWghVhcl(wghPrfmncVO);
			}else {
				//wghPrfmncMapper.insertWghPrfmncCom(wghPrfmncVO);
				wghPrfmncMapper.insertWghVhcl(wghPrfmncVO);
			}

			return 0;
	}

	@Override
	public int deleteWghEntrVhcl(WghPrfmncVO wghPrfmncVO) throws Exception {
		String orgWghno = wghPrfmncVO.getWghno();
			wghPrfmncMapper.deleteWghVhcl(wghPrfmncVO);
			wghPrfmncMapper.deleteWghPrfmncCom(wghPrfmncVO);
		return 0;
	}

	@Override
	public List<WghPrfmncVO> selectWghEntrVhclList(WghPrfmncVO wghPrfmnc) throws Exception {

		List<WghPrfmncVO> result = wghPrfmncMapper.selectWghVhclList(wghPrfmnc);
		return result;
	}

	@Override
	public int saveWghVhclInfo(List<WghPrfmncVO> wghPrfmncVOList) throws Exception {

			wghPrfmncVOList.forEach(wghPrfmncVO -> {
				WghPrfmncVO wgh1 = new WghPrfmncVO();
				WghPrfmncVO wgh2 = new WghPrfmncVO();

				wgh1.setApcCd(wghPrfmncVO.getApcCd());
				wgh1.setWghno(wghPrfmncVO.getWghno());
				wgh1.setWghDt(wghPrfmncVO.getEntrTm());
				wgh1.setVhclno(wghPrfmncVO.getVhclno());
				wgh1.setWghWght(wghPrfmncVO.getEntrWght());
				wgh1.setFcltCd(wghPrfmncVO.getFcltCd());
				wgh1.setWghRmrk(wghPrfmncVO.getWghRmrk());
				wgh1.setWghSeCd("01");
				wgh1.setWghSeq("1");
//				wgh1.setPrcsTaskCd("");
//				wgh1.setPrcsCmptnDt("");
//				wgh1.setPrcsCmptnYn("");

				wgh2.setApcCd(wghPrfmncVO.getApcCd());
				wgh2.setWghno(wghPrfmncVO.getWghno());
				wgh2.setWghDt(wghPrfmncVO.getOutTm());
				wgh2.setWghWght(wghPrfmncVO.getOutWght());
				wgh2.setVhclno(wghPrfmncVO.getVhclno());
				wgh2.setFcltCd(wghPrfmncVO.getFcltCd());
				wgh2.setWghRmrk(wghPrfmncVO.getWghRmrk());
				wgh2.setWghSeCd("02");
				wgh2.setWghSeq("2");
//				wgh2.setPrcsTaskCd("");
//				wgh2.setPrcsCmptnDt("");
//				wgh2.setPrcsCmptnYn("");

				wghPrfmncMapper.updateWghVhcl(wgh1);

				WghPrfmncVO chk = wghPrfmncMapper.selectWghVhcl(wgh2);
				if(chk == null) {
					wghPrfmncMapper.insertWghVhcl(wgh2);
				}else {
					wghPrfmncMapper.updateWghVhcl(wgh2);
				}

			});

			return 0;
	}

	@Override
	public List<WghPrfmncVO> selectWghRcptWrhsDtlList(WghPrfmncVO wghPrfmncVO) throws Exception {
		List<WghPrfmncVO> resultList = wghPrfmncMapper.selectWghRcptWrhsDtlList(wghPrfmncVO);
		return resultList;
	}

	@Override
	public List<WghPrfmncVO> selectWghRcptSpmtDtlList(WghPrfmncVO wghPrfmncVO) throws Exception {
		List<WghPrfmncVO> resultList = wghPrfmncMapper.selectWghRcptSpmtDtlList(wghPrfmncVO);
		return resultList;
	}

	@Override
	public List<WghInspPrfmncVO> selectWghInspPrfmncList(WghInspPrfmncVO wghInspPrfmncVO) throws Exception {
		return wghPrfmncMapper.selectWghInspPrfmncList(wghInspPrfmncVO);
	}

	@Override
	public HashMap<String, Object> deleteWghPrfmncInspList(WghPrfmncVO wghPrfmncVO, List<WghInspPrfmncVO> wghInspPrfmncVOList, List<PltWrhsSpmtVO> pltWrhsSpmtVOList) throws Exception {
		/** 계량실적 관련 삭제 **/
		HashMap<String, Object> rtnObj = deleteWghPrfmnc(wghPrfmncVO);
		if (rtnObj != null) {
			throw new EgovBizException(getMessageForMap(rtnObj));
		}
		/** 검품등급 삭제 **/
		if(wghInspPrfmncVOList.size() > 0){
			int delCnt = wghPrfmncMapper.deleteWghInspPrfmncList(wghInspPrfmncVOList);
			if(delCnt != wghInspPrfmncVOList.size()){
				throw new EgovBizException(getMessage(ComConstants.RESULT_STATUS_ERROR));
			}
		}
		/** 팔레트 불출관리 삭제 **/
		if(pltWrhsSpmtVOList.size() > 0){
			for(PltWrhsSpmtVO vo : pltWrhsSpmtVOList){
				rtnObj = pltWrhsSpmtService.updateDelYnPltWrhsSpmt(vo);
				if(rtnObj != null){
					throw new EgovBizException(getMessageForMap(rtnObj));
				}
			}
		}
		return null;
	}

	@Override
	public List<WghHstryVO> selectWghHstryList(WghHstryVO wghHstryVO) throws Exception {
		return wghPrfmncMapper.selectWghHstryList(wghHstryVO);
	}

	@Override
	public List<WghPrfmncVO> selectWghPrfmncListForSpmtReg(WghPrfmncVO wghPrfmncVO) throws Exception {
		List<WghPrfmncVO> resultList = wghPrfmncMapper.selectWghPrfmncListForSpmtReg(wghPrfmncVO);
		return resultList;
	}

	@Override
	public List<WghPrfmncVO> selectWghInfoForSpmtReg(WghPrfmncVO wghPrfmncVO) throws Exception {
		List<WghPrfmncVO> resultList = wghPrfmncMapper.selectWghInfoForSpmtReg(wghPrfmncVO);
		return resultList;
	}

	@Override
	public List<WghPrfmncVO> selectInvntrListForSpmtReg(WghPrfmncVO wghPrfmncVO) throws Exception {
		List<WghPrfmncVO> resultList = wghPrfmncMapper.selectInvntrListForSpmtReg(wghPrfmncVO);
		return resultList;
	}

	@Override
	public List<WghPrfmncVO> selectInvntrDtlListForSpmtReg(WghPrfmncVO wghPrfmncVO) throws Exception {
		List<WghPrfmncVO> resultList = wghPrfmncMapper.selectInvntrDtlListForSpmtReg(wghPrfmncVO);
		return resultList;
	}

	@Override
	public HashMap<String, Object> insertSpmtPrfmncByWgh (SpmtPrfmncComVO spmtPrfmncComVO) throws Exception {

		HashMap<String, Object> rtnObj = spmtPrfmncService.insertSpmtPrfmncByWgh(spmtPrfmncComVO);
		if (rtnObj != null) {
			throw new EgovBizException(getMessageForMap(rtnObj));
		}
		String apcCd = spmtPrfmncComVO.getApcCd();
		String wghno = spmtPrfmncComVO.getWghno();
		String spmtno = spmtPrfmncComVO.getSpmtno();
		String sysLastChgUserId = spmtPrfmncComVO.getSysLastChgUserId();
		String sysLastChgPrgrmId = spmtPrfmncComVO.getSysLastChgPrgrmId();

		if (!StringUtils.hasText(spmtno)){
			throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "출하번호")));
		}

		WghPrfmncDtlVO wghDtlVO = new WghPrfmncDtlVO();
		wghDtlVO.setSpmtno(spmtno);
		wghDtlVO.setWghno(wghno);
		wghDtlVO.setApcCd(apcCd);
		wghDtlVO.setSysLastChgPrgrmId(sysLastChgPrgrmId);
		wghDtlVO.setSysLastChgUserId(sysLastChgUserId);

		wghPrfmncMapper.updateWghPrfmncDtlSpmtno(wghDtlVO);

		return null;
	}

	@Override
	public HashMap<String, Object> deleteSpmtPrfmncList(List<SpmtPrfmncComVO> spmtPrfmncList) throws Exception {

		HashMap<String, Object> rtnObj;

		for (SpmtPrfmncComVO spmtPrfmncComVO : spmtPrfmncList) {
			String apcCd = spmtPrfmncComVO.getApcCd();
			String spmtno = spmtPrfmncComVO.getSpmtno();

			if (!StringUtils.hasText(apcCd)){
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드");
			}

			if (!StringUtils.hasText(spmtno)){
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "출하번호");
			}
		}

		for (SpmtPrfmncComVO spmtPrfmncComVO : spmtPrfmncList) {


			rtnObj = spmtPrfmncService.deleteSpmt(spmtPrfmncComVO);
			if (rtnObj != null) {
				throw new EgovBizException(getMessageForMap(rtnObj));
			}

			String apcCd = spmtPrfmncComVO.getApcCd();
			String spmtno = spmtPrfmncComVO.getSpmtno();
			String sysLastChgUserId = spmtPrfmncComVO.getSysLastChgUserId();
			String sysLastChgPrgrmId = spmtPrfmncComVO.getSysLastChgPrgrmId();
			String wghno = spmtPrfmncComVO.getWghno();

			if (StringUtils.hasText(wghno)) {
				WghPrfmncDtlVO wghDtlVO = new WghPrfmncDtlVO();
				wghDtlVO.setApcCd(apcCd);
				wghDtlVO.setSpmtno(spmtno);
				wghDtlVO.setWghno(wghno);
				wghDtlVO.setSysLastChgUserId(sysLastChgUserId);
				wghDtlVO.setSysLastChgPrgrmId(sysLastChgPrgrmId);

				if ( 0 == wghPrfmncMapper.deleteWghPrfmncDtlSpmtno(wghDtlVO)) {
					throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_PARAM_ONE, "출하번호삭제")));		// E0003	{0} 시 오류가 발생하였습니다.
				}
			}

		}


		return null;
	}

	@Override
	public HashMap<String, Object> updateWghInfoDtlList(List<WghPrfmncVO> wghPrfmncList) throws Exception {
		//List<WghPrfmncVO> insertWrhsList = new ArrayList<>();
		List<WghPrfmncVO> insertSpmtList = new ArrayList<>();
		//List<WghPrfmncVO> updateWrhsList = new ArrayList<>();
		List<WghPrfmncVO> updateSpmtList = new ArrayList<>();

		HashMap<String, Object> resultMap;

		for (WghPrfmncVO wghPrfmncVO : wghPrfmncList) {

			if (ComConstants.ROW_STS_INSERT.equals(wghPrfmncVO.getRowSts())) {


				if ("DT".equals(wghPrfmncVO.getWrhsSpmtType())) {

					insertSpmtList.add(wghPrfmncVO);
				}


			}

			if (ComConstants.ROW_STS_UPDATE.equals(wghPrfmncVO.getRowSts())) {


				if ("DT".equals(wghPrfmncVO.getWrhsSpmtType())) {

					updateSpmtList.add(wghPrfmncVO);
				}
			}
		}


		if (insertSpmtList != null && insertSpmtList.size() > 0) {
			int groupId = 0;
			int start = 1;
			String wghno = "";
			int seq = 1;
			String pckgno = "";
			String spmtno = "";
			List<GdsInvntrVO> insertgdsInvntrList = new ArrayList<>();


			for (WghPrfmncVO wghPrfmncVO : insertSpmtList) {

				if (start == 1) {
					groupId = wghPrfmncVO.getGroupId();
					wghno = cmnsTaskNoService.selectWghno(wghPrfmncVO.getApcCd(), wghPrfmncVO.getWghYmd());
					wghPrfmncVO.setWghno(wghno);

					wghPrfmncMapper.insertWghPrfmncCom(wghPrfmncVO);

					String vhclno = wghPrfmncVO.getVhclno();

					if (StringUtils.hasText(vhclno)) {

						WrhsVhclVO wrhsVhclVO = new WrhsVhclVO();
						BeanUtils.copyProperties(wghPrfmncVO, wrhsVhclVO);

						wrhsVhclService.insertMergeWrhsVhcl(wrhsVhclVO);

					}


				} else {
					if (groupId != wghPrfmncVO.getGroupId()) {
						seq = 1;
						groupId = wghPrfmncVO.getGroupId();
						wghno = cmnsTaskNoService.selectWghno(wghPrfmncVO.getApcCd(), wghPrfmncVO.getWghYmd());
						wghPrfmncVO.setWghno(wghno);
						wghPrfmncMapper.insertWghPrfmncCom(wghPrfmncVO);

						String vhclno = wghPrfmncVO.getVhclno();

						if (StringUtils.hasText(vhclno)) {

							WrhsVhclVO wrhsVhclVO = new WrhsVhclVO();
							BeanUtils.copyProperties(wghPrfmncVO, wrhsVhclVO);

							wrhsVhclService.insertMergeWrhsVhcl(wrhsVhclVO);

						}

					}
				}

				String wrhsSecd = wghPrfmncVO.getWrhsSeCd();
				String gdsSecd = wghPrfmncVO.getGdsSeCd();
				String trsprtSecd = wghPrfmncVO.getTrsprtSeCd();

				if (!StringUtils.hasText(wrhsSecd)) {
					wghPrfmncVO.setWrhsSeCd(ApcConstants.WRHS_SE_CD_BASIC);
				}

				if (!StringUtils.hasText(gdsSecd)) {
					wghPrfmncVO.setGdsSeCd(ApcConstants.GDS_SE_CD_BASIC);
				}

				if (!StringUtils.hasText(trsprtSecd)) {
					wghPrfmncVO.setTrsprtSeCd(ApcConstants.TRSPRT_SE_CD_BASIC);
				}

				double dtlWrhsWght = wghPrfmncVO.getDtlWrhsWght();
				if (dtlWrhsWght > 0) {
					wghPrfmncVO.setWrhsWght(dtlWrhsWght);
				}

				WghPrfmncDtlVO wghPrfmncDtlVO = new WghPrfmncDtlVO();
				BeanUtils.copyProperties(wghPrfmncVO, wghPrfmncDtlVO);
				wghPrfmncDtlVO.setWghSn(seq);


				if ( 0 == wghPrfmncMapper.insertSpmtWghPrfmncDtl(wghPrfmncDtlVO)) {
					throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_PARAM_ONE, "계량실적상세 등록")));		// E0003	{0} 시 오류가 발생하였습니다.
				}

				start++;
				seq++;

			}


		}



		if (updateSpmtList != null && updateSpmtList.size() > 0) {
			int groupId = 0;
			int start = 1;

			String pckgno = "";
			String spmtno = "";

			List<SpmtPrfmncVO> spmtPrfmncList = new ArrayList<>();
			List<GdsInvntrVO> insertgdsInvntrList = new ArrayList<>();

			for (WghPrfmncVO wghPrfmncVO : updateSpmtList) {

				if (start == 1) {
					groupId = wghPrfmncVO.getGroupId();

					wghPrfmncMapper.updateWghPrfmncCom(wghPrfmncVO);



					String vhclno = wghPrfmncVO.getVhclno();

					if (StringUtils.hasText(vhclno)) {

						WrhsVhclVO wrhsVhclVO = new WrhsVhclVO();
						BeanUtils.copyProperties(wghPrfmncVO, wrhsVhclVO);

						wrhsVhclService.insertMergeWrhsVhcl(wrhsVhclVO);
					}

				} else {

					if (groupId != wghPrfmncVO.getGroupId()) {
						groupId = wghPrfmncVO.getGroupId();
						wghPrfmncMapper.updateWghPrfmncCom(wghPrfmncVO);


						String vhclno = wghPrfmncVO.getVhclno();

						if (StringUtils.hasText(vhclno)) {

							WrhsVhclVO wrhsVhclVO = new WrhsVhclVO();
							BeanUtils.copyProperties(wghPrfmncVO, wrhsVhclVO);

							wrhsVhclService.insertMergeWrhsVhcl(wrhsVhclVO);
						}

					} /*else {
						*//** 검품등급 insert **//*
						*//** 검품등급 wghno set **//*
						String wghno = wghPrfmncVO.getWghno();
						List<WghInspPrfmncVO> inspList = wghPrfmncVO.getInspPrfmncList();
						if(inspList != null){
							for(WghInspPrfmncVO vo : inspList){
								vo.setWghno(wghno);
							}
							wghPrfmncMapper.insertUpdateInspList(inspList);
						}

						if ("Y".equals(wghPrfmncVO.getDistributionYn())) {

						} else {

							wghPrfmncVO.setPltQntt(0);
							wghPrfmncVO.setWholWght(0);
						}
					}*/
				}

				double dtlWrhsWght = wghPrfmncVO.getDtlWrhsWght();
				if (dtlWrhsWght > 0) {
					wghPrfmncVO.setWrhsWght(dtlWrhsWght);
				}

				WghPrfmncDtlVO wghPrfmncDtlVO = new WghPrfmncDtlVO();
				BeanUtils.copyProperties(wghPrfmncVO, wghPrfmncDtlVO);


				if ("Y".equals(wghPrfmncVO.getNewYn())) {
					String wrhsSecd = wghPrfmncVO.getWrhsSeCd();
					String gdsSecd = wghPrfmncVO.getGdsSeCd();
					String trsprtSecd = wghPrfmncVO.getTrsprtSeCd();

					if (!StringUtils.hasText(wrhsSecd)) {
						wghPrfmncVO.setWrhsSeCd(ApcConstants.WRHS_SE_CD_BASIC);
					}

					if (!StringUtils.hasText(gdsSecd)) {
						wghPrfmncVO.setGdsSeCd(ApcConstants.GDS_SE_CD_BASIC);
					}

					if (!StringUtils.hasText(trsprtSecd)) {
						wghPrfmncVO.setTrsprtSeCd(ApcConstants.TRSPRT_SE_CD_BASIC);
					}

					if ( 0 == wghPrfmncMapper.insertSpmtWghPrfmncDtl(wghPrfmncDtlVO)) {
						throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_PARAM_ONE, "계량실적상세 등록")));		// E0003	{0} 시 오류가 발생하였습니다.
					}

				} else {

					String wrhsSecd = wghPrfmncVO.getWrhsSeCd();
					String gdsSecd = wghPrfmncVO.getGdsSeCd();
					String trsprtSecd = wghPrfmncVO.getTrsprtSeCd();

					if (!StringUtils.hasText(wrhsSecd)) {
						wghPrfmncVO.setWrhsSeCd(ApcConstants.WRHS_SE_CD_BASIC);
					}

					if (!StringUtils.hasText(gdsSecd)) {
						wghPrfmncVO.setGdsSeCd(ApcConstants.GDS_SE_CD_BASIC);
					}

					if (!StringUtils.hasText(trsprtSecd)) {
						wghPrfmncVO.setTrsprtSeCd(ApcConstants.TRSPRT_SE_CD_BASIC);
					}

					if ( 0 == wghPrfmncMapper.updateSpmtWghPrfmncDtl(wghPrfmncDtlVO)) {
						throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_PARAM_ONE, "계량실적상세 수정")));		// E0003	{0} 시 오류가 발생하였습니다.
					}


				}
				start++;
			}



		}


		return null;
	}

}
