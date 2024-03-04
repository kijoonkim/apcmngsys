package com.at.apcss.am.wrhs.service;

import java.util.HashMap;
import java.util.List;

import com.at.apcss.am.wrhs.vo.ComRawMtrWrhsDsctnTotVO;
import com.at.apcss.am.wrhs.vo.RawMtrWrhsDsctnTotVO;
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


}
