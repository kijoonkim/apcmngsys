package com.at.apcss.am.wrhs.service;

import com.at.apcss.am.wrhs.vo.RawMtrWrhsIgiDtlVO;
import com.at.apcss.am.wrhs.vo.RawMtrWrhsIgiVO;
import com.at.apcss.am.wrhs.vo.SdlngVO;

import java.util.HashMap;
import java.util.List;

/**
 * 원물입고 Service 인터페이스
 * @author 김호
 * @since 2025.07.10
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2025.07.10  김호        최초 생성
 * </pre>
 */
public interface RawMtrWrhsIgiService {
	
	/**
	 * 원물 재처리
	 * @param rawMtrWrhsMngVO
	 * @return
	 * @throws Exception
	 */
	//public HashMap<String, Object> insertRawMtrRePrcs(RawMtrWrhsMngVO rawMtrWrhsMngVO) throws Exception;

	/**
	 * 검수등록 목록 조회
	 * @param rawMtrWrhsIgiVO
	 * @return
	 * @throws Exception
	 */
	public List<RawMtrWrhsIgiVO> selectRawMtrWrhsIgiList(RawMtrWrhsIgiVO rawMtrWrhsIgiVO) throws Exception;


	/**
	 * 검수등록 발번 조회
	 * @param rawMtrWrhsIgiVO
	 * @return
	 * @throws Exception
	 */
	public String selectGetIgiSeq(RawMtrWrhsIgiVO rawMtrWrhsIgiVO) throws Exception;
	/**
	 * 검수 등록
	 * @param rawMtrWrhsIgiVO
	 * @return
	 * @throws Exception
	 */
	public int insertRawMtrWrhsIgi(RawMtrWrhsIgiVO rawMtrWrhsIgiVO) throws Exception;

	/**
	 * 검수 수정
	 * @param rawMtrWrhsIgiVO
	 * @return
	 * @throws Exception
	 */
	public int updateRawMtrWrhsIgi(RawMtrWrhsIgiVO rawMtrWrhsIgiVO) throws Exception;

	/**
	 * 검수 삭제
	 * @param rawMtrWrhsIgiVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> deleteRawMtrWrhsIgi(RawMtrWrhsIgiVO rawMtrWrhsIgiVO) throws Exception;

	/**
	 * 검수 상세 등록
	 * @param rawMtrWrhsIgiDtlVO
	 * @return
	 * @throws Exception
	 */
	public int insertRawMtrWrhsIgiDtl(RawMtrWrhsIgiDtlVO rawMtrWrhsIgiDtlVO) throws Exception;

	/**
	 * 검수 상세 수정
	 * @param rawMtrWrhsIgiDtlVO
	 * @return
	 * @throws Exception
	 */
	public int updateRawMtrWrhsIgiDtl(RawMtrWrhsIgiDtlVO rawMtrWrhsIgiDtlVO) throws Exception;

	/**
	 * 검수 멀티 저장
	 * @param RawMtrWrhsIgiList
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> multiRawMtrWrhsIgiList(List<RawMtrWrhsIgiVO> RawMtrWrhsIgiList) throws Exception;


	/**
	 * 검수등록 누계 조회
	 * @param rawMtrWrhsIgiVO
	 * @return
	 * @throws Exception
	 */
	public List<RawMtrWrhsIgiVO> selectRawMtrWrhsIgiTot(RawMtrWrhsIgiVO rawMtrWrhsIgiVO) throws Exception;

	/**
	 * 생산자 검수 정보 조회
	 * @param rawMtrWrhsIgiVO
	 * @return
	 * @throws Exception
	 */
	public RawMtrWrhsIgiVO selectPrschsPrdcrInfo(RawMtrWrhsIgiVO rawMtrWrhsIgiVO) throws Exception;

	/**
	 * 입고 누계 조회
	 * @param rawMtrWrhsIgiVO
	 * @return
	 * @throws Exception
	 */
	public List<RawMtrWrhsIgiVO> selectRawMtrWghPrmncTotList(RawMtrWrhsIgiVO rawMtrWrhsIgiVO) throws Exception;

    /**
     * 육묘기준 목록 공통 조회
     * @param sdlngVO
     * @return
     * @throws Exception
     */
    public List<SdlngVO> sdlngCrtrInfos(SdlngVO sdlngVO) throws Exception;

    /**
     * 육묘시설 구역 목록 공통 조회
     * @param sdlngVO
     * @return
     * @throws Exception
     */
    public List<SdlngVO> sdlngFcltZoneInfos(SdlngVO sdlngVO) throws Exception;

    /**
     * 육묘시설 열 목록 공통 조회
     * @param sdlngVO
     * @return
     * @throws Exception
     */
    public List<SdlngVO> sdlngFcltRowInfos(SdlngVO sdlngVO) throws Exception;

    /**
     * 육묘기준 목록 조회
     * @param sdlngVO
     * @return
     * @throws Exception
     */
    public List<SdlngVO> selectSdlngCrtrList(SdlngVO sdlngVO) throws Exception;

    /**
     * 육묘기준 목록 저장
     * @param SdlngCrtrList
     * @return
     * @throws Exception
     */
    public HashMap<String, Object> multiSdlngCrtrList(List<SdlngVO> SdlngCrtrList) throws Exception;

    /**
     * 육묘기준 목록 등록
     * @param sdlngVO
     * @return
     * @throws Exception
     */
    public int insertSdlngCrtrList(SdlngVO sdlngVO) throws Exception;

    /**
     * 육묘기준 목록 수정
     * @param sdlngVO
     * @return
     * @throws Exception
     */
    public int updateSdlngCrtrList(SdlngVO sdlngVO) throws Exception;

    /**
     * 육묘기준 목록 삭제
     * @param sdlngVO
     * @return
     * @throws Exception
     */
    public HashMap<String, Object> deleteSdlngCrtrList(SdlngVO sdlngVO) throws Exception;

    /**
     * 육묘장 목록 조회
     * @param sdlngVO
     * @return
     * @throws Exception
     */
    public List<SdlngVO> selectSdlngList(SdlngVO sdlngVO) throws Exception;

    /**
     * 육묘장 목록 저장
     * @param SdlngList
     * @return
     * @throws Exception
     */
    public HashMap<String, Object> multiSdlngList(List<SdlngVO> SdlngList) throws Exception;

    /**
     * 육묘장 목록 등록
     * @param sdlngVO
     * @return
     * @throws Exception
     */
    public int insertSdlngList(SdlngVO sdlngVO) throws Exception;

    /**
     * 육묘장 목록 수정
     * @param sdlngVO
     * @return
     * @throws Exception
     */
    public int updateSdlngList(SdlngVO sdlngVO) throws Exception;

    /**
     * 육묘장 목록 삭제
     * @param SdlngList
     * @return
     * @throws Exception
     */
    public HashMap<String, Object> deleteSdlngList(List<SdlngVO> SdlngList) throws Exception;

    /**
     * 재배장 목록 조회
     * @param sdlngVO
     * @return
     * @throws Exception
     */
    public List<SdlngVO> selectCltvtnList(SdlngVO sdlngVO) throws Exception;

    /**
     * 재배장 목록 저장
     * @param CltvtnList
     * @return
     * @throws Exception
     */
    public HashMap<String, Object> multiCltvtnList(List<SdlngVO> CltvtnList) throws Exception;

    /**
     * 재배장 목록 등록
     * @param sdlngVO
     * @return
     * @throws Exception
     */
    public int insertCltvtnList(SdlngVO sdlngVO) throws Exception;

    /**
     * 재배장 목록 수정
     * @param sdlngVO
     * @return
     * @throws Exception
     */
    public int updateCltvtnList(SdlngVO sdlngVO) throws Exception;

    /**
     * 재배장 목록 삭제
     * @param sdlngVO
     * @return
     * @throws Exception
     */
    public HashMap<String, Object> deleteCltvtnList(SdlngVO sdlngVO) throws Exception;

    /**
     * 계량 목록 조회
     * @param sdlngVO
     * @return
     * @throws Exception
     */
    public List<SdlngVO> selectWghList(SdlngVO sdlngVO) throws Exception;

    /**
     * 계량 목록 저장
     * @param WghList
     * @return
     * @throws Exception
     */
    public HashMap<String, Object> multiWghList(List<SdlngVO> WghList) throws Exception;

    /**
     * 계량 목록 등록
     * @param sdlngVO
     * @return
     * @throws Exception
     */
    public int insertWghList(SdlngVO sdlngVO) throws Exception;

    /**
     * 계량 목록 수정
     * @param sdlngVO
     * @return
     * @throws Exception
     */
    public int updateWghList(SdlngVO sdlngVO) throws Exception;

    /**
     * 수확일자 저장
     * @param sdlngVO
     * @return
     * @throws Exception
     */
    public int saveHrvstYmd(SdlngVO sdlngVO) throws Exception;

    /**
     * 계량 목록 삭제
     * @param sdlngVO
     * @return
     * @throws Exception
     */
    public HashMap<String, Object> deleteWghList(SdlngVO sdlngVO) throws Exception;

    /**
     * 출고 목록 조회
     * @param sdlngVO
     * @return
     * @throws Exception
     */
    public List<SdlngVO> selectSpmtList(SdlngVO sdlngVO) throws Exception;

    /**
     * 출고 목록 저장
     * @param SpmtList
     * @return
     * @throws Exception
     */
    public HashMap<String, Object> multiSpmtList(List<SdlngVO> SpmtList) throws Exception;

    /**
     * 출고 공통 목록 등록
     * @param sdlngVO
     * @return
     * @throws Exception
     */
    public int insertSpmtPrfmncComList(SdlngVO sdlngVO) throws Exception;

    /**
     * 출고 상세 목록 등록
     * @param sdlngVO
     * @return
     * @throws Exception
     */
    public int insertSpmtPrfmncDtlList(SdlngVO sdlngVO) throws Exception;

    /**
     * 출고 공통 목록 수정
     * @param sdlngVO
     * @return
     * @throws Exception
     */
    public int updateSpmtPrfmncComList(SdlngVO sdlngVO) throws Exception;

    /**
     * 출고 상세 목록 수정
     * @param sdlngVO
     * @return
     * @throws Exception
     */
    public int updateSpmtPrfmncDtlList(SdlngVO sdlngVO) throws Exception;

    /**
     * 출고 목록 삭제
     * @param SpmtList
     * @return
     * @throws Exception
     */
    public HashMap<String, Object> deleteSpmtList(List<SdlngVO> SpmtList) throws Exception;
}
