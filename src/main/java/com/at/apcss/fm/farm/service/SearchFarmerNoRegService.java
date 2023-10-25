package com.at.apcss.fm.farm.service;

import java.util.List;
import java.util.Map;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.fm.farm.vo.SearchFarmerNoRegVO;


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
public interface SearchFarmerNoRegService {

	/**
	 * 정보를 조회한다.
	 * @param searchFarmerNoRegVO
	 * @return
	 * @throws Exception
	 */
	public SearchFarmerNoRegVO selectSearchFarmerNoReg(SearchFarmerNoRegVO searchFarmerNoRegVO) throws Exception;

	public List<SearchFarmerNoRegVO> selectSearchFarmerNoRegList(SearchFarmerNoRegVO searchFarmerNoRegVO) throws Exception;

	public int insertSearchFarmerNoReg(SearchFarmerNoRegVO searchFarmerNoRegVO) throws Exception;

	public int updateSearchFarmerNoReg(SearchFarmerNoRegVO searchFarmerNoRegVO) throws Exception;

	public int multiSaveSearchFarmerNoRegList(List<SearchFarmerNoRegVO> searchFarmerNoRegVOList) throws Exception;

	public int deleteSearchFarmerNoReg(SearchFarmerNoRegVO searchFarmerNoRegVO) throws Exception;

}
