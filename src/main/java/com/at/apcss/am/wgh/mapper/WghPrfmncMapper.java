package com.at.apcss.am.wgh.mapper;

import java.util.HashMap;
import java.util.List;

import com.at.apcss.am.wgh.vo.WghFcltVO;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.am.wgh.vo.WghPrfmncDtlVO;
import com.at.apcss.am.wgh.vo.WghPrfmncVO;

/**
 * 계량실적 Mapper 인터페이스
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
@Mapper
public interface WghPrfmncMapper {


	/**
	 * 계량실적정보 목록 조회
	 * @param wghPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public List<WghPrfmncVO> selectWghPrfmncList(WghPrfmncVO wghPrfmncVO) throws Exception;

	/**
	 * 계량실적 공통 단건 조회
	 * @param wghPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public WghPrfmncVO selectWghPrfmncCom(WghPrfmncVO wghPrfmncVO) throws Exception;

	/**
	 * 계량실적 공통 목록 조회
	 * @param wghPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public List<WghPrfmncVO> selectWghPrfmncComList(WghPrfmncVO wghPrfmncVO) throws Exception;

	/**
	 * 계량실적 공통 등록
	 * @param wghPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public int insertWghPrfmncCom(WghPrfmncVO wghPrfmncVO) throws Exception;

	/**
	 * 계량실적 공통변경
	 * @param wghPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public int updateWghPrfmncCom(WghPrfmncVO wghPrfmncVO) throws Exception;

	/**
	 * 계량실적 공통 삭제
	 * @param wghPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public int deleteWghPrfmncCom(WghPrfmncVO wghPrfmncVO) throws Exception;



	/** 상세 **/

	/**
	 * 계량실적 상세 단건 조회
	 * @param wghPrfmncDtlVO
	 * @return
	 * @throws Exception
	 */
	public WghPrfmncDtlVO selectWghPrfmncDtl(WghPrfmncDtlVO wghPrfmncDtlVO) throws Exception;

	/**
	 * 계량실적 상세 목록 조회
	 * @param wghPrfmncDtlVO
	 * @return
	 * @throws Exception
	 */
	public List<WghPrfmncDtlVO> selectWghPrfmncDtlList(WghPrfmncDtlVO wghPrfmncDtlVO) throws Exception;

	/**
	 * 계량실적 상세 등록
	 * @param wghPrfmncDtlVO
	 * @return
	 * @throws Exception
	 */
	public int insertWghPrfmncDtl(WghPrfmncDtlVO wghPrfmncDtlVO) throws Exception;

	/**
	 * 계량실적 상세 변경
	 * @param wghPrfmncDtlVO
	 * @return
	 * @throws Exception
	 */
	public int updateWghPrfmncDtl(WghPrfmncDtlVO wghPrfmncDtlVO) throws Exception;

	/**
	 * 계량실적 상세 삭제
	 * @param wghPrfmncDtlVO
	 * @return
	 * @throws Exception
	 */
	public int deleteWghPrfmncDtl(WghPrfmncDtlVO wghPrfmncDtlVO) throws Exception;


	/**
	 * 계량실적 공통 삭제 : set delYn 'Y'
	 * @param wghPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public int updateWghPrfmncComForDelY(WghPrfmncVO wghPrfmncVO) throws Exception;

	/**
	 * 계량실적 상세 삭제 : set delYn 'Y'
	 * @param wghPrfmncDtlVO
	 * @return
	 * @throws Exception
	 */
	public int updateWghPrfmncDtlForDelY(WghPrfmncDtlVO wghPrfmncDtlVO) throws Exception;

	/**
	 * 계량정보관리 입고 목록 조회
	 * @param wghPrfmncVO
	 * @return List<WghPrfmncVO>
	 * @throws Exception
	 */
	public List<WghPrfmncVO> selectWghInfoWrhsMngList(WghPrfmncVO wghPrfmncVO) throws Exception;

	/**
	 * 계량정보관리 출고 목록 조회
	 * @param wghPrfmncVO
	 * @return List<WghPrfmncVO>
	 * @throws Exception
	 */
	public List<WghPrfmncVO> selectWghInfoSpmtMngList(WghPrfmncVO wghPrfmncVO) throws Exception;

	/**
	 * 저장위치 변경
	 * @param WghPrfmncVO
	 * @return Integer
	 * @throws Exception
	 */
	public int updateStrgLoctnCd(WghPrfmncVO wghPrfmncVO) throws Exception;

	/**
	 * 감량율변경 변경
	 * @param WghPrfmncVO
	 * @return Integer
	 * @throws Exception
	 */
	public int updateRdcdRt(WghPrfmncVO wghPrfmncVO) throws Exception;

	/**
	 * 계량접수등록 입고 목록 조회
	 * @param wghPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public List<WghPrfmncVO> selectWghRcptWrhsList(WghPrfmncVO wghPrfmncVO) throws Exception;
	/**
	 * 계량접수등록 입고 상세 목록 조회
	 * @param wghPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public List<WghPrfmncVO> selectWghRcptWrhsDtlList(WghPrfmncVO wghPrfmncVO) throws Exception;
	/**
	 * 계량접수등록 출고 목록 조회
	 * @param wghPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public List<WghPrfmncVO> selectWghRcptSpmtList(WghPrfmncVO wghPrfmncVO) throws Exception;
	/**
	 * 계량접수등록 출고 상세 목록 조회
	 * @param wghPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public List<WghPrfmncVO> selectWghRcptSpmtDtlList(WghPrfmncVO wghPrfmncVO) throws Exception;
	/**
	 * 원물계량 정보 조회
	 * @param wghPrfmnc
	 * @return List<HashMap<String, Object>>
	 * @throws Exception
	 */
    List<HashMap<String, Object>> selectMultiWghPrfmncList(WghPrfmncVO wghPrfmnc) throws Exception;
	/**
	 * 계량대 목록 조회
	 * @param wghFcltVO
	 * @return
	 * @throws Exception
	 */
    List<WghFcltVO> selectWghFclt(WghFcltVO wghFcltVO) throws Exception;


    /**
	 * 원물입차등록
	 * @param wghFcltVO
	 * @return
	 * @throws Exception
	 */
    public int insertWghVhcl(WghPrfmncVO wghPrfmncVO);

    /**
	 * 원물입차수정
	 * @param wghFcltVO
	 * @return
	 * @throws Exception
	 */
    public int updateWghVhcl(WghPrfmncVO wghPrfmncVO);

    /**
	 * 원물입차삭제
	 * @param wghFcltVO
	 * @return
	 * @throws Exception
	 */
    public int deleteWghVhcl(WghPrfmncVO wghPrfmncVO) throws Exception;

    /**
	 * 원물입차 목록 조회
	 * @param wghFcltVO
	 * @return
	 * @throws Exception
	 */
    List<WghPrfmncVO> selectWghVhclList(WghPrfmncVO wghFcltVO) throws Exception;

    /**
	 * 원물입차 단건 조회
	 * @param wghFcltVO
	 * @return
	 * @throws Exception
	 */
    WghPrfmncVO selectWghVhcl(WghPrfmncVO wghFcltVO);

}
