package com.at.apcss.pd.isom.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.fm.bbs.mapper.BbsMapper;
import com.at.apcss.fm.bbs.service.BbsService;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.pd.isom.mapper.InvShipOgnSpeczItmPurSalMngMapper;
import com.at.apcss.pd.isom.service.InvShipOgnSpeczItmPurSalMngService;
import com.at.apcss.pd.isom.vo.InvShipOgnSpeczItmPurSalMngVO;


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
@Service("InvShipOgnSpeczItmPurSalMngService")
public class InvShipOgnSpeczItmPurSalMngServiceImpl implements InvShipOgnSpeczItmPurSalMngService{

	@Autowired
	private InvShipOgnSpeczItmPurSalMngMapper InvShipOgnSpeczItmPurSalMngMapper;

	@Override
	public InvShipOgnSpeczItmPurSalMngVO selectInvShipOgnSpeczItmPurSalMng(InvShipOgnSpeczItmPurSalMngVO InvShipOgnSpeczItmPurSalMngVO) throws Exception {

		InvShipOgnSpeczItmPurSalMngVO resultVO = InvShipOgnSpeczItmPurSalMngMapper.selectInvShipOgnSpeczItmPurSalMng(InvShipOgnSpeczItmPurSalMngVO);

		return resultVO;
	}

	@Override
	public List<InvShipOgnSpeczItmPurSalMngVO> selectInvShipOgnSpeczItmPurSalMngList(InvShipOgnSpeczItmPurSalMngVO InvShipOgnSpeczItmPurSalMngVO) throws Exception {

		List<InvShipOgnSpeczItmPurSalMngVO> resultList = InvShipOgnSpeczItmPurSalMngMapper.selectInvShipOgnSpeczItmPurSalMngList(InvShipOgnSpeczItmPurSalMngVO);
		return resultList;
	}

	@Override
	public int insertInvShipOgnSpeczItmPurSalMng(InvShipOgnSpeczItmPurSalMngVO InvShipOgnSpeczItmPurSalMngVO) throws Exception {

		int insertedCnt = InvShipOgnSpeczItmPurSalMngMapper.insertInvShipOgnSpeczItmPurSalMng(InvShipOgnSpeczItmPurSalMngVO);

		return insertedCnt;
	}

	@Override
	public int updateInvShipOgnSpeczItmPurSalMng(InvShipOgnSpeczItmPurSalMngVO InvShipOgnSpeczItmPurSalMngVO) throws Exception {

		int updatedCnt = InvShipOgnSpeczItmPurSalMngMapper.updateInvShipOgnSpeczItmPurSalMng(InvShipOgnSpeczItmPurSalMngVO);

		return updatedCnt;
	}

	@Override
	public int multiSaveInvShipOgnSpeczItmPurSalMngList(List<InvShipOgnSpeczItmPurSalMngVO> InvShipOgnSpeczItmPurSalMngVOList) throws Exception {
		int savedCnt = 0;
		for (InvShipOgnSpeczItmPurSalMngVO InvShipOgnSpeczItmPurSalMngVO : InvShipOgnSpeczItmPurSalMngVOList) {
			if(ComConstants.ROW_STS_INSERT.equals(InvShipOgnSpeczItmPurSalMngVO.getRowSts())) {
				savedCnt += insertInvShipOgnSpeczItmPurSalMng(InvShipOgnSpeczItmPurSalMngVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(InvShipOgnSpeczItmPurSalMngVO.getRowSts())) {
				savedCnt += updateInvShipOgnSpeczItmPurSalMng(InvShipOgnSpeczItmPurSalMngVO);
			}
		}
		return savedCnt;
	}

	@Override
	public int deleteInvShipOgnSpeczItmPurSalMng(InvShipOgnSpeczItmPurSalMngVO InvShipOgnSpeczItmPurSalMngVO) throws Exception {
		return InvShipOgnSpeczItmPurSalMngMapper.deleteInvShipOgnSpeczItmPurSalMng(InvShipOgnSpeczItmPurSalMngVO);
	}

}
