package com.at.apcss.am.spmt.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.cmns.service.CmnsTaskNoService;
import com.at.apcss.am.cmns.service.CmnsValidationService;
import com.at.apcss.am.invntr.service.GdsInvntrService;
import com.at.apcss.am.invntr.vo.GdsInvntrVO;
import com.at.apcss.am.spmt.mapper.SpmtPrfmncMapper;
import com.at.apcss.am.spmt.service.SpmtPrfmncService;
import com.at.apcss.am.spmt.vo.SpmtPrfmncVO;
import com.at.apcss.co.constants.ComConstants;

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

	@Resource(name= "cmnsTaskNoService")
	private CmnsTaskNoService cmnsTaskNoService;

	@Resource(name = "cmnsValidationService")
	private CmnsValidationService cmnsValidationService;

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
	public int insertSpmtPrfmncList(List<SpmtPrfmncVO> spmtPrfmncList) throws Exception {

		int insertedCnt = 0;

		String spmtno = cmnsTaskNoService.selectSpmtno(spmtPrfmncList.get(0).getApcCd(), spmtPrfmncList.get(0).getSpmtYmd());

		spmtPrfmncList.get(0).setSpmtno(spmtno);

		insertSpmtPrfmncCom(spmtPrfmncList.get(0));

		for (SpmtPrfmncVO spmtPrfmncVO : spmtPrfmncList) {
			spmtPrfmncVO.setSpmtno(spmtno);
			insertedCnt += insertSpmtPrfmncDtl(spmtPrfmncVO);

			GdsInvntrVO gdsInvntrVO = new GdsInvntrVO();
			gdsInvntrVO.setApcCd(spmtPrfmncVO.getApcCd());
			gdsInvntrVO.setPckgno(spmtPrfmncVO.getPckgno());
			gdsInvntrVO.setPckgSn(spmtPrfmncVO.getPckgSn());
			gdsInvntrVO.setSpmtQntt(spmtPrfmncVO.getSpmtQntt());
			gdsInvntrVO.setSpmtWght(spmtPrfmncVO.getSpmtWght());
			gdsInvntrVO.setSysLastChgPrgrmId(spmtPrfmncVO.getSysLastChgPrgrmId());
			gdsInvntrVO.setSysLastChgUserId(spmtPrfmncVO.getSysLastChgUserId());

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
	public HashMap<String, Object> deleteSpmtPrfmnc(List<SpmtPrfmncVO> spmtPrfmncList) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		int deletedCnt = 0;

		List<SpmtPrfmncVO> deleteList = new ArrayList<>();


		for (SpmtPrfmncVO spmtPrfmncVO : spmtPrfmncList) {

			String result = cmnsValidationService.selectChkDdlnYn(spmtPrfmncVO.getApcCd(), spmtPrfmncVO.getSpmtYmd());

			if(result == null) {
				deleteSpmtPrfmncCom(spmtPrfmncVO);

				deleteList = selectSpmtPrfmncDtl(spmtPrfmncVO);

				for (SpmtPrfmncVO spmtPrfmnc : deleteList) {

					spmtPrfmnc.setSysLastChgPrgrmId(spmtPrfmncVO.getSysLastChgPrgrmId());
					spmtPrfmnc.setSysLastChgUserId(spmtPrfmncVO.getSysLastChgUserId());

					deletedCnt += deleteSpmtPrfmncDtl(spmtPrfmnc);

					GdsInvntrVO gdsInvntrVO = new GdsInvntrVO();
					gdsInvntrVO.setApcCd(spmtPrfmnc.getApcCd());
					gdsInvntrVO.setPckgno(spmtPrfmnc.getPckgno());
					gdsInvntrVO.setPckgSn(spmtPrfmnc.getPckgSn());
					gdsInvntrVO.setSpmtQntt(spmtPrfmnc.getSpmtQntt());
					gdsInvntrVO.setSpmtWght(spmtPrfmnc.getSpmtWght());
					gdsInvntrVO.setSysLastChgPrgrmId(spmtPrfmncVO.getSysLastChgPrgrmId());
					gdsInvntrVO.setSysLastChgUserId(spmtPrfmncVO.getSysLastChgUserId());

					gdsInvntrService.updateGdsInvntrSpmtPrfmncCncl(gdsInvntrVO);
				}
			}else {
				resultMap.put("errCd", ComConstants.MSGCD_ALEADY_CLOSE);
				return resultMap;
			}

		}
		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);
		return resultMap;
	}

	@Override
	public List<SpmtPrfmncVO> selectSpmtPrfmncDtl(SpmtPrfmncVO spmtPrfmncVO) throws Exception {
		List<SpmtPrfmncVO> resultList  = spmtPrfmncMapper.selectSpmtPrfmncDtl(spmtPrfmncVO);
		return resultList;
	}

}
