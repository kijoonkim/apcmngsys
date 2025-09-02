package com.at.apcss.pd.pcm.service;

import java.util.List;

import com.at.apcss.pd.pcm.vo.PrfmncChckMngVO;


/**
 * 승인형조직 총취급액 실적점검 Service 인터페이스
 * @author ljw
 * @since 2024.10.24
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.10.24  ljw        최초 생성
 * </pre>
 */

public interface PrfmncChckMngService {

	/**
	 * 승인형 조직을 조회 한다.
	 * @param PrfmncChckMngVO
	 * @return PrfmncChckMngVO
	 * @throws Exception
	 */
	public PrfmncChckMngVO selectUoAprv (PrfmncChckMngVO PrfmncChckMngVO) throws Exception;

	/**
	 * 승인형 조직 리스트를 조회 한다.
	 * @param PrfmncChckMngVO
	 * @return PrfmncChckMngVO
	 * @throws Exception
	 */
	public List<PrfmncChckMngVO> selectUoAprvList(PrfmncChckMngVO PrfmncChckMngVO) throws Exception;

	/**
	 * 승인형 조직 총취급 실적 리스트를 조회 한다.
	 * @param PrfmncChckMngVO
	 * @return List<PrfmncChckMngVO>
	 * @throws Exception
	 */
	public List<PrfmncChckMngVO> selectPrfmncChckMngList(PrfmncChckMngVO PrfmncChckMngVO) throws Exception;

	/**
	 * 승인형 조직 총취급 실적을 저장 한다.
	 * @param PrfmncChckMngVO
	 * @return int
	 * @throws Exception
	 */
	public int insertPrfmncChckMng (PrfmncChckMngVO PrfmncChckMngVO) throws Exception;

	/**
	 * 승인형 조직 총취급 실적 리스트를 저장 한다.
	 * @param PrfmncChckMngVO
	 * @return int
	 * @throws Exception
	 */
	public int multiSavePrfmncChckMngList (List<PrfmncChckMngVO> PrfmncChckMngVOList) throws Exception;

	/**
	 * 승인형 실적점검관리 로우데이터 조회
	 * @param prfmncChckMngVO
	 * @return List<PrfmncChckMngVO>
	 * @throws Exception
	 */
    public List<PrfmncChckMngVO> selectPrfmncChckRawData(PrfmncChckMngVO prfmncChckMngVO);
}
