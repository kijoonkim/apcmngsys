package com.at.apcss.am.cmns.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.at.apcss.am.cmns.vo.GdsVO;

/**
 * 상품정보 Mapper 인터페이스
 * @author 하민우
 * @since 2023.09.11
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.09.11  하민우        최초 생성
 * </pre>
 */
@Mapper
public interface GdsMapper {

	/**
	 * 상품정보 목록 조회
	 * @param GdsVO
	 * @return
	 * @throws Exception
	 */
	public List<GdsVO> selectGdsList(GdsVO gdsVO) throws Exception;

	/**
	 * 상품정보 등록
	 * @param GdsVO
	 * @return
	 * @throws Exception
	 */
	public int insertGds(GdsVO gdsVO) throws Exception;

	/**
	 * 상품정보 변경
	 * @param GdsVO
	 * @return
	 * @throws Exception
	 */
	public int updateGds(GdsVO gdsVO) throws Exception;

	/**
	 * 상품정보 삭제
	 * @param GdsVO
	 * @return
	 * @throws Exception
	 */
	public int deleteGds(GdsVO gdsVO) throws Exception;
}
