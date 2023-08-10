package com.at.apcss.am.cmns.service;

import java.util.List;

import com.at.apcss.am.cmns.vo.RawMtrTrsprtCstVO;

/**
 * 지역별운임비관리 Service 인터페이스
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
public interface RawMtrTrsprtCstService {

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

	/**
	 * 원물운임비용 멀티등록
	 * @param RawMtrTrsprtCstVO
	 * @return Integer
	 * @throws Exception
	 */
	public int multiTrsprtCstList(List<RawMtrTrsprtCstVO> RawMtrTrsprtCstList) throws Exception;

}
