package com.at.apcss.pd.pcom.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.pd.pcom.vo.ItemUoStbltYnVO;
import com.at.apcss.pd.pcom.vo.PrdcrCrclOgnSpItmPurSalYMngVO;

/**
 * 게시판 Mapper 인터페이스
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
@Mapper
public interface PrdcrCrclOgnSpItmPurSalYMngMapper {



	public PrdcrCrclOgnSpItmPurSalYMngVO selectPrdcrCrclOgnSpItmPurSalYMng(PrdcrCrclOgnSpItmPurSalYMngVO prdcrCrclOgnSpItmPurSalYMngVO);

	public List<PrdcrCrclOgnSpItmPurSalYMngVO> selectPrdcrCrclOgnSpItmPurSalYMngList(PrdcrCrclOgnSpItmPurSalYMngVO prdcrCrclOgnSpItmPurSalYMngVO);

	public int insertPrdcrCrclOgnSpItmPurSalYMng(PrdcrCrclOgnSpItmPurSalYMngVO prdcrCrclOgnSpItmPurSalYMngVO);

	public List<ItemUoStbltYnVO> selectItemUoStbltYnList(ItemUoStbltYnVO itemUoStbltYnVo);

	public int updateItemUoStbltYn(ItemUoStbltYnVO itemUoStbltYnVo);

	public void updateItemUoStbltYnInit(ItemUoStbltYnVO itemUoStbltYnVo);

	/**
	 * 통합조직 전문품목 매입매출 로우데이터 조회 2024년
	 * @param prdcrCrclOgnSpItmPurSalYMngVO
	 * @return List<PrdcrCrclOgnSpItmPurSalYMngVO>
	 */
	public List<PrdcrCrclOgnSpItmPurSalYMngVO> selectRawDataList(PrdcrCrclOgnSpItmPurSalYMngVO prdcrCrclOgnSpItmPurSalYMngVO);

	/**
	 * 통합조직 전문품목 매입매출 로우데이터 조회 2025년
	 * @param prdcrCrclOgnSpItmPurSalYMngVO
	 * @return List<PrdcrCrclOgnSpItmPurSalYMngVO>
	 */
	public List<PrdcrCrclOgnSpItmPurSalYMngVO> selectRawDataList2025(PrdcrCrclOgnSpItmPurSalYMngVO prdcrCrclOgnSpItmPurSalYMngVO);

	/**
	 * 통합조직 전문품목 매입매출 Rawdata 조회
	 * @param prdcrCrclOgnSpItmPurSalYMngVO
	 * @return List<PrdcrCrclOgnSpItmPurSalYMngVO>
	 */
	public List<PrdcrCrclOgnSpItmPurSalYMngVO> selectUoSpcltItemPrchsSlsRawdataList(PrdcrCrclOgnSpItmPurSalYMngVO prdcrCrclOgnSpItmPurSalYMngVO);

	/**
	 * 통합조직 전문품목 매입매출 목록 조회 (2025.07.24)
	 * @param prdcrCrclOgnSpItmPurSalYMngVO
	 * @return
	 */
	public List<PrdcrCrclOgnSpItmPurSalYMngVO> selectUoMajorItemPrchsSlsList(PrdcrCrclOgnSpItmPurSalYMngVO prdcrCrclOgnSpItmPurSalYMngVO);

	/* 개발서버 신규 화면 조회 */
	public List<PrdcrCrclOgnSpItmPurSalYMngVO> selectPrdcrCrclOgnSpItmPurSalYMngListNew(PrdcrCrclOgnSpItmPurSalYMngVO prdcrCrclOgnSpItmPurSalYMngVO);
	/* 개발서버 신규 화면 등록 */
	public int insertPrdcrCrclOgnSpItmPurSalYMngNew(PrdcrCrclOgnSpItmPurSalYMngVO prdcrCrclOgnSpItmPurSalYMngVO);
	/* 개발서버 신규 화면 적합여부 */
	public List<ItemUoStbltYnVO> selectItemUoStbltYnListNew(ItemUoStbltYnVO itemUoStbltYnVo);
	//저장전 기존 데이터 삭제 처리
	public int updateDelYn(PrdcrCrclOgnSpItmPurSalYMngVO prdcrCrclOgnSpItmPurSalYMngVO);

	/**
	 * 총매입매출 임시저장 처리.
	 * @param prdcrCrclOgnSpItmPurSalYMngVO
	 * @return int
	 */
	public int updateTempSaveUoAps(PrdcrCrclOgnSpItmPurSalYMngVO prdcrCrclOgnSpItmPurSalYMngVO);

	/**
	 * 임시저장 정보를 조회한다.
	 * @param prdcrCrclOgnSpItmPurSalYMngVO
	 * @return PrdcrCrclOgnSpItmPurSalYMngVO
	 */
	public PrdcrCrclOgnSpItmPurSalYMngVO selectTempSaveUoPst(PrdcrCrclOgnSpItmPurSalYMngVO prdcrCrclOgnSpItmPurSalYMngVO);
}
