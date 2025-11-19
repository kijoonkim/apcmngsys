package com.at.apcss.am.wrhs.mapper;

import com.at.apcss.am.wrhs.vo.RawMtrWrhsIgiDtlVO;
import com.at.apcss.am.wrhs.vo.RawMtrWrhsIgiVO;
import com.at.apcss.am.wrhs.vo.SdlngVO;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import java.util.List;


/**
 * 원물입고계획등록 Mapper 인터페이스
 * @author
 * @since 2023.08.08
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.08.08     김호         최초 생성
 * </pre>
 */
@Mapper
public interface RawMtrWrhsIgiMapper {
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
	 * 검수 수정
	 * @param rawMtrWrhsIgiVO
	 * @return
	 * @throws Exception
	 */
	public int deleteRawMtrWrhsIgi(RawMtrWrhsIgiVO rawMtrWrhsIgiVO) throws Exception;

	/**
	 * 검수 상세 등록
	 * @param rawMtrWrhsIgiDtlVO
	 * @return
	 * @throws Exception
	 */
	public int deleteRawMtrWrhsIgiDtl(RawMtrWrhsIgiDtlVO rawMtrWrhsIgiDtlVO) throws Exception;

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
     * 육묘시설기준 목록 수정
     * @param sdlngVO
     * @return
     * @throws Exception
     */
    public int updateSdlngFcltCrtrList(SdlngVO sdlngVO) throws Exception;

    /**
     * 육묘기준 목록 조회
     * @param sdlngVO
     * @return
     * @throws Exception
     */
    public List<SdlngVO> selectSdlngCrtrList(SdlngVO sdlngVO) throws Exception;

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
    public int deleteSdlngCrtrList(SdlngVO sdlngVO) throws Exception;

    /**
     * 육묘장 목록 조회
     * @param sdlngVO
     * @return
     * @throws Exception
     */
    public List<SdlngVO> selectSdlngList(SdlngVO sdlngVO) throws Exception;

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
     * @param sdlngVO
     * @return
     * @throws Exception
     */
    public int deleteSdlngList(SdlngVO sdlngVO) throws Exception;

    /**
     * 재배장 목록 단건 조회
     * @param sdlngVO
     * @return
     * @throws Exception
     */
    public List<SdlngVO> selectCltvtn(SdlngVO sdlngVO) throws Exception;

    /**
     * 재배장 목록 조회
     * @param sdlngVO
     * @return
     * @throws Exception
     */
    public List<SdlngVO> selectCltvtnList(SdlngVO sdlngVO) throws Exception;

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
    public int deleteCltvtnList(SdlngVO sdlngVO) throws Exception;

    /**
     * 계량 목록 단건 조회
     * @param sdlngVO
     * @return
     * @throws Exception
     */
    public List<SdlngVO> selectWgh(SdlngVO sdlngVO) throws Exception;

    /**
     * 계량 목록 조회
     * @param sdlngVO
     * @return
     * @throws Exception
     */
    public List<SdlngVO> selectWghList(SdlngVO sdlngVO) throws Exception;

    /**
     * 계량 목록 개수 조회
     * @param sdlngVO
     * @return
     * @throws Exception
     */
    public int countWghList(SdlngVO sdlngVO) throws Exception;

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
    public int deleteWghList(SdlngVO sdlngVO) throws Exception;

    /**
     * 출고 목록 조회
     * @param sdlngVO
     * @return
     * @throws Exception
     */
    public List<SdlngVO> selectSpmtList(SdlngVO sdlngVO) throws Exception;

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
     * 출고 공통 목록 삭제
     * @param sdlngVO
     * @return
     * @throws Exception
     */
    public int deleteSpmtPrfmncComList(SdlngVO sdlngVO) throws Exception;

    /**
     * 출고 상세 목록 삭제
     * @param sdlngVO
     * @return
     * @throws Exception
     */
    public int deleteSpmtPrfmncDtlList(SdlngVO sdlngVO) throws Exception;
}
