package com.at.apcss.pd.pom.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.pd.pom.vo.PrdcrOgnPrdShipRsltMngVO;

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
public interface PrdcrOgnPrdShipRsltMngMapper {


	/**
	 * 메시지정보를 조회한다.
	 * @param bbsVO
	 * @return
	 */
	public PrdcrOgnPrdShipRsltMngVO selectPrdcrOgnPrdShipRsltMng(PrdcrOgnPrdShipRsltMngVO PrdcrOgnPrdShipRsltMngVO);

	public List<PrdcrOgnPrdShipRsltMngVO> selectPrdcrOgnPrdShipRsltMngList(PrdcrOgnPrdShipRsltMngVO PrdcrOgnPrdShipRsltMngVO);

	public List<PrdcrOgnPrdShipRsltMngVO> selectPrdcrOgnPrdShipRsltMngDtlList(PrdcrOgnPrdShipRsltMngVO PrdcrOgnPrdShipRsltMngVO);

	public int insertPrdcrOgnPrdShipRsltMng(PrdcrOgnPrdShipRsltMngVO PrdcrOgnPrdShipRsltMngVO);

	public int updatePrdcrOgnPrdShipRsltMng(PrdcrOgnPrdShipRsltMngVO PrdcrOgnPrdShipRsltMngVO);

	public int deletePrdcrOgnPrdShipRsltMng(PrdcrOgnPrdShipRsltMngVO PrdcrOgnPrdShipRsltMngVO) throws Exception;
}
