package com.at.apcss.pd.pom.service;

import java.util.List;
import java.util.Map;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.pd.pom.vo.PrdcrOgnShipContMngVO;


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
public interface PrdcrOgnShipContMngService {

	/**
	 * 정보를 조회한다.
	 * @param PrdcrOgnShipContMngVO
	 * @return
	 * @throws Exception
	 */
	public PrdcrOgnShipContMngVO selectPrdcrOgnShipContMng(PrdcrOgnShipContMngVO PrdcrOgnShipContMngVO) throws Exception;

	public List<PrdcrOgnShipContMngVO> selectPrdcrOgnShipContMngList(PrdcrOgnShipContMngVO PrdcrOgnShipContMngVO) throws Exception;

	public List<PrdcrOgnShipContMngVO> selectPrdcrOgnShipContMngDtlList(PrdcrOgnShipContMngVO PrdcrOgnShipContMngVO) throws Exception;

	public int insertPrdcrOgnShipContMng(PrdcrOgnShipContMngVO PrdcrOgnShipContMngVO) throws Exception;

	public int updatePrdcrOgnShipContMng(PrdcrOgnShipContMngVO PrdcrOgnShipContMngVO) throws Exception;

	public int multiSavePrdcrOgnShipContMngList(List<PrdcrOgnShipContMngVO> PrdcrOgnShipContMngVOList) throws Exception;

	public int deletePrdcrOgnShipContMng(PrdcrOgnShipContMngVO PrdcrOgnShipContMngVO) throws Exception;

}
