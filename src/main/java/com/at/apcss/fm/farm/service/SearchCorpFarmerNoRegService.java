package com.at.apcss.fm.farm.service;

import java.util.List;
import java.util.Map;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.fm.farm.vo.SearchCorpFarmerNoRegVO;


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
public interface SearchCorpFarmerNoRegService {

	/**
	 * 정보를 조회한다.
	 * @param searchCorpFarmerNoRegVO
	 * @return
	 * @throws Exception
	 */
	public SearchCorpFarmerNoRegVO selectSearchCorpFarmerNoReg(SearchCorpFarmerNoRegVO searchCorpFarmerNoRegVO) throws Exception;

	public List<SearchCorpFarmerNoRegVO> selectSearchCorpFarmerNoRegList(SearchCorpFarmerNoRegVO searchCorpFarmerNoRegVO) throws Exception;

	public int insertSearchCorpFarmerNoReg(SearchCorpFarmerNoRegVO searchCorpFarmerNoRegVO) throws Exception;

	public int updateSearchCorpFarmerNoReg(SearchCorpFarmerNoRegVO searchCorpFarmerNoRegVO) throws Exception;

	public int multiSaveSearchCorpFarmerNoRegList(List<SearchCorpFarmerNoRegVO> searchCorpFarmerNoRegVOList) throws Exception;

	public int deleteSearchCorpFarmerNoReg(SearchCorpFarmerNoRegVO searchCorpFarmerNoRegVO) throws Exception;

}
