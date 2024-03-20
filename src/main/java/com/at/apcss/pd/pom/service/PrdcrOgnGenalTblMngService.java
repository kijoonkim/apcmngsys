package com.at.apcss.pd.pom.service;

import java.util.List;

import com.at.apcss.pd.pom.vo.PrdcrOgnGenalTblMngVO;


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
public interface PrdcrOgnGenalTblMngService {

	/**
	 * 정보를 조회한다.
	 * @param PrdcrOgnGenalTblMngVO
	 * @return
	 * @throws Exception
	 */
	public PrdcrOgnGenalTblMngVO selectPrdcrOgnGenalTblMng(PrdcrOgnGenalTblMngVO PrdcrOgnGenalTblMngVO) throws Exception;

	public List<PrdcrOgnGenalTblMngVO> selectPrdcrOgnGenalTblMngList(PrdcrOgnGenalTblMngVO PrdcrOgnGenalTblMngVO) throws Exception;

	public int insertPrdcrOgnGenalTblMng(PrdcrOgnGenalTblMngVO PrdcrOgnGenalTblMngVO) throws Exception;

	public int updatePrdcrOgnGenalTblMng(PrdcrOgnGenalTblMngVO PrdcrOgnGenalTblMngVO) throws Exception;

	public int multiSavePrdcrOgnGenalTblMngList(List<PrdcrOgnGenalTblMngVO> PrdcrOgnGenalTblMngVOList) throws Exception;

	public int deletePrdcrOgnGenalTblMng(PrdcrOgnGenalTblMngVO PrdcrOgnGenalTblMngVO) throws Exception;

	public int updateStbltYn(PrdcrOgnGenalTblMngVO PrdcrOgnGenalTblMngVO) throws Exception;

	public List<PrdcrOgnGenalTblMngVO> selectRawDataPrdcrOgnzList(PrdcrOgnGenalTblMngVO PrdcrOgnGenalTblMngVO) throws Exception;

}
