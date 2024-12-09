package com.at.apcss.pd.hisPopup.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.pd.hisPopup.vo.OgnzVO;
import com.at.apcss.pd.hisPopup.vo.PrdcrOgnzVO;
import com.at.apcss.pd.hisPopup.vo.CltvtnLandVO;

/**
 * 게시판 Mapper 인터페이스
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
@Mapper
public interface PrdcrOgnHisPopupMapper {


	/**
	 * 변경된 사업자번호 리스트를 조회
	 * @param OgnzVO
	 * @return List<OgnzVO>
	 */
	public List<OgnzVO> selectHisBrnoMngList(OgnzVO OgnzVO);

	/**
	 * 사업자 정보 조회
	 * @param OgnzVO
	 * @return List<OgnzVO>
	 */
	public OgnzVO selectHisBrnoInfo(OgnzVO OgnzVO);

	/**
	 * 통합조직 및 하위 출자출하조직 리스트
	 * @param OgnzVO
	 * @return List<OgnzVO>
	 */
	public List<OgnzVO> selectHisBrnoList(OgnzVO OgnzVO);

	/**
	 * 속한 통합조직 리스트 조회
	 * @param OgnzVO
	 * @return List<OgnzVO>
	 */
	public List<OgnzVO> selectHisUoList(OgnzVO OgnzVO);

	/**
	 * 2024년 생산자조직 리스트를 조회
	 * @param PrdcrOgnzVO
	 * @return List<PrdcrOgnzVO>
	 */
	public List<PrdcrOgnzVO> selectHisPrdcrOgnz2024(PrdcrOgnzVO PrdcrOgnzVO);

	/**
	 * 2024년 농가 리스트를 조회
	 * @param CltvtnLandVO
	 * @return List<CltvtnLandVO>
	 */
	public List<CltvtnLandVO> selectHisCltvtnLand2024(CltvtnLandVO CltvtnLandVO);

	/**
	 * 2025년 생산자조직 리스트를 조회
	 * @param PrdcrOgnzVO
	 * @return List<PrdcrOgnzVO>
	 */
	public List<PrdcrOgnzVO> selectHisPrdcrOgnz2025(PrdcrOgnzVO PrdcrOgnzVO);

	/**
	 * 2025년 농가 리스트를 조회
	 * @param CltvtnLandVO
	 * @return List<CltvtnLandVO>
	 */
	public List<CltvtnLandVO> selectHisCltvtnLand2025(CltvtnLandVO CltvtnLandVO);
}
