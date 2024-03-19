package com.at.apcss.pd.pcorm.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.pd.pcorm.vo.PrdcrCrclOgnVluIdctrMngVO;

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
public interface PrdcrCrclOgnVluIdctrMngMapper {

	/**
	 * 통합조직 등록결과 리스트 조회
	 * @param PrdcrCrclOgnVluIdctrMngVO
	 * @return List<PrdcrCrclOgnVluIdctrMngVO>
	 * @throws Exception
	 */
	public List<PrdcrCrclOgnVluIdctrMngVO> selectUoList(PrdcrCrclOgnVluIdctrMngVO prdcrCrclOgnVluIdctrMngVO);

	/**
	 * 통합조직 총괄 조회
	 * @param PrdcrCrclOgnVluIdctrMngVO
	 * @return List<PrdcrCrclOgnVluIdctrMngVO>
	 * @throws Exception
	 */
	public List<PrdcrCrclOgnVluIdctrMngVO> selectUoTotList(PrdcrCrclOgnVluIdctrMngVO prdcrCrclOgnVluIdctrMngVO);

	/**
	 * 출자출하조직 등록결과 리스트 조회
	 * @param PrdcrCrclOgnVluIdctrMngVO
	 * @return List<PrdcrCrclOgnVluIdctrMngVO>
	 * @throws Exception
	 */
	public List<PrdcrCrclOgnVluIdctrMngVO> selectIsoList(PrdcrCrclOgnVluIdctrMngVO prdcrCrclOgnVluIdctrMngVO);

	/**
	 * 출자출하조직 총괄 등록결과 리스트 조회
	 * @param PrdcrCrclOgnVluIdctrMngVO
	 * @return List<PrdcrCrclOgnVluIdctrMngVO>
	 * @throws Exception
	 */
	public List<PrdcrCrclOgnVluIdctrMngVO> selectIsoTotList(PrdcrCrclOgnVluIdctrMngVO prdcrCrclOgnVluIdctrMngVO);

	/**
	 * 생산자조직 등록결과 리스트 조회
	 * @param PrdcrCrclOgnVluIdctrMngVO
	 * @return List<PrdcrCrclOgnVluIdctrMngVO>
	 * @throws Exception
	 */
	public List<PrdcrCrclOgnVluIdctrMngVO> selectFrmhsList(PrdcrCrclOgnVluIdctrMngVO prdcrCrclOgnVluIdctrMngVO);

	/**
	 * 출자출하조직 총괄 저장
	 * @param PrdcrCrclOgnVluIdctrMngVO
	 * @return int
	 * @throws Exception
	 */
	public int insertIsoTotList (PrdcrCrclOgnVluIdctrMngVO prdcrCrclOgnVluIdctrMngVO);

	/**
	 * 통합조직 총괄 저장
	 * @param PrdcrCrclOgnVluIdctrMngVO
	 * @return int
	 * @throws Exception
	 */
	public int insertUoTotList (PrdcrCrclOgnVluIdctrMngVO prdcrCrclOgnVluIdctrMngVO);

	/**
	 * 로우데이터 조회
	 * @param PrdcrCrclOgnVluIdctrMngVO
	 * @return List<PrdcrCrclOgnVluIdctrMngVO>
	 * @throws Exception
	 */
	public List<PrdcrCrclOgnVluIdctrMngVO> selectRawDataList(PrdcrCrclOgnVluIdctrMngVO prdcrCrclOgnVluIdctrMngVO);

	/**
	 * 출자출하조직 로우데이터 조회
	 * @param PrdcrCrclOgnVluIdctrMngVO
	 * @return List<PrdcrCrclOgnVluIdctrMngVO>
	 * @throws Exception
	 */
	public List<PrdcrCrclOgnVluIdctrMngVO> selectRawDataIsoList(PrdcrCrclOgnVluIdctrMngVO prdcrCrclOgnVluIdctrMngVO);



	/**
	 * 통합조직 선정여부 일괄 조회
	 * @param PrdcrCrclOgnVluIdctrMngVO
	 * @return List<PrdcrCrclOgnVluIdctrMngVO>
	 * @throws Exception
	 */
	public List<PrdcrCrclOgnVluIdctrMngVO> selectUoIcptRsnList(PrdcrCrclOgnVluIdctrMngVO prdcrCrclOgnVluIdctrMngVO);

	/**
	 * 출자출하조직 선정여부 일괄 조회
	 * @param PrdcrCrclOgnVluIdctrMngVO
	 * @return List<PrdcrCrclOgnVluIdctrMngVO>
	 * @throws Exception
	 */
	public List<PrdcrCrclOgnVluIdctrMngVO> selectIsoIcptRsnList(PrdcrCrclOgnVluIdctrMngVO prdcrCrclOgnVluIdctrMngVO);


	/* 사용자용 화면 조회  */

	/**
	 * 사용자용 화면 평가지표 조회
	 * @param PrdcrCrclOgnVluIdctrMngVO
	 * @return List<PrdcrCrclOgnVluIdctrMngVO>
	 * @throws Exception
	 */
	public List<PrdcrCrclOgnVluIdctrMngVO> selectScrUserGrid01(PrdcrCrclOgnVluIdctrMngVO prdcrCrclOgnVluIdctrMngVO);

	/**
	 * 사용자용 화면 가감점 조회
	 * @param PrdcrCrclOgnVluIdctrMngVO
	 * @return List<PrdcrCrclOgnVluIdctrMngVO>
	 * @throws Exception
	 */
	public List<PrdcrCrclOgnVluIdctrMngVO> selectScrUserGrid02(PrdcrCrclOgnVluIdctrMngVO prdcrCrclOgnVluIdctrMngVO);

	/**
	 * 사용자용 화면 통합조직 선정여부 조회
	 * @param PrdcrCrclOgnVluIdctrMngVO
	 * @return List<PrdcrCrclOgnVluIdctrMngVO>
	 * @throws Exception
	 */
	public List<PrdcrCrclOgnVluIdctrMngVO> selectScrUserGrid03(PrdcrCrclOgnVluIdctrMngVO prdcrCrclOgnVluIdctrMngVO);

	/**
	 * 사용자용 화면 출자출하조직 선정여부 조회
	 * @param PrdcrCrclOgnVluIdctrMngVO
	 * @return List<PrdcrCrclOgnVluIdctrMngVO>
	 * @throws Exception
	 */
	public List<PrdcrCrclOgnVluIdctrMngVO> selectScrUserGrid04(PrdcrCrclOgnVluIdctrMngVO prdcrCrclOgnVluIdctrMngVO);

	/**
	 * 사용자용 화면 최종점수 조회
	 * @param PrdcrCrclOgnVluIdctrMngVO
	 * @return List<PrdcrCrclOgnVluIdctrMngVO>
	 * @throws Exception
	 */
	public List<PrdcrCrclOgnVluIdctrMngVO> selectScrUserGrid05(PrdcrCrclOgnVluIdctrMngVO prdcrCrclOgnVluIdctrMngVO);
}
