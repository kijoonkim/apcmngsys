package com.at.apcss.am.pckg.service;

import java.util.HashMap;
import java.util.List;

import com.at.apcss.am.pckg.vo.PckgPrfmncVO;

/**
 * 포장실적 Service 인터페이스
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
public interface PckgPrfmncService {
	
	/**
	 * 포장실적 단건 조회
	 * @param pckgPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public PckgPrfmncVO selectPckgPrfmnc(PckgPrfmncVO pckgPrfmncVO) throws Exception;

	/**
	 * 포장실적 목록 조회
	 * @param pckgPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public List<PckgPrfmncVO> selectPckgPrfmncList(PckgPrfmncVO pckgPrfmncVO) throws Exception;

	/**
	 * 포장실적 등록
	 * @param pckgPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertPckgPrfmnc(PckgPrfmncVO pckgPrfmncVO) throws Exception;
	
	/**
	 * 포장실적 목록 등록
	 * @param pckgPrfmncList
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertPckgPrfmncList(List<PckgPrfmncVO> pckgPrfmncList) throws Exception;
	

	/**
	 * 포장실적 변경
	 * @param pckgPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> updatePckgPrfmnc(PckgPrfmncVO pckgPrfmncVO) throws Exception;

	/**
	 * 포장실적 삭제
	 * @param pckgPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> deletePckgPrfmnc(PckgPrfmncVO pckgPrfmncVO) throws Exception;
	
	/**
	 * 포장실적 목록 삭제
	 * @param pckgPrfmncList
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> deletePckgPrfmncList(List<PckgPrfmncVO> pckgPrfmncList) throws Exception;
	
	
	
}
