package com.at.apcss.pd.aom.service;

import java.util.List;
import java.util.Map;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.pd.aom.vo.PrdcrCrclOgnReqClsMngVO;


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
public interface PrdcrCrclOgnReqClsMngService {

	/**
	 * 정보를 조회한다.
	 * @param PrdcrCrclOgnReqClsMngVO
	 * @return
	 * @throws Exception
	 */
	public PrdcrCrclOgnReqClsMngVO selectPrdcrCrclOgnReqClsMng(PrdcrCrclOgnReqClsMngVO PrdcrCrclOgnReqClsMngVO) throws Exception;

	public List<PrdcrCrclOgnReqClsMngVO> selectPrdcrCrclOgnReqClsMngList(PrdcrCrclOgnReqClsMngVO PrdcrCrclOgnReqClsMngVO) throws Exception;

	public int insertPrdcrCrclOgnReqClsMng(PrdcrCrclOgnReqClsMngVO PrdcrCrclOgnReqClsMngVO) throws Exception;

	public int updatePrdcrCrclOgnReqClsMng(PrdcrCrclOgnReqClsMngVO PrdcrCrclOgnReqClsMngVO) throws Exception;

	public int multiSavePrdcrCrclOgnReqClsMngList(List<PrdcrCrclOgnReqClsMngVO> PrdcrCrclOgnReqClsMngVOList) throws Exception;

	public int deletePrdcrCrclOgnReqClsMng(PrdcrCrclOgnReqClsMngVO PrdcrCrclOgnReqClsMngVO) throws Exception;

}
