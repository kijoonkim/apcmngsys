package com.at.apcss.pd.bsm.service;

import java.util.List;
import java.util.Map;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.pd.bsm.vo.PrdcrCrclOgnMngVO;


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
public interface PrdcrCrclOgnMngService {

	/**
	 * 정보를 조회한다.
	 * @param PrdcrCrclOgnMngVO
	 * @return
	 * @throws Exception
	 */
	public PrdcrCrclOgnMngVO selectPrdcrCrclOgnMng(PrdcrCrclOgnMngVO PrdcrCrclOgnMngVO) throws Exception;

	public List<PrdcrCrclOgnMngVO> selectPrdcrCrclOgnMngList(PrdcrCrclOgnMngVO PrdcrCrclOgnMngVO) throws Exception;

	public int insertPrdcrCrclOgnMng(PrdcrCrclOgnMngVO PrdcrCrclOgnMngVO) throws Exception;

	public int updatePrdcrCrclOgnMng(PrdcrCrclOgnMngVO PrdcrCrclOgnMngVO) throws Exception;

	public int multiSavePrdcrCrclOgnMngList(List<PrdcrCrclOgnMngVO> PrdcrCrclOgnMngVOList) throws Exception;

	public int deletePrdcrCrclOgnMng(PrdcrCrclOgnMngVO PrdcrCrclOgnMngVO) throws Exception;

}
