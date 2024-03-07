package com.at.apcss.pd.pcorm.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.pd.pcorm.vo.PrdcrCrclOgnVluFndsMngVO;

/**
 * 게시판 Mapper 인터페이스
 * @author 정연두
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21  정연두        최초 생성
 * </pre>
 */
@Mapper
public interface PrdcrCrclOgnVluFndsMngMapper {
	//활성화 자금 리스트 조회
	public List<PrdcrCrclOgnVluFndsMngVO> selectScoreList(PrdcrCrclOgnVluFndsMngVO prdcrCrclOgnVluFndsMngVO);
	//산출식 관리 팝업 - 산출식 리스트 조회
	public List<PrdcrCrclOgnVluFndsMngVO> selectComputWayList(PrdcrCrclOgnVluFndsMngVO prdcrCrclOgnVluFndsMngVO);

	public int insertComputWayList(PrdcrCrclOgnVluFndsMngVO PrdcrCrclOgnVluFndsMngVO);
}
