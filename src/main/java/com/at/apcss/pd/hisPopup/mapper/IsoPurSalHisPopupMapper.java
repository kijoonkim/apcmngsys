package com.at.apcss.pd.hisPopup.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.pd.hisPopup.vo.IsoPurSalVO;

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
public interface IsoPurSalHisPopupMapper {

	/**
	 * 2024년 생산자조직 리스트를 조회
	 * @param PrdcrOgnzVO
	 * @return List<IsoPurSalVO>
	 */
	public List<IsoPurSalVO> selectHisIsoPurSal2024(IsoPurSalVO IsoPurSalVO);

	/**
	 * 2025년 생산자조직 리스트를 조회
	 * @param PrdcrOgnzVO
	 * @return List<IsoPurSalVO>
	 */
	public List<IsoPurSalVO> selectHisIsoPurSal2025(IsoPurSalVO IsoPurSalVO);
}
