package com.at.apcss.pd.hisPopup.service;

import java.util.List;

import com.at.apcss.pd.hisPopup.vo.CltvtnLandVO;
import com.at.apcss.pd.hisPopup.vo.OgnzVO;
import com.at.apcss.pd.hisPopup.vo.PrdcrOgnzVO;


/**
 * 생산자조직 현황 과거 실적 조회 Service 인터페이스
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
public interface PrdcrOgnHisPopupService {


	/**
	 * 변경된 사업자번호 리스트를 조회
	 * @param OgnzVO
	 * @return List<OgnzVO>
	 * @throws Exception
	 */
	public List<OgnzVO> selectHisBrnoMngList(OgnzVO OgnzVO) throws Exception;

	/**
	 * 사업자 정보 조회
	 * @param OgnzVO
	 * @return List<OgnzVO>
	 * @throws Exception
	 */
	public OgnzVO selectHisBrnoInfo(OgnzVO OgnzVO) throws Exception;

	/**
	 * 통합조직 및 하위 출자출하조직 리스트
	 * @param OgnzVO
	 * @return List<OgnzVO>
	 * @throws Exception
	 */
	public List<OgnzVO> selectHisBrnoList(OgnzVO OgnzVO) throws Exception;

	/**
	 * 속한 통합조직 리스트 조회
	 * @param OgnzVO
	 * @return List<OgnzVO>
	 * @throws Exception
	 */
	public List<OgnzVO> selectHisUoList(OgnzVO OgnzVO) throws Exception;

	/**
	 * 2024년 생산자조직 리스트를 조회
	 * @param PrdcrOgnzVO
	 * @return List<PrdcrOgnzVO>
	 * @throws Exception
	 */
	public List<PrdcrOgnzVO> selectHisPrdcrOgnz2024(PrdcrOgnzVO PrdcrOgnzVO) throws Exception;

	/**
	 * 2024년 농가 리스트를 조회
	 * @param CltvtnLandVO
	 * @return List<CltvtnLandVO>
	 * @throws Exception
	 */
	public List<CltvtnLandVO> selectHisCltvtnLand2024(CltvtnLandVO CltvtnLandVO) throws Exception;

	/**
	 * 2025년 생산자조직 리스트를 조회
	 * @param PrdcrOgnzVO
	 * @return List<PrdcrOgnzVO>
	 * @throws Exception
	 */
	public List<PrdcrOgnzVO> selectHisPrdcrOgnz2025(PrdcrOgnzVO PrdcrOgnzVO) throws Exception;

	/**
	 * 2025년 농가 리스트를 조회
	 * @param CltvtnLandVO
	 * @return List<CltvtnLandVO>
	 * @throws Exception
	 */
	public List<CltvtnLandVO> selectHisCltvtnLand2025(CltvtnLandVO CltvtnLandVO) throws Exception;
}
