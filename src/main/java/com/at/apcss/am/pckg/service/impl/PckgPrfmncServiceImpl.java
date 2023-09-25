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

import com.at.apcss.am.cmns.service.CmnsGdsService;
import com.at.apcss.am.cmns.service.CmnsTaskNoService;
import com.at.apcss.am.cmns.vo.CmnsGdsVO;
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
import com.at.apcss.co.sys.util.ComUtil;

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

	@Resource(name="cmnsGdsService")
	private CmnsGdsService cmnsGdsService;

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

		int pckgSn = 0;
		int insertedCnt = 0;
		for ( PckgPrfmncVO pckgPrfmncVO : pckgPrfmncList ) {
			pckgSn++;
			pckgPrfmncVO.setPckgSn(pckgSn);
			insertedCnt = pckgPrfmncMapper.insertPckgPrfmnc(pckgPrfmncVO);

			if (insertedCnt != 0) {

			}

			if (!StringUtils.hasText(pckgPrfmncVO.getGdsCd())
					&& StringUtils.hasText(pckgPrfmncVO.getSpmtPckgUnitCd())) {
				CmnsGdsVO cmnsGdsVO = new CmnsGdsVO();
				BeanUtils.copyProperties(pckgPrfmncVO, cmnsGdsVO);
				rtnObj = cmnsGdsService.insertCheckGdsCd(cmnsGdsVO);
				if (rtnObj != null) {
					throw new EgovBizException(getMessageForMap(rtnObj));
				}

				if (!StringUtils.hasText(cmnsGdsVO.getNewGdsCd())) {
					throw new EgovBizException(
								getMessageForMap(ComUtil.getResultMap("E0003", "상품코드 발번"))
							);	// {0} 시 오류가 발생하였습니다.
				}

				pckgPrfmncVO.setGrdCd(cmnsGdsVO.getNewGdsCd());
			}

			GdsInvntrVO gdsInvntrVO = new GdsInvntrVO();
			BeanUtils.copyProperties(pckgPrfmncVO, gdsInvntrVO);
			gdsInvntrVO.setInvntrQntt(pckgPrfmncVO.getPckgQntt());
			gdsInvntrVO.setInvntrWght(pckgPrfmncVO.getPckgWght());
			gdsInvntrList.add(gdsInvntrVO);
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
