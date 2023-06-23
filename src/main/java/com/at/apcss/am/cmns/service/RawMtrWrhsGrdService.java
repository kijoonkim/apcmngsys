package com.at.apcss.am.cmns.service;

import java.util.List;

import com.at.apcss.am.cmns.vo.RawMtrWrhsGrdVO;

/**
 * 원물입고육안등급관리 Service 인터페이스
 * @author 신정철
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21  신정철        최초 생성
 * </pre>
 */
public interface RawMtrWrhsGrdService {
	
	/**
	 * 원물입고등급 단건 조회
	 * @param rawMtrWrhsGrdVO
	 * @return
	 * @throws Exception
	 */
	public RawMtrWrhsGrdVO selectRawMtrWrhsGrd(RawMtrWrhsGrdVO rawMtrWrhsGrdVO) throws Exception;

	/**
	 * 원물입고등급 목록 조회
	 * @param rawMtrWrhsGrdVO
	 * @return
	 * @throws Exception
	 */
	public List<RawMtrWrhsGrdVO> selectRawMtrWrhsGrdList(RawMtrWrhsGrdVO rawMtrWrhsGrdVO) throws Exception;

	/**
	 * 원물입고등급 등록
	 * @param rawMtrWrhsGrdVO
	 * @return
	 * @throws Exception
	 */
	public int insertRawMtrWrhsGrd(RawMtrWrhsGrdVO rawMtrWrhsGrdVO) throws Exception;

	/**
	 * 원물입고등급 변경
	 * @param rawMtrWrhsGrdVO
	 * @return
	 * @throws Exception
	 */
	public int updateRawMtrWrhsGrd(RawMtrWrhsGrdVO rawMtrWrhsGrdVO) throws Exception;

	/**
	 * 원물입고등급 삭제
	 * @param rawMtrWrhsGrdVO
	 * @return
	 * @throws Exception
	 */
	public int deleteRawMtrWrhsGrd(RawMtrWrhsGrdVO rawMtrWrhsGrdVO) throws Exception;
}
