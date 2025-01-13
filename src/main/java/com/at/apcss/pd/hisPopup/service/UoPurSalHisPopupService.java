package com.at.apcss.pd.hisPopup.service;

import java.util.List;

import com.at.apcss.pd.hisPopup.vo.UoPurSalVO;


/**
 * 평가등록결과 Service 인터페이스
 * @author ljw
 * @since 2024.11.28
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.11.28  ljw        최초 생성
 * </pre>
 */
public interface UoPurSalHisPopupService {

	/**
	 * 2024년 생산자조직 리스트를 조회
	 * @param PrdcrOgnzVO
	 * @return List<UoPurSalVO>
	 * @throws Exception
	 */
	public List<UoPurSalVO> selectHisUoPurSal2024(UoPurSalVO UoPurSalVO) throws Exception;

	/**
	 * 2025년 생산자조직 리스트를 조회
	 * @param PrdcrOgnzVO
	 * @return List<UoPurSalVO>
	 * @throws Exception
	 */
	public List<UoPurSalVO> selectHisUoPurSal2025(UoPurSalVO UoPurSalVO) throws Exception;

}
