package com.at.apcss.pd.isom.service.impl;

import java.util.List;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.pd.pcom.vo.ItemUoStbltYnVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.pd.isom.mapper.InvShipOgnGenalTblMngMapper;
import com.at.apcss.pd.isom.service.InvShipOgnGenalTblMngService;
import com.at.apcss.pd.isom.vo.InvShipOgnGenalTblMngVO;


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
@Service("InvShipOgnGenalTblMngService")
public class InvShipOgnGenalTblMngServiceImpl extends BaseServiceImpl implements InvShipOgnGenalTblMngService{

	@Autowired
	private InvShipOgnGenalTblMngMapper invShipOgnGenalTblMngMapper;

	@Override
	public InvShipOgnGenalTblMngVO selectInvShipOgnGenalTblMng(InvShipOgnGenalTblMngVO invShipOgnGenalTblMngVO) throws Exception {

		return invShipOgnGenalTblMngMapper.selectInvShipOgnGenalTblMng(invShipOgnGenalTblMngVO);
	}

	@Override
	public List<InvShipOgnGenalTblMngVO> selectInvShipOgnGenalTblMngList(InvShipOgnGenalTblMngVO invShipOgnGenalTblMngVO) throws Exception {

		return invShipOgnGenalTblMngMapper.selectInvShipOgnGenalTblMngList(invShipOgnGenalTblMngVO);
	}

	@Override
	public List<InvShipOgnGenalTblMngVO> selectInvShipOgnGenalTblMngIsoList(InvShipOgnGenalTblMngVO invShipOgnGenalTblMngVO) throws Exception {

		return invShipOgnGenalTblMngMapper.selectInvShipOgnGenalTblMngIsoList(invShipOgnGenalTblMngVO);
	}

	@Override
	public int updateStbltYn(InvShipOgnGenalTblMngVO invShipOgnGenalTblMngVO) throws Exception {

		return invShipOgnGenalTblMngMapper.updateStbltYn(invShipOgnGenalTblMngVO);
	}

	@Override
	public List<InvShipOgnGenalTblMngVO> selectRawDataList(InvShipOgnGenalTblMngVO invShipOgnGenalTblMngVO) throws Exception {

		//List<InvShipOgnGenalTblMngVO> resultList = invShipOgnGenalTblMngMapper.selectRawDataList(invShipOgnGenalTblMngVO);
		return invShipOgnGenalTblMngMapper.selectInvstSpmtOgnzOvsTableRawDataList(invShipOgnGenalTblMngVO);
		//return invShipOgnGenalTblMngMapper.selectInvstOldSpmtOgnzOvsTableRawDataList(invShipOgnGenalTblMngVO);
	}

	@Override
	public List<InvShipOgnGenalTblMngVO> selectUoPrchsSlsSummaryList(InvShipOgnGenalTblMngVO invShipOgnGenalTblMngVO) throws Exception {
		int yr = Integer.parseInt(invShipOgnGenalTblMngVO.getYr());
		if (yr < 2025) {
			invShipOgnGenalTblMngVO.setOldDataYn(ComConstants.CON_YES);
		}
		return invShipOgnGenalTblMngMapper.selectUoPrchsSlsSummaryList(invShipOgnGenalTblMngVO);
	}


	@Override
	public List<InvShipOgnGenalTblMngVO> selectInvShipOgnGenalTblMngListNew(InvShipOgnGenalTblMngVO invShipOgnGenalTblMngVO) throws Exception {
		return invShipOgnGenalTblMngMapper.selectInvShipOgnGenalTblMngListNew(invShipOgnGenalTblMngVO);
	}

	@Override
	public List<InvShipOgnGenalTblMngVO> selectIsoPrchsSlsSummaryList(InvShipOgnGenalTblMngVO invShipOgnGenalTblMngVO) throws Exception {
		int yr = Integer.parseInt(invShipOgnGenalTblMngVO.getYr());
		if (yr < 2025) {
			invShipOgnGenalTblMngVO.setOldDataYn(ComConstants.CON_YES);
		}
		return invShipOgnGenalTblMngMapper.selectIsoPrchsSlsSummaryList(invShipOgnGenalTblMngVO);
	}

	@Override
	public List<InvShipOgnGenalTblMngVO> selectRawDataList2025(InvShipOgnGenalTblMngVO invShipOgnGenalTblMngVO) throws Exception {
		return invShipOgnGenalTblMngMapper.selectRawDataList2025(invShipOgnGenalTblMngVO);
	}

	@Override
	public List<InvShipOgnGenalTblMngVO> selectIsoPrchsSlsRawdataList(InvShipOgnGenalTblMngVO invShipOgnGenalTblMngVO) throws Exception {
		int yr = Integer.parseInt(invShipOgnGenalTblMngVO.getYr());
		if (yr < 2025) {
			invShipOgnGenalTblMngVO.setOldDataYn(ComConstants.CON_YES);
		}
		return invShipOgnGenalTblMngMapper.selectIsoPrchsSlsRawdataList(invShipOgnGenalTblMngVO);
	}

	@Override
	public List<InvShipOgnGenalTblMngVO> selectIsoClsfTot(InvShipOgnGenalTblMngVO invShipOgnGenalTblMngVO) throws Exception {

		return invShipOgnGenalTblMngMapper.selectIsoClsfTot(invShipOgnGenalTblMngVO);
	}

	@Override
	public int updateItemIsoActnMttr(InvShipOgnGenalTblMngVO invShipOgnGenalTblMngVO) throws Exception {

		return invShipOgnGenalTblMngMapper.updateItemIsoActnMttr(invShipOgnGenalTblMngVO);
	}

	@Override
	public int multiSaveItemIsoActnMttr(List<InvShipOgnGenalTblMngVO> InvShipOgnGenalTblMngVOList) throws Exception {
		int savedCnt = 0;
		for (InvShipOgnGenalTblMngVO invShipOgnGenalTblMngVO : InvShipOgnGenalTblMngVOList) {
			savedCnt += updateItemIsoActnMttr(invShipOgnGenalTblMngVO);
		}
		return savedCnt;
	}

}
