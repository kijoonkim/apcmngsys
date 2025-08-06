package com.at.apcss.am.wgh.service;

import java.util.HashMap;
import java.util.List;

import com.at.apcss.am.invntr.vo.PltWrhsSpmtVO;
import com.at.apcss.am.spmt.vo.SpmtPrfmncComVO;
import com.at.apcss.am.spmt.vo.SpmtPrfmncVO;
import com.at.apcss.am.wgh.vo.WghHstryVO;
import com.at.apcss.am.wgh.vo.WghInspPrfmncVO;
import com.at.apcss.am.wgh.vo.WghPrfmncDtlVO;
import com.at.apcss.am.wgh.vo.WghPrfmncVO;

/**
 * 계량실적관리 Service 인터페이스
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
public interface WghPrfmncService {

	/**
	 * 계량실적 단건 조회
	 * @param wghPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public WghPrfmncVO selectWghPrfmnc(WghPrfmncVO wghPrfmncVO) throws Exception;

	/**
	 * 계량실적 목록 조회
	 * @param wghPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public List<WghPrfmncVO> selectWghPrfmncList(WghPrfmncVO wghPrfmncVO) throws Exception;

	/**
	 * 계량실적 등록
	 * @param wghPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertWghPrfmnc(WghPrfmncVO wghPrfmncVO) throws Exception;

	/**
	 * 계량실적 등록
	 * @param wghPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertWghVhclPrfmnc(WghPrfmncVO wghPrfmncVO) throws Exception;

	/**
	 * 계량실적 변경
	 * @param wghPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> updateWghPrfmnc(WghPrfmncVO wghPrfmncVO) throws Exception;

	/**
	 * 계량실적 변경
	 * @param wghPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> updateWghVhclPrfmnc(WghPrfmncVO wghPrfmncVO) throws Exception;

	/**
	 * 계량실적 삭제
	 * @param wghPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> deleteWghPrfmnc(WghPrfmncVO wghPrfmncVO) throws Exception;

	/**
	 * 계량실적 목록 삭제
	 * @param wghPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> deleteWghPrfmncList(List<WghPrfmncVO> wghPrfmncList) throws Exception;


	/**
	 * 계량실적 상세 단건 조회
	 * @param wghPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public WghPrfmncDtlVO selectWghPrfmncDtl(WghPrfmncDtlVO wghPrfmncDtlVO) throws Exception;

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
	 * 계량실적 상세 목록 조회
	 * @param wghPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public List<WghPrfmncDtlVO> selectWghPrfmncDtlList(WghPrfmncDtlVO wghPrfmncDtlVO) throws Exception;

	/**
	 * 계량실적 상세 등록
	 * @param wghPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertWghPrfmncDtl(WghPrfmncDtlVO wghPrfmncDtlVO) throws Exception;

	/**
	 * 계량실적 상세 변경
	 * @param wghPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> updateWghPrfmncDtl(WghPrfmncDtlVO wghPrfmncDtlVO) throws Exception;

	/**
	 * 계량실적 상세 삭제
	 * @param wghPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> deleteWghPrfmncDtl(WghPrfmncDtlVO wghPrfmncDtlVO) throws Exception;

	/**
	 * 저장위치 및 감량율 목록 변경
	 * @param List<WghPrfmncVO>
	 * @return HashMap<String, Object>
	 * @throws Exception
	 */
	public HashMap<String, Object> updateStrgLoctnCdList(List<WghPrfmncVO> wghPrfmncList) throws Exception;

	/**
	 * 저장위치 변경
	 * @param List<WghPrfmncVO>
	 * @return HashMap<String, Object>
	 * @throws Exception
	 */
	public HashMap<String, Object> updateStrgLoctnCd(WghPrfmncVO wghPrfmncVO) throws Exception;

	/**
	 * 감량율 변경
	 * @param List<WghPrfmncVO>
	 * @return HashMap<String, Object>
	 * @throws Exception
	 */
	public HashMap<String, Object> updateRdcdRt(WghPrfmncVO wghPrfmncVO) throws Exception;

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
	 * 계량접수 다중 저장
	 * @param List<WghPrfmncVO>
	 * @return HashMap<String, Object>
	 * @throws Exception
	 */
	public HashMap<String, Object> multiWghPrfmncList(List<WghPrfmncVO> wghPrfmncList) throws Exception;
	public HashMap<String, Object> multiWghPrfmncList(List<WghPrfmncVO> wghPrfmncList, List<PltWrhsSpmtVO> pltWrhsSpmtList, List<WghHstryVO> wghHstryVOList, List<WghInspPrfmncVO> wghInspPrfmncVOList) throws Exception;
	/**
	 * 원물계량 정보 조회
	 * @param wghPrfmnc
	 * @return List<HashMap<String, Object>>
	 * @throws Exception
	 */
    List<HashMap<String, Object>> selectMultiWghPrfmncList(WghPrfmncVO wghPrfmnc)throws Exception;


    /**
	 * 원물입차등록
	 * @param wghPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public int insertWghEntrVhcl(WghPrfmncVO wghPrfmncVO) throws Exception;
    /**
	 * 원물입차삭제
	 * @param wghPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public int deleteWghEntrVhcl(WghPrfmncVO wghPrfmncVO) throws Exception;

	/**
	 * 원물입차 조회
	 * @param wghPrfmnc
	 * @return List<WghPrfmncVO>
	 * @throws Exception
	 */
    List<WghPrfmncVO> selectWghEntrVhclList(WghPrfmncVO wghPrfmnc)throws Exception;


    /**
	 * 원물출차등록
	 * @param wghPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public int insertWghOutVhcl(WghPrfmncVO wghPrfmncVO) throws Exception;

	/**
	 * 원물계량정보관리
	 * @param wghPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public int saveWghVhclInfo(List<WghPrfmncVO> wghPrfmncVO) throws Exception;

	/**
	 * 계량검사실적 조회
	 * @param wghInspPrfmncVO
	 * @return
	 * @throws Exception
	 */
    List<WghInspPrfmncVO> selectWghInspPrfmncList(WghInspPrfmncVO wghInspPrfmncVO) throws Exception;

	/**
	 * 원물계량실적 삭제 및 검품등급 삭제
	 * @param wghPrfmncVO
	 * @param wghInspPrfmncVOList
	 * @return
	 */
	HashMap<String, Object> deleteWghPrfmncInspList(WghPrfmncVO wghPrfmncVO, List<WghInspPrfmncVO> wghInspPrfmncVOList, List<PltWrhsSpmtVO> pltWrhsSpmtVOList) throws Exception;
	/**
	 * 계량이력 조회 for wghno
	 * @param wghHstryVO
	 * @return List<WghHstryVO>
	 */
	List<WghHstryVO> selectWghHstryList(WghHstryVO wghHstryVO) throws Exception;

	/**
	 * 출하실적등록(계량) - 계량목록 조회
	 * @param wghPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public List<WghPrfmncVO> selectWghPrfmncListForSpmtReg(WghPrfmncVO wghPrfmncVO) throws Exception;

	/**
	 * 출하실적등록(계량) - 계량정보 조회
	 * @param wghPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public List<WghPrfmncVO> selectWghInfoForSpmtReg(WghPrfmncVO wghPrfmncVO) throws Exception;

	/**
	 * 출하실적등록(계량) - 재고조회
	 * @param wghPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public List<WghPrfmncVO> selectInvntrListForSpmtReg(WghPrfmncVO wghPrfmncVO) throws Exception;

	/**
	 * 출하실적등록(계량) - 재고상세조회
	 * @param wghPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public List<WghPrfmncVO> selectInvntrDtlListForSpmtReg(WghPrfmncVO wghPrfmncVO) throws Exception;

	/**
	 * 출하실적등록(계량) - 출하등록
	 * @param spmtPrfmncComVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertSpmtPrfmncByWgh(SpmtPrfmncComVO spmtPrfmncComVO) throws Exception;

	/**
	 * 출하실적등록(계량) - 출하취소
	 * @param spmtPrfmncList
	 * @return
	 * @throws Exception
	 */
    public HashMap<String, Object> deleteSpmtPrfmncList(List<SpmtPrfmncComVO> spmtPrfmncList) throws Exception;

	/**
	 * 계량정보관리 출고
	 * @param wghPrfmncList
	 * @return
	 * @throws Exception
	 */
    public HashMap<String, Object> updateWghInfoDtlList(List<WghPrfmncVO> wghPrfmncList) throws Exception;
}
