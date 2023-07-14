package com.at.apcss.am.oprtr.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.at.apcss.am.oprtr.vo.OprtrVO;
/**
 * 작업생산자 Mapper 인터페이스
 * @author 김호
 * @since 2023.07.13
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.07.13  김호        최초 생성
 * </pre>
 */
@Mapper
public interface OprtrMapper {
	/**
	 * 작업생산자 조회
	 * @param OprtrVO
	 * @return OprtrVO
	 * @throws Exception
	 */
	public OprtrVO selectOprtr(OprtrVO oprtrVO) throws Exception;

	/**
	 * 작업생산자 목록 조회
	 * @param OprtrVO
	 * @return List<OprtrVO>
	 * @throws Exception
	 */
	public List<OprtrVO> selectOprtrList(OprtrVO oprtrVO) throws Exception;

	/**
	 * 작업생산자 등록
	 * @param OprtrVO
	 * @return Integer
	 * @throws Exception
	 */
	public int insertOprtr(OprtrVO oprtrVO) throws Exception;

	/**
	 * 작업생산자 변경
	 * @param OprtrVO
	 * @return Integer
	 * @throws Exception
	 */
	public int updateOprtr(OprtrVO oprtrVO) throws Exception;
	/**
	 * 작업생산자 삭제
	 * @param OprtrVO
	 * @return Integer
	 * @throws Exception
	 */
	public int deleteOprtr(OprtrVO oprtrVO) throws Exception;
}
