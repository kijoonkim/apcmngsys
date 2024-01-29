package com.at.apcss.pd.pom.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.pd.pom.mapper.PrdcrOgnCurntMngMapper;
import com.at.apcss.pd.pom.service.PrdcrOgnCurntMngService;
import com.at.apcss.pd.pom.vo.PrdcrOgnCurntMngVO;
import com.at.apcss.pd.pom.vo.TbEvFrmhsApoVO;


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
@Service("PrdcrOgnCurntMngService")
public class PrdcrOgnCurntMngServiceImpl extends BaseServiceImpl implements PrdcrOgnCurntMngService{

	@Autowired
	private PrdcrOgnCurntMngMapper PrdcrOgnCurntMngMapper;

	@Override
	public PrdcrOgnCurntMngVO selectPrdcrOgnCurntMng(PrdcrOgnCurntMngVO PrdcrOgnCurntMngVO) throws Exception {

		PrdcrOgnCurntMngVO resultVO = PrdcrOgnCurntMngMapper.selectPrdcrOgnCurntMng(PrdcrOgnCurntMngVO);

		return resultVO;
	}

	@Override
	public List<PrdcrOgnCurntMngVO> selectPrdcrOgnCurntMngList(PrdcrOgnCurntMngVO PrdcrOgnCurntMngVO) throws Exception {

		List<PrdcrOgnCurntMngVO> resultList = PrdcrOgnCurntMngMapper.selectPrdcrOgnCurntMngList(PrdcrOgnCurntMngVO);
		return resultList;
	}

	@Override
	public List<PrdcrOgnCurntMngVO> selectPrdcrOgnCurntMngDtlList(PrdcrOgnCurntMngVO PrdcrOgnCurntMngVO) throws Exception {

		List<PrdcrOgnCurntMngVO> resultList = PrdcrOgnCurntMngMapper.selectPrdcrOgnCurntMngDtlList(PrdcrOgnCurntMngVO);
		return resultList;
	}

	@Override
	public int insertPrdcrOgnCurntMngDtl(PrdcrOgnCurntMngVO PrdcrOgnCurntMngVO) throws Exception {

		int insertedCnt = PrdcrOgnCurntMngMapper.insertPrdcrOgnCurntMngDtl(PrdcrOgnCurntMngVO);

		return insertedCnt;
	}

	@Override
	public int updatePrdcrOgnCurntMng(PrdcrOgnCurntMngVO PrdcrOgnCurntMngVO) throws Exception {

		int updatedCnt = PrdcrOgnCurntMngMapper.updatePrdcrOgnCurntMng(PrdcrOgnCurntMngVO);

		return updatedCnt;
	}

	//농가리스트 저장 및 해당 조직의 적합여부 체크
	@Override
	public int multiSavePrdcrOgnCurntMngDtlList(List<PrdcrOgnCurntMngVO> PrdcrOgnCurntMngVOList) throws Exception {
		int savedCnt = 0;
		//생사자조직seq,등록년도는 하위조직은 모두 같은 값을 가짐
		String prdcrOgnzSnVal = null;
		String yrVal = null;
		for (PrdcrOgnCurntMngVO PrdcrOgnCurntMngVO : PrdcrOgnCurntMngVOList) {
			prdcrOgnzSnVal = PrdcrOgnCurntMngVO.getPrdcrOgnzSn();//생산자조직seq
			yrVal = PrdcrOgnCurntMngVO.getYr();//등록년도
			if(ComConstants.ROW_STS_INSERT.equals(PrdcrOgnCurntMngVO.getRowSts())) {
				savedCnt += insertPrdcrOgnCurntMngDtl(PrdcrOgnCurntMngVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(PrdcrOgnCurntMngVO.getRowSts())) {
				savedCnt += updatePrdcrOgnCurntMng(PrdcrOgnCurntMngVO);
			}
		}
		//생사자조직seq,등록년도가 비어 있지 않을떄
		//생사자조직seq,등록년도 동시에 있을경우 PK 라서 1건만 조회 될것
		if(prdcrOgnzSnVal != null && !prdcrOgnzSnVal.equals("") && yrVal != null && !yrVal.equals("")) {
			//농가리스트 저장 완료 후 해당 생산자조직 적합여부 업데이트
			TbEvFrmhsApoVO TbEvFrmhsApoVo = new TbEvFrmhsApoVO();
			TbEvFrmhsApoVo.setPrdcrOgnzSn(prdcrOgnzSnVal);
			TbEvFrmhsApoVo.setYr(yrVal);
			TbEvFrmhsApoVO resultVo = selectTbEvFrmhsApoStbltYn(TbEvFrmhsApoVo);
			//조회 결과가 있을 경우에만 업데이트
			if(resultVo != null) {
				updateTbEvFrmhsApoStbltYn(resultVo);
			}
		}
		return savedCnt;
	}
	//생산자조직 적합여부 업데이트
	@Override
	public int updateTbEvFrmhsApoStbltYn(TbEvFrmhsApoVO tbEvFrmhsApoVO) throws Exception {
		int updatedCnt = PrdcrOgnCurntMngMapper.updateTbEvFrmhsApoStbltYn(tbEvFrmhsApoVO);
		return updatedCnt;
	}
	//생산조직 적합여부 조회
	@Override
	public TbEvFrmhsApoVO selectTbEvFrmhsApoStbltYn(TbEvFrmhsApoVO tbEvFrmhsApoVO) throws Exception {
		TbEvFrmhsApoVO resultVO = PrdcrOgnCurntMngMapper.selectTbEvFrmhsApoStbltYn(tbEvFrmhsApoVO);
		return resultVO;
	}

	//생산조직 적합여부 조회 리스트
	@Override
	public List<TbEvFrmhsApoVO> selectTbEvFrmhsApoStbltYnList(TbEvFrmhsApoVO tbEvFrmhsApoVO) throws Exception {
		List<TbEvFrmhsApoVO> resultVoList = PrdcrOgnCurntMngMapper.selectTbEvFrmhsApoStbltYnList(tbEvFrmhsApoVO);
		return resultVoList;
	}

	@Override
	public int deletePrdcrOgnCurntMngDtl(PrdcrOgnCurntMngVO PrdcrOgnCurntMngVO) throws Exception {
		return PrdcrOgnCurntMngMapper.deletePrdcrOgnCurntMngDtl(PrdcrOgnCurntMngVO);
	}



	//생산자 조직
	@Override
	public TbEvFrmhsApoVO selectTbEvFrmhsApo(TbEvFrmhsApoVO tbEvFrmhsApoVO) throws Exception {
		TbEvFrmhsApoVO resultVO = PrdcrOgnCurntMngMapper.selectTbEvFrmhsApo(tbEvFrmhsApoVO);

		return resultVO;
	}

	@Override
	public List<TbEvFrmhsApoVO> selectTbEvFrmhsApoList(TbEvFrmhsApoVO tbEvFrmhsApoVO) throws Exception {
		List<TbEvFrmhsApoVO> resultList = PrdcrOgnCurntMngMapper.selectTbEvFrmhsApoList(tbEvFrmhsApoVO);
		return resultList;
	}

	@Override
	public int multiSaveTbEvFrmhsApoList(List<TbEvFrmhsApoVO> tbEvFrmhsApoVOList) throws Exception {
		int savedCnt = 0;
		for (TbEvFrmhsApoVO tbEvFrmhsApoVO : tbEvFrmhsApoVOList) {
			savedCnt += insertTbEvFrmhsApo(tbEvFrmhsApoVO);
			//생산자조직 품목,취급유형,전문육성구분 수정
			updateTbEvFrmhsPrdctnEcSpmtSttnApo(tbEvFrmhsApoVO);
		}
		return savedCnt;
	}

	@Override
	public int insertTbEvFrmhsApo(TbEvFrmhsApoVO tbEvFrmhsApoVO) throws Exception {
		int insertedCnt = PrdcrOgnCurntMngMapper.insertTbEvFrmhsApo(tbEvFrmhsApoVO);
		return insertedCnt;
	}

	@Override
	public int deleteTbEvFrmhsApo(TbEvFrmhsApoVO tbEvFrmhsApoVO) throws Exception {
		int deletedCnt =PrdcrOgnCurntMngMapper.deleteTbEvFrmhsApo(tbEvFrmhsApoVO);
		PrdcrOgnCurntMngMapper.deleteTbEvFrmhsPrdctnEcSpmtSttnApo(tbEvFrmhsApoVO);
		return deletedCnt;
	}

	@Override
	public int deleteTbEvFrmhsPrdctnEcSpmtSttnApo(TbEvFrmhsApoVO tbEvFrmhsApoVO) throws Exception {
		int deletedCnt = PrdcrOgnCurntMngMapper.deleteTbEvFrmhsPrdctnEcSpmtSttnApo(tbEvFrmhsApoVO);
		return deletedCnt;
	}

	@Override
	public int updateTbEvFrmhsPrdctnEcSpmtSttnApo(TbEvFrmhsApoVO tbEvFrmhsApoVO) throws Exception {
		int updatedCnt = PrdcrOgnCurntMngMapper.updateTbEvFrmhsPrdctnEcSpmtSttnApo(tbEvFrmhsApoVO);
		return updatedCnt;
	}
}
