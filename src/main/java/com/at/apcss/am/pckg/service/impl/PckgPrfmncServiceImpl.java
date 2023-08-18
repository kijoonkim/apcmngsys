package com.at.apcss.am.pckg.service.impl;

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
import com.at.apcss.am.invntr.service.GdsInvntrService;
import com.at.apcss.am.invntr.vo.GdsInvntrVO;
import com.at.apcss.am.invntr.vo.SortInvntrVO;
import com.at.apcss.am.pckg.mapper.PckgPrfmncMapper;
import com.at.apcss.am.pckg.service.PckgInptService;
import com.at.apcss.am.pckg.service.PckgPrfmncService;
import com.at.apcss.am.pckg.vo.PckgInptVO;
import com.at.apcss.am.pckg.vo.PckgPrfmncVO;
import com.at.apcss.am.sort.vo.SortInptPrfmncVO;
import com.at.apcss.am.sort.vo.SortPrfmncVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;

/**
 * @Class Name : PckgPrfmncServiceImpl.java
 * @Description : 포장실적 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("pckgPrfmncService")
public class PckgPrfmncServiceImpl extends BaseServiceImpl implements PckgPrfmncService {

	@Autowired
	private PckgPrfmncMapper pckgPrfmncMapper;

	@Resource(name="cmnsTaskNoService")
	private CmnsTaskNoService cmnsTaskNoService;

	@Resource(name="pckgInptService")
	private PckgInptService pckgInptService;

	@Resource(name="gdsInvntrService")
	private GdsInvntrService gdsInvntrService;


	@Override
	public PckgPrfmncVO selectPckgPrfmnc(PckgPrfmncVO pckgPrfmncVO) throws Exception {

		PckgPrfmncVO resultVO = pckgPrfmncMapper.selectPckgPrfmnc(pckgPrfmncVO);

		return resultVO;
	}

	@Override
	public List<PckgPrfmncVO> selectPckgPrfmncList(PckgPrfmncVO pckgPrfmncVO) throws Exception {

		List<PckgPrfmncVO> resultList = pckgPrfmncMapper.selectPckgPrfmncList(pckgPrfmncVO);

		return resultList;
	}

	@Override
	public HashMap<String, Object> insertPckgPrfmnc(PckgPrfmncVO pckgPrfmncVO) throws Exception {

		int insertedCnt = pckgPrfmncMapper.insertPckgPrfmnc(pckgPrfmncVO);

		return null;
	}


	@Override
	public HashMap<String, Object> insertPckgPrfmncList(List<PckgPrfmncVO> pckgPrfmncList) throws Exception {

		HashMap<String, Object> rtnObj = new HashMap<>();

		List<GdsInvntrVO> gdsInvntrList = new ArrayList<>();

		// 포장투입실적 등록용 list
		List<PckgInptVO> inptRegList = new ArrayList<>();

		// 투입실적 유무에 따라 선별번호 부여 or 선별투입실적 등록 처리

		String pckgno = ComConstants.CON_YES;
		int pckgSn = 0;

		int insertedCnt = 0;
		for ( PckgPrfmncVO pckgPrfmncVO : pckgPrfmncList ) {
			pckgSn++;
			if (!StringUtils.hasText(pckgno)) {
				pckgno = cmnsTaskNoService.selectPckgno(pckgPrfmncVO.getApcCd(), pckgPrfmncVO.getPckgYmd());
			}
			pckgPrfmncVO.setPckgno(pckgno);
			pckgPrfmncVO.setPckgSn(pckgSn);
			insertedCnt = pckgPrfmncMapper.insertPckgPrfmnc(pckgPrfmncVO);

			if (insertedCnt != 0) {

			}

			GdsInvntrVO gdsInvntrVO = new GdsInvntrVO();
			BeanUtils.copyProperties(pckgPrfmncVO, gdsInvntrVO);
			gdsInvntrVO.setInvntrQntt(pckgPrfmncVO.getPckgQntt());
			gdsInvntrVO.setInvntrWght(pckgPrfmncVO.getPckgWght());

			gdsInvntrList.add(gdsInvntrVO);

			// 포장투입실적 확인
			PckgInptVO pckgInptVO = new PckgInptVO();
			BeanUtils.copyProperties(pckgPrfmncVO, pckgInptVO);

			PckgInptVO inptInfo = pckgInptService.selectPckgInpt(pckgInptVO);
			if (inptInfo != null && StringUtils.hasText(inptInfo.getSortno())) {
				pckgPrfmncVO.setNeedsInptChgYn(ComConstants.CON_YES);
			} else {
				// 투입실적 항목 set
				inptRegList.add(pckgInptVO);
			}
		}

		if (!inptRegList.isEmpty()) {
			rtnObj = pckgInptService.insertPckgInptList(inptRegList);
			if (rtnObj != null) {
				// error throw exception;
				throw new EgovBizException(getMessageForMap(rtnObj));
			}
		}

		// 포장투입실적 선별번호 update
		for ( PckgPrfmncVO pckgPrfmncVO : pckgPrfmncList ) {
			if (ComConstants.CON_YES.equals(pckgPrfmncVO.getNeedsInptChgYn())) {
				pckgPrfmncMapper.updateInptPckgno(pckgPrfmncVO);
			}
		}

		// 상품재고 생성
		rtnObj = gdsInvntrService.insertGdsInvntrList(gdsInvntrList);
		if (rtnObj != null) {
			throw new EgovBizException(getMessageForMap(rtnObj));
		}

		// 입고구분에 따라 재고 변경 추가
		return null;
	}


	@Override
	public HashMap<String, Object> updatePckgPrfmnc(PckgPrfmncVO pckgPrfmncVO) throws Exception {

		int updatedCnt = pckgPrfmncMapper.updatePckgPrfmnc(pckgPrfmncVO);

		return null;
	}

	@Override
	public HashMap<String, Object> deletePckgPrfmnc(PckgPrfmncVO pckgPrfmncVO) throws Exception {

		int deletedCnt = pckgPrfmncMapper.deletePckgPrfmnc(pckgPrfmncVO);

		return null;
	}

}
