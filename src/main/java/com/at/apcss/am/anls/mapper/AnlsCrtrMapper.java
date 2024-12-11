package com.at.apcss.am.anls.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.am.anls.vo.AnlsCrtrVO;

/**
 * 분석기준 Mapper
 * @author FINEVT 개발팀 신정철
 * @since 2023.07.07
 * @version 1.0
 * @see
 *
 * <pre>
 * 공통코드
 *
 *  수정일      수정자      수정내용
 *  ----------	----------  ---------------------------
 *  2024.07.07  신정철      최초 생성
 *
 *  </pre>
 */
@Mapper
public interface AnlsCrtrMapper {

	
	/**
	 * 분석기준 단건 조회
	 * @param anlsCrtrVO
	 * @return
	 * @throws Exception
	 */
	public AnlsCrtrVO selectAnlsCrtr(AnlsCrtrVO anlsCrtrVO) throws Exception;
	
	/**
	 * 분석기준 목록 조회
	 * @param anlsCrtrVO
	 * @return
	 * @throws Exception
	 */
	public List<AnlsCrtrVO> selectAnlsCrtrList(AnlsCrtrVO anlsCrtrVO) throws Exception;
	
	/**
	 * 분석기준상세 단건 조회
	 * @param anlsCrtrVO
	 * @return
	 * @throws Exception
	 */
	public AnlsCrtrVO selectAnlsCrtrDtl(AnlsCrtrVO anlsCrtrVO) throws Exception;
	
	/**
	 * 분석기준상세 목록 조회
	 * @param anlsCrtrVO
	 * @return
	 * @throws Exception
	 */
	public List<AnlsCrtrVO> selectAnlsCrtrDtlList(AnlsCrtrVO anlsCrtrVO) throws Exception;
	
	/**
	 * 분석기준상세 목록 조회 (기준)
	 * @param anlsCrtrVO
	 * @return
	 * @throws Exception
	 */
	public List<AnlsCrtrVO> selectCrtrDtlList(AnlsCrtrVO anlsCrtrVO) throws Exception;
	
	/**
	 * 분석기준 등록
	 * @param anlsCrtrVO
	 * @return
	 * @throws Exception
	 */
	public int insertAnlsCrtr(AnlsCrtrVO anlsCrtrVO) throws Exception;
	
	/**
	 * 분석기준 변경
	 * @param anlsCrtrVO
	 * @return
	 * @throws Exception
	 */
	public int updateAnlsCrtr(AnlsCrtrVO anlsCrtrVO) throws Exception;
	
	/**
	 * 분석기준 삭제
	 * @param anlsCrtrVO
	 * @return
	 * @throws Exception
	 */
	public int deleteAnlsCrtr(AnlsCrtrVO anlsCrtrVO) throws Exception;
	
	/**
	 * 분석기준 상세 등록
	 * @param anlsCrtrVO
	 * @return
	 * @throws Exception
	 */
	public int insertAnlsCrtrDtl(AnlsCrtrVO anlsCrtrVO) throws Exception;
	
	/**
	 * 분석기준 상세 변경
	 * @param anlsCrtrVO
	 * @return
	 * @throws Exception
	 */
	public int updateAnlsCrtrDtl(AnlsCrtrVO anlsCrtrVO) throws Exception;
	
	/**
	 * 분석기준 상세 삭제
	 * @param anlsCrtrVO
	 * @return
	 * @throws Exception
	 */
	public int deleteAnlsCrtrDtl(AnlsCrtrVO anlsCrtrVO) throws Exception;
	
	
	
	
}
