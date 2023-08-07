package com.at.apcss.am.whrs.service;

import java.util.HashMap;
import java.util.List;

import com.at.apcss.am.wgh.vo.WghPrfmncVO;
import com.at.apcss.am.whrs.vo.RawMtrWrhsVO;

/**
 * 원물입고 Service 인터페이스
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
public interface RawMtrWrhsService {
	
	/**
	 * 원물입고 단건 조회
	 * @param rawMtrWrhsVO
	 * @return
	 * @throws Exception
	 */
	public RawMtrWrhsVO selectRawMtrWrhs(RawMtrWrhsVO rawMtrWrhsVO) throws Exception;

	/**
	 * 원물입고 목록 조회
	 * @param rawMtrWrhsVO
	 * @return
	 * @throws Exception
	 */
	public List<RawMtrWrhsVO> selectRawMtrWrhsList(RawMtrWrhsVO rawMtrWrhsVO) throws Exception;

	/**
	 * 원물입고 등록
	 * @param rawMtrWrhsVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertRawMtrWrhs(RawMtrWrhsVO rawMtrWrhsVO) throws Exception;
	
	/**
	 * 원물입고 등록
	 * @param rawMtrWrhsVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertRawMtrWrhsList(List<RawMtrWrhsVO> rawMtrWrhsList) throws Exception;
	
	/**
	 * 계량번호를 통한 원물입고 등록
	 * @param rawMtrWrhsVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertRawMtrWrhsByWghno(RawMtrWrhsVO rawMtrWrhsVO) throws Exception;

	/**
	 * 원물입고 변경
	 * @param rawMtrWrhsVO
	 * @return
	 * @throws Exception
	 */
	public int updateRawMtrWrhs(RawMtrWrhsVO rawMtrWrhsVO) throws Exception;

	/**
	 * 원물입고 삭제
	 * @param rawMtrWrhsVO
	 * @return
	 * @throws Exception
	 */
	public int deleteRawMtrWrhs(RawMtrWrhsVO rawMtrWrhsVO) throws Exception;
	
	
}
