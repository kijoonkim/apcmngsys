package com.at.apcss.pd.pcom.service.impl;

import java.util.List;

import com.at.apcss.am.constants.PdConstants;
import com.at.apcss.co.constants.ComConstants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.pd.pcom.mapper.PrdcrCrclOgnPurSalMngMapper;
import com.at.apcss.pd.pcom.service.PrdcrCrclOgnPurSalMngService;
import com.at.apcss.pd.pcom.vo.PrdcrCrclOgnPurSalMngVO;


/**
 * @Class Name : BbsServiceImpl.java
 * @Description : 게시판 서비스를 정의하기 위한 서비스 구현 클래스
 * @author 정연두
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21  정연두        최초 생성
 * </pre>
 */
@Service("PrdcrCrclOgnPurSalMngService")
public class PrdcrCrclOgnPurSalMngServiceImpl extends BaseServiceImpl implements PrdcrCrclOgnPurSalMngService{

	@Autowired
	private PrdcrCrclOgnPurSalMngMapper prdcrCrclOgnPurSalMngMapper;

	@Override
	public PrdcrCrclOgnPurSalMngVO selectPrdcrCrclOgnPurSalMng(PrdcrCrclOgnPurSalMngVO prdcrCrclOgnPurSalMngVO) throws Exception {

		return prdcrCrclOgnPurSalMngMapper.selectPrdcrCrclOgnPurSalMng(prdcrCrclOgnPurSalMngVO);
	}

	@Override
	public List<PrdcrCrclOgnPurSalMngVO> selectPrdcrCrclOgnPurSalMngList(PrdcrCrclOgnPurSalMngVO prdcrCrclOgnPurSalMngVO) throws Exception {
		return prdcrCrclOgnPurSalMngMapper.selectPrdcrCrclOgnPurSalMngList(prdcrCrclOgnPurSalMngVO);
	}

	@Override
	public int insertPrdcrCrclOgnPurSalMng01(PrdcrCrclOgnPurSalMngVO prdcrCrclOgnPurSalMngVO) throws Exception {

		return prdcrCrclOgnPurSalMngMapper.insertPrdcrCrclOgnPurSalMng01(prdcrCrclOgnPurSalMngVO);
	}

	@Override
	public int insertPrdcrCrclOgnPurSalMng02(PrdcrCrclOgnPurSalMngVO prdcrCrclOgnPurSalMngVO) throws Exception {

		return prdcrCrclOgnPurSalMngMapper.insertPrdcrCrclOgnPurSalMng02(prdcrCrclOgnPurSalMngVO);
	}

	@Override
	public int insertPrdcrCrclOgnPurSalMng03(PrdcrCrclOgnPurSalMngVO prdcrCrclOgnPurSalMngVO) throws Exception {

		return prdcrCrclOgnPurSalMngMapper.insertPrdcrCrclOgnPurSalMng03(prdcrCrclOgnPurSalMngVO);
	}

	@Override
	public int multiSavePrdcrCrclOgnPurSalMngList01(List<PrdcrCrclOgnPurSalMngVO> prdcrCrclOgnPurSalMngVOList) throws Exception {
		int savedCnt = 0;
		String yrVal = null;// 등록년도
		String brnoVal = null;//출자출하조직 사업자번호
		String tmprStrgYnVal = null;//임시저장 여부
		for (PrdcrCrclOgnPurSalMngVO PrdcrCrclOgnPurSalMngVO : prdcrCrclOgnPurSalMngVOList) {
			yrVal = PrdcrCrclOgnPurSalMngVO.getYr();
			brnoVal = PrdcrCrclOgnPurSalMngVO.getBrno();
			tmprStrgYnVal = PrdcrCrclOgnPurSalMngVO.getTmprStrgYn();
			savedCnt += insertPrdcrCrclOgnPurSalMng01(PrdcrCrclOgnPurSalMngVO);
		}
		//임시저장 변경
		PrdcrCrclOgnPurSalMngVO tmprStrgVo = new PrdcrCrclOgnPurSalMngVO();
		tmprStrgVo.setYr(yrVal);
		tmprStrgVo.setBrno(brnoVal);
		tmprStrgVo.setTmprStrgYn(tmprStrgYnVal);
		prdcrCrclOgnPurSalMngMapper.updateTempSaveUoAps(tmprStrgVo);
		return savedCnt;
	}

	@Override
	public int multiSavePrdcrCrclOgnPurSalMngList02(List<PrdcrCrclOgnPurSalMngVO> prdcrCrclOgnPurSalMngVOList) throws Exception {
		int savedCnt = 0;
		String yrVal = null;// 등록년도
		String brnoVal = null;//출자출하조직 사업자번호
		String tmprStrgYnVal = null;//임시저장 여부
		for (PrdcrCrclOgnPurSalMngVO PrdcrCrclOgnPurSalMngVO : prdcrCrclOgnPurSalMngVOList) {
			yrVal = PrdcrCrclOgnPurSalMngVO.getYr();
			brnoVal = PrdcrCrclOgnPurSalMngVO.getBrno();
			tmprStrgYnVal = PrdcrCrclOgnPurSalMngVO.getTmprStrgYn();
			savedCnt += insertPrdcrCrclOgnPurSalMng02(PrdcrCrclOgnPurSalMngVO);
		}
		//임시저장 변경
		PrdcrCrclOgnPurSalMngVO tmprStrgVo = new PrdcrCrclOgnPurSalMngVO();
		tmprStrgVo.setYr(yrVal);
		tmprStrgVo.setBrno(brnoVal);
		tmprStrgVo.setTmprStrgYn(tmprStrgYnVal);
		prdcrCrclOgnPurSalMngMapper.updateTempSaveUoAps(tmprStrgVo);
		return savedCnt;
	}

	@Override
	public int multiSavePrdcrCrclOgnPurSalMngList03(List<PrdcrCrclOgnPurSalMngVO> prdcrCrclOgnPurSalMngVOList) throws Exception {
		int savedCnt = 0;
		String yrVal = null;// 등록년도
		String brnoVal = null;//출자출하조직 사업자번호
		String tmprStrgYnVal = null;//임시저장 여부
		for (PrdcrCrclOgnPurSalMngVO PrdcrCrclOgnPurSalMngVO : prdcrCrclOgnPurSalMngVOList) {
			yrVal = PrdcrCrclOgnPurSalMngVO.getYr();
			brnoVal = PrdcrCrclOgnPurSalMngVO.getBrno();
			tmprStrgYnVal = PrdcrCrclOgnPurSalMngVO.getTmprStrgYn();
			savedCnt += insertPrdcrCrclOgnPurSalMng03(PrdcrCrclOgnPurSalMngVO);
		}
		//임시저장 변경
		PrdcrCrclOgnPurSalMngVO tmprStrgVo = new PrdcrCrclOgnPurSalMngVO();
		tmprStrgVo.setYr(yrVal);
		tmprStrgVo.setBrno(brnoVal);
		tmprStrgVo.setTmprStrgYn(tmprStrgYnVal);
		prdcrCrclOgnPurSalMngMapper.updateTempSaveUoAps(tmprStrgVo);
		return savedCnt;
	}

	@Override
	public int deletePrdcrCrclOgnPurSalMng(PrdcrCrclOgnPurSalMngVO prdcrCrclOgnPurSalMngVO) throws Exception {
		return prdcrCrclOgnPurSalMngMapper.deletePrdcrCrclOgnPurSalMng(prdcrCrclOgnPurSalMngVO);
	}

	@Override
	public List<PrdcrCrclOgnPurSalMngVO> selectRawDataList(PrdcrCrclOgnPurSalMngVO prdcrCrclOgnPurSalMngVO) throws Exception {

		return prdcrCrclOgnPurSalMngMapper.selectRawDataList(prdcrCrclOgnPurSalMngVO);
	}

	@Override
	public List<PrdcrCrclOgnPurSalMngVO> selectRawDataList2025(PrdcrCrclOgnPurSalMngVO prdcrCrclOgnPurSalMngVO) throws Exception {

		return prdcrCrclOgnPurSalMngMapper.selectRawDataList2025(prdcrCrclOgnPurSalMngVO);
	}

	@Override
	public List<PrdcrCrclOgnPurSalMngVO> selectUoTotalPurchaseRawDataList(PrdcrCrclOgnPurSalMngVO prdcrCrclOgnPurSalMngVO) throws Exception {
		int yr = Integer.parseInt(prdcrCrclOgnPurSalMngVO.getYr());
		if (yr < 2025) {
			prdcrCrclOgnPurSalMngVO.setOldDataYn(ComConstants.CON_YES);
		}
		return prdcrCrclOgnPurSalMngMapper.selectUoTotalPurchaseRawDataList(prdcrCrclOgnPurSalMngVO);
	}

	@Override
	public List<PrdcrCrclOgnPurSalMngVO> selectUoTotalPurchaseList(PrdcrCrclOgnPurSalMngVO prdcrCrclOgnPurSalMngVO) throws Exception {
		int yr = Integer.parseInt(prdcrCrclOgnPurSalMngVO.getYr());
		if (yr < 2025) {
			prdcrCrclOgnPurSalMngVO.setOldDataYn(ComConstants.CON_YES);
		}
		prdcrCrclOgnPurSalMngVO.setPrchsSlsSe(PdConstants.CON_PRCHS_SLS_SE_PRCHS);
		return prdcrCrclOgnPurSalMngMapper.selectUoTotalPurchaseSaleList(prdcrCrclOgnPurSalMngVO);
	}

	@Override
	public List<PrdcrCrclOgnPurSalMngVO> selectUoTotalSaleList(PrdcrCrclOgnPurSalMngVO prdcrCrclOgnPurSalMngVO) throws Exception {
		int yr = Integer.parseInt(prdcrCrclOgnPurSalMngVO.getYr());
		if (yr < 2025) {
			prdcrCrclOgnPurSalMngVO.setOldDataYn(ComConstants.CON_YES);
		}
		prdcrCrclOgnPurSalMngVO.setPrchsSlsSe(PdConstants.CON_PRCHS_SLS_SE_SLS);
		return prdcrCrclOgnPurSalMngMapper.selectUoTotalPurchaseSaleList(prdcrCrclOgnPurSalMngVO);
	}

	@Override
	public List<PrdcrCrclOgnPurSalMngVO> selectPrdcrCrclOgnPurSalMngSlsList(PrdcrCrclOgnPurSalMngVO prdcrCrclOgnPurSalMngVO) throws Exception {

		return prdcrCrclOgnPurSalMngMapper.selectPrdcrCrclOgnPurSalMngSlsList(prdcrCrclOgnPurSalMngVO);
	}

	@Override
	public List<PrdcrCrclOgnPurSalMngVO> selectPrdcrCrclOgnPurSalMngPrchsList(PrdcrCrclOgnPurSalMngVO prdcrCrclOgnPurSalMngVO) throws Exception {

		return prdcrCrclOgnPurSalMngMapper.selectPrdcrCrclOgnPurSalMngPrchsList(prdcrCrclOgnPurSalMngVO);
	}

	@Override
	public PrdcrCrclOgnPurSalMngVO selectTempSaveUoAps(PrdcrCrclOgnPurSalMngVO prdcrCrclOgnPurSalMngVO) throws Exception {

		return prdcrCrclOgnPurSalMngMapper.selectTempSaveUoAps(prdcrCrclOgnPurSalMngVO);
	}

}
