package com.at.apcss.pd.hisPopup.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.pd.hisPopup.vo.UoSpItmPurSalVO;

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
public interface UoSpItmPurSalYHisPopupMapper {

	/**
	 * 2024년 통합조직 전문품목 매입매출 리스트를 조회
	 * @param UoSpItmPurSalVO
	 * @return List<UoSpItmPurSalVO>
	 */
	public List<UoSpItmPurSalVO> selectHisUoSpItmPurSalY2024(UoSpItmPurSalVO UoSpItmPurSalVO);

	/**
	 * 2025년 통합조직 전문품목 매입매출 리스트를 조회
	 * @param UoSpItmPurSalVO
	 * @return List<UoSpItmPurSalVO>
	 */
	public List<UoSpItmPurSalVO> selectHisUoSpItmPurSalY2025(UoSpItmPurSalVO UoSpItmPurSalVO);
}
