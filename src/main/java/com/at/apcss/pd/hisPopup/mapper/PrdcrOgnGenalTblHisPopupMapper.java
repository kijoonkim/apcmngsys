package com.at.apcss.pd.hisPopup.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.pd.hisPopup.vo.PrdcrOgnGenalTblVO;

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
public interface PrdcrOgnGenalTblHisPopupMapper {

	/**
	 * 2024년 생산자조직 총괄표 리스트를 조회
	 * @param PrdcrOgnGenalTblVO
	 * @return List<PrdcrOgnGenalTblVO>
	 */
	public List<PrdcrOgnGenalTblVO> selectHisPrdcrOgnGenalTbl2024(PrdcrOgnGenalTblVO PrdcrOgnGenalTblVO);

	/**
	 * 2025년 생산자조직 총괄표 리스트를 조회
	 * @param PrdcrOgnGenalTblVO
	 * @return List<PrdcrOgnGenalTblVO>
	 */
	public List<PrdcrOgnGenalTblVO> selectHisPrdcrOgnGenalTbl2025(PrdcrOgnGenalTblVO PrdcrOgnGenalTblVO);

}
