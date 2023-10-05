package com.at.apcss.pd.pcom.service;

import java.util.List;
import java.util.Map;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.pd.pcom.vo.PrdcrCrclOgnSpItmPurSalNMngVO;


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
public interface PrdcrCrclOgnSpItmPurSalNMngService {

	/**
	 * 정보를 조회한다.
	 * @param PrdcrCrclOgnSpItmPurSalNMngVO
	 * @return
	 * @throws Exception
	 */
	public PrdcrCrclOgnSpItmPurSalNMngVO selectPrdcrCrclOgnSpItmPurSalNMng(PrdcrCrclOgnSpItmPurSalNMngVO PrdcrCrclOgnSpItmPurSalNMngVO) throws Exception;

	public List<PrdcrCrclOgnSpItmPurSalNMngVO> selectPrdcrCrclOgnSpItmPurSalNMngList(PrdcrCrclOgnSpItmPurSalNMngVO PrdcrCrclOgnSpItmPurSalNMngVO) throws Exception;

	public int insertPrdcrCrclOgnSpItmPurSalNMng(PrdcrCrclOgnSpItmPurSalNMngVO PrdcrCrclOgnSpItmPurSalNMngVO) throws Exception;

	public int updatePrdcrCrclOgnSpItmPurSalNMng(PrdcrCrclOgnSpItmPurSalNMngVO PrdcrCrclOgnSpItmPurSalNMngVO) throws Exception;

	public int multiSavePrdcrCrclOgnSpItmPurSalNMngList(List<PrdcrCrclOgnSpItmPurSalNMngVO> PrdcrCrclOgnSpItmPurSalNMngVOList) throws Exception;

	public int deletePrdcrCrclOgnSpItmPurSalNMng(PrdcrCrclOgnSpItmPurSalNMngVO PrdcrCrclOgnSpItmPurSalNMngVO) throws Exception;

}
