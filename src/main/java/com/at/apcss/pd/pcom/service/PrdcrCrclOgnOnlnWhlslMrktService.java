package com.at.apcss.pd.pcom.service;

import java.util.List;

import com.at.apcss.pd.pcom.vo.PrdcrCrclOgnOnlnWhlslMrktVO;


/**
 * 온라인도매시장 판매목표 Service 인터페이스
 * @author ljw
 * @since 2025.01.07
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2025.01.07  ljw        최초 생성
 * </pre>
 */
public interface PrdcrCrclOgnOnlnWhlslMrktService {

	/**
	 * 온라인도매시장 판매목표 정보를 조회한다.
	 * @param PrdcrCrclOgnOnlnWhlslMrktVO
	 * @return PrdcrCrclOgnOnlnWhlslMrktVO
	 * @throws Exception
	 */
	public PrdcrCrclOgnOnlnWhlslMrktVO selectPrdcrCrclOgnOnlnWhlslMrkt(PrdcrCrclOgnOnlnWhlslMrktVO PrdcrCrclOgnOnlnWhlslMrktVO) throws Exception;

	/**
	 * 조직 리스트를 조회한다.
	 * @param PrdcrCrclOgnOnlnWhlslMrktVO
	 * @return List<PrdcrCrclOgnOnlnWhlslMrktVO>
	 * @throws Exception
	 */
	public List<PrdcrCrclOgnOnlnWhlslMrktVO> selectPrdcrCrclOgnOnlnWhlslMrktUoList(PrdcrCrclOgnOnlnWhlslMrktVO PrdcrCrclOgnOnlnWhlslMrktVO) throws Exception;

	/**
	 * 온라인도매시장 판매목표 정보를 저장한다
	 * @param PrdcrCrclOgnOnlnWhlslMrktVO
	 * @return int
	 * @throws Exception
	 */
	public int insertPrdcrCrclOgnOnlnWhlslMrkt(PrdcrCrclOgnOnlnWhlslMrktVO PrdcrCrclOgnOnlnWhlslMrktVO) throws Exception;


}
