package com.at.apcss.am.wgh.service;

import java.util.HashMap;
import java.util.List;

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
	 * 계량실적 변경
	 * @param wghPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> updateWghPrfmnc(WghPrfmncVO wghPrfmncVO) throws Exception;

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

}
