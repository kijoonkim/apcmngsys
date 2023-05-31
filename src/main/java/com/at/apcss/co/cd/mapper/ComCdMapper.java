package com.at.apcss.co.cd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.at.apcss.co.cd.vo.ComCdVO;
/**
 * 공통코드 Mapper
 * @author FINEVT 개발팀 김호
 * @since 2023.05.18
 * @version 1.0
 * @see
 *
 * <pre>
 * 공통코드
 *
 *  수정일      수정자      수정내용
 *  -------            --------        ---------------------------
 *  2023.05.18  김호       최초 생성
 *
 *  </pre>
 */
@Mapper
public interface ComCdMapper {

	/**
	 * 공통코드 조회
	 * @param ComCd
	 * @return
	 */
	public ComCdVO selectComCd(ComCdVO comCdVO);
	
	/**
	 * 공통코드 목록 조회
	 * @param comCdVO
	 * @return
	 */
	public List<ComCdVO> selectComCdList(ComCdVO comCdVO);
	
	/**
	 * 공통코드 상세 목록 조회
	 * @param comCdVO
	 * @return
	 */
	public List<ComCdVO> selectComCdDtlList(ComCdVO comCdVO);
	
	/**
	 * 공통코드 등록
	 * @param comCdVO
	 * @return inserted count
	 */
	public int insertComCd(ComCdVO comCdVO);
	
	/**
	 * 공통코드 변경
	 * @param comCdVO
	 * @return updated count
	 */
	public int updateComCd(ComCdVO comCdVO);
	
	/**
	 * 공통코드 삭제 
	 * @param comCdVO
	 * @return deleted count
	 */
	public int deleteComCd(ComCdVO comCdVO);
	
	/**
	 * 공통코드 상세 등록
	 * @param comCdVO
	 * @return inserted count
	 */
	public int insertComCdDtl(ComCdVO comCdVO);
	
	/**
	 * 공통코드 상세 변경
	 * @param comCdVO
	 * @return updated count
	 */
	public int updateComCdDtl(ComCdVO comCdVO);
	
	/**
	 * 공통코드 상세 삭제
	 * @param comCdVO
	 * @return deleted count
	 */
	public int deleteComCdDtl(ComCdVO comCdVO);
}
