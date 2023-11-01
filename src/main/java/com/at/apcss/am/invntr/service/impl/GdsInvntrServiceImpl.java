package com.at.apcss.am.invntr.service.impl;

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
import com.at.apcss.am.invntr.mapper.GdsInvntrMapper;
import com.at.apcss.am.invntr.service.GdsInvntrService;
import com.at.apcss.am.invntr.vo.GdsInvntrVO;
import com.at.apcss.am.invntr.vo.GdsStdGrdVO;
import com.at.apcss.co.constants.ApcConstants;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;

/**
 * @Class Name : GdsInvntrServiceImpl.java
 * @Description : 상품재고관리 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("gdsInvntrService")
public class GdsInvntrServiceImpl extends BaseServiceImpl implements GdsInvntrService {


	@Autowired
	private GdsInvntrMapper gdsInvntrMapper;

	@Resource(name= "cmnsTaskNoService")
	private CmnsTaskNoService cmnsTaskNoService;

	@Override
	public GdsInvntrVO selectGdsInvntr(GdsInvntrVO gdsInvntrVO) throws Exception {

		GdsInvntrVO resultVO = gdsInvntrMapper.selectGdsInvntr(gdsInvntrVO);

		return resultVO;
	}

	@Override
	public List<GdsInvntrVO> selectGdsInvntrList(GdsInvntrVO gdsInvntrVO) throws Exception {

		List<GdsInvntrVO> resultList = gdsInvntrMapper.selectGdsInvntrList(gdsInvntrVO);

		return resultList;
	}

	@Override
	public List<GdsInvntrVO> selectUpdateGdsInvntrList(GdsInvntrVO gdsInvntrVO) throws Exception {

		List<GdsInvntrVO> resultList = gdsInvntrMapper.selectUpdateGdsInvntrList(gdsInvntrVO);

		return resultList;
	}

	@Override
	public HashMap<String, Object> insertGdsInvntr(GdsInvntrVO gdsInvntrVO) throws Exception {

		gdsInvntrMapper.insertGdsInvntr(gdsInvntrVO);

		List<GdsStdGrdVO> stdGrdList = gdsInvntrVO.getStdGrdList();
		if (stdGrdList != null) {
			for ( GdsStdGrdVO stdGrd : stdGrdList ) {
				GdsStdGrdVO gdsStdGrdVO = new GdsStdGrdVO();
				BeanUtils.copyProperties(gdsInvntrVO, gdsStdGrdVO);
				BeanUtils.copyProperties(stdGrd, gdsStdGrdVO,
						ApcConstants.PROP_APC_CD,
						ApcConstants.PROP_PCKGNO,
						ApcConstants.PROP_PCKG_SN,
						ComConstants.PROP_SYS_FRST_INPT_DT,
						ComConstants.PROP_SYS_FRST_INPT_USER_ID,
						ComConstants.PROP_SYS_FRST_INPT_PRGRM_ID,
						ComConstants.PROP_SYS_LAST_CHG_DT,
						ComConstants.PROP_SYS_LAST_CHG_USER_ID,
						ComConstants.PROP_SYS_LAST_CHG_PRGRM_ID);

				gdsInvntrMapper.insertGdsStdGrd(gdsStdGrdVO);
			}
		}

		return null;
	}

	@Override
	public int updateGdsInvntr(GdsInvntrVO gdsInvntrVO) throws Exception {

		int updatedCnt = gdsInvntrMapper.updateGdsInvntr(gdsInvntrVO);

		return updatedCnt;
	}

	@Override
	public HashMap<String, Object> deleteGdsInvntr(GdsInvntrVO gdsInvntrVO) throws Exception {

        //int deletedCnt = gdsInvntrMapper.deleteGdsInvntr(gdsInvntrVO);
        gdsInvntrMapper.updateGdsInvntrForDelY(gdsInvntrVO);

        GdsStdGrdVO gdsStdGrdVO = new GdsStdGrdVO();
        BeanUtils.copyProperties(gdsInvntrVO, gdsStdGrdVO);
        gdsInvntrMapper.updateGdsStdGrdForDelY(gdsStdGrdVO);

        return null;
	}

	@Override
	public HashMap<String, Object> insertGdsInvntrList(List<GdsInvntrVO> gdsInvntrList) throws Exception {

		for ( GdsInvntrVO gdsInvntrVO : gdsInvntrList ) {

			HashMap<String, Object> rtnObj = insertGdsInvntr(gdsInvntrVO);
			if (rtnObj != null) {
				throw new EgovBizException(getMessageForMap(rtnObj));
			}
		}

		return null;
	}

	@Override
	public HashMap<String, Object> updateGdsInvntrSpmtPrfmnc(GdsInvntrVO gdsInvntrVO) throws Exception {

		GdsInvntrVO invntrInfo = selectGdsInvntr(gdsInvntrVO);

		if (invntrInfo == null || !StringUtils.hasText(invntrInfo.getPckgno())) {
			logger.debug("상품재고 없음");
			return ComUtil.getResultMap("W0005", "상품재고");
		}

		if (gdsInvntrVO.getSpmtWght() > invntrInfo.getInvntrWght()) {
			logger.debug("상품재고 대비 출하량 over");
			return ComUtil.getResultMap("W0008", "재고량||출하량");		// W0008	{0} 보다 {1}이/가 큽니다.
		}

		// 재고량
		int invntrQntt = invntrInfo.getInvntrQntt() - gdsInvntrVO.getSpmtQntt();
		double invntrWght = invntrInfo.getInvntrWght() - gdsInvntrVO.getSpmtWght();
		gdsInvntrVO.setInvntrQntt(invntrQntt);
		gdsInvntrVO.setInvntrWght(invntrWght);

		// 포장량
		int spmtQntt = invntrInfo.getSpmtQntt() + gdsInvntrVO.getSpmtQntt();
		double spmtWght = invntrInfo.getSpmtWght() + gdsInvntrVO.getSpmtWght();
		gdsInvntrVO.setSpmtQntt(spmtQntt);
		gdsInvntrVO.setSpmtWght(spmtWght);

		int updatedCnt = gdsInvntrMapper.updateGdsInvntrSpmtPrfmnc(gdsInvntrVO);

		if (updatedCnt != 1) {

		}

		return null;
	}

	@Override
	public HashMap<String, Object> updateGdsInvntrSpmtPrfmncCncl(GdsInvntrVO gdsInvntrVO) throws Exception {

		GdsInvntrVO invntrInfo = selectGdsInvntr(gdsInvntrVO);

		if (invntrInfo == null || !StringUtils.hasText(invntrInfo.getPckgno())) {
			logger.debug("상품재고정보 없음");
			return ComUtil.getResultMap("W0005", "상품재고정보");
		}

		if (gdsInvntrVO.getSpmtWght() > invntrInfo.getSpmtWght()) {
			logger.debug("상품재고 대비 출하량 over");
			return ComUtil.getResultMap("W0008", "출하량||취소량");		// W0008	{0} 보다 {1}이/가 큽니다.
		}

		// 재고량
		int invntrQntt = invntrInfo.getInvntrQntt() + gdsInvntrVO.getSpmtQntt();
		double invntrWght = invntrInfo.getInvntrWght() + gdsInvntrVO.getSpmtWght();
		gdsInvntrVO.setInvntrQntt(invntrQntt);
		gdsInvntrVO.setInvntrWght(invntrWght);

		// 포장량
		int spmtQntt = invntrInfo.getSpmtQntt() - gdsInvntrVO.getSpmtQntt();
		double spmtWght = invntrInfo.getSpmtWght() - gdsInvntrVO.getSpmtWght();
		gdsInvntrVO.setSpmtQntt(spmtQntt);
		gdsInvntrVO.setSpmtWght(spmtWght);

		int updatedCnt = gdsInvntrMapper.updateGdsInvntrSpmtPrfmnc(gdsInvntrVO);

		if (updatedCnt != 1) {

		}

		return null;
	}

	@Override
	public HashMap<String, Object> multiSaveGdsInvntrList(List<GdsInvntrVO> gdsInvntrList) throws Exception {
		List<GdsInvntrVO> updateList = new ArrayList<>();
		List<GdsInvntrVO> insertList = new ArrayList<>();

		for (GdsInvntrVO gdsInvntrVO : gdsInvntrList) {
			GdsInvntrVO vo = new GdsInvntrVO();
			BeanUtils.copyProperties(gdsInvntrVO, vo);

			if (ComConstants.ROW_STS_INSERT.equals(gdsInvntrVO.getRowSts())) {
				insertList.add(vo);
			}
			if (ComConstants.ROW_STS_UPDATE.equals(gdsInvntrVO.getRowSts())) {
				updateList.add(vo);
			}
		}

		// 상품재고 등록
		if(insertList.size() > 0) {
			String pckgno = cmnsTaskNoService.selectPckgno(insertList.get(0).getApcCd(), insertList.get(0).getPckgYmd());
			int pckgSn = 1;
			for (GdsInvntrVO gdsInvntrVO : insertList) {

				gdsInvntrVO.setPckgno(pckgno);
				gdsInvntrVO.setPckgSn(pckgSn);

				// 상품재고 등록 이력 남기기

				insertGdsInvntr(gdsInvntrVO);
				pckgSn ++;
			}
		}

		// 상품재고 변경
		for (GdsInvntrVO gdsInvntrVO : updateList) {

			// 상품재고 변경 이력

			// 상품재고 변경
			gdsInvntrMapper.updateGdsInvntrChg(gdsInvntrVO);
		}

		return null;
	}

	@Override
	public HashMap<String, Object> updateInvntrTrnsf(GdsInvntrVO gdsInvntrVO) throws Exception {

		GdsInvntrVO invntrInfo = selectGdsInvntr(gdsInvntrVO);

		if (invntrInfo == null || !StringUtils.hasText(invntrInfo.getPckgno())) {
			logger.debug("상품재고정보 없음");
			return ComUtil.getResultMap("W0005", "상품재고정보");
		}

		if (gdsInvntrVO.getSpmtWght() > invntrInfo.getSpmtWght()) {
			logger.debug("상품재고 대비 출하량 over");
			return ComUtil.getResultMap("W0008", "출하량||취소량");		// W0008	{0} 보다 {1}이/가 큽니다.
		}

		// 재고 - 이송
		int invntrQntt = invntrInfo.getInvntrQntt() - gdsInvntrVO.getTrnsfQntt();
		double invntrWght = invntrInfo.getInvntrWght() - gdsInvntrVO.getTrnsfWght();
		gdsInvntrVO.setInvntrQntt(invntrQntt);
		gdsInvntrVO.setInvntrWght(invntrWght);

		int updatedCnt = gdsInvntrMapper.updateInvntrTrnsf(gdsInvntrVO);

		if (updatedCnt != 1) {

		}

		return null;
	}

}
