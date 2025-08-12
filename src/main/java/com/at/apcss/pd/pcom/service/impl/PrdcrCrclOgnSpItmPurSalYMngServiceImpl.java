package com.at.apcss.pd.pcom.service.impl;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.pd.pcom.mapper.PrdcrCrclOgnSpItmPurSalYMngMapper;
import com.at.apcss.pd.pcom.service.PrdcrCrclOgnSpItmPurSalYMngService;
import com.at.apcss.pd.pcom.vo.ItemUoStbltYnVO;
import com.at.apcss.pd.pcom.vo.PrdcrCrclOgnSpItmPurSalYMngVO;


/**
 * @Class Name : BbsServiceImpl.java
 * @Description : 게시판 서비스를 정의하기 위한 서비스 구현 클래스
 * @author
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
@Service("PrdcrCrclOgnSpItmPurSalYMngService")
public class PrdcrCrclOgnSpItmPurSalYMngServiceImpl extends BaseServiceImpl implements PrdcrCrclOgnSpItmPurSalYMngService{

	@Autowired
	private PrdcrCrclOgnSpItmPurSalYMngMapper prdcrCrclOgnSpItmPurSalYMngMapper;

	@Override
	public PrdcrCrclOgnSpItmPurSalYMngVO selectPrdcrCrclOgnSpItmPurSalYMng(PrdcrCrclOgnSpItmPurSalYMngVO prdcrCrclOgnSpItmPurSalYMngVO) throws Exception {
		return prdcrCrclOgnSpItmPurSalYMngMapper.selectPrdcrCrclOgnSpItmPurSalYMng(prdcrCrclOgnSpItmPurSalYMngVO);
	}

	@Override
	public List<PrdcrCrclOgnSpItmPurSalYMngVO> selectPrdcrCrclOgnSpItmPurSalYMngList(PrdcrCrclOgnSpItmPurSalYMngVO prdcrCrclOgnSpItmPurSalYMngVO) throws Exception {
		return prdcrCrclOgnSpItmPurSalYMngMapper.selectPrdcrCrclOgnSpItmPurSalYMngList(prdcrCrclOgnSpItmPurSalYMngVO);
	}

	@Override
	public int insertPrdcrCrclOgnSpItmPurSalYMng(PrdcrCrclOgnSpItmPurSalYMngVO prdcrCrclOgnSpItmPurSalYMngVO) throws Exception {
		return prdcrCrclOgnSpItmPurSalYMngMapper.insertPrdcrCrclOgnSpItmPurSalYMng(prdcrCrclOgnSpItmPurSalYMngVO);
	}

	@Override
	public int updatePrdcrCrclOgnSpItmPurSalYMng(PrdcrCrclOgnSpItmPurSalYMngVO prdcrCrclOgnSpItmPurSalYMngVO) throws Exception {
		return 0;
	}
	@Override
	public int deletePrdcrCrclOgnSpItmPurSalYMng(PrdcrCrclOgnSpItmPurSalYMngVO prdcrCrclOgnSpItmPurSalYMngVO) throws Exception {
		return 0;
	}

	@Override
	public int multiSavePrdcrCrclOgnSpItmPurSalYMngList(List<PrdcrCrclOgnSpItmPurSalYMngVO> prdcrCrclOgnSpItmPurSalYMngVOList) throws Exception {
		int savedCnt = 0;
		String yrVal = null;// 등록년도
		String brnoVal = null;//통합조직 사업자번호
		for (PrdcrCrclOgnSpItmPurSalYMngVO prdcrCrclOgnSpItmPurSalYMngVO : prdcrCrclOgnSpItmPurSalYMngVOList) {
			yrVal = prdcrCrclOgnSpItmPurSalYMngVO.getYr();
			brnoVal = prdcrCrclOgnSpItmPurSalYMngVO.getBrno();
			if (ComConstants.ROW_STS_INSERT.equals(prdcrCrclOgnSpItmPurSalYMngVO.getRowSts())) {
				savedCnt += insertPrdcrCrclOgnSpItmPurSalYMng(prdcrCrclOgnSpItmPurSalYMngVO);
			}
			if (ComConstants.ROW_STS_UPDATE.equals(prdcrCrclOgnSpItmPurSalYMngVO.getRowSts())) {
				savedCnt += updatePrdcrCrclOgnSpItmPurSalYMng(prdcrCrclOgnSpItmPurSalYMngVO);
			}
		}
		//전문품목 매입 매출 저장 완료 후 적합여부 체크
		if(yrVal != null && !yrVal.equals("")
			&& brnoVal != null && !brnoVal.equals("")){
			List<ItemUoStbltYnVO> resultVoList = new ArrayList<>();
			ItemUoStbltYnVO ItemStbltYnVo = new ItemUoStbltYnVO();

			ItemStbltYnVo.setYr(yrVal);
			ItemStbltYnVo.setBrno(brnoVal);
			resultVoList = selectItemUoStbltYnList(ItemStbltYnVo);
			//조회 결과가 있을 경우에만 업데이트
			if(resultVoList != null) {
				//적합여부 초기화
				prdcrCrclOgnSpItmPurSalYMngMapper.updateItemUoStbltYnInit(ItemStbltYnVo);
				for (ItemUoStbltYnVO resultVo : resultVoList) {
					updateItemUoStbltYn(resultVo);
				}
			}
		}
		return savedCnt;
	}

	//품목별 적합여부 리스트
	@Override
	public List<ItemUoStbltYnVO> selectItemUoStbltYnList(ItemUoStbltYnVO ItemUoStbltYnVo) throws Exception {
		return prdcrCrclOgnSpItmPurSalYMngMapper.selectItemUoStbltYnList(ItemUoStbltYnVo);
	}
	//적합여부 업데이트
	@Override
	public int updateItemUoStbltYn(ItemUoStbltYnVO ItemUoStbltYnVo) throws Exception {
		return prdcrCrclOgnSpItmPurSalYMngMapper.updateItemUoStbltYn(ItemUoStbltYnVo);
	}
	//전문품목 매입매출 출자출하조직 보유 로우데이터 2024년
	@Override
	public List<PrdcrCrclOgnSpItmPurSalYMngVO> selectRawDataList(PrdcrCrclOgnSpItmPurSalYMngVO prdcrCrclOgnSpItmPurSalYMngVO) throws Exception {
		return prdcrCrclOgnSpItmPurSalYMngMapper.selectRawDataList(prdcrCrclOgnSpItmPurSalYMngVO);
	}

	//전문품목 매입매출 출자출하조직 보유 로우데이터 2025년
	@Override
	public List<PrdcrCrclOgnSpItmPurSalYMngVO> selectRawDataList2025(PrdcrCrclOgnSpItmPurSalYMngVO prdcrCrclOgnSpItmPurSalYMngVO) throws Exception {
		return prdcrCrclOgnSpItmPurSalYMngMapper.selectRawDataList2025(prdcrCrclOgnSpItmPurSalYMngVO);
	}

	/**
	 * 통합조직 전문품목 매입매출 목록 조회
	 * @param prdcrCrclOgnSpItmPurSalYMngVO
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<PrdcrCrclOgnSpItmPurSalYMngVO> selectUoMajorItemPrchsSlsList(PrdcrCrclOgnSpItmPurSalYMngVO prdcrCrclOgnSpItmPurSalYMngVO) throws Exception {
		return prdcrCrclOgnSpItmPurSalYMngMapper.selectUoMajorItemPrchsSlsList(prdcrCrclOgnSpItmPurSalYMngVO);
	}

	/* 개발서버 신규화면 조회 */
	@Override
	public List<PrdcrCrclOgnSpItmPurSalYMngVO> selectPrdcrCrclOgnSpItmPurSalYMngListNew(PrdcrCrclOgnSpItmPurSalYMngVO prdcrCrclOgnSpItmPurSalYMngVO) throws Exception {
		return prdcrCrclOgnSpItmPurSalYMngMapper.selectPrdcrCrclOgnSpItmPurSalYMngListNew(prdcrCrclOgnSpItmPurSalYMngVO);
	}
	/* 개발서버 신규화면 등록 */
	@Override
	public int insertPrdcrCrclOgnSpItmPurSalYMngNew(PrdcrCrclOgnSpItmPurSalYMngVO prdcrCrclOgnSpItmPurSalYMngVO) throws Exception {
		return prdcrCrclOgnSpItmPurSalYMngMapper.insertPrdcrCrclOgnSpItmPurSalYMngNew(prdcrCrclOgnSpItmPurSalYMngVO);
	}
	/* 개발서버 신규화면 등록 */
	@Override
	public int multiSavePrdcrCrclOgnSpItmPurSalYMngListNew(List<PrdcrCrclOgnSpItmPurSalYMngVO> prdcrCrclOgnSpItmPurSalYMngVOList) throws Exception {
		int savedCnt = 0;
		String yrVal = null;// 등록년도
		String brnoVal = null;//통합조직 사업자번호
		String tmprStrgYnVal = null;//임시저장 여부
		int delYn = 0;
		for (PrdcrCrclOgnSpItmPurSalYMngVO prdcrCrclOgnSpItmPurSalYMngVO : prdcrCrclOgnSpItmPurSalYMngVOList) {
			yrVal = prdcrCrclOgnSpItmPurSalYMngVO.getYr();
			brnoVal = prdcrCrclOgnSpItmPurSalYMngVO.getBrno();
			tmprStrgYnVal = prdcrCrclOgnSpItmPurSalYMngVO.getTmprStrgYn();
			if(delYn == 0) {
				delYn = prdcrCrclOgnSpItmPurSalYMngMapper.updateDelYn(prdcrCrclOgnSpItmPurSalYMngVO);
			}
			savedCnt += insertPrdcrCrclOgnSpItmPurSalYMngNew(prdcrCrclOgnSpItmPurSalYMngVO);
		}

		//임시저장인 경우 적합여부 체크 하지 않음
		if("Y".equals(tmprStrgYnVal)) {
			PrdcrCrclOgnSpItmPurSalYMngVO tmprStrgVo = new PrdcrCrclOgnSpItmPurSalYMngVO();
			tmprStrgVo.setYr(yrVal);
			tmprStrgVo.setBrno(brnoVal);
			tmprStrgVo.setTmprStrgYn(tmprStrgYnVal);
			prdcrCrclOgnSpItmPurSalYMngMapper.updateTempSaveUoAps(tmprStrgVo);
			return savedCnt;
		}

		//전문품목 매입 매출 저장 완료 후 적합여부 체크
		if(yrVal != null && !yrVal.equals("")
			&& brnoVal != null && !brnoVal.equals("")){
			List<ItemUoStbltYnVO> resultVoList = new ArrayList<>();
			ItemUoStbltYnVO ItemStbltYnVo = new ItemUoStbltYnVO();

			ItemStbltYnVo.setYr(yrVal);
			ItemStbltYnVo.setBrno(brnoVal);
			resultVoList = selectItemUoStbltYnListNew(ItemStbltYnVo);
			//조회 결과가 있을 경우에만 업데이트
			if(resultVoList != null) {
				//적합여부 초기화
				prdcrCrclOgnSpItmPurSalYMngMapper.updateItemUoStbltYnInit(ItemStbltYnVo);
				for (ItemUoStbltYnVO resultVo : resultVoList) {
					updateItemUoStbltYn(resultVo);
				}
			}
		}
		return savedCnt;
	}
	/* 개발서버 신규화면 적합여부 체크 */
	@Override
	public List<ItemUoStbltYnVO> selectItemUoStbltYnListNew(ItemUoStbltYnVO ItemUoStbltYnVo) throws Exception {
		return prdcrCrclOgnSpItmPurSalYMngMapper.selectItemUoStbltYnListNew(ItemUoStbltYnVo);
	}

	@Override
	public PrdcrCrclOgnSpItmPurSalYMngVO selectTempSaveUoPst(PrdcrCrclOgnSpItmPurSalYMngVO prdcrCrclOgnSpItmPurSalYMngVO) throws Exception {

		return prdcrCrclOgnSpItmPurSalYMngMapper.selectTempSaveUoPst(prdcrCrclOgnSpItmPurSalYMngVO);
	}
}
