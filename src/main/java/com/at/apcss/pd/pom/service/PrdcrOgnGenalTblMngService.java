package com.apcmngsys.apcss.pd.pom.service;

import java.util.List;

import com.apcmngsys.apcss.pd.pom.vo.PrdcrOgnGenalTblMngVO;


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
public interface PrdcrOgnGenalTblMngService {

	/**
	 * 정보를 조회한다.
	 * @param prdcrOgnGenalTblMngVO
	 * @return
	 * @throws Exception
	 */
	public PrdcrOgnGenalTblMngVO selectPrdcrOgnGenalTblMng(PrdcrOgnGenalTblMngVO prdcrOgnGenalTblMngVO) throws Exception;

	public List<PrdcrOgnGenalTblMngVO> selectPrdcrOgnGenalTblMngList(PrdcrOgnGenalTblMngVO prdcrOgnGenalTblMngVO) throws Exception;

	/**
	 * 생산자조직 - 총괄표 조회
	 * @param prdcrOgnGenalTblMngVO
	 * @return
	 * @throws Exception
	 */
	public List<PrdcrOgnGenalTblMngVO> selectPrdcrOgnzSummaryList(PrdcrOgnGenalTblMngVO prdcrOgnGenalTblMngVO) throws Exception;


	public int insertPrdcrOgnGenalTblMng(PrdcrOgnGenalTblMngVO prdcrOgnGenalTblMngVO) throws Exception;

	public int updatePrdcrOgnGenalTblMng(PrdcrOgnGenalTblMngVO prdcrOgnGenalTblMngVO) throws Exception;

	public int multiSavePrdcrOgnGenalTblMngList(List<PrdcrOgnGenalTblMngVO> PrdcrOgnGenalTblMngVOList) throws Exception;

	public int deletePrdcrOgnGenalTblMng(PrdcrOgnGenalTblMngVO prdcrOgnGenalTblMngVO) throws Exception;

	public int updateStbltYn(PrdcrOgnGenalTblMngVO prdcrOgnGenalTblMngVO) throws Exception;

	/**
	 * 생산자조직 총괄표 로우데이터를 조회 한다 2024년
	 * @param prdcrOgnGenalTblMngVO
	 * @return List<PrdcrOgnGenalTblMngVO>
	 * @throws Exception
	 */
	public List<PrdcrOgnGenalTblMngVO> selectRawDataPrdcrOgnzList(PrdcrOgnGenalTblMngVO prdcrOgnGenalTblMngVO) throws Exception;

	/**
	 * 생산자조직 총괄표 로우데이터를 조회 한다 2025년
	 * @param prdcrOgnGenalTblMngVO
	 * @return List<PrdcrOgnGenalTblMngVO>
	 * @throws Exception
	 */
	public List<PrdcrOgnGenalTblMngVO> selectRawDataPrdcrOgnzList2025(PrdcrOgnGenalTblMngVO prdcrOgnGenalTblMngVO) throws Exception;

}
