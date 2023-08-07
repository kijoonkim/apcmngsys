package com.at.apcss.am.cmns.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.at.apcss.am.cmns.vo.RawMtrTrsprtCstVO;

/**
 * 원물운임비옹등록 Mapper 인터페이스
 * @author 하민우
 * @since 2023.08.04
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.08.04  하민우        최초 생성
 * </pre>
 */
@Mapper
public interface RawMtrTrsprtCstMapper {

	/**
	 * 원물운임비용 목록 조회
	 * @param RawMtrTrsprtCstVO
	 * @return List<RawMtrTrsprtCstVO>
	 * @throws Exception
	 */
	public List<RawMtrTrsprtCstVO> selectRawMtrTrsprtCstList(RawMtrTrsprtCstVO RawMtrTrsprtCstVO) throws Exception;

	/**
	 * 원물운임비용 등록
	 * @param RawMtrTrsprtCstVO
	 * @return
	 * @throws Exception
	 */
	public int insertRawMtrTrsprtCst(RawMtrTrsprtCstVO RawMtrTrsprtCstVO) throws Exception;

	/**
	 * 원물운임비용 수정
	 * @param RawMtrTrsprtCstVO
	 * @return
	 * @throws Exception
	 */
	public int updateRawMtrTrsprtCst(RawMtrTrsprtCstVO RawMtrTrsprtCstVO) throws Exception;

	/**
	 * 원물운임비용 삭제
	 * @param RawMtrTrsprtCstVO
	 * @return
	 * @throws Exception
	 */
	public int deleteRawMtrTrsprtCst(RawMtrTrsprtCstVO RawMtrTrsprtCstVO) throws Exception;	
}
