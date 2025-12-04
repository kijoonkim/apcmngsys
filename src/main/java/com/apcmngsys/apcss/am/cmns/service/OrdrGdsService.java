package com.apcmngsys.apcss.am.cmns.service;

import java.util.HashMap;
import java.util.List;

import com.apcmngsys.apcss.am.cmns.vo.CmnsGdsVO;
import com.apcmngsys.apcss.am.cmns.vo.OrdrGdsVO;

/**
 * 발주 상품정보 Service 인터페이스
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
public interface OrdrGdsService {

	/**
	 * 발주상품정보 조회
	 * @param ordrGdsVO
	 * @return
	 * @throws Exception
	 */
	public OrdrGdsVO selectOrdrGds(OrdrGdsVO ordrGdsVO) throws Exception;
	
	/**
	 * 발주상품정보 목록 조회
	 * @param ordrGdsVO
	 * @return
	 * @throws Exception
	 */
	public List<OrdrGdsVO> selectOrdrGdsList(OrdrGdsVO ordrGdsVO) throws Exception;
	
	/**
	 * 발주상품정보 목록 저장
	 * @param ordrGdsList
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> multiOrdrGdsList(List<OrdrGdsVO> ordrGdsList) throws Exception;
	
	/**
	 * 발주상품정보 등록
	 * @param ordrGdsVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertOrdrGds(OrdrGdsVO ordrGdsVO) throws Exception;
	
	/**
	 * 발주상품정보 변경
	 * @param ordrGdsVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> updateOrdrGds(OrdrGdsVO ordrGdsVO) throws Exception;
	
	/**
	 * 발주상품정보 변경 set delYn 'Y'
	 * @param ordrGdsVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> updateOrdrGdsForDelY(OrdrGdsVO ordrGdsVO) throws Exception;
	
	/**
	 * 발주상품정보 삭제
	 * @param ordrGdsVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> deleteOrdrGds(OrdrGdsVO ordrGdsVO) throws Exception;
	
}
