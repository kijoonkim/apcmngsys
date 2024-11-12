package com.at.apcss.pd.popup.service;

import java.util.List;

import com.at.apcss.pd.popup.vo.BrnoPopupVO;


/**
 * 통합조직,출자출하조직 팝업 Service 인터페이스
 * @author ljw
 * @since 2024.10.17
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.10.17  ljw       최초 생성
 * </pre>
 */
public interface BrnoPopupService {

	/**
	 * 통합조직 리스트
	 * @param BrnoPopupVO
	 * @return List<BrnoPopupVO>
	 * @throws Exception
	 */
	public List<BrnoPopupVO> selectBrnoList(BrnoPopupVO BrnoPopupVO) throws Exception;

	/**
	 * 신청 통합조직 리스트
	 * @param BrnoPopupVO
	 * @return List<BrnoPopupVO>
	 * @throws Exception
	 */
	public List<BrnoPopupVO> selectAplyBrnoList(BrnoPopupVO BrnoPopupVO) throws Exception;

	/**
	 * 조직 리스트
	 * @param BrnoPopupVO
	 * @return List<BrnoPopupVO>
	 * @throws Exception
	 */
	public List<BrnoPopupVO> selectBrnoMngList(BrnoPopupVO BrnoPopupVO) throws Exception;

}
