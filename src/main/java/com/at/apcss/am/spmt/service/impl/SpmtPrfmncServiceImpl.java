package com.at.apcss.am.spmt.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.invntr.service.GdsInvntrService;
import com.at.apcss.am.invntr.vo.GdsInvntrVO;
import com.at.apcss.am.spmt.mapper.SpmtPrfmncMapper;
import com.at.apcss.am.spmt.service.SpmtPrfmncService;
import com.at.apcss.am.spmt.vo.SpmtPrfmncVO;
import com.at.apcss.co.sys.controller.BaseController;
import com.tmax.tibero.Debug;

import ch.qos.logback.classic.Logger;

/**
 * @Class Name : SpmtPrfmncServiceImpl.java
 * @Description : 출고실적 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("spmtPrfmncService")
public class SpmtPrfmncServiceImpl implements SpmtPrfmncService {

	@Autowired
	private SpmtPrfmncMapper spmtPrfmncMapper;

	@Resource(name= "gdsInvntrService")
	private GdsInvntrService gdsInvntrService;

	@Override
	public SpmtPrfmncVO selectSpmtPrfmnc(SpmtPrfmncVO spmtPrfmncVO) throws Exception {

		SpmtPrfmncVO resultVO = spmtPrfmncMapper.selectSpmtPrfmnc(spmtPrfmncVO);

		return resultVO;
	}

	@Override
	public List<SpmtPrfmncVO> selectSpmtPrfmncList(SpmtPrfmncVO spmtPrfmncVO) throws Exception {

		List<SpmtPrfmncVO> resultList = spmtPrfmncMapper.selectSpmtPrfmncList(spmtPrfmncVO);

		return resultList;
	}

	@Override
	public int insertSpmtPrfmncCom(SpmtPrfmncVO spmtPrfmncVO) throws Exception {

		int insertedCnt = spmtPrfmncMapper.insertSpmtPrfmncCom(spmtPrfmncVO);

		return insertedCnt;
	}

	@Override
	public int updateSpmtPrfmncCom(SpmtPrfmncVO spmtPrfmncVO) throws Exception {

		int updatedCnt = spmtPrfmncMapper.updateSpmtPrfmncCom(spmtPrfmncVO);

		return updatedCnt;
	}

	@Override
	public int deleteSpmtPrfmncCom(SpmtPrfmncVO spmtPrfmncVO) throws Exception {

		int deletedCnt = spmtPrfmncMapper.deleteSpmtPrfmncCom(spmtPrfmncVO);

		return deletedCnt;
	}

	@Override
	public int insertSpmtPrfmncDtl(SpmtPrfmncVO spmtPrfmncVO) throws Exception {

		int insertedCnt = spmtPrfmncMapper.insertSpmtPrfmncDtl(spmtPrfmncVO);

		return insertedCnt;
	}

	@Override
	public int updateSpmtPrfmncDtl(SpmtPrfmncVO spmtPrfmncVO) throws Exception {

		int updatedCnt = spmtPrfmncMapper.updateSpmtPrfmncDtl(spmtPrfmncVO);

		return updatedCnt;
	}

	@Override
	public int deleteSpmtPrfmncDtl(SpmtPrfmncVO spmtPrfmncVO) throws Exception {

		int deletedCnt = spmtPrfmncMapper.deleteSpmtPrfmncDtl(spmtPrfmncVO);

		return deletedCnt;
	}

	@Override
	public int insertSpmtPrfmnc(List<SpmtPrfmncVO> spmtPrfmnc) throws Exception {

		int insertedCnt = 0;

		insertSpmtPrfmncCom(spmtPrfmnc.get(0));

		for ( var i=0; i<spmtPrfmnc.size(); i++ ) {
			insertedCnt += insertSpmtPrfmncDtl(spmtPrfmnc.get(i));
			
			GdsInvntrVO gdsInvntrVO = new GdsInvntrVO();
			gdsInvntrVO.setApcCd(spmtPrfmnc.get(i).getApcCd());
			gdsInvntrVO.setPckgno(spmtPrfmnc.get(i).getPckgno());
			gdsInvntrVO.setPckgSn(spmtPrfmnc.get(i).getPckgSn());
			gdsInvntrVO.setSpmtQntt(spmtPrfmnc.get(i).getSpmtQntt());
			gdsInvntrVO.setSpmtWght(spmtPrfmnc.get(i).getSpmtWght());
			gdsInvntrVO.setSysLastChgPrgrmId(spmtPrfmnc.get(i).getSysLastChgPrgrmId());
			gdsInvntrVO.setSysLastChgUserId(spmtPrfmnc.get(i).getSysLastChgUserId());

			gdsInvntrService.updateGdsInvntrSpmtPrfmnc(gdsInvntrVO);
		}
		return insertedCnt;
	}

	@Override
	public List<SpmtPrfmncVO> selectSpmtPrfmncDtlList(SpmtPrfmncVO spmtPrfmncVO) throws Exception {

		List<SpmtPrfmncVO> resultList = spmtPrfmncMapper.selectSpmtPrfmncDtlList(spmtPrfmncVO);

		return resultList;
	}

	@Override
	public int deleteSpmtPrfmnc(List<SpmtPrfmncVO> spmtPrfmnc) throws Exception {
		int deletedCnt = 0;

		List<SpmtPrfmncVO> deleteList = new ArrayList<>();

		for ( var i=0; i<spmtPrfmnc.size(); i++ ) {
			deleteSpmtPrfmncCom(spmtPrfmnc.get(i));

			deleteList = selectSpmtPrfmncDtl(spmtPrfmnc.get(i));
			
			for ( var j=0; j<deleteList.size(); j++ ) {
				deleteList.get(i).setSysLastChgPrgrmId(spmtPrfmnc.get(i).getSysLastChgPrgrmId());
				deleteList.get(i).setSysLastChgUserId(spmtPrfmnc.get(i).getSysLastChgUserId());

				deletedCnt += deleteSpmtPrfmncDtl(deleteList.get(i));

				GdsInvntrVO gdsInvntrVO = new GdsInvntrVO();
				gdsInvntrVO.setApcCd(deleteList.get(i).getApcCd());
				gdsInvntrVO.setPckgno(deleteList.get(i).getPckgno());
				gdsInvntrVO.setPckgSn(deleteList.get(i).getPckgSn());
				gdsInvntrVO.setSpmtQntt(deleteList.get(i).getSpmtQntt());
				gdsInvntrVO.setSpmtWght(deleteList.get(i).getSpmtWght());
				gdsInvntrVO.setSysLastChgPrgrmId(spmtPrfmnc.get(i).getSysLastChgPrgrmId());
				gdsInvntrVO.setSysLastChgUserId(spmtPrfmnc.get(i).getSysLastChgUserId());

				gdsInvntrService.updateGdsInvntrSpmtPrfmncCncl(gdsInvntrVO);
			}
		}
		return deletedCnt;
	}

	@Override
	public List<SpmtPrfmncVO> selectSpmtPrfmncDtl(SpmtPrfmncVO spmtPrfmncVO) throws Exception {
		List<SpmtPrfmncVO> resultList  = spmtPrfmncMapper.selectSpmtPrfmncDtl(spmtPrfmncVO);
		return resultList;
	}

}
