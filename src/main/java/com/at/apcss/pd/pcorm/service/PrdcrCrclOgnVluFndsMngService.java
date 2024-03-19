package com.at.apcss.pd.pcorm.service;

import java.util.List;

import com.at.apcss.pd.pcorm.vo.PrdcrCrclOgnVluFndsMngVO;


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
public interface PrdcrCrclOgnVluFndsMngService {

	/**
	 * 평가지표 리스트 조회한다.
	 * @param prdcrCrclOgnVluFndsMngVO
	 * @return
	 * @throws Exception
	 */
	public List<PrdcrCrclOgnVluFndsMngVO> selectScoreList1(PrdcrCrclOgnVluFndsMngVO prdcrCrclOgnVluFndsMngVO) throws Exception;

	/**
	 * 가감점 리스트 조회한다.
	 * @param prdcrCrclOgnVluFndsMngVO
	 * @return
	 * @throws Exception
	 */
	public List<PrdcrCrclOgnVluFndsMngVO> selectScoreList2(PrdcrCrclOgnVluFndsMngVO prdcrCrclOgnVluFndsMngVO) throws Exception;

	/**
	 * 평가지표,가감점 단건 저장
	 * @param prdcrCrclOgnVluFndsMngVO
	 * @return
	 * @throws Exception
	 */
	public int insertActvtnFund(PrdcrCrclOgnVluFndsMngVO PrdcrCrclOgnVluFndsMngVO) throws Exception;
	/**
	 * 평가지표,가감점 리스트 저장
	 * @param prdcrCrclOgnVluFndsMngVO
	 * @return
	 * @throws Exception
	 */
	public int multiSaveActvtnFundList(List<PrdcrCrclOgnVluFndsMngVO> PrdcrCrclOgnVluFndsMngVOList) throws Exception;



	/**
	 * 산출식 관리 팝업 - 산출식 리스트 조회
	 * @param prdcrCrclOgnVluFndsMngVO
	 * @return
	 * @throws Exception
	 */
	public List<PrdcrCrclOgnVluFndsMngVO> selectComputWayList(PrdcrCrclOgnVluFndsMngVO prdcrCrclOgnVluFndsMngVO) throws Exception;
	/**
	 * 산출식 관리 팝업 - 산출식 단건 저장
	 * @param prdcrCrclOgnVluFndsMngVO
	 * @return
	 * @throws Exception
	 */
	public int insertComputWay(PrdcrCrclOgnVluFndsMngVO PrdcrCrclOgnVluFndsMngVO) throws Exception;
	/**
	 * 산출식 관리 팝업 - 산출식 리스트 리스트 저장
	 * @param prdcrCrclOgnVluFndsMngVO
	 * @return
	 * @throws Exception
	 */
	public int multiSaveComputWayList(List<PrdcrCrclOgnVluFndsMngVO> PrdcrCrclOgnVluFndsMngVOList) throws Exception;


	/**
	 * 활성화자금 로우데이터 조회
	 * @param prdcrCrclOgnVluFndsMngVO
	 * @return
	 * @throws Exception
	 */
	public List<PrdcrCrclOgnVluFndsMngVO> selectScrDataList(PrdcrCrclOgnVluFndsMngVO prdcrCrclOgnVluFndsMngVO) throws Exception;

	/**
	 * 활성화자금 기준 로우데이터 조회
	 * @param prdcrCrclOgnVluFndsMngVO
	 * @return
	 * @throws Exception
	 */
	public List<PrdcrCrclOgnVluFndsMngVO> selectRtDataList(PrdcrCrclOgnVluFndsMngVO prdcrCrclOgnVluFndsMngVO) throws Exception;



	/**
	 * 사용자용 평가지표 조회
	 * @param PrdcrCrclOgnVluFndsMngVO
	 * @return List<PrdcrCrclOgnVluFndsMngVO>
	 * @throws Exception
	 */
	public List<PrdcrCrclOgnVluFndsMngVO> selectScrUserGrid01(PrdcrCrclOgnVluFndsMngVO PrdcrCrclOgnVluFndsMngVO) throws Exception;

	/**
	 * 사용자용 가감점 조회
	 * @param PrdcrCrclOgnVluFndsMngVO
	 * @return List<PrdcrCrclOgnVluFndsMngVO>
	 * @throws Exception
	 */
	public List<PrdcrCrclOgnVluFndsMngVO> selectScrUserGrid02(PrdcrCrclOgnVluFndsMngVO PrdcrCrclOgnVluFndsMngVO) throws Exception;

	/**
	 * 사용자용 통합조직 선정여부 조회
	 * @param PrdcrCrclOgnVluFndsMngVO
	 * @return List<PrdcrCrclOgnVluFndsMngVO>
	 * @throws Exception
	 */
	public List<PrdcrCrclOgnVluFndsMngVO> selectScrUserGrid03(PrdcrCrclOgnVluFndsMngVO PrdcrCrclOgnVluFndsMngVO) throws Exception;

	/**
	 * 사용자용 출자출하조직 선정여부 조회
	 * @param PrdcrCrclOgnVluFndsMngVO
	 * @return List<PrdcrCrclOgnVluFndsMngVO>
	 * @throws Exception
	 */
	public List<PrdcrCrclOgnVluFndsMngVO> selectScrUserGrid04(PrdcrCrclOgnVluFndsMngVO PrdcrCrclOgnVluFndsMngVO) throws Exception;

	/**
	 * 사용자용 최종 점수 조회
	 * @param PrdcrCrclOgnVluFndsMngVO
	 * @return List<PrdcrCrclOgnVluFndsMngVO>
	 * @throws Exception
	 */
	public List<PrdcrCrclOgnVluFndsMngVO> selectScrUserGrid05(PrdcrCrclOgnVluFndsMngVO PrdcrCrclOgnVluFndsMngVO) throws Exception;
}
