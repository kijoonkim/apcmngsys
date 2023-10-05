package com.at.apcss.pd.isom.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.fm.bbs.mapper.BbsMapper;
import com.at.apcss.fm.bbs.service.BbsService;
import com.at.apcss.fm.bbs.vo.BbsVO;
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
public class InvShipOgnGenalTblMngServiceImpl implements InvShipOgnGenalTblMngService{

	@Autowired
	private InvShipOgnGenalTblMngMapper InvShipOgnGenalTblMngMapper;

	@Override
	public InvShipOgnGenalTblMngVO selectInvShipOgnGenalTblMng(InvShipOgnGenalTblMngVO InvShipOgnGenalTblMngVO) throws Exception {

		InvShipOgnGenalTblMngVO resultVO = InvShipOgnGenalTblMngMapper.selectInvShipOgnGenalTblMng(InvShipOgnGenalTblMngVO);

		return resultVO;
	}

	@Override
	public List<InvShipOgnGenalTblMngVO> selectInvShipOgnGenalTblMngList(InvShipOgnGenalTblMngVO InvShipOgnGenalTblMngVO) throws Exception {

		List<InvShipOgnGenalTblMngVO> resultList = InvShipOgnGenalTblMngMapper.selectInvShipOgnGenalTblMngList(InvShipOgnGenalTblMngVO);
		return resultList;
	}

	@Override
	public int insertInvShipOgnGenalTblMng(InvShipOgnGenalTblMngVO InvShipOgnGenalTblMngVO) throws Exception {

		int insertedCnt = InvShipOgnGenalTblMngMapper.insertInvShipOgnGenalTblMng(InvShipOgnGenalTblMngVO);

		return insertedCnt;
	}

	@Override
	public int updateInvShipOgnGenalTblMng(InvShipOgnGenalTblMngVO InvShipOgnGenalTblMngVO) throws Exception {

		int updatedCnt = InvShipOgnGenalTblMngMapper.updateInvShipOgnGenalTblMng(InvShipOgnGenalTblMngVO);

		return updatedCnt;
	}

	@Override
	public int multiSaveInvShipOgnGenalTblMngList(List<InvShipOgnGenalTblMngVO> InvShipOgnGenalTblMngVOList) throws Exception {
		int savedCnt = 0;
		for (InvShipOgnGenalTblMngVO InvShipOgnGenalTblMngVO : InvShipOgnGenalTblMngVOList) {
			if(ComConstants.ROW_STS_INSERT.equals(InvShipOgnGenalTblMngVO.getRowSts())) {
				savedCnt += insertInvShipOgnGenalTblMng(InvShipOgnGenalTblMngVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(InvShipOgnGenalTblMngVO.getRowSts())) {
				savedCnt += updateInvShipOgnGenalTblMng(InvShipOgnGenalTblMngVO);
			}
		}
		return savedCnt;
	}

	@Override
	public int deleteInvShipOgnGenalTblMng(InvShipOgnGenalTblMngVO InvShipOgnGenalTblMngVO) throws Exception {
		return InvShipOgnGenalTblMngMapper.deleteInvShipOgnGenalTblMng(InvShipOgnGenalTblMngVO);
	}

}
