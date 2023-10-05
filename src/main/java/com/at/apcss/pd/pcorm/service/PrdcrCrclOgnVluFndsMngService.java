package com.at.apcss.pd.pcorm.service;

import java.util.List;
import java.util.Map;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.pd.pcorm.vo.PrdcrCrclOgnVluFndsMngVO;


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
public interface PrdcrCrclOgnVluFndsMngService {

	/**
	 * 정보를 조회한다.
	 * @param prdcrCrclOgnVluFndsMngVO
	 * @return
	 * @throws Exception
	 */
	public PrdcrCrclOgnVluFndsMngVO selectPrdcrCrclOgnVluFndsMng(PrdcrCrclOgnVluFndsMngVO prdcrCrclOgnVluFndsMngVO) throws Exception;

	public List<PrdcrCrclOgnVluFndsMngVO> selectPrdcrCrclOgnVluFndsMngList(PrdcrCrclOgnVluFndsMngVO prdcrCrclOgnVluFndsMngVO) throws Exception;

	public int insertPrdcrCrclOgnVluFndsMng(PrdcrCrclOgnVluFndsMngVO prdcrCrclOgnVluFndsMngVO) throws Exception;

	public int updatePrdcrCrclOgnVluFndsMng(PrdcrCrclOgnVluFndsMngVO prdcrCrclOgnVluFndsMngVO) throws Exception;

	public int multiSavePrdcrCrclOgnVluFndsMngList(List<PrdcrCrclOgnVluFndsMngVO> prdcrCrclOgnVluFndsMngVOList) throws Exception;

	public int deletePrdcrCrclOgnVluFndsMng(PrdcrCrclOgnVluFndsMngVO prdcrCrclOgnVluFndsMngVO) throws Exception;

}
