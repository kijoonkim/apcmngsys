package com.at.apcss.pd.pcom.service;

import java.util.List;

import com.at.apcss.pd.pcom.vo.ItemUoStbltYnVO;
import com.at.apcss.pd.pcom.vo.PrdcrCrclOgnSpItmPurSalYMngVO;


/**
 * 평가등록결과 Service 인터페이스
 * @author 김동제
 * @since 2023.10.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.10.01  김동제        최초 생성
 * </pre>
 */
public interface PrdcrCrclOgnSpItmPurSalYMngService {

	/**
	 * 정보를 조회한다.
	 * @param prdcrCrclOgnSpItmPurSalYMngVO
	 * @return
	 * @throws Exception
	 */
	public PrdcrCrclOgnSpItmPurSalYMngVO selectPrdcrCrclOgnSpItmPurSalYMng(PrdcrCrclOgnSpItmPurSalYMngVO prdcrCrclOgnSpItmPurSalYMngVO) throws Exception;

	public List<PrdcrCrclOgnSpItmPurSalYMngVO> selectPrdcrCrclOgnSpItmPurSalYMngList(PrdcrCrclOgnSpItmPurSalYMngVO prdcrCrclOgnSpItmPurSalYMngVO) throws Exception;

	public int insertPrdcrCrclOgnSpItmPurSalYMng(PrdcrCrclOgnSpItmPurSalYMngVO prdcrCrclOgnSpItmPurSalYMngVO) throws Exception;

	public int updatePrdcrCrclOgnSpItmPurSalYMng(PrdcrCrclOgnSpItmPurSalYMngVO prdcrCrclOgnSpItmPurSalYMngVO) throws Exception;

	public int deletePrdcrCrclOgnSpItmPurSalYMng(PrdcrCrclOgnSpItmPurSalYMngVO prdcrCrclOgnSpItmPurSalYMngVO) throws Exception;

	public int multiSavePrdcrCrclOgnSpItmPurSalYMngList(List<PrdcrCrclOgnSpItmPurSalYMngVO> PrdcrCrclOgnSpItmPurSalYMngVOList) throws Exception;

	public List<ItemUoStbltYnVO> selectItemUoStbltYnList(ItemUoStbltYnVO ItemUoStbltYnVo) throws Exception;

	public int updateItemUoStbltYn(ItemUoStbltYnVO ItemUoStbltYnVo) throws Exception;

	/**
	 * 통합조직 전문품목 매입매출 로우데이터 조회 2024년
	 * @param prdcrCrclOgnSpItmPurSalYMngVO
	 * @return List<PrdcrCrclOgnSpItmPurSalYMngVO>
	 * @throws Exception
	 */
	public List<PrdcrCrclOgnSpItmPurSalYMngVO> selectRawDataList(PrdcrCrclOgnSpItmPurSalYMngVO prdcrCrclOgnSpItmPurSalYMngVO) throws Exception;

	/**
	 * 통합조직 전문품목 매입매출 로우데이터 조회 2025년
	 * @param PrdcrCrclOgnSpItmPurSalYMngVO
	 * @return List<PrdcrCrclOgnSpItmPurSalYMngVO>
	 * @throws Exception
	 */
	public List<PrdcrCrclOgnSpItmPurSalYMngVO> selectRawDataList2025(PrdcrCrclOgnSpItmPurSalYMngVO prdcrCrclOgnSpItmPurSalYMngVO) throws Exception;


	public List<PrdcrCrclOgnSpItmPurSalYMngVO> selectUoMajorItemPrchsSlsList(PrdcrCrclOgnSpItmPurSalYMngVO prdcrCrclOgnSpItmPurSalYMngVO) throws Exception;

	/* 개발서버 신규화면 조회 */
	public List<PrdcrCrclOgnSpItmPurSalYMngVO> selectPrdcrCrclOgnSpItmPurSalYMngListNew(PrdcrCrclOgnSpItmPurSalYMngVO prdcrCrclOgnSpItmPurSalYMngVO) throws Exception;
	/* 개발서버 신규화면 등록 */
	public int insertPrdcrCrclOgnSpItmPurSalYMngNew(PrdcrCrclOgnSpItmPurSalYMngVO prdcrCrclOgnSpItmPurSalYMngVO) throws Exception;
	/* 개발서버 신규화면 등록 */
	public int multiSavePrdcrCrclOgnSpItmPurSalYMngListNew(List<PrdcrCrclOgnSpItmPurSalYMngVO> PrdcrCrclOgnSpItmPurSalYMngVOList) throws Exception;
	/* 개발서버 신규화면 적합여부 체크 */
	public List<ItemUoStbltYnVO> selectItemUoStbltYnListNew(ItemUoStbltYnVO ItemUoStbltYnVo) throws Exception;

	/**
	 * 임시저장 정보를 조회한다.
	 * @param prdcrCrclOgnSpItmPurSalYMngVO
	 * @return PrdcrCrclOgnSpItmPurSalYMngVO
	 * @throws Exception
	 */
	public PrdcrCrclOgnSpItmPurSalYMngVO selectTempSaveUoPst(PrdcrCrclOgnSpItmPurSalYMngVO prdcrCrclOgnSpItmPurSalYMngVO) throws Exception;
}
