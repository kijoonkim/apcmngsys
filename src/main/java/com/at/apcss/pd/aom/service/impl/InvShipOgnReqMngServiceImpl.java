package com.at.apcss.pd.aom.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.fm.bbs.mapper.BbsMapper;
import com.at.apcss.fm.bbs.service.BbsService;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.pd.aom.mapper.InvShipOgnReqMngMapper;
import com.at.apcss.pd.aom.service.InvShipOgnReqMngService;
import com.at.apcss.pd.aom.vo.InvShipOgnReqMngVO;


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
@Service("InvShipOgnReqMngService")
public class InvShipOgnReqMngServiceImpl implements InvShipOgnReqMngService{

	@Autowired
	private InvShipOgnReqMngMapper InvShipOgnReqMngMapper;

	@Override
	public InvShipOgnReqMngVO selectInvShipOgnReqMng(InvShipOgnReqMngVO InvShipOgnReqMngVO) throws Exception {

		InvShipOgnReqMngVO resultVO = InvShipOgnReqMngMapper.selectInvShipOgnReqMng(InvShipOgnReqMngVO);

		return resultVO;
	}

	@Override
	public List<InvShipOgnReqMngVO> selectInvShipOgnReqMngList(InvShipOgnReqMngVO InvShipOgnReqMngVO) throws Exception {

		List<InvShipOgnReqMngVO> resultList = InvShipOgnReqMngMapper.selectInvShipOgnReqMngList(InvShipOgnReqMngVO);
		return resultList;
	}

	@Override
	public int insertInvShipOgnReqMng(InvShipOgnReqMngVO InvShipOgnReqMngVO) throws Exception {

		int insertedCnt = InvShipOgnReqMngMapper.insertInvShipOgnReqMng(InvShipOgnReqMngVO);

		return insertedCnt;
	}

	@Override
	public int updateInvShipOgnReqMng(InvShipOgnReqMngVO InvShipOgnReqMngVO) throws Exception {

		int updatedCnt = InvShipOgnReqMngMapper.updateInvShipOgnReqMng(InvShipOgnReqMngVO);

		return updatedCnt;
	}

	@Override
	public int multiSaveInvShipOgnReqMngList(List<InvShipOgnReqMngVO> InvShipOgnReqMngVOList) throws Exception {
		int savedCnt = 0;
		for (InvShipOgnReqMngVO InvShipOgnReqMngVO : InvShipOgnReqMngVOList) {
			if(ComConstants.ROW_STS_INSERT.equals(InvShipOgnReqMngVO.getRowSts())) {
				savedCnt += insertInvShipOgnReqMng(InvShipOgnReqMngVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(InvShipOgnReqMngVO.getRowSts())) {
				savedCnt += updateInvShipOgnReqMng(InvShipOgnReqMngVO);
			}
		}
		return savedCnt;
	}

	@Override
	public int deleteInvShipOgnReqMng(InvShipOgnReqMngVO InvShipOgnReqMngVO) throws Exception {
		return InvShipOgnReqMngMapper.deleteInvShipOgnReqMng(InvShipOgnReqMngVO);
	}

}
