package com.at.apcss.pd.pcom.service.impl;

import java.util.List;
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
	private PrdcrCrclOgnPurSalMngMapper PrdcrCrclOgnPurSalMngMapper;

	@Override
	public PrdcrCrclOgnPurSalMngVO selectPrdcrCrclOgnPurSalMng(PrdcrCrclOgnPurSalMngVO PrdcrCrclOgnPurSalMngVO) throws Exception {

		PrdcrCrclOgnPurSalMngVO resultVO = PrdcrCrclOgnPurSalMngMapper.selectPrdcrCrclOgnPurSalMng(PrdcrCrclOgnPurSalMngVO);

		return resultVO;
	}

	@Override
	public List<PrdcrCrclOgnPurSalMngVO> selectPrdcrCrclOgnPurSalMngList(PrdcrCrclOgnPurSalMngVO PrdcrCrclOgnPurSalMngVO) throws Exception {

		List<PrdcrCrclOgnPurSalMngVO> resultList = PrdcrCrclOgnPurSalMngMapper.selectPrdcrCrclOgnPurSalMngList(PrdcrCrclOgnPurSalMngVO);
		return resultList;
	}

	@Override
	public int insertPrdcrCrclOgnPurSalMng01(PrdcrCrclOgnPurSalMngVO PrdcrCrclOgnPurSalMngVO) throws Exception {

		int insertedCnt = PrdcrCrclOgnPurSalMngMapper.insertPrdcrCrclOgnPurSalMng01(PrdcrCrclOgnPurSalMngVO);

		return insertedCnt;
	}

	@Override
	public int insertPrdcrCrclOgnPurSalMng02(PrdcrCrclOgnPurSalMngVO PrdcrCrclOgnPurSalMngVO) throws Exception {

		int insertedCnt = PrdcrCrclOgnPurSalMngMapper.insertPrdcrCrclOgnPurSalMng02(PrdcrCrclOgnPurSalMngVO);

		return insertedCnt;
	}

	@Override
	public int insertPrdcrCrclOgnPurSalMng03(PrdcrCrclOgnPurSalMngVO PrdcrCrclOgnPurSalMngVO) throws Exception {

		int insertedCnt = PrdcrCrclOgnPurSalMngMapper.insertPrdcrCrclOgnPurSalMng03(PrdcrCrclOgnPurSalMngVO);

		return insertedCnt;
	}

	@Override
	public int multiSavePrdcrCrclOgnPurSalMngList01(List<PrdcrCrclOgnPurSalMngVO> PrdcrCrclOgnPurSalMngVOList) throws Exception {
		int savedCnt = 0;
		String yrVal = null;// 등록년도
		String brnoVal = null;//출자출하조직 사업자번호
		String tmprStrgYnVal = null;//임시저장 여부
		for (PrdcrCrclOgnPurSalMngVO PrdcrCrclOgnPurSalMngVO : PrdcrCrclOgnPurSalMngVOList) {
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
		PrdcrCrclOgnPurSalMngMapper.updateTempSaveUoAps(tmprStrgVo);
		return savedCnt;
	}

	@Override
	public int multiSavePrdcrCrclOgnPurSalMngList02(List<PrdcrCrclOgnPurSalMngVO> PrdcrCrclOgnPurSalMngVOList) throws Exception {
		int savedCnt = 0;
		String yrVal = null;// 등록년도
		String brnoVal = null;//출자출하조직 사업자번호
		String tmprStrgYnVal = null;//임시저장 여부
		for (PrdcrCrclOgnPurSalMngVO PrdcrCrclOgnPurSalMngVO : PrdcrCrclOgnPurSalMngVOList) {
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
			PrdcrCrclOgnPurSalMngMapper.updateTempSaveUoAps(tmprStrgVo);
		return savedCnt;
	}

	@Override
	public int multiSavePrdcrCrclOgnPurSalMngList03(List<PrdcrCrclOgnPurSalMngVO> PrdcrCrclOgnPurSalMngVOList) throws Exception {
		int savedCnt = 0;
		String yrVal = null;// 등록년도
		String brnoVal = null;//출자출하조직 사업자번호
		String tmprStrgYnVal = null;//임시저장 여부
		for (PrdcrCrclOgnPurSalMngVO PrdcrCrclOgnPurSalMngVO : PrdcrCrclOgnPurSalMngVOList) {
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
		PrdcrCrclOgnPurSalMngMapper.updateTempSaveUoAps(tmprStrgVo);
		return savedCnt;
	}

	@Override
	public int deletePrdcrCrclOgnPurSalMng(PrdcrCrclOgnPurSalMngVO PrdcrCrclOgnPurSalMngVO) throws Exception {
		return PrdcrCrclOgnPurSalMngMapper.deletePrdcrCrclOgnPurSalMng(PrdcrCrclOgnPurSalMngVO);
	}

	@Override
	public List<PrdcrCrclOgnPurSalMngVO> selectRawDataList(PrdcrCrclOgnPurSalMngVO PrdcrCrclOgnPurSalMngVO) throws Exception {

		List<PrdcrCrclOgnPurSalMngVO> resultList = PrdcrCrclOgnPurSalMngMapper.selectRawDataList(PrdcrCrclOgnPurSalMngVO);
		return resultList;
	}

	@Override
	public List<PrdcrCrclOgnPurSalMngVO> selectPrdcrCrclOgnPurSalMngSlsList(PrdcrCrclOgnPurSalMngVO PrdcrCrclOgnPurSalMngVO) throws Exception {

		List<PrdcrCrclOgnPurSalMngVO> resultList = PrdcrCrclOgnPurSalMngMapper.selectPrdcrCrclOgnPurSalMngSlsList(PrdcrCrclOgnPurSalMngVO);
		return resultList;
	}

	@Override
	public List<PrdcrCrclOgnPurSalMngVO> selectPrdcrCrclOgnPurSalMngPrchsList(PrdcrCrclOgnPurSalMngVO PrdcrCrclOgnPurSalMngVO) throws Exception {

		List<PrdcrCrclOgnPurSalMngVO> resultList = PrdcrCrclOgnPurSalMngMapper.selectPrdcrCrclOgnPurSalMngPrchsList(PrdcrCrclOgnPurSalMngVO);
		return resultList;
	}

	@Override
	public PrdcrCrclOgnPurSalMngVO selectTempSaveUoAps(PrdcrCrclOgnPurSalMngVO PrdcrCrclOgnPurSalMngVO) throws Exception {

		PrdcrCrclOgnPurSalMngVO resultVO = PrdcrCrclOgnPurSalMngMapper.selectTempSaveUoAps(PrdcrCrclOgnPurSalMngVO);

		return resultVO;
	}

}
