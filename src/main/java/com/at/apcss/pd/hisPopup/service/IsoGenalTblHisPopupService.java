package com.at.apcss.pd.hisPopup.service;

import java.util.List;

import com.at.apcss.pd.hisPopup.vo.IsoGenalTblVO;


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
public interface IsoGenalTblHisPopupService {

	/**
	 * 2024년 출자출하조직 총괄표 리스트를 조회
	 * @param IsoGenalTblVO
	 * @return List<IsoGenalTblVO>
	 * @throws Exception
	 */
	public List<IsoGenalTblVO> selectHisIsoGenalTbl2024(IsoGenalTblVO IsoGenalTblVO) throws Exception;

	/**
	 * 2025년 출자출하조직 총괄표 리스트를 조회
	 * @param IsoGenalTblVO
	 * @return List<IsoGenalTblVO>
	 * @throws Exception
	 */
	public List<IsoGenalTblVO> selectHisIsoGenalTbl2025(IsoGenalTblVO IsoGenalTblVO) throws Exception;

	/**
	 * 2025년 출자출하조직 부류별 합계 리스트를 조회
	 * @param IsoGenalTblVO
	 * @return List<IsoGenalTblVO>
	 * @throws Exception
	 */
	public List<IsoGenalTblVO> selectHisIsoClsfTot2025(IsoGenalTblVO IsoGenalTblVO) throws Exception;
}
