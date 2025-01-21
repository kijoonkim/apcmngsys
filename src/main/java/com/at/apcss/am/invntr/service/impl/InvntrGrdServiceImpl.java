package com.at.apcss.am.invntr.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.invntr.mapper.GdsInvntrMapper;
import com.at.apcss.am.invntr.mapper.InvntrGrdMapper;
import com.at.apcss.am.invntr.mapper.InvntrGrdMngMapper;
import com.at.apcss.am.invntr.mapper.RawMtrInvntrMapper;
import com.at.apcss.am.invntr.mapper.SortInvntrMapper;
import com.at.apcss.am.invntr.service.GdsInvntrService;
import com.at.apcss.am.invntr.service.InvntrGrdService;
import com.at.apcss.am.invntr.service.InvntrService;
import com.at.apcss.am.invntr.service.RawMtrInvntrService;
import com.at.apcss.am.invntr.service.SortInvntrService;
import com.at.apcss.am.invntr.vo.GdsInvntrVO;
import com.at.apcss.am.invntr.vo.InvntrMngVO;
import com.at.apcss.am.invntr.vo.InvntrVO;
import com.at.apcss.am.invntr.vo.RawMtrInvntrVO;
import com.at.apcss.am.invntr.vo.SortInvntrVO;
import com.at.apcss.am.sort.mapper.SortPrfmncMapper;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;

/**
 * @Class Name : InvntrServiceImpl.java
 * @Description : 재고관리 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("invntrGrdService")
public class InvntrGrdServiceImpl extends BaseServiceImpl implements InvntrGrdService {


	@Autowired
	private InvntrGrdMapper invntrGrdMapper;

	@Autowired
	private RawMtrInvntrMapper rawMtrInvntrMapper;

	@Autowired
	private SortInvntrMapper sortInvntrMapper;

	@Autowired
	private GdsInvntrMapper gdsInvntrMapper;

	@Override
	public int updateRawMtrInvntrGrd(InvntrMngVO invntrMngVO) throws Exception {
		invntrGrdMapper.updateRawMtrInvntrGrd(invntrMngVO);
		RawMtrInvntrVO rawMtrInvntrVO = new RawMtrInvntrVO();
		rawMtrInvntrVO.setWrhsno(invntrMngVO.getInvntrno());
		rawMtrInvntrVO.setApcCd(invntrMngVO.getApcCd());

		rawMtrInvntrVO = rawMtrInvntrMapper.selectRawMtrInvntr(rawMtrInvntrVO);
		rawMtrInvntrVO.setChgBfrQntt(rawMtrInvntrVO.getInvntrQntt());
		rawMtrInvntrVO.setChgBfrWght(rawMtrInvntrVO.getInvntrWght());
		rawMtrInvntrVO.setChgAftrQntt(rawMtrInvntrVO.getInvntrQntt());
		rawMtrInvntrVO.setChgAftrWght(rawMtrInvntrVO.getInvntrWght());
		rawMtrInvntrVO.setChgRsnCd("G1");

		rawMtrInvntrVO.setSysLastChgUserId(invntrMngVO.getSysLastChgUserId());
		rawMtrInvntrVO.setSysLastChgPrgrmId(invntrMngVO.getSysLastChgPrgrmId());
		String wrhsno = rawMtrInvntrVO.getWrhsno();

		invntrMngVO.getRawMtrstdGrdList().forEach(item ->{
			item.setSysLastChgUserId(invntrMngVO.getSysLastChgUserId());
			item.setSysLastChgPrgrmId(invntrMngVO.getSysLastChgPrgrmId());
			item.setWrhsno(wrhsno);
			invntrGrdMapper.updateRawMtrStdGrd(item);
		});

		rawMtrInvntrMapper.insertRawMtrChgHstry(rawMtrInvntrVO);


		return 0;
	}

	@Override
	public int updateSortInvntrGrd(InvntrMngVO invntrMngVO) throws Exception {
		invntrGrdMapper.updateSortInvntrGrd(invntrMngVO);
		SortInvntrVO sortInvntrVO = new SortInvntrVO();
		sortInvntrVO.setSortno(invntrMngVO.getInvntrno());
		sortInvntrVO.setSortSn(invntrMngVO.getSn());
		sortInvntrVO.setApcCd(invntrMngVO.getApcCd());

		sortInvntrVO = sortInvntrMapper.selectSortInvntr(sortInvntrVO);
		sortInvntrVO.setChgBfrQntt(sortInvntrVO.getInvntrQntt());
		sortInvntrVO.setChgBfrWght(sortInvntrVO.getInvntrWght());
		sortInvntrVO.setChgAftrQntt(sortInvntrVO.getInvntrQntt());
		sortInvntrVO.setChgAftrWght(sortInvntrVO.getInvntrWght());
		sortInvntrVO.setChgRsnCd("G1");

		sortInvntrVO.setSysLastChgUserId(invntrMngVO.getSysLastChgUserId());
		sortInvntrVO.setSysLastChgPrgrmId(invntrMngVO.getSysLastChgPrgrmId());
		String sortno = sortInvntrVO.getSortno();
		int sortSn = sortInvntrVO.getSortSn();

		invntrMngVO.getSortStdGrdList().forEach(item ->{
			item.setSysLastChgUserId(invntrMngVO.getSysLastChgUserId());
			item.setSysLastChgPrgrmId(invntrMngVO.getSysLastChgPrgrmId());
			item.setSortno(sortno);
			item.setSortSn(sortSn);
			invntrGrdMapper.updateSortStdGrd(item);
		});

		sortInvntrMapper.insertSortChgHstry(sortInvntrVO);
		return 0;
	}

	@Override
	public int updateGdsInvntrGrd(InvntrMngVO invntrMngVO) throws Exception {
		invntrGrdMapper.updateSortInvntrGrd(invntrMngVO);
		GdsInvntrVO gdsInvntrVO = new GdsInvntrVO();
		gdsInvntrVO.setPckgno(invntrMngVO.getInvntrno());
		gdsInvntrVO.setPckgSn(invntrMngVO.getSn());
		gdsInvntrVO.setApcCd(invntrMngVO.getApcCd());
		gdsInvntrVO = gdsInvntrMapper.selectGdsInvntr(gdsInvntrVO);

		gdsInvntrVO.setChgBfrQntt(gdsInvntrVO.getInvntrQntt());
		gdsInvntrVO.setChgBfrWght(gdsInvntrVO.getInvntrWght());
		gdsInvntrVO.setChgAftrQntt(gdsInvntrVO.getInvntrQntt());
		gdsInvntrVO.setChgAftrWght(gdsInvntrVO.getInvntrWght());
		gdsInvntrVO.setChgRsnCd("G1");

		gdsInvntrVO.setSysLastChgUserId(invntrMngVO.getSysLastChgUserId());
		gdsInvntrVO.setSysLastChgPrgrmId(invntrMngVO.getSysLastChgPrgrmId());
		String pckgno = gdsInvntrVO.getPckgno();
		int pckgSn = gdsInvntrVO.getPckgSn();

		invntrMngVO.getGdsStdGrdList().forEach(item ->{
			item.setSysLastChgUserId(invntrMngVO.getSysLastChgUserId());
			item.setSysLastChgPrgrmId(invntrMngVO.getSysLastChgPrgrmId());
			item.setPckgno(pckgno);
			item.setPckgSn(pckgSn);
			invntrGrdMapper.updateGdsStdGrd(item);
		});

		gdsInvntrMapper.insertGdsInvntrChgHstry(gdsInvntrVO);
		return 0;
	}








}
