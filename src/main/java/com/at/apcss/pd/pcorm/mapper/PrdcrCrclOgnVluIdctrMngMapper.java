package com.at.apcss.pd.pcorm.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.pd.pcorm.vo.PrdcrCrclOgnVluIdctrMngVO;

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
public interface PrdcrCrclOgnVluIdctrMngMapper {


	/**
	 * 메시지정보를 조회한다.
	 * @param bbsVO
	 * @return
	 */
	public PrdcrCrclOgnVluIdctrMngVO selectPrdcrCrclOgnVluIdctrMng(PrdcrCrclOgnVluIdctrMngVO prdcrCrclOgnVluIdctrMngVO);

	public List<PrdcrCrclOgnVluIdctrMngVO> selectPrdcrCrclOgnVluIdctrMngList(PrdcrCrclOgnVluIdctrMngVO prdcrCrclOgnVluIdctrMngVO);

	public int insertPrdcrCrclOgnVluIdctrMng(PrdcrCrclOgnVluIdctrMngVO prdcrCrclOgnVluIdctrMngVO);

	public int updatePrdcrCrclOgnVluIdctrMng(PrdcrCrclOgnVluIdctrMngVO prdcrCrclOgnVluIdctrMngVO);

	public int deletePrdcrCrclOgnVluIdctrMng(PrdcrCrclOgnVluIdctrMngVO prdcrCrclOgnVluIdctrMngVO) throws Exception;
}
