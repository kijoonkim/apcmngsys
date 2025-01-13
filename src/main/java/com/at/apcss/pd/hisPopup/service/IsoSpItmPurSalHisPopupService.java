package com.at.apcss.pd.hisPopup.service;

import java.util.List;

import com.at.apcss.pd.hisPopup.vo.IsoSpItmPurSalVO;


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
public interface IsoSpItmPurSalHisPopupService {

	/**
	 * 2024년 생산자조직 리스트를 조회
	 * @param PrdcrOgnzVO
	 * @return List<IsoSpItmPurSalVO>
	 * @throws Exception
	 */
	public List<IsoSpItmPurSalVO> selectHisIsoSpItmPurSal2024(IsoSpItmPurSalVO IsoSpItmPurSalVO) throws Exception;

	/**
	 * 2025년 생산자조직 리스트를 조회
	 * @param PrdcrOgnzVO
	 * @return List<IsoSpItmPurSalVO>
	 * @throws Exception
	 */
	public List<IsoSpItmPurSalVO> selectHisIsoSpItmPurSal2025(IsoSpItmPurSalVO IsoSpItmPurSalVO) throws Exception;

}
