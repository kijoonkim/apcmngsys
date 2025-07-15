package com.at.apcss.am.wrhs.service;

import com.at.apcss.am.wrhs.vo.RawMtrWrhsIgiDtlVO;
import com.at.apcss.am.wrhs.vo.RawMtrWrhsIgiVO;
import com.at.apcss.am.wrhs.vo.RawMtrWrhsMngVO;

import java.util.HashMap;
import java.util.List;

/**
 * 원물입고 Service 인터페이스
 * @author 김호
 * @since 2025.07.10
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2025.07.10  김호        최초 생성
 * </pre>
 */
public interface RawMtrWrhsIgiService {
	
	/**
	 * 원물 재처리
	 * @param rawMtrWrhsMngVO
	 * @return
	 * @throws Exception
	 */
	//public HashMap<String, Object> insertRawMtrRePrcs(RawMtrWrhsMngVO rawMtrWrhsMngVO) throws Exception;

	/**
	 * 검수등록 목록 조회
	 * @param rawMtrWrhsIgiVO
	 * @return
	 * @throws Exception
	 */
	public List<RawMtrWrhsIgiVO> selectRawMtrWrhsIgiList(RawMtrWrhsIgiVO rawMtrWrhsIgiVO) throws Exception;


	/**
	 * 검수등록 발번 조회
	 * @param rawMtrWrhsIgiVO
	 * @return
	 * @throws Exception
	 */
	public String selectGetIgiSeq(RawMtrWrhsIgiVO rawMtrWrhsIgiVO) throws Exception;
	/**
	 * 검수 등록
	 * @param rawMtrWrhsIgiVO
	 * @return
	 * @throws Exception
	 */
	public int insertRawMtrWrhsIgi(RawMtrWrhsIgiVO rawMtrWrhsIgiVO) throws Exception;

	/**
	 * 검수 수정
	 * @param rawMtrWrhsIgiVO
	 * @return
	 * @throws Exception
	 */
	public int updateRawMtrWrhsIgi(RawMtrWrhsIgiVO rawMtrWrhsIgiVO) throws Exception;

	/**
	 * 검수 삭제
	 * @param rawMtrWrhsIgiVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> deleteRawMtrWrhsIgi(RawMtrWrhsIgiVO rawMtrWrhsIgiVO) throws Exception;

	/**
	 * 검수 상세 등록
	 * @param rawMtrWrhsIgiDtlVO
	 * @return
	 * @throws Exception
	 */
	public int insertRawMtrWrhsIgiDtl(RawMtrWrhsIgiDtlVO rawMtrWrhsIgiDtlVO) throws Exception;

	/**
	 * 검수 상세 수정
	 * @param rawMtrWrhsIgiDtlVO
	 * @return
	 * @throws Exception
	 */
	public int updateRawMtrWrhsIgiDtl(RawMtrWrhsIgiDtlVO rawMtrWrhsIgiDtlVO) throws Exception;

	/**
	 * 검수 멀티 저장
	 * @param RawMtrWrhsIgiList
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> multiRawMtrWrhsIgiList(List<RawMtrWrhsIgiVO> RawMtrWrhsIgiList) throws Exception;

	
}
