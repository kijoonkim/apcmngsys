package com.at.apcss.am.wrhs.service;

import java.util.HashMap;
import java.util.List;

import com.at.apcss.am.cmns.vo.PrdcrVO;
import com.at.apcss.am.invntr.vo.PltWrhsSpmtVO;
import com.at.apcss.am.wrhs.vo.ComRawMtrWrhsDsctnTotVO;
import com.at.apcss.am.wrhs.vo.RawMtrWrhsDsctnTotVO;
import com.at.apcss.am.wrhs.vo.RawMtrWrhsSmmryVO;
import com.at.apcss.am.wrhs.vo.RawMtrWrhsVO;

/**
 * 원물입고 Service 인터페이스
 * @author 신정철
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21  신정철        최초 생성
 * </pre>
 */
public interface RawMtrWrhsService {

	/**
	 * 원물입고 단건 조회
	 * @param rawMtrWrhsVO
	 * @return
	 * @throws Exception
	 */
	public RawMtrWrhsVO selectRawMtrWrhs(RawMtrWrhsVO rawMtrWrhsVO) throws Exception;

	/**
	 * 원물입고 목록 조회
	 * @param rawMtrWrhsVO
	 * @return
	 * @throws Exception
	 */
	public List<RawMtrWrhsVO> selectRawMtrWrhsList(RawMtrWrhsVO rawMtrWrhsVO) throws Exception;

	/**
	 * 파프리카입고내역집계 목록 조회
	 * @param rawMtrWrhsVO
	 * @return
	 * @throws Exception
	 */
	public List<RawMtrWrhsDsctnTotVO> selectDsctnTotList(RawMtrWrhsDsctnTotVO rawMtrWrhsVO) throws Exception;

	/**
	 * 입고내역집계(공통) 목록 조회
	 * @param rawMtrWrhsVO
	 * @return
	 * @throws Exception
	 */
	public List<ComRawMtrWrhsDsctnTotVO> selectComDsctnTotList(ComRawMtrWrhsDsctnTotVO rawMtrWrhsVO) throws Exception;

	/**
	 * 원물입고 등록
	 * @param rawMtrWrhsVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertRawMtrWrhs(RawMtrWrhsVO rawMtrWrhsVO) throws Exception;

	/**
	 * 원물입고 등록
	 * @param rawMtrWrhsVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertRawMtrWrhsList(List<RawMtrWrhsVO> rawMtrWrhsList) throws Exception;

	/**
	 * 계량번호를 통한 원물입고 등록
	 * @param rawMtrWrhsVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertRawMtrWrhsByWghno(RawMtrWrhsVO rawMtrWrhsVO) throws Exception;

	/**
	 * 원물입고 변경
	 * @param rawMtrWrhsVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> updateRawMtrWrhs(RawMtrWrhsVO rawMtrWrhsVO) throws Exception;

	/**
	 * 원물입고 삭제
	 * @param rawMtrWrhsVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> deleteRawMtrWrhs(RawMtrWrhsVO rawMtrWrhsVO) throws Exception;

	/**
	 * 원물입고 목록 삭제
	 * @param rawMtrWrhsVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> deleteRawMtrWrhsList(List<RawMtrWrhsVO> rawMtrWrhsList) throws Exception;

	/**
	 * 원물입고 삭제 - by 계량번호
	 * @param rawMtrWrhsVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> deleteRawMtrWrhsByWghno(RawMtrWrhsVO rawMtrWrhsVO) throws Exception;


	/**
	 * 입고실적 목록 조회
	 *
	 * @param selectRawMtrWrhsPrfmncList
	 * @return
	 * @throws Exception
	 */
	public List<RawMtrWrhsVO> selectRawMtrWrhsPrfmncList(RawMtrWrhsVO rawMtrWrhsVO) throws Exception;


	/**
	 * 원물 재처리 등록
	 * @param rawMtrWrhsVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertRawMtrRePrcs(RawMtrWrhsVO rawMtrWrhsVO) throws Exception;

	/**
	 * 원물 재처리 취소
	 * @param rawMtrWrhsVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> deleteRawMtrRePrcs(RawMtrWrhsVO rawMtrWrhsVO) throws Exception;

	/**
	 * 원물 재처리 투입 등록
	 * @param rawMtrWrhsVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertRawMtrPrcsInpt(RawMtrWrhsVO rawMtrWrhsVO) throws Exception;

	/**
	 * 원물 재처리 투입 취소
	 * @param rawMtrWrhsVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> deleteRawMtrPrcsInpt(RawMtrWrhsVO rawMtrWrhsVO) throws Exception;


	/**
	 * 원물입고 재처리 목록 조회
	 * @param rawMtrWrhsVO
	 * @return
	 * @throws Exception
	 */
	public List<RawMtrWrhsVO> selectRawMtrPrcsList(RawMtrWrhsVO rawMtrWrhsVO) throws Exception;

	/**
	 * 원물입고 재처리 투입 목록 조회
	 * @param rawMtrWrhsVO
	 * @return
	 * @throws Exception
	 */
	public List<RawMtrWrhsVO> selectRawMtrPrcsInptList(RawMtrWrhsVO rawMtrWrhsVO) throws Exception;

	/**
	 * 원물입고요약 단건 조회
	 * @param rawMtrWrhsSmmryVO
	 * @return
	 * @throws Exception
	 */
	public RawMtrWrhsSmmryVO selectRawMtrWrhsSmmry(RawMtrWrhsSmmryVO rawMtrWrhsSmmryVO) throws Exception;

	/**
	 * 원물입고요약 목록 조회
	 * @param rawMtrWrhsSmmryVO
	 * @return
	 * @throws Exception
	 */
	public List<RawMtrWrhsSmmryVO> selectRawMtrWrhsSmmryList(RawMtrWrhsSmmryVO rawMtrWrhsSmmryVO) throws Exception;

	/**
	 * 원물입고요약 집계 목록 조회
	 * @param rawMtrWrhsSmmryVO
	 * @return
	 * @throws Exception
	 */
	public List<RawMtrWrhsSmmryVO> selectRawMtrWrhsSmmryTotalList(RawMtrWrhsSmmryVO rawMtrWrhsSmmryVO) throws Exception;

	/**
	 * 원물입고요약 등록
	 * @param rawMtrWrhsSmmryVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertRawMtrWrhsSmmry(RawMtrWrhsSmmryVO rawMtrWrhsSmmryVO) throws Exception;

	/**
	 * 원물입고요약 등록
	 * @param rawMtrWrhsSmmryVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertRawMtrWrhsSmmryList(List<RawMtrWrhsSmmryVO> rawMtrWrhsSmmryList) throws Exception;


	/**
	 * 원물입고요약 변경
	 * @param rawMtrWrhsSmmryVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> updateRawMtrWrhsSmmry(RawMtrWrhsSmmryVO rawMtrWrhsSmmryVO) throws Exception;

	/**
	 * 원물입고요약 삭제
	 * @param rawMtrWrhsSmmryVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> deleteRawMtrWrhsSmmry(RawMtrWrhsSmmryVO rawMtrWrhsSmmryVO) throws Exception;

	/**
	 * 원물입고요약 목록 삭제
	 * @param rawMtrWrhsSmmryVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> deleteRawMtrWrhsSmmryList(List<RawMtrWrhsSmmryVO> rawMtrWrhsSmmryList) throws Exception;

	/**
	 * 원물입고등록 모바일 등록 최근 3건 조회
	 * @param rawMtrWrhsVO
	 * @return
	 * @throws Exception
	 */
    List<RawMtrWrhsVO> selectRawMtrWrhsLatestInfoList(RawMtrWrhsVO rawMtrWrhsVO) throws Exception;

	/**
	 * 모바일 원물입고 목록 조회
	 * @param rawMtrWrhsVO
	 * @return
	 * @throws Exception
	 */
	public List<RawMtrWrhsVO> selectMblRawMtrWrhsList(RawMtrWrhsVO rawMtrWrhsVO) throws Exception;

	/**
	 * 지우농업법인 거래명세표 조회여부 확인.
	 * @param rawMtrWrhsVO
	 * @return
	 * @throws Exception
	 */
	public int updateRawMtrWrhsInq(RawMtrWrhsVO rawMtrWrhsVO) throws Exception;

	public HashMap<String, Object> insertRawMtrWrhsListJiwoo(List<RawMtrWrhsVO> rawMtrWrhsList) throws Exception;
	public HashMap<String, Object> deleteRawMtrWrhsJiwoo(RawMtrWrhsVO rawMtrWrhsVO) throws Exception;
	/**
	 * 입고번호 단순 발행.
	 * @param rawMtrWrhsVO
	 * @return
	 * @throws Exception
	 */
    String selectWrhsno(RawMtrWrhsVO rawMtrWrhsVO) throws Exception;
	/**
	 * 팔레트번호 단순 발행.
	 * @param rawMtrWrhsVO
	 * @return
	 * @throws Exception
	 */
    String selectPltno(RawMtrWrhsVO rawMtrWrhsVO) throws Exception;
	/**
	 * 입고간편등록 팔레트번호단일 및 팔레트,박스 반출입 정보생성
	 * @param rawMtrWrhsList,pltWrhsSpmtVO
	 * @return
	 * @throws Exception
	 */
    int insertRawMtrWrhsListAndPlt(List<RawMtrWrhsVO> rawMtrWrhsList, List<PltWrhsSpmtVO> pltWrhsSpmtVO)throws Exception;
	/**
	 * 원물입고정보 조회 pltno :1 <> spmt :N
	 * @param rawMtrWrhsVO
	 * @return
	 * @throws Exception
	 */
	List<RawMtrWrhsVO> selectRawMtrWrhsToPltno(RawMtrWrhsVO rawMtrWrhsVO) throws Exception;
	/**
	 * 딸기입고 수정
	 * @param rawMtrWrhsList,pltWrhsSpmtList
	 * @return
	 * @throws Exception
	 */
	int updateRawMtrWrhsListAndPlt(List<RawMtrWrhsVO> rawMtrWrhsList, List<PltWrhsSpmtVO> pltWrhsSpmtList)throws Exception;
	/**
	 * 생산자 입고실적 이력 품종코드
	 * @param prdcrVO
	 * @return
	 * @throws Exception
	 */
	List<String> selectVrtyHistoryByPrdcr(PrdcrVO prdcrVO) throws Exception;
}
