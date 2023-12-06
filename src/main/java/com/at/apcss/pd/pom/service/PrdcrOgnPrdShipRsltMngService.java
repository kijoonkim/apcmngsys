package com.at.apcss.pd.pom.service;

import java.util.List;

import com.at.apcss.pd.pom.vo.PrdcrOgnPrdShipRsltMngVO;


/**
 * 평가등록결과 Service 인터페이스
 * @author 김동제
 * @since 2023.10.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.10.01  김동제        최초 생성
 * </pre>
 */
public interface PrdcrOgnPrdShipRsltMngService {

	/**
	 * 정보를 조회한다.
	 * @param PrdcrOgnPrdShipRsltMngVO
	 * @return
	 * @throws Exception
	 */
	public PrdcrOgnPrdShipRsltMngVO selectPrdcrOgnPrdShipRsltMng(PrdcrOgnPrdShipRsltMngVO PrdcrOgnPrdShipRsltMngVO) throws Exception;

	public List<PrdcrOgnPrdShipRsltMngVO> selectPrdcrOgnPrdShipRsltMngList(PrdcrOgnPrdShipRsltMngVO PrdcrOgnPrdShipRsltMngVO) throws Exception;

	public List<PrdcrOgnPrdShipRsltMngVO> selectPrdcrOgnPrdShipRsltMngDtlList(PrdcrOgnPrdShipRsltMngVO PrdcrOgnPrdShipRsltMngVO) throws Exception;

	public int insertPrdcrOgnPrdShipRsltMng(PrdcrOgnPrdShipRsltMngVO PrdcrOgnPrdShipRsltMngVO) throws Exception;

	public int updatePrdcrOgnPrdShipRsltMng(PrdcrOgnPrdShipRsltMngVO PrdcrOgnPrdShipRsltMngVO) throws Exception;

	public int multiSavePrdcrOgnPrdShipRsltMngList(List<PrdcrOgnPrdShipRsltMngVO> PrdcrOgnPrdShipRsltMngVOList) throws Exception;

	public int deletePrdcrOgnPrdShipRsltMng(PrdcrOgnPrdShipRsltMngVO PrdcrOgnPrdShipRsltMngVO) throws Exception;

}
