package com.at.apcss.pd.aom.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.pd.aom.vo.PrdcrCrclOgnReqClsMngVO;

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
public interface PrdcrCrclOgnReqClsMngMapper {


	/**
	 * 메시지정보를 조회한다.
	 * @param bbsVO
	 * @return
	 */
	public PrdcrCrclOgnReqClsMngVO selectPrdcrCrclOgnReqClsMng(PrdcrCrclOgnReqClsMngVO PrdcrCrclOgnReqClsMngVO);

	public List<PrdcrCrclOgnReqClsMngVO> selectPrdcrCrclOgnReqClsMngList(PrdcrCrclOgnReqClsMngVO PrdcrCrclOgnReqClsMngVO);

	public int insertPrdcrCrclOgnReqClsMng(PrdcrCrclOgnReqClsMngVO PrdcrCrclOgnReqClsMngVO);

	public int updatePrdcrCrclOgnReqClsMng(PrdcrCrclOgnReqClsMngVO PrdcrCrclOgnReqClsMngVO);

	public int deletePrdcrCrclOgnReqClsMng(PrdcrCrclOgnReqClsMngVO PrdcrCrclOgnReqClsMngVO) throws Exception;
}
