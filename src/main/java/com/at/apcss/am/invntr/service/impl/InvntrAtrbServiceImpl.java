package com.at.apcss.am.invntr.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.invntr.mapper.GdsInvntrMapper;
import com.at.apcss.am.invntr.mapper.InvntrGrdMapper;
import com.at.apcss.am.invntr.mapper.InvntrGrdMngMapper;
import com.at.apcss.am.invntr.mapper.InvntrTypeMapper;
import com.at.apcss.am.invntr.mapper.RawMtrInvntrMapper;
import com.at.apcss.am.invntr.mapper.SortInvntrMapper;
import com.at.apcss.am.invntr.service.GdsInvntrService;
import com.at.apcss.am.invntr.service.InvntrAtrbService;
import com.at.apcss.am.invntr.service.InvntrGrdService;
import com.at.apcss.am.invntr.service.InvntrMngService;
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
@Service("invntrAtrbService")
public class InvntrAtrbServiceImpl extends BaseServiceImpl implements InvntrAtrbService {


	@Autowired
	private InvntrTypeMapper invntrTypeMapper;

	@Autowired
	private RawMtrInvntrMapper rawMtrInvntrMapper;

	@Autowired
	private SortInvntrMapper sortInvntrMapper;

	@Autowired
	private GdsInvntrMapper gdsInvntrMapper;

	@Override
	public int updateRawMtrInvntrType(List<InvntrMngVO> invntrMngVOList) throws Exception {

		invntrMngVOList.forEach(item ->{
			try {
			RawMtrInvntrVO rawMtrInvntrVO = new RawMtrInvntrVO();
			invntrTypeMapper.updateRawMtrInvntrType(item);
			rawMtrInvntrVO.setWrhsno(item.getInvntrno());
			rawMtrInvntrVO.setApcCd(item.getApcCd());


			rawMtrInvntrVO = rawMtrInvntrMapper.selectRawMtrInvntr(rawMtrInvntrVO);

			rawMtrInvntrVO.setChgBfrQntt(rawMtrInvntrVO.getInvntrQntt());
			rawMtrInvntrVO.setChgBfrWght(rawMtrInvntrVO.getInvntrWght());
			rawMtrInvntrVO.setChgAftrQntt(rawMtrInvntrVO.getInvntrQntt());
			rawMtrInvntrVO.setChgAftrWght(rawMtrInvntrVO.getInvntrWght());
			rawMtrInvntrVO.setChgRsnCd("Y1");

			rawMtrInvntrMapper.insertRawMtrChgHstry(rawMtrInvntrVO);
			} catch (Exception e) {

			}
		});

		return 0;
	}

	@Override
	public int updateSortInvntrType(List<InvntrMngVO> invntrMngVOList) throws Exception {
		invntrMngVOList.forEach(invntrMngVO ->{
			try {
			SortInvntrVO sortInvntrVO = new SortInvntrVO();
			invntrTypeMapper.updateSortInvntrType(invntrMngVO);

			sortInvntrVO.setSortno(invntrMngVO.getInvntrno());
			sortInvntrVO.setSortSn(invntrMngVO.getSn());
			sortInvntrVO.setApcCd(invntrMngVO.getApcCd());
			sortInvntrVO = sortInvntrMapper.selectSortInvntr(sortInvntrVO);

			sortInvntrVO.setChgBfrQntt(sortInvntrVO.getInvntrQntt());
			sortInvntrVO.setChgBfrWght(sortInvntrVO.getInvntrWght());
			sortInvntrVO.setChgAftrQntt(sortInvntrVO.getInvntrQntt());
			sortInvntrVO.setChgAftrWght(sortInvntrVO.getInvntrWght());
			sortInvntrVO.setChgRsnCd("Y1");

			sortInvntrMapper.insertSortChgHstry(sortInvntrVO);
			} catch (Exception e) {

			}
		});
		return 0;
	}

	@Override
	public int updateGdsInvntrType(List<InvntrMngVO> invntrMngVOList) throws Exception {

		invntrMngVOList.forEach(invntrMngVO ->{
			try {
				GdsInvntrVO gdsInvntrVO = new GdsInvntrVO();
				invntrTypeMapper.updateGdsInvntrType(invntrMngVO);

				gdsInvntrVO.setPckgno(invntrMngVO.getInvntrno());
				gdsInvntrVO.setPckgSn(invntrMngVO.getSn());
				gdsInvntrVO.setApcCd(invntrMngVO.getApcCd());
				gdsInvntrVO = gdsInvntrMapper.selectGdsInvntr(gdsInvntrVO);

				gdsInvntrVO.setChgBfrQntt(gdsInvntrVO.getInvntrQntt());
				gdsInvntrVO.setChgBfrWght(gdsInvntrVO.getInvntrWght());
				gdsInvntrVO.setChgAftrQntt(gdsInvntrVO.getInvntrQntt());
				gdsInvntrVO.setChgAftrWght(gdsInvntrVO.getInvntrWght());
				gdsInvntrVO.setChgRsnCd("Y1");

				gdsInvntrMapper.insertGdsInvntrChgHstry(gdsInvntrVO);

			} catch (Exception e) {

			}
		});
		return 0;
	}








}
