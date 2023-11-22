package com.at.apcss.pd.isom.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.fm.bbs.mapper.BbsMapper;
import com.at.apcss.fm.bbs.service.BbsService;
import com.at.apcss.fm.bbs.vo.BbsVO;
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
	public int insertInvShipOgnPurSalMng(InvShipOgnPurSalMngVO InvShipOgnPurSalMngVO) throws Exception {

		int insertedCnt = InvShipOgnPurSalMngMapper.insertInvShipOgnPurSalMng(InvShipOgnPurSalMngVO);

		return insertedCnt;
	}

	@Override
	public int updateInvShipOgnPurSalMng(InvShipOgnPurSalMngVO InvShipOgnPurSalMngVO) throws Exception {

		int updatedCnt = InvShipOgnPurSalMngMapper.updateInvShipOgnPurSalMng(InvShipOgnPurSalMngVO);

		return updatedCnt;
	}

	@Override
	public int multiSaveInvShipOgnPurSalMngList(List<InvShipOgnPurSalMngVO> InvShipOgnPurSalMngVOList) throws Exception {
		int savedCnt = 0;
		for (InvShipOgnPurSalMngVO InvShipOgnPurSalMngVO : InvShipOgnPurSalMngVOList) {
			if(ComConstants.ROW_STS_INSERT.equals(InvShipOgnPurSalMngVO.getRowSts())) {
				savedCnt += insertInvShipOgnPurSalMng(InvShipOgnPurSalMngVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(InvShipOgnPurSalMngVO.getRowSts())) {
				savedCnt += updateInvShipOgnPurSalMng(InvShipOgnPurSalMngVO);
			}
		}
		return savedCnt;
	}

	@Override
	public int deleteInvShipOgnPurSalMng(InvShipOgnPurSalMngVO InvShipOgnPurSalMngVO) throws Exception {
		return InvShipOgnPurSalMngMapper.deleteInvShipOgnPurSalMng(InvShipOgnPurSalMngVO);
	}

}
