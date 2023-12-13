package com.at.apcss.am.wrhs.service;

import java.util.HashMap;

import com.at.apcss.am.wrhs.vo.RawMtrWrhsMngVO;

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
public interface RawMtrWrhsMngService {
	
	/**
	 * 원물 재처리
	 * @param rawMtrWrhsMngVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertRawMtrRePrcs(RawMtrWrhsMngVO rawMtrWrhsMngVO) throws Exception;

	/**
	 * 원물 재처리 취소
	 * @param rawMtrWrhsMngVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> deleteRawMtrRePrcs(RawMtrWrhsMngVO rawMtrWrhsMngVO) throws Exception;
	
	/**
	 * 원물입고 취소
	 * @param rawMtrWrhsMngVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> deleteRawMtrPrcs(RawMtrWrhsMngVO rawMtrWrhsMngVO) throws Exception;
	
	
	
}
