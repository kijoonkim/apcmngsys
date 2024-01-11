package com.at.apcss.pd.aom.service;

import java.util.List;

import com.at.apcss.pd.aom.vo.PrdcrCrclOgnReqMngVO;
import com.at.apcss.pd.aom.vo.GpcVO;


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
public interface PrdcrCrclOgnReqMngService {

	/**
	 * 정보를 조회한다.
	 * @param PrdcrCrclOgnReqMngVO
	 * @return
	 * @throws Exception
	 */
	public PrdcrCrclOgnReqMngVO selectPrdcrCrclOgnReqMng(PrdcrCrclOgnReqMngVO PrdcrCrclOgnReqMngVO) throws Exception;

	public List<PrdcrCrclOgnReqMngVO> selectPrdcrCrclOgnReqMngList(PrdcrCrclOgnReqMngVO PrdcrCrclOgnReqMngVO) throws Exception;

	public int insertPrdcrCrclOgnReqMng(PrdcrCrclOgnReqMngVO PrdcrCrclOgnReqMngVO) throws Exception;

	public int updatePrdcrCrclOgnReqMng(PrdcrCrclOgnReqMngVO PrdcrCrclOgnReqMngVO) throws Exception;

	public int multiSavePrdcrCrclOgnReqMngList(List<PrdcrCrclOgnReqMngVO> PrdcrCrclOgnReqMngVOList) throws Exception;

	public int deletePrdcrCrclOgnReqMng(PrdcrCrclOgnReqMngVO PrdcrCrclOgnReqMngVO) throws Exception;

	public int multiSaveGpcList(List<GpcVO> gpcVOList) throws Exception;

	public int insertGpc(GpcVO gpcVO) throws Exception;

	public List<GpcVO> selectGpcList(GpcVO gpcVO) throws Exception;

	public int deleteGpc(GpcVO gpcVO) throws Exception;

}
