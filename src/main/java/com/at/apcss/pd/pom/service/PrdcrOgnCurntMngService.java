package com.at.apcss.pd.pom.service;

import java.util.List;

import com.at.apcss.pd.pom.vo.PrdcrOgnCurntMngVO;


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
public interface PrdcrOgnCurntMngService {

	/**
	 * 정보를 조회한다.
	 * @param PrdcrOgnCurntMngVO
	 * @return
	 * @throws Exception
	 */
	public PrdcrOgnCurntMngVO selectPrdcrOgnCurntMng(PrdcrOgnCurntMngVO PrdcrOgnCurntMngVO) throws Exception;

	public List<PrdcrOgnCurntMngVO> selectPrdcrOgnCurntMngList(PrdcrOgnCurntMngVO PrdcrOgnCurntMngVO) throws Exception;

	public List<PrdcrOgnCurntMngVO> selectPrdcrOgnCurntMngDtlList(PrdcrOgnCurntMngVO PrdcrOgnCurntMngVO) throws Exception;

	public int insertPrdcrOgnCurntMng(PrdcrOgnCurntMngVO PrdcrOgnCurntMngVO) throws Exception;

	public int updatePrdcrOgnCurntMng(PrdcrOgnCurntMngVO PrdcrOgnCurntMngVO) throws Exception;

	public int multiSavePrdcrOgnCurntMngList(List<PrdcrOgnCurntMngVO> PrdcrOgnCurntMngVOList) throws Exception;

	public int deletePrdcrOgnCurntMng(PrdcrOgnCurntMngVO PrdcrOgnCurntMngVO) throws Exception;

}
