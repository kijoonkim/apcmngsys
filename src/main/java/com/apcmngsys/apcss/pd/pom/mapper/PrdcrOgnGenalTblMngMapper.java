package com.apcmngsys.apcss.pd.pom.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.apcmngsys.apcss.pd.pom.vo.PrdcrOgnGenalTblMngVO;

/**
 * 게시판 Mapper 인터페이스
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
@Mapper
public interface PrdcrOgnGenalTblMngMapper {


	/**
	 * 메시지정보를 조회한다.
	 * @param bbsVO
	 * @return
	 */
	public PrdcrOgnGenalTblMngVO selectPrdcrOgnGenalTblMng(PrdcrOgnGenalTblMngVO prdcrOgnGenalTblMngVO);

	public List<PrdcrOgnGenalTblMngVO> selectPrdcrOgnGenalTblMngList(PrdcrOgnGenalTblMngVO prdcrOgnGenalTblMngVO);
	public List<PrdcrOgnGenalTblMngVO> selectPrdcrOgnzSummaryList(PrdcrOgnGenalTblMngVO prdcrOgnGenalTblMngVO);

	public int insertPrdcrOgnGenalTblMng(PrdcrOgnGenalTblMngVO prdcrOgnGenalTblMngVO);

	public int updatePrdcrOgnGenalTblMng(PrdcrOgnGenalTblMngVO prdcrOgnGenalTblMngVO);

	public int deletePrdcrOgnGenalTblMng(PrdcrOgnGenalTblMngVO prdcrOgnGenalTblMngVO);

	public int updateStbltYn(PrdcrOgnGenalTblMngVO prdcrOgnGenalTblMngVO);

	/**
	 * 생산자조직 총괄표 로우데이터 조회 2024년
	 * @param prdcrOgnGenalTblMngVO
	 * @return List<PrdcrOgnGenalTblMngVO>
	 */
	public List<PrdcrOgnGenalTblMngVO> selectRawDataPrdcrOgnzList(PrdcrOgnGenalTblMngVO prdcrOgnGenalTblMngVO);

	/**
	 * 생산자조직 총괄표 로우데이터 조회 2025년
	 * @param prdcrOgnGenalTblMngVO
	 * @return List<PrdcrOgnGenalTblMngVO>
	 */
	public List<PrdcrOgnGenalTblMngVO> selectRawDataPrdcrOgnzList2025(PrdcrOgnGenalTblMngVO prdcrOgnGenalTblMngVO);
}
