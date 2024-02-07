package com.at.apcss.pd.aom.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.pd.aom.vo.GpcVO;
import com.at.apcss.pd.aom.vo.PrdcrCrclOgnReqMngVO;

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
public interface PrdcrCrclOgnReqMngMapper {


	/**
	 * 메시지정보를 조회한다.
	 * @param bbsVO
	 * @return
	 */
	public PrdcrCrclOgnReqMngVO selectPrdcrCrclOgnReqMng(PrdcrCrclOgnReqMngVO PrdcrCrclOgnReqMngVO);

	public List<PrdcrCrclOgnReqMngVO> selectPrdcrCrclOgnReqMngList(PrdcrCrclOgnReqMngVO PrdcrCrclOgnReqMngVO);

	public int insertPrdcrCrclOgnReqMng(PrdcrCrclOgnReqMngVO PrdcrCrclOgnReqMngVO);

	public int updatePrdcrCrclOgnReqMng(PrdcrCrclOgnReqMngVO PrdcrCrclOgnReqMngVO);

	public int deletePrdcrCrclOgnReqMng(PrdcrCrclOgnReqMngVO PrdcrCrclOgnReqMngVO) throws Exception;

	public int insertGpc(GpcVO gpcVO);

	public int insertEvAplyMng(PrdcrCrclOgnReqMngVO PrdcrCrclOgnReqMngVO);

	public List<GpcVO> selectGpcList(GpcVO gpcVO);

	public int deleteGpc(GpcVO gpcVO);

	public int updateCorpDdlnSeCd(PrdcrCrclOgnReqMngVO PrdcrCrclOgnReqMngVO);

	public List<PrdcrCrclOgnReqMngVO> hiddenGrdUoSelectList(PrdcrCrclOgnReqMngVO PrdcrCrclOgnReqMngVO);

}
