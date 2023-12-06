package com.at.apcss.pd.pom.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.pd.pom.vo.PrdcrOgnShipContMngVO;

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
public interface PrdcrOgnShipContMngMapper {


	/**
	 * 메시지정보를 조회한다.
	 * @param bbsVO
	 * @return
	 */
	public PrdcrOgnShipContMngVO selectPrdcrOgnShipContMng(PrdcrOgnShipContMngVO PrdcrOgnShipContMngVO);

	public List<PrdcrOgnShipContMngVO> selectPrdcrOgnShipContMngList(PrdcrOgnShipContMngVO PrdcrOgnShipContMngVO);

	public List<PrdcrOgnShipContMngVO> selectPrdcrOgnShipContMngDtlList(PrdcrOgnShipContMngVO PrdcrOgnShipContMngVO);

	public int insertPrdcrOgnShipContMng(PrdcrOgnShipContMngVO PrdcrOgnShipContMngVO);

	public int updatePrdcrOgnShipContMng(PrdcrOgnShipContMngVO PrdcrOgnShipContMngVO);

	public int deletePrdcrOgnShipContMng(PrdcrOgnShipContMngVO PrdcrOgnShipContMngVO) throws Exception;
}
