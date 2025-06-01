package com.at.apcss.pd.isom.service.impl;

import java.util.List;

import com.at.apcss.am.constants.PdConstants;
import com.at.apcss.co.constants.ComConstants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.pd.isom.mapper.InvShipOgnPurSalMngMapper;
import com.at.apcss.pd.isom.service.InvShipOgnPurSalMngService;
import com.at.apcss.pd.isom.vo.InvShipOgnPurSalMngVO;


/**
 * @Class Name : InvShipOgnPurSalMngServiceImpl.java
 * @Description : 출자출하조직 매임매출 서비스를 정의하기 위한 서비스 구현 클래스
 * @author 유민지
 * @since 2025.04.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21          최초 생성
 * </pre>
 */
@Service("InvShipOgnPurSalMngService")
public class InvShipOgnPurSalMngServiceImpl extends BaseServiceImpl implements InvShipOgnPurSalMngService{

	@Autowired
	private InvShipOgnPurSalMngMapper invShipOgnPurSalMngMapper;

	@Override
	public InvShipOgnPurSalMngVO selectInvShipOgnPurSalMng(InvShipOgnPurSalMngVO invShipOgnPurSalMngVO) throws Exception {

		return invShipOgnPurSalMngMapper.selectInvShipOgnPurSalMng(invShipOgnPurSalMngVO);
	}

	@Override
	public List<InvShipOgnPurSalMngVO> selectInvShipOgnPurSalMngList(InvShipOgnPurSalMngVO invShipOgnPurSalMngVO) throws Exception {

		return invShipOgnPurSalMngMapper.selectInvShipOgnPurSalMngList(invShipOgnPurSalMngVO);
	}

	@Override
	public List<InvShipOgnPurSalMngVO> selectInvShipOgnPurSalMngPrchsList(InvShipOgnPurSalMngVO invShipOgnPurSalMngVO) throws Exception {

		return invShipOgnPurSalMngMapper.selectInvShipOgnPurSalMngPrchsList(invShipOgnPurSalMngVO);
	}

	@Override
	public List<InvShipOgnPurSalMngVO> selectInvShipOgnPurSalMngSlsList(InvShipOgnPurSalMngVO invShipOgnPurSalMngVO) throws Exception {

		return invShipOgnPurSalMngMapper.selectInvShipOgnPurSalMngSlsList(invShipOgnPurSalMngVO);
	}

	@Override
	public List<InvShipOgnPurSalMngVO> selectInvShipOgnPurSalMngPrchsListNew(InvShipOgnPurSalMngVO invShipOgnPurSalMngVO) throws Exception {

		return invShipOgnPurSalMngMapper.selectInvShipOgnPurSalMngPrchsListNew(invShipOgnPurSalMngVO);
	}

	@Override
	public List<InvShipOgnPurSalMngVO> selectInvShipOgnPurSalMngSlsListNew(InvShipOgnPurSalMngVO invShipOgnPurSalMngVO) throws Exception {

		return invShipOgnPurSalMngMapper.selectInvShipOgnPurSalMngSlsListNew(invShipOgnPurSalMngVO);
	}

	@Override
	public int insertInvShipOgnPurSalMng01(InvShipOgnPurSalMngVO invShipOgnPurSalMngVO) throws Exception {

		return invShipOgnPurSalMngMapper.insertInvShipOgnPurSalMng01(invShipOgnPurSalMngVO);
	}

	@Override
	public int insertInvShipOgnPurSalMng02(InvShipOgnPurSalMngVO invShipOgnPurSalMngVO) throws Exception {

		return invShipOgnPurSalMngMapper.insertInvShipOgnPurSalMng02(invShipOgnPurSalMngVO);
	}

	@Override
	public int insertInvShipOgnPurSalMng03(InvShipOgnPurSalMngVO invShipOgnPurSalMngVO) throws Exception {

		return invShipOgnPurSalMngMapper.insertInvShipOgnPurSalMng03(invShipOgnPurSalMngVO);
	}

	@Override
	public int multiSaveInvShipOgnPurSalMngList01(List<InvShipOgnPurSalMngVO> invShipOgnPurSalMngVOList) throws Exception {
		int savedCnt = 0;
		String yrVal = null;// 등록년도
		String brnoVal = null;//출자출하조직 사업자번호
		String tmprStrgYnVal = null;//임시저장 여부
		for (InvShipOgnPurSalMngVO invShipOgnPurSalMngVO : invShipOgnPurSalMngVOList) {
			yrVal = invShipOgnPurSalMngVO.getYr();
			brnoVal = invShipOgnPurSalMngVO.getBrno();
			tmprStrgYnVal = invShipOgnPurSalMngVO.getTmprStrgYn();
			savedCnt += insertInvShipOgnPurSalMng01(invShipOgnPurSalMngVO);
		}
		//임시저장 변경
		InvShipOgnPurSalMngVO tmprStrgVo = new InvShipOgnPurSalMngVO();
		tmprStrgVo.setYr(yrVal);
		tmprStrgVo.setBrno(brnoVal);
		tmprStrgVo.setTmprStrgYn(tmprStrgYnVal);
		invShipOgnPurSalMngMapper.updateTempSaveIsoAps(tmprStrgVo);
		return savedCnt;
	}

	@Override
	public int multiSaveInvShipOgnPurSalMngList02(List<InvShipOgnPurSalMngVO> invShipOgnPurSalMngVOList) throws Exception {
		int savedCnt = 0;
		String yrVal = null;// 등록년도
		String brnoVal = null;//출자출하조직 사업자번호
		String tmprStrgYnVal = null;//임시저장 여부
		for (InvShipOgnPurSalMngVO invShipOgnPurSalMngVO : invShipOgnPurSalMngVOList) {
			yrVal = invShipOgnPurSalMngVO.getYr();
			brnoVal = invShipOgnPurSalMngVO.getBrno();
			tmprStrgYnVal = invShipOgnPurSalMngVO.getTmprStrgYn();
			savedCnt += insertInvShipOgnPurSalMng02(invShipOgnPurSalMngVO);
		}
		//임시저장 변경
		InvShipOgnPurSalMngVO tmprStrgVo = new InvShipOgnPurSalMngVO();
		tmprStrgVo.setYr(yrVal);
		tmprStrgVo.setBrno(brnoVal);
		tmprStrgVo.setTmprStrgYn(tmprStrgYnVal);
		invShipOgnPurSalMngMapper.updateTempSaveIsoAps(tmprStrgVo);
		return savedCnt;
	}

	@Override
	public int multiSaveInvShipOgnPurSalMngList03(List<InvShipOgnPurSalMngVO> invShipOgnPurSalMngVOList) throws Exception {
		int savedCnt = 0;
		String yrVal = null;// 등록년도
		String brnoVal = null;//출자출하조직 사업자번호
		String tmprStrgYnVal = null;//임시저장 여부
		for (InvShipOgnPurSalMngVO invShipOgnPurSalMngVO : invShipOgnPurSalMngVOList) {
			yrVal = invShipOgnPurSalMngVO.getYr();
			brnoVal = invShipOgnPurSalMngVO.getBrno();
			tmprStrgYnVal = invShipOgnPurSalMngVO.getTmprStrgYn();
			savedCnt += insertInvShipOgnPurSalMng03(invShipOgnPurSalMngVO);
		}
		//임시저장 변경
		InvShipOgnPurSalMngVO tmprStrgVo = new InvShipOgnPurSalMngVO();
		tmprStrgVo.setYr(yrVal);
		tmprStrgVo.setBrno(brnoVal);
		tmprStrgVo.setTmprStrgYn(tmprStrgYnVal);
		invShipOgnPurSalMngMapper.updateTempSaveIsoAps(tmprStrgVo);
		return savedCnt;
	}

	@Override
	public int deleteInvShipOgnPurSalMng(InvShipOgnPurSalMngVO invShipOgnPurSalMngVO) throws Exception {
		return invShipOgnPurSalMngMapper.deleteInvShipOgnPurSalMng(invShipOgnPurSalMngVO);
	}

	@Override
	public List<InvShipOgnPurSalMngVO> selectRawDataList(InvShipOgnPurSalMngVO invShipOgnPurSalMngVO) throws Exception {

		return invShipOgnPurSalMngMapper.selectRawDataList(invShipOgnPurSalMngVO);
	}

	@Override
	public List<InvShipOgnPurSalMngVO> selectRawDataList2025(InvShipOgnPurSalMngVO invShipOgnPurSalMngVO) throws Exception {

		return invShipOgnPurSalMngMapper.selectRawDataList2025(invShipOgnPurSalMngVO);
	}

	@Override
	public InvShipOgnPurSalMngVO selectTempSaveIsoAps(InvShipOgnPurSalMngVO invShipOgnPurSalMngVO) throws Exception {

		return invShipOgnPurSalMngMapper.selectTempSaveIsoAps(invShipOgnPurSalMngVO);
	}

	@Override
	public List<InvShipOgnPurSalMngVO> selectIsoTotalPurchaseSaleRawDataList(InvShipOgnPurSalMngVO invShipOgnPurSalMngVO) throws Exception {

		int yr = Integer.parseInt(invShipOgnPurSalMngVO.getYr());
		if (yr < 2025) {
			invShipOgnPurSalMngVO.setOldDataYn(ComConstants.CON_YES);
		}
		return invShipOgnPurSalMngMapper.selectIsoTotalPurchaseSaleRawDataList(invShipOgnPurSalMngVO);
	}

	@Override
	public List<InvShipOgnPurSalMngVO> selectIsoTotalPurchaseList(InvShipOgnPurSalMngVO invShipOgnPurSalMngVO) throws Exception {
		int yr = Integer.parseInt(invShipOgnPurSalMngVO.getYr());
		if (yr < 2025) {
			invShipOgnPurSalMngVO.setOldDataYn(ComConstants.CON_YES);
		}
		invShipOgnPurSalMngVO.setPrchsSlsSe(PdConstants.CON_PRCHS_SLS_SE_PRCHS);
		return invShipOgnPurSalMngMapper.selectIsoTotalPurchaseSaleList(invShipOgnPurSalMngVO);
	}

	@Override
	public List<InvShipOgnPurSalMngVO> selectIsoTotalSaleList(InvShipOgnPurSalMngVO invShipOgnPurSalMngVO) throws Exception {
		int yr = Integer.parseInt(invShipOgnPurSalMngVO.getYr());
		if (yr < 2025) {
			invShipOgnPurSalMngVO.setOldDataYn(ComConstants.CON_YES);
		}
		invShipOgnPurSalMngVO.setPrchsSlsSe(PdConstants.CON_PRCHS_SLS_SE_SLS);
		return invShipOgnPurSalMngMapper.selectIsoTotalPurchaseSaleList(invShipOgnPurSalMngVO);
		//return invShipOgnPurSalMngMapper.selectIsoTotalSaleList(invShipOgnPurSalMngVO);
	}
}
