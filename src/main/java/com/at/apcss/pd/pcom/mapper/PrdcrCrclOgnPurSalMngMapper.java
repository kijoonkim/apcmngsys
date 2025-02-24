package com.at.apcss.pd.pcom.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.pd.pcom.vo.PrdcrCrclOgnPurSalMngVO;

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
public interface PrdcrCrclOgnPurSalMngMapper {


	/**
	 * 메시지정보를 조회한다.
	 * @param bbsVO
	 * @return
	 */
	public PrdcrCrclOgnPurSalMngVO selectPrdcrCrclOgnPurSalMng(PrdcrCrclOgnPurSalMngVO PrdcrCrclOgnPurSalMngVO);

	public List<PrdcrCrclOgnPurSalMngVO> selectPrdcrCrclOgnPurSalMngList(PrdcrCrclOgnPurSalMngVO PrdcrCrclOgnPurSalMngVO);

	public int insertPrdcrCrclOgnPurSalMng01(PrdcrCrclOgnPurSalMngVO PrdcrCrclOgnPurSalMngVO);

	public int insertPrdcrCrclOgnPurSalMng02(PrdcrCrclOgnPurSalMngVO PrdcrCrclOgnPurSalMngVO);

	public int insertPrdcrCrclOgnPurSalMng03(PrdcrCrclOgnPurSalMngVO PrdcrCrclOgnPurSalMngVO);

	public int deletePrdcrCrclOgnPurSalMng(PrdcrCrclOgnPurSalMngVO PrdcrCrclOgnPurSalMngVO) throws Exception;

	/**
	 * 통합조직 총매입매출 로우데이터 조회 2024년
	 * @param PrdcrCrclOgnPurSalMngVO
	 * @return List<PrdcrCrclOgnPurSalMngVO>
	 */
	public List<PrdcrCrclOgnPurSalMngVO> selectRawDataList(PrdcrCrclOgnPurSalMngVO PrdcrCrclOgnPurSalMngVO);

	/**
	 * 통합조직 총매입매출 로우데이터 조회 2025년
	 * @param PrdcrCrclOgnPurSalMngVO
	 * @return List<PrdcrCrclOgnPurSalMngVO>
	 */
	public List<PrdcrCrclOgnPurSalMngVO> selectRawDataList2025(PrdcrCrclOgnPurSalMngVO PrdcrCrclOgnPurSalMngVO);
	//매입 리스트
	public List<PrdcrCrclOgnPurSalMngVO> selectPrdcrCrclOgnPurSalMngPrchsList(PrdcrCrclOgnPurSalMngVO PrdcrCrclOgnPurSalMngVO);
	//매출 리스트
	public List<PrdcrCrclOgnPurSalMngVO> selectPrdcrCrclOgnPurSalMngSlsList(PrdcrCrclOgnPurSalMngVO PrdcrCrclOgnPurSalMngVO);

	/**
	 * 통합조직 총매입매출 입시저장
	 * @param PrdcrCrclOgnPurSalMngVO
	 * @return int
	 */
	public int updateTempSaveUoAps(PrdcrCrclOgnPurSalMngVO PrdcrCrclOgnPurSalMngVO);

	/**
	 * 통합조직 총 매입 매출 임시저장 정보
	 * @param PrdcrCrclOgnPurSalMngVO
	 * @return PrdcrCrclOgnPurSalMngVO
	 */
	public PrdcrCrclOgnPurSalMngVO selectTempSaveUoAps(PrdcrCrclOgnPurSalMngVO PrdcrCrclOgnPurSalMngVO);
}
