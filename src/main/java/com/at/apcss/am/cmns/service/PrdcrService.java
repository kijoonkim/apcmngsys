package com.at.apcss.am.cmns.service;

import java.util.HashMap;
import java.util.List;

import com.at.apcss.am.cmns.vo.PrdcrVO;

/**
 * 생산자정보관리 Service 인터페이스
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
public interface PrdcrService {

	/**
	 * 생산자정보 단건 조회
	 * @param prdcrVO
	 * @return
	 * @throws Exception
	 */
	public PrdcrVO selectPrdcr(PrdcrVO prdcrVO) throws Exception;

	/**
	 * 생산자정보 목록 조회
	 * @param prdcrVO
	 * @return
	 * @throws Exception
	 */
	public List<PrdcrVO> selectPrdcrList(PrdcrVO prdcrVO) throws Exception;

	/**
	 * 생산자정보 코드 목록 조회
	 * @param prdcrVO
	 * @return
	 * @throws Exception
	 */
	public List<PrdcrVO> selectPrdcrCdList(PrdcrVO prdcrVO) throws Exception;
	
	/**
	 * 아그리스 생산자 마스터 목록 조회
	 * @param prdcrVO
	 * @return
	 * @throws Exception
	 */
	public List<PrdcrVO> selectAgrixPrdcrList(PrdcrVO prdcrVO) throws Exception;

	/**
	 * 생산자정보 등록
	 * @param prdcrVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertPrdcr(PrdcrVO prdcrVO) throws Exception;

	/**
	 * 생산자정보 변경
	 * @param prdcrVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> updatePrdcr(PrdcrVO prdcrVO) throws Exception;

	/**
	 * 생산자 대표정보 최신화
	 * @param prdcrVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> updatePrdcrRprs(PrdcrVO prdcrVO) throws Exception;

	/**
	 * 생산자정보 삭제
	 * @param prdcrVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> deletePrdcr(PrdcrVO prdcrVO) throws Exception;

	/**
	 * 생산자정보 등록
	 * @param prdcrList
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> multiPrdcrList(List<PrdcrVO> prdcrList) throws Exception;
	/**
	 * APC 생산자 정보 업데이트
	 * @param PrdcrVO
	 * @return integer
	 * @throws Exception
	 */
	public int updateApcPrdcr(PrdcrVO prdcrVO) throws Exception;
	/**
	 * APC 생산자 정보 업데이트 목록
	 * @param List<PrdcrVO>
	 * @return HashMap<String, Object>
	 * @throws Exception
	 */
	public HashMap<String, Object> updatePrdcrList(List<PrdcrVO> prdcrVO) throws Exception;

}
