package com.at.apcss.am.wrhs.service.impl;

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
import com.at.apcss.am.cmns.service.CmnsValidationService;
import com.at.apcss.am.cmns.service.PrdcrService;
import com.at.apcss.am.cmns.vo.PrdcrVO;
import com.at.apcss.am.invntr.service.RawMtrInvntrService;
import com.at.apcss.am.invntr.vo.RawMtrInvntrVO;
import com.at.apcss.am.wrhs.mapper.RawMtrWrhsMapper;
import com.at.apcss.am.wrhs.service.RawMtrWrhsService;
import com.at.apcss.am.wrhs.vo.RawMtrWrhsDsctnTotVO;
import com.at.apcss.am.wrhs.vo.RawMtrWrhsVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;

/**
 * @Class Name : RawMtrWrhsServiceImpl.java
 * @Description : 원물입고 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("rawMtrWrhsService")
public class RawMtrWrhsServiceImpl extends BaseServiceImpl implements RawMtrWrhsService {

	@Autowired
	private RawMtrWrhsMapper rawMtrWrhsMapper;

	@Resource(name="cmnsTaskNoService")
	private CmnsTaskNoService cmnsTaskNoService;

	@Resource(name="rawMtrInvntrService")
	private RawMtrInvntrService rawMtrInvntrService;

	@Resource(name="prdcrService")
	private PrdcrService prdcrService;

	@Resource(name="cmnsValidationService")
	private CmnsValidationService cmnsValidationService;


	@Override
	public RawMtrWrhsVO selectRawMtrWrhs(RawMtrWrhsVO rawMtrWrhsVO) throws Exception {

		RawMtrWrhsVO resultVO = rawMtrWrhsMapper.selectRawMtrWrhs(rawMtrWrhsVO);
		return resultVO;
	}

	@Override
	public List<RawMtrWrhsVO> selectRawMtrWrhsList(RawMtrWrhsVO rawMtrWrhsVO) throws Exception {

		List<RawMtrWrhsVO> resultList = rawMtrWrhsMapper.selectRawMtrWrhsList(rawMtrWrhsVO);

		return resultList;
	}
	@Override
	public List<RawMtrWrhsDsctnTotVO> selectDsctnTotList(RawMtrWrhsDsctnTotVO rawMtrWrhsVO) throws Exception {

		List<RawMtrWrhsDsctnTotVO> resultList = rawMtrWrhsMapper.selectDsctnTotList(rawMtrWrhsVO);

		return resultList;
	}

	@Override
	public List<RawMtrWrhsVO> selectRawMtrWrhsPrfmncList(RawMtrWrhsVO rawMtrWrhsVO) throws Exception {

		List<RawMtrWrhsVO> resultList = rawMtrWrhsMapper.selectRawMtrWrhsPrfmncList(rawMtrWrhsVO);

		return resultList;
	}

	@Override
	public HashMap<String, Object> insertRawMtrWrhs(RawMtrWrhsVO rawMtrWrhsVO) throws Exception {

		String wrhsno = rawMtrWrhsVO.getWrhsno();

		boolean needsWrhsInsert = false;
		if (!StringUtils.hasText(wrhsno)) {
			needsWrhsInsert = true;
			wrhsno = cmnsTaskNoService.selectWrhsno(rawMtrWrhsVO.getApcCd(), rawMtrWrhsVO.getWrhsYmd());
			rawMtrWrhsVO.setWrhsno(wrhsno);
		}

		if (!StringUtils.hasText(rawMtrWrhsVO.getPltno())) {
			rawMtrWrhsVO.setPltno(wrhsno);
		}

		if (needsWrhsInsert) {
			rawMtrWrhsMapper.insertRawMtrWrhs(rawMtrWrhsVO);
		}

		RawMtrInvntrVO rawMtrInvntrVO = new RawMtrInvntrVO();
		BeanUtils.copyProperties(rawMtrWrhsVO, rawMtrInvntrVO);
		rawMtrInvntrVO.setWrhsQntt(rawMtrWrhsVO.getBxQntt());
		rawMtrInvntrVO.setInvntrQntt(rawMtrWrhsVO.getBxQntt());
		rawMtrInvntrVO.setInvntrWght(rawMtrWrhsVO.getWrhsWght());
		rawMtrInvntrVO.setStdGrdList(rawMtrWrhsVO.getStdGrdList());

		HashMap<String, Object> rtnObj = rawMtrInvntrService.insertRawMtrInvntr(rawMtrInvntrVO);
		if (rtnObj != null) {
			throw new EgovBizException(getMessageForMap(rtnObj));
		}

		// 생산자정보 update
		PrdcrVO prdcrVO = new PrdcrVO();
		BeanUtils.copyProperties(rawMtrWrhsVO, prdcrVO);
		prdcrVO.setRprsItemCd(rawMtrWrhsVO.getItemCd());
		prdcrVO.setRprsVrtyCd(rawMtrWrhsVO.getVrtyCd());
		prdcrVO.setGdsSeCd(rawMtrWrhsVO.getGdsSeCd());
		prdcrVO.setWrhsSeCd(rawMtrWrhsVO.getWrhsSeCd());
		prdcrVO.setTrsprtSeCd(rawMtrWrhsVO.getTrsprtSeCd());
		prdcrVO.setVhclno(rawMtrWrhsVO.getVhclno());

		rtnObj = prdcrService.updatePrdcrRprs(prdcrVO);
		if (rtnObj != null) {
			throw new EgovBizException(getMessageForMap(rtnObj));
		}

		return null;
	}

	@Override
	public HashMap<String, Object> insertRawMtrWrhsList(List<RawMtrWrhsVO> rawMtrWrhsList) throws Exception {

		HashMap<String, Object> rtnObj;

		for ( RawMtrWrhsVO rawMtrWrhsVO : rawMtrWrhsList ) {

			String wrhsno = cmnsTaskNoService.selectWrhsno(rawMtrWrhsVO.getApcCd(), rawMtrWrhsVO.getWrhsYmd());
			rawMtrWrhsVO.setWrhsno(wrhsno);

			if (!StringUtils.hasText(rawMtrWrhsVO.getPltno())) {
				rawMtrWrhsVO.setPltno(wrhsno);
			}

			rawMtrWrhsMapper.insertRawMtrWrhs(rawMtrWrhsVO);

			RawMtrInvntrVO rawMtrInvntrVO = new RawMtrInvntrVO();
			BeanUtils.copyProperties(rawMtrWrhsVO, rawMtrInvntrVO);
			rawMtrInvntrVO.setWrhsQntt(rawMtrWrhsVO.getWrhsQntt());
			rawMtrInvntrVO.setInvntrQntt(rawMtrWrhsVO.getWrhsQntt());
			rawMtrInvntrVO.setInvntrWght(rawMtrWrhsVO.getWrhsWght());

			rtnObj = rawMtrInvntrService.insertRawMtrInvntr(rawMtrInvntrVO);
			if (rtnObj != null) {
				throw new EgovBizException(getMessageForMap(rtnObj));
			}
		}

		return null;
	}

	@Override
	public HashMap<String, Object> insertRawMtrWrhsByWghno(RawMtrWrhsVO rawMtrWrhsVO) throws Exception {
		return null;
	}

	@Override
	public HashMap<String, Object> updateRawMtrWrhs(RawMtrWrhsVO rawMtrWrhsVO) throws Exception {

		HashMap<String, Object> rtnObj = new HashMap<>();

		// 원물재고 상태 확인
		RawMtrWrhsVO wrhsInfo = selectRawMtrWrhs(rawMtrWrhsVO);
		if (wrhsInfo == null
				|| !StringUtils.hasText(wrhsInfo.getWrhsno())
				|| ComConstants.CON_YES.equals(wrhsInfo.getDelYn()) ) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "입고정보");	// W0005	{0}이/가 없습니다.
		}
		RawMtrInvntrVO invntrVO = new RawMtrInvntrVO();
		BeanUtils.copyProperties(rawMtrWrhsVO, invntrVO);

		invntrVO.setPltno(null);
		// 원물재고 삭제
		rtnObj = rawMtrInvntrService.deleteRawMtrInvntr(invntrVO);
		if (rtnObj != null) {
			throw new EgovBizException(getMessageForMap(rtnObj));
		}

		rawMtrWrhsVO.setDelYn(null);
		rawMtrWrhsMapper.updateRawMtrWrhs(rawMtrWrhsVO);

		rtnObj = insertRawMtrWrhs(rawMtrWrhsVO);
		if (rtnObj != null) {
			throw new EgovBizException(getMessageForMap(rtnObj));
		}

		return null;
	}

	@Override
	public HashMap<String, Object> deleteRawMtrWrhs(RawMtrWrhsVO rawMtrWrhsVO) throws Exception {

		HashMap<String, Object> rtnObj = new HashMap<>();

		// 원물재고 상태 확인
		RawMtrWrhsVO wrhsInfo = selectRawMtrWrhs(rawMtrWrhsVO);
		if (wrhsInfo == null
				|| !StringUtils.hasText(wrhsInfo.getWrhsno())
				|| ComConstants.CON_YES.equals(wrhsInfo.getDelYn()) ) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "입고정보");	// W0005	{0}이/가 없습니다.
		}

		// 마감확인
		String apcCd = wrhsInfo.getApcCd();
		String wrhsYmd = wrhsInfo.getWrhsYmd();
		String ddlnYn = cmnsValidationService.selectChkDdlnYn(apcCd, wrhsYmd);
		if (!ComConstants.CON_NONE.equals(ddlnYn)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_ALEADY_CLOSE, "원물재고");
		}

		RawMtrInvntrVO invntrVO = new RawMtrInvntrVO();
		BeanUtils.copyProperties(rawMtrWrhsVO, invntrVO);

		// 원물재고 삭제
		rtnObj = rawMtrInvntrService.updateRawMtrInvntrForDelY(invntrVO);
		if (rtnObj != null) {
			throw new EgovBizException(getMessageForMap(rtnObj));
		}

		// 입고실적 삭제
		rawMtrWrhsMapper.updateRawMtrWrhsDelY(rawMtrWrhsVO);

		return null;
	}


	@Override
	public HashMap<String, Object> deleteRawMtrWrhsList(List<RawMtrWrhsVO> rawMtrWrhsList) throws Exception {

		HashMap<String, Object> rtnObj = new HashMap<>();

		for ( RawMtrWrhsVO rawMtrWrhsVO : rawMtrWrhsList ) {
			rtnObj = deleteRawMtrWrhs(rawMtrWrhsVO);
			if (rtnObj != null) {
				logger.debug("msg: {}", rtnObj.get(ComConstants.PROP_RESULT_MESSAGE));
				throw new EgovBizException(getMessageForMap(rtnObj));
			}
		}

		return null;
	}

	@Override
	public HashMap<String, Object> deleteRawMtrWrhsByWghno(RawMtrWrhsVO rawMtrWrhsVO) throws Exception {
		HashMap<String, Object> rtnObj = new HashMap<>();

		RawMtrWrhsVO param = new RawMtrWrhsVO();
		param.setWghno(rawMtrWrhsVO.getWghno());
		param.setApcCd(rawMtrWrhsVO.getApcCd());

		List<RawMtrWrhsVO> wrhsList = rawMtrWrhsMapper.selectRawMtrWrhsList(rawMtrWrhsVO);

		List<RawMtrWrhsVO> voList = new ArrayList<>();

		for ( RawMtrWrhsVO wrhs : wrhsList ) {
			RawMtrWrhsVO vo = new RawMtrWrhsVO();
			BeanUtils.copyProperties(rawMtrWrhsVO, vo);
			vo.setWrhsno(wrhs.getWrhsno());

			voList.add(vo);
		}

		for ( RawMtrWrhsVO vo : voList ) {
			rtnObj = deleteRawMtrWrhs(vo);
			if (rtnObj != null) {
				logger.debug("msg: {}", rtnObj.get(ComConstants.PROP_RESULT_MESSAGE));
				throw new EgovBizException(getMessageForMap(rtnObj));
			}
		}

		return null;
	}

	@Override
	public HashMap<String, Object> insertRawMtrRePrcs(RawMtrWrhsVO rawMtrWrhsVO) throws Exception {

		// 마감확인
		String apcCd = rawMtrWrhsVO.getApcCd();
		String wrhsYmd = rawMtrWrhsVO.getWrhsYmd();
		String ddlnYn = cmnsValidationService.selectChkDdlnYn(apcCd, wrhsYmd);
		if (!ComConstants.CON_NONE.equals(ddlnYn)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_ALEADY_CLOSE, "처리일자");
		}

		String wrhsno = cmnsTaskNoService.selectWrhsno(apcCd, wrhsYmd);
		rawMtrWrhsVO.setWrhsno(wrhsno);

		if (!StringUtils.hasText(rawMtrWrhsVO.getPltno())) {
			rawMtrWrhsVO.setPltno(wrhsno);
		}

		rawMtrWrhsMapper.insertRawMtrWrhs(rawMtrWrhsVO);

		RawMtrInvntrVO rawMtrInvntrVO = new RawMtrInvntrVO();
		BeanUtils.copyProperties(rawMtrWrhsVO, rawMtrInvntrVO);
		rawMtrInvntrVO.setWrhsQntt(rawMtrWrhsVO.getWrhsQntt());
		rawMtrInvntrVO.setInvntrQntt(rawMtrWrhsVO.getWrhsQntt());
		rawMtrInvntrVO.setInvntrWght(rawMtrWrhsVO.getWrhsWght());

		HashMap<String, Object> rtnObj = rawMtrInvntrService.insertRawMtrInvntr(rawMtrInvntrVO);
		if (rtnObj != null) {
			throw new EgovBizException(getMessageForMap(rtnObj));
		}

		return null;
	}

	@Override
	public HashMap<String, Object> deleteRawMtrRePrcs(RawMtrWrhsVO rawMtrWrhsVO) throws Exception {

		// 원물재고 상태 확인
		RawMtrWrhsVO wrhsInfo = selectRawMtrWrhs(rawMtrWrhsVO);
		if (wrhsInfo == null
				|| !StringUtils.hasText(wrhsInfo.getWrhsno())
				|| ComConstants.CON_YES.equals(wrhsInfo.getDelYn()) ) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "입고정보");	// W0005	{0}이/가 없습니다.
		}

		// 마감확인
		String apcCd = wrhsInfo.getApcCd();
		String wrhsYmd = wrhsInfo.getWrhsYmd();
		String ddlnYn = cmnsValidationService.selectChkDdlnYn(apcCd, wrhsYmd);
		if (!ComConstants.CON_NONE.equals(ddlnYn)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_ALEADY_CLOSE, "원물재고");
		}

		if (!StringUtils.hasText(wrhsInfo.getPrcsNo())) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_TARGET, "재처리실적");
		}

		RawMtrInvntrVO invntrVO = new RawMtrInvntrVO();
		BeanUtils.copyProperties(rawMtrWrhsVO, invntrVO);

		// 원물재고 삭제
		HashMap<String, Object> rtnObj = rawMtrInvntrService.updateRawMtrInvntrForDelY(invntrVO);
		if (rtnObj != null) {
			throw new EgovBizException(getMessageForMap(rtnObj));
		}

		// 입고실적 삭제
		rawMtrWrhsMapper.updateRawMtrWrhsDelY(rawMtrWrhsVO);

		return null;
	}

	@Override
	public HashMap<String, Object> insertRawMtrPrcsInpt(RawMtrWrhsVO rawMtrWrhsVO) throws Exception {

		rawMtrWrhsMapper.insertRawMtrPrcs(rawMtrWrhsVO);
		return null;
	}

	@Override
	public HashMap<String, Object> deleteRawMtrPrcsInpt(RawMtrWrhsVO rawMtrWrhsVO) throws Exception {

		rawMtrWrhsMapper.updateRawMtrPrcsDelY(rawMtrWrhsVO);
		return null;
	}

	@Override
	public List<RawMtrWrhsVO> selectRawMtrPrcsList(RawMtrWrhsVO rawMtrWrhsVO) throws Exception {

		List<RawMtrWrhsVO> resultList = rawMtrWrhsMapper.selectRawMtrPrcsList(rawMtrWrhsVO);

		return resultList;
	}

	@Override
	public List<RawMtrWrhsVO> selectRawMtrPrcsInptList(RawMtrWrhsVO rawMtrWrhsVO) throws Exception {

		List<RawMtrWrhsVO> resultList = rawMtrWrhsMapper.selectRawMtrPrcsInptList(rawMtrWrhsVO);

		return resultList;
	}


}
