package com.at.apcss.pd.pcorm.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.pd.pcorm.vo.PrdcrCrclOgnVluFndsMngVO;

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
public interface PrdcrCrclOgnVluFndsMngMapper {
	//평가지표 리스트 조회
	public List<PrdcrCrclOgnVluFndsMngVO> selectScoreList1(PrdcrCrclOgnVluFndsMngVO prdcrCrclOgnVluFndsMngVO);
	//가감점 리스트 조회
	public List<PrdcrCrclOgnVluFndsMngVO> selectScoreList2(PrdcrCrclOgnVluFndsMngVO prdcrCrclOgnVluFndsMngVO);
	//최종점수 리스트 조회
	public List<PrdcrCrclOgnVluFndsMngVO> selectScrRsltList(PrdcrCrclOgnVluFndsMngVO prdcrCrclOgnVluFndsMngVO);
	//평가지표,가감점 리스트 저장
	public int insertActvtnFund(PrdcrCrclOgnVluFndsMngVO PrdcrCrclOgnVluFndsMngVO);
	//최종점수 저장
	public int insertScrRslt(PrdcrCrclOgnVluFndsMngVO PrdcrCrclOgnVluFndsMngVO);

	//산출식 관리 팝업 - 산출식 리스트 조회
	public List<PrdcrCrclOgnVluFndsMngVO> selectComputWayList(PrdcrCrclOgnVluFndsMngVO prdcrCrclOgnVluFndsMngVO);
	//산출식 관리 팝업 - 산출식 리스트 저장
	public int insertComputWay(PrdcrCrclOgnVluFndsMngVO PrdcrCrclOgnVluFndsMngVO);

	//활성화자금 로우데이터 조회
	public List<PrdcrCrclOgnVluFndsMngVO> selectScrDataList(PrdcrCrclOgnVluFndsMngVO prdcrCrclOgnVluFndsMngVO);

	//활성화자금 기준 로우데이터 조회
	public List<PrdcrCrclOgnVluFndsMngVO> selectRtDataList(PrdcrCrclOgnVluFndsMngVO prdcrCrclOgnVluFndsMngVO);

	/* 사용자용 화면 조회  */

	/**
	 * 사용자용 화면 평가지표 조회
	 * @param PrdcrCrclOgnVluFndsMngVO
	 * @return List<PrdcrCrclOgnVluFndsMngVO>
	 * @throws Exception
	 */
	public List<PrdcrCrclOgnVluFndsMngVO> selectScrUserGrid01(PrdcrCrclOgnVluFndsMngVO PrdcrCrclOgnVluFndsMngVO);

	/**
	 * 사용자용 화면 가감점 조회
	 * @param PrdcrCrclOgnVluFndsMngVO
	 * @return List<PrdcrCrclOgnVluFndsMngVO>
	 * @throws Exception
	 */
	public List<PrdcrCrclOgnVluFndsMngVO> selectScrUserGrid02(PrdcrCrclOgnVluFndsMngVO PrdcrCrclOgnVluFndsMngVO);

	/**
	 * 사용자용 화면 통합조직 선정여부 조회
	 * @param PrdcrCrclOgnVluFndsMngVO
	 * @return List<PrdcrCrclOgnVluFndsMngVO>
	 * @throws Exception
	 */
	public List<PrdcrCrclOgnVluFndsMngVO> selectScrUserGrid03(PrdcrCrclOgnVluFndsMngVO PrdcrCrclOgnVluFndsMngVO);

	/**
	 * 사용자용 화면 출자출하조직 선정여부 조회
	 * @param PrdcrCrclOgnVluFndsMngVO
	 * @return List<PrdcrCrclOgnVluFndsMngVO>
	 * @throws Exception
	 */
	public List<PrdcrCrclOgnVluFndsMngVO> selectScrUserGrid04(PrdcrCrclOgnVluFndsMngVO PrdcrCrclOgnVluFndsMngVO);

	/**
	 * 사용자용 화면 최종점수 조회
	 * @param PrdcrCrclOgnVluFndsMngVO
	 * @return List<PrdcrCrclOgnVluFndsMngVO>
	 * @throws Exception
	 */
	public List<PrdcrCrclOgnVluFndsMngVO> selectScrUserGrid05(PrdcrCrclOgnVluFndsMngVO PrdcrCrclOgnVluFndsMngVO);
}
