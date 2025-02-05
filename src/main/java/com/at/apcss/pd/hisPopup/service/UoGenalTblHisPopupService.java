package com.at.apcss.pd.hisPopup.service;

import java.util.List;

import com.at.apcss.pd.hisPopup.vo.UoGenalTblVO;


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
public interface UoGenalTblHisPopupService {

	/**
	 * 2024년 통합조직 총괄표 리스트를 조회
	 * @param UoGenalTblVO
	 * @return List<UoGenalTblVO>
	 * @throws Exception
	 */
	public List<UoGenalTblVO> selectHisUoGenalTbl2024(UoGenalTblVO UoGenalTblVO) throws Exception;

	/**
	 * 2025년 통합조직 총괄표 리스트를 조회
	 * @param UoGenalTblVO
	 * @return List<UoGenalTblVO>
	 * @throws Exception
	 */
	public List<UoGenalTblVO> selectHisUoGenalTbl2025(UoGenalTblVO UoGenalTblVO) throws Exception;

	/**
	 * 2025년 통합조직 부류별 합계 리스트를 조회
	 * @param UoGenalTblVO
	 * @return List<UoGenalTblVO>
	 * @throws Exception
	 */
	public List<UoGenalTblVO> selectHisUoClsfTot2025(UoGenalTblVO UoGenalTblVO) throws Exception;
}
