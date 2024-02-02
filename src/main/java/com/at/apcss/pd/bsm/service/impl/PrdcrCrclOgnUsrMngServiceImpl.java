package com.at.apcss.pd.bsm.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.pd.bsm.mapper.PrdcrCrclOgnUsrMngMapper;
import com.at.apcss.pd.bsm.service.PrdcrCrclOgnUsrMngService;
import com.at.apcss.pd.bsm.vo.PrdcrCrclOgnUsrMngVO;


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
@Service("PrdcrCrclOgnUsrMngService")
public class PrdcrCrclOgnUsrMngServiceImpl extends BaseServiceImpl implements PrdcrCrclOgnUsrMngService{

	@Autowired
	private PrdcrCrclOgnUsrMngMapper PrdcrCrclOgnUsrMngMapper;

	@Override
	public PrdcrCrclOgnUsrMngVO selectPrdcrCrclOgnUsrMng(PrdcrCrclOgnUsrMngVO PrdcrCrclOgnUsrMngVO) throws Exception {

		PrdcrCrclOgnUsrMngVO resultVO = PrdcrCrclOgnUsrMngMapper.selectPrdcrCrclOgnUsrMng(PrdcrCrclOgnUsrMngVO);

		return resultVO;
	}

	@Override
	public List<PrdcrCrclOgnUsrMngVO> selectPrdcrCrclOgnUsrMngList(PrdcrCrclOgnUsrMngVO PrdcrCrclOgnUsrMngVO) throws Exception {

		List<PrdcrCrclOgnUsrMngVO> resultList = PrdcrCrclOgnUsrMngMapper.selectPrdcrCrclOgnUsrMngList(PrdcrCrclOgnUsrMngVO);
		return resultList;
	}

	@Override
	public int insertPrdcrCrclOgnUsrMng(PrdcrCrclOgnUsrMngVO PrdcrCrclOgnUsrMngVO) throws Exception {

		int insertedCnt = PrdcrCrclOgnUsrMngMapper.insertPrdcrCrclOgnUsrMng(PrdcrCrclOgnUsrMngVO);

		return insertedCnt;
	}

	@Override
	public int updatePrdcrCrclOgnUsrMng(PrdcrCrclOgnUsrMngVO PrdcrCrclOgnUsrMngVO) throws Exception {

		int updatedCnt = PrdcrCrclOgnUsrMngMapper.updatePrdcrCrclOgnUsrMng(PrdcrCrclOgnUsrMngVO);

		return updatedCnt;
	}

	@Override
	public int multiSavePrdcrCrclOgnUsrMngList(List<PrdcrCrclOgnUsrMngVO> PrdcrCrclOgnUsrMngVOList) throws Exception {
		int savedCnt = 0;
		for (PrdcrCrclOgnUsrMngVO PrdcrCrclOgnUsrMngVO : PrdcrCrclOgnUsrMngVOList) {
			if(ComConstants.ROW_STS_INSERT.equals(PrdcrCrclOgnUsrMngVO.getRowSts())) {
				savedCnt += insertPrdcrCrclOgnUsrMng(PrdcrCrclOgnUsrMngVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(PrdcrCrclOgnUsrMngVO.getRowSts())) {
				savedCnt += updatePrdcrCrclOgnUsrMng(PrdcrCrclOgnUsrMngVO);
			}
		}
		return savedCnt;
	}

	@Override
	public int deleteUser(PrdcrCrclOgnUsrMngVO PrdcrCrclOgnUsrMngVO) throws Exception {
		int deleteCnt = PrdcrCrclOgnUsrMngMapper.deleteUser(PrdcrCrclOgnUsrMngVO);
		PrdcrCrclOgnUsrMngMapper.deleteAuthUser(PrdcrCrclOgnUsrMngVO);
		return deleteCnt;
	}

	@Override
	public int changeUserType(PrdcrCrclOgnUsrMngVO PrdcrCrclOgnUsrMngVO) throws Exception {

		int updatedCnt = PrdcrCrclOgnUsrMngMapper.updateMemberUserType(PrdcrCrclOgnUsrMngVO);
		if(updatedCnt > 0){
			PrdcrCrclOgnUsrMngMapper.insertComAuthrtUser(PrdcrCrclOgnUsrMngVO);
			PrdcrCrclOgnUsrMngMapper.updateTbEvApoUserType(PrdcrCrclOgnUsrMngVO);
			PrdcrCrclOgnUsrMngMapper.updateTbApcOgnzInfoUserType(PrdcrCrclOgnUsrMngVO);
		}
		return updatedCnt;
	}

}
