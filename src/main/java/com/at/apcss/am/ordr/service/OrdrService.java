package com.at.apcss.am.ordr.service;

import java.util.HashMap;
import java.util.List;

import com.at.apcss.am.ordr.vo.OrdrVO;

/**
 * 발주정보 Service 인터페이스
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
public interface OrdrService {

	/**
	 * 발주정보 단건 조회
	 * @param ordrVO
	 * @return
	 * @throws Exception
	 */
	public OrdrVO selectOrdr(OrdrVO ordrVO) throws Exception;

	/**
	 * 발주정보 목록 조회
	 * @param ordrVO
	 * @return
	 * @throws Exception
	 */
	public List<OrdrVO> selectOrdrList(OrdrVO ordrVO) throws Exception;

	/**
	 * 발주정보 수기등록 목록 조회
	 * @param ordrVO
	 * @return
	 * @throws Exception
	 */
	public List<OrdrVO> selectOrdrHandwritingList(OrdrVO ordrVO) throws Exception;

	/**
	 * 발주정보 등록
	 * @param ordrVO
	 * @return
	 * @throws Exception
	 */
	public int insertOrdr(OrdrVO ordrVO) throws Exception;

	/**
	 * 발주정보 변경
	 * @param ordrVO
	 * @return
	 * @throws Exception
	 */
	public int updateOrdr(OrdrVO ordrVO) throws Exception;

	/**
	 * 발주정보 등록
	 * @param ordrList
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> multiOrdrList(List<OrdrVO> ordrList) throws Exception;

	/**
	 * 발주정보 삭제
	 * @param ordrVO
	 * @return
	 * @throws Exception
	 */
	public int deleteOrdr(OrdrVO ordrVO) throws Exception;

	/**
	 * 발주정보 목록 삭제
	 * @param ordrVO
	 * @return
	 * @throws Exception
	 */
	public int deleteOrdrList(List<OrdrVO> ordrList) throws Exception;

	/**
	 * 발주정보 목록 삭제
	 * @param ordrList
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> deleteOutordrList(List<OrdrVO> ordrList) throws Exception;
	
	/**
	 * 발주정보 출하지시번호 확인
	 * @param ordrVO
	 * @return
	 * @throws Exception
	 */
	public int selectOrdrCheck(OrdrVO ordrVO) throws Exception;

	/**
	 * 발주정보 출하지시번호 저장
	 * @param ordrVO
	 * @return
	 * @throws Exception
	 */
	public void updateCmndno(OrdrVO ordrVO) throws Exception;
}
