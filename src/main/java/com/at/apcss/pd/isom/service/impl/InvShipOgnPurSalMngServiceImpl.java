package com.at.apcss.pd.isom.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.pd.isom.mapper.InvShipOgnPurSalMngMapper;
import com.at.apcss.pd.isom.service.InvShipOgnPurSalMngService;
import com.at.apcss.pd.isom.vo.InvShipOgnPurSalMngVO;


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
@Service("InvShipOgnPurSalMngService")
public class InvShipOgnPurSalMngServiceImpl extends BaseServiceImpl implements InvShipOgnPurSalMngService{

	@Autowired
	private InvShipOgnPurSalMngMapper InvShipOgnPurSalMngMapper;

	@Override
	public InvShipOgnPurSalMngVO selectInvShipOgnPurSalMng(InvShipOgnPurSalMngVO InvShipOgnPurSalMngVO) throws Exception {

		InvShipOgnPurSalMngVO resultVO = InvShipOgnPurSalMngMapper.selectInvShipOgnPurSalMng(InvShipOgnPurSalMngVO);

		return resultVO;
	}

	@Override
	public List<InvShipOgnPurSalMngVO> selectInvShipOgnPurSalMngList(InvShipOgnPurSalMngVO InvShipOgnPurSalMngVO) throws Exception {

		List<InvShipOgnPurSalMngVO> resultList = InvShipOgnPurSalMngMapper.selectInvShipOgnPurSalMngList(InvShipOgnPurSalMngVO);
		return resultList;
	}

	@Override
	public int insertInvShipOgnPurSalMng01(InvShipOgnPurSalMngVO InvShipOgnPurSalMngVO) throws Exception {

		int insertedCnt = InvShipOgnPurSalMngMapper.insertInvShipOgnPurSalMng01(InvShipOgnPurSalMngVO);

		return insertedCnt;
	}

	@Override
	public int insertInvShipOgnPurSalMng02(InvShipOgnPurSalMngVO InvShipOgnPurSalMngVO) throws Exception {

		int insertedCnt = InvShipOgnPurSalMngMapper.insertInvShipOgnPurSalMng02(InvShipOgnPurSalMngVO);

		return insertedCnt;
	}

	@Override
	public int insertInvShipOgnPurSalMng03(InvShipOgnPurSalMngVO InvShipOgnPurSalMngVO) throws Exception {

		int insertedCnt = InvShipOgnPurSalMngMapper.insertInvShipOgnPurSalMng03(InvShipOgnPurSalMngVO);

		return insertedCnt;
	}

	@Override
	public int updateInvShipOgnPurSalMng(InvShipOgnPurSalMngVO InvShipOgnPurSalMngVO) throws Exception {

		int updatedCnt = InvShipOgnPurSalMngMapper.updateInvShipOgnPurSalMng(InvShipOgnPurSalMngVO);

		return updatedCnt;
	}

	@Override
	public int multiSaveInvShipOgnPurSalMngList01(List<InvShipOgnPurSalMngVO> InvShipOgnPurSalMngVOList) throws Exception {
		int savedCnt = 0;
		for (InvShipOgnPurSalMngVO InvShipOgnPurSalMngVO : InvShipOgnPurSalMngVOList) {
			savedCnt += insertInvShipOgnPurSalMng01(InvShipOgnPurSalMngVO);
			/*
			if(ComConstants.ROW_STS_INSERT.equals(InvShipOgnPurSalMngVO.getRowSts())) {
				savedCnt += insertInvShipOgnPurSalMng01(InvShipOgnPurSalMngVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(InvShipOgnPurSalMngVO.getRowSts())) {
				savedCnt += updateInvShipOgnPurSalMng(InvShipOgnPurSalMngVO);
			}
			*/
		}
		return savedCnt;
	}

	@Override
	public int multiSaveInvShipOgnPurSalMngList02(List<InvShipOgnPurSalMngVO> InvShipOgnPurSalMngVOList) throws Exception {
		int savedCnt = 0;
		for (InvShipOgnPurSalMngVO InvShipOgnPurSalMngVO : InvShipOgnPurSalMngVOList) {
			savedCnt += insertInvShipOgnPurSalMng02(InvShipOgnPurSalMngVO);
		}
		return savedCnt;
	}

	@Override
	public int multiSaveInvShipOgnPurSalMngList03(List<InvShipOgnPurSalMngVO> InvShipOgnPurSalMngVOList) throws Exception {
		int savedCnt = 0;
		for (InvShipOgnPurSalMngVO InvShipOgnPurSalMngVO : InvShipOgnPurSalMngVOList) {
			savedCnt += insertInvShipOgnPurSalMng03(InvShipOgnPurSalMngVO);
		}
		return savedCnt;
	}

	@Override
	public int deleteInvShipOgnPurSalMng(InvShipOgnPurSalMngVO InvShipOgnPurSalMngVO) throws Exception {
		return InvShipOgnPurSalMngMapper.deleteInvShipOgnPurSalMng(InvShipOgnPurSalMngVO);
	}

}
