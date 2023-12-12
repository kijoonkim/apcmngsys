package com.at.apcss.pd.pcom.service;

import java.util.List;

import com.at.apcss.pd.pcom.vo.PrdcrCrclOgnPurSalMngVO;


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
public interface PrdcrCrclOgnPurSalMngService {

	/**
	 * 정보를 조회한다.
	 * @param PrdcrCrclOgnPurSalMngVO
	 * @return
	 * @throws Exception
	 */
	public PrdcrCrclOgnPurSalMngVO selectPrdcrCrclOgnPurSalMng(PrdcrCrclOgnPurSalMngVO PrdcrCrclOgnPurSalMngVO) throws Exception;

	public List<PrdcrCrclOgnPurSalMngVO> selectPrdcrCrclOgnPurSalMngList(PrdcrCrclOgnPurSalMngVO PrdcrCrclOgnPurSalMngVO) throws Exception;

	public int insertPrdcrCrclOgnPurSalMng01(PrdcrCrclOgnPurSalMngVO PrdcrCrclOgnPurSalMngVO) throws Exception;

	public int insertPrdcrCrclOgnPurSalMng02(PrdcrCrclOgnPurSalMngVO PrdcrCrclOgnPurSalMngVO) throws Exception;

	public int updatePrdcrCrclOgnPurSalMng(PrdcrCrclOgnPurSalMngVO PrdcrCrclOgnPurSalMngVO) throws Exception;

	public int multiSavePrdcrCrclOgnPurSalMngList01(List<PrdcrCrclOgnPurSalMngVO> PrdcrCrclOgnPurSalMngVOList) throws Exception;

	public int multiSavePrdcrCrclOgnPurSalMngList02(List<PrdcrCrclOgnPurSalMngVO> PrdcrCrclOgnPurSalMngVOList) throws Exception;

	public int deletePrdcrCrclOgnPurSalMng(PrdcrCrclOgnPurSalMngVO PrdcrCrclOgnPurSalMngVO) throws Exception;

}
