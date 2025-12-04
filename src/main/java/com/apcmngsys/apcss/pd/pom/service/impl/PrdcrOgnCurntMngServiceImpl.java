package com.apcmngsys.apcss.pd.pom.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.apcmngsys.apcss.co.sys.service.impl.BaseServiceImpl;
import com.apcmngsys.apcss.pd.pom.mapper.PrdcrOgnCurntMngMapper;
import com.apcmngsys.apcss.pd.pom.service.PrdcrOgnCurntMngService;
import com.apcmngsys.apcss.pd.pom.vo.PrdcrOgnCurntMngVO;
import com.apcmngsys.apcss.pd.pom.vo.TbEvFrmhsApoVO;


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
 * 2023.06.21          최초 생성
 * </pre>
 */
@Service("prdcrOgnCurntMngService")
public class PrdcrOgnCurntMngServiceImpl extends BaseServiceImpl implements PrdcrOgnCurntMngService{

	@Autowired
	private PrdcrOgnCurntMngMapper prdcrOgnCurntMngMapper;

	@Override
	public PrdcrOgnCurntMngVO selectPrdcrOgnCurntMng(PrdcrOgnCurntMngVO prdcrOgnCurntMngVO) throws Exception {
		return prdcrOgnCurntMngMapper.selectPrdcrOgnCurntMng(prdcrOgnCurntMngVO);
	}

	@Override
	public List<PrdcrOgnCurntMngVO> selectPrdcrOgnCurntMngList(PrdcrOgnCurntMngVO prdcrOgnCurntMngVO) throws Exception {
		return prdcrOgnCurntMngMapper.selectPrdcrOgnCurntMngList(prdcrOgnCurntMngVO);
	}

	@Override
	public List<PrdcrOgnCurntMngVO> selectPrdcrOgnCurntMngDtlList(PrdcrOgnCurntMngVO prdcrOgnCurntMngVO) throws Exception {
		return prdcrOgnCurntMngMapper.selectPrdcrOgnCurntMngDtlList(prdcrOgnCurntMngVO);
	}

	@Override
	public int insertPrdcrOgnCurntMngDtl(PrdcrOgnCurntMngVO prdcrOgnCurntMngVO) throws Exception {
		return prdcrOgnCurntMngMapper.insertPrdcrOgnCurntMngDtl(prdcrOgnCurntMngVO);
	}

	@Override
	public int updatePrdcrOgnCurntMng(PrdcrOgnCurntMngVO prdcrOgnCurntMngVO) throws Exception {
		//int updatedCnt = prdcrOgnCurntMngMapper.updatePrdcrOgnCurntMng(PrdcrOgnCurntMngVO);
		return 0;
	}

	//농가리스트 저장 및 해당 조직의 적합여부 체크
	@Override
	public int multiSavePrdcrOgnCurntMngDtlList(List<PrdcrOgnCurntMngVO> PrdcrOgnCurntMngVOList) throws Exception {
		int savedCnt = 0;
		//생사자조직seq,등록년도는 하위조직은 모두 같은 값을 가짐
		String prdcrOgnzSnVal = null;
		String yrVal = null;
		String brnoVal = "";
		String uoBrnoVal = "";
		for (PrdcrOgnCurntMngVO prdcrOgnCurntMngVO : PrdcrOgnCurntMngVOList) {
			prdcrOgnzSnVal = prdcrOgnCurntMngVO.getPrdcrOgnzSn();//생산자조직seq
			yrVal = prdcrOgnCurntMngVO.getYr();//등록년도
			brnoVal = prdcrOgnCurntMngVO.getBrno();//사업자번호
			uoBrnoVal = prdcrOgnCurntMngVO.getUoBrno();//통합조직 사업자번호
			savedCnt += insertPrdcrOgnCurntMngDtl(prdcrOgnCurntMngVO);
		}
		//생사자조직seq,등록년도가 비어 있지 않을떄
		//생사자조직seq,등록년도 동시에 있을경우 PK 라서 1건만 조회 될것
		if (prdcrOgnzSnVal != null && !prdcrOgnzSnVal.equals("") && yrVal != null && !yrVal.equals("")) {
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

		//영향이 가는 전문품목 매입매출, 총매입매출 임시저장 처리
		PrdcrOgnCurntMngVO tempSaveVo = new PrdcrOgnCurntMngVO();
		tempSaveVo.setYr(yrVal);
		tempSaveVo.setBrno(brnoVal);
		tempSaveVo.setBrno(uoBrnoVal);
		updateTempSaveAps(tempSaveVo);
		updateTempSavePst(tempSaveVo);
		return savedCnt;
	}

	//생산자조직 적합여부 업데이트
	@Override
	public int updateTbEvFrmhsApoStbltYn(TbEvFrmhsApoVO tbEvFrmhsApoVO) throws Exception {
		return prdcrOgnCurntMngMapper.updateTbEvFrmhsApoStbltYn(tbEvFrmhsApoVO);
	}
	//생산조직 적합여부 조회
	@Override
	public TbEvFrmhsApoVO selectTbEvFrmhsApoStbltYn(TbEvFrmhsApoVO tbEvFrmhsApoVO) throws Exception {
		return prdcrOgnCurntMngMapper.selectTbEvFrmhsApoStbltYn(tbEvFrmhsApoVO);
	}

	//생산조직 적합여부 조회 리스트
	@Override
	public List<TbEvFrmhsApoVO> selectTbEvFrmhsApoStbltYnList(TbEvFrmhsApoVO tbEvFrmhsApoVO) throws Exception {
		return prdcrOgnCurntMngMapper.selectTbEvFrmhsApoStbltYnList(tbEvFrmhsApoVO);
	}

	@Override
	public int deletePrdcrOgnCurntMngDtl(PrdcrOgnCurntMngVO prdcrOgnCurntMngVO) throws Exception {
		return prdcrOgnCurntMngMapper.deletePrdcrOgnCurntMngDtl(prdcrOgnCurntMngVO);
	}



	//생산자 조직
	@Override
	public TbEvFrmhsApoVO selectTbEvFrmhsApo(TbEvFrmhsApoVO tbEvFrmhsApoVO) throws Exception {
		return prdcrOgnCurntMngMapper.selectTbEvFrmhsApo(tbEvFrmhsApoVO);
	}

	@Override
	public List<TbEvFrmhsApoVO> selectTbEvFrmhsApoList(TbEvFrmhsApoVO tbEvFrmhsApoVO) throws Exception {
		return prdcrOgnCurntMngMapper.selectTbEvFrmhsApoList(tbEvFrmhsApoVO);
	}

	@Override
	public List<TbEvFrmhsApoVO> selectPrdcrOgnzPrfmncList(TbEvFrmhsApoVO tbEvFrmhsApoVO) throws Exception {
		return prdcrOgnCurntMngMapper.selectPrdcrOgnzPrfmncList(tbEvFrmhsApoVO);
	}

	@Override
	public int multiSaveTbEvFrmhsApoList(List<TbEvFrmhsApoVO> tbEvFrmhsApoVOList) throws Exception {
		int savedCnt = 0;
		String yrVal = null;
		String brnoVal = "";
		String uoBrnoVal = "";
		for (TbEvFrmhsApoVO tbEvFrmhsApoVO : tbEvFrmhsApoVOList) {
			yrVal = tbEvFrmhsApoVO.getYr();
			brnoVal = tbEvFrmhsApoVO.getBrno();
			uoBrnoVal = tbEvFrmhsApoVO.getUoBrno();
			savedCnt += insertTbEvFrmhsApo(tbEvFrmhsApoVO);
			//생산자조직 품목,취급유형,전문육성구분 수정
			updateTbEvFrmhsPrdctnEcSpmtSttnApo(tbEvFrmhsApoVO);
		}

		//영향이 가는 전문품목 매입매출, 총매입매출 임시저장 처리
		PrdcrOgnCurntMngVO tempSaveVo = new PrdcrOgnCurntMngVO();
		tempSaveVo.setYr(yrVal);
		tempSaveVo.setBrno(brnoVal);
		tempSaveVo.setUoBrno(uoBrnoVal);
		updateTempSaveAps(tempSaveVo);
		updateTempSavePst(tempSaveVo);
		return savedCnt;
	}

	@Override
	public int insertTbEvFrmhsApo(TbEvFrmhsApoVO tbEvFrmhsApoVO) throws Exception {
		return prdcrOgnCurntMngMapper.insertTbEvFrmhsApo(tbEvFrmhsApoVO);
	}

	@Override
	public int deleteTbEvFrmhsApo(TbEvFrmhsApoVO tbEvFrmhsApoVO) throws Exception {
		int deletedCnt = prdcrOgnCurntMngMapper.deleteTbEvFrmhsApo(tbEvFrmhsApoVO);
		prdcrOgnCurntMngMapper.deleteTbEvFrmhsPrdctnEcSpmtSttnApo(tbEvFrmhsApoVO);
		return deletedCnt;
	}

	@Override
	public int deleteTbEvFrmhsPrdctnEcSpmtSttnApo(TbEvFrmhsApoVO tbEvFrmhsApoVO) throws Exception {
		return prdcrOgnCurntMngMapper.deleteTbEvFrmhsPrdctnEcSpmtSttnApo(tbEvFrmhsApoVO);
	}

	@Override
	public int updateTbEvFrmhsPrdctnEcSpmtSttnApo(TbEvFrmhsApoVO tbEvFrmhsApoVO) throws Exception {
		return prdcrOgnCurntMngMapper.updateTbEvFrmhsPrdctnEcSpmtSttnApo(tbEvFrmhsApoVO);
	}

	@Override
	public List<TbEvFrmhsApoVO> selectRawData01(TbEvFrmhsApoVO tbEvFrmhsApoVO) throws Exception {
		return prdcrOgnCurntMngMapper.selectRawData01(tbEvFrmhsApoVO);
	}

	@Override
	public List<PrdcrOgnCurntMngVO> selectRawData02(PrdcrOgnCurntMngVO prdcrOgnCurntMngVO) throws Exception {
		return prdcrOgnCurntMngMapper.selectRawData02(prdcrOgnCurntMngVO);
	}

	@Override
	public int updateTempSaveAps(PrdcrOgnCurntMngVO prdcrOgnCurntMngVO) throws Exception {
		return prdcrOgnCurntMngMapper.updateTempSaveAps(prdcrOgnCurntMngVO);
	}

	@Override
	public int updateTempSavePst(PrdcrOgnCurntMngVO prdcrOgnCurntMngVO) throws Exception {
		return prdcrOgnCurntMngMapper.updateTempSavePst(prdcrOgnCurntMngVO);
	}

}
