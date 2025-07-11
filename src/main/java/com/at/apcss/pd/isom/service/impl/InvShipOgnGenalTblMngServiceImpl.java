package com.at.apcss.pd.isom.service.impl;

import java.util.List;
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
	private InvShipOgnGenalTblMngMapper InvShipOgnGenalTblMngMapper;

	@Override
	public InvShipOgnGenalTblMngVO selectInvShipOgnGenalTblMng(InvShipOgnGenalTblMngVO InvShipOgnGenalTblMngVO) throws Exception {

		return InvShipOgnGenalTblMngMapper.selectInvShipOgnGenalTblMng(InvShipOgnGenalTblMngVO);
	}

	@Override
	public List<InvShipOgnGenalTblMngVO> selectInvShipOgnGenalTblMngList(InvShipOgnGenalTblMngVO InvShipOgnGenalTblMngVO) throws Exception {

		return InvShipOgnGenalTblMngMapper.selectInvShipOgnGenalTblMngList(InvShipOgnGenalTblMngVO);
	}

	@Override
	public List<InvShipOgnGenalTblMngVO> selectInvShipOgnGenalTblMngIsoList(InvShipOgnGenalTblMngVO InvShipOgnGenalTblMngVO) throws Exception {

		return InvShipOgnGenalTblMngMapper.selectInvShipOgnGenalTblMngIsoList(InvShipOgnGenalTblMngVO);
	}

	@Override
	public int updateStbltYn(InvShipOgnGenalTblMngVO InvShipOgnGenalTblMngVO) throws Exception {

		return InvShipOgnGenalTblMngMapper.updateStbltYn(InvShipOgnGenalTblMngVO);
	}

	@Override
	public List<InvShipOgnGenalTblMngVO> selectRawDataList(InvShipOgnGenalTblMngVO InvShipOgnGenalTblMngVO) throws Exception {

		//List<InvShipOgnGenalTblMngVO> resultList = InvShipOgnGenalTblMngMapper.selectRawDataList(InvShipOgnGenalTblMngVO);
		return InvShipOgnGenalTblMngMapper.selectInvstSpmtOgnzOvsTableRawDataList(InvShipOgnGenalTblMngVO);
		//return InvShipOgnGenalTblMngMapper.selectInvstOldSpmtOgnzOvsTableRawDataList(InvShipOgnGenalTblMngVO);
	}

	@Override
	public List<InvShipOgnGenalTblMngVO> selectInvShipOgnGenalTblMngListNew(InvShipOgnGenalTblMngVO InvShipOgnGenalTblMngVO) throws Exception {

		return InvShipOgnGenalTblMngMapper.selectInvShipOgnGenalTblMngListNew(InvShipOgnGenalTblMngVO);
	}

	@Override
	public List<InvShipOgnGenalTblMngVO> selectRawDataList2025(InvShipOgnGenalTblMngVO InvShipOgnGenalTblMngVO) throws Exception {
		return InvShipOgnGenalTblMngMapper.selectRawDataList2025(InvShipOgnGenalTblMngVO);
	}

	@Override
	public List<InvShipOgnGenalTblMngVO> selectIsoClsfTot(InvShipOgnGenalTblMngVO InvShipOgnGenalTblMngVO) throws Exception {

		return InvShipOgnGenalTblMngMapper.selectIsoClsfTot(InvShipOgnGenalTblMngVO);
	}

	@Override
	public int updateItemIsoActnMttr(InvShipOgnGenalTblMngVO InvShipOgnGenalTblMngVO) throws Exception {

		return InvShipOgnGenalTblMngMapper.updateItemIsoActnMttr(InvShipOgnGenalTblMngVO);
	}

	@Override
	public int multiSaveItemIsoActnMttr(List<InvShipOgnGenalTblMngVO> InvShipOgnGenalTblMngVOList) throws Exception {
		int savedCnt = 0;
		for (InvShipOgnGenalTblMngVO InvShipOgnGenalTblMngVO : InvShipOgnGenalTblMngVOList) {
			savedCnt += updateItemIsoActnMttr(InvShipOgnGenalTblMngVO);
		}
		return savedCnt;
	}

}
