package com.at.apcss.am.shpgot.service;

import com.at.apcss.am.shpgot.vo.ShpgotCrtrVO;
import com.at.apcss.am.shpgot.vo.ShpgotMngVO;
import com.at.apcss.am.shpgot.vo.ShpgotRsltVO;
import com.at.apcss.am.stat.vo.StatCrtrVO;
import com.at.apcss.am.stat.vo.StatMngVO;

import java.util.HashMap;
import java.util.List;


/**
 * 통계 Service 인터페이스
 * @author 박승진
 * @since 2024.10.23
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.10.23  박승진        최초 생성
 * </pre>
 */
public interface ShpgotMngService {

	public ShpgotCrtrVO selectCrtr(ShpgotCrtrVO shpgotCrtrVO) throws Exception;

	public ShpgotCrtrVO selectCrtr(String apcCd, String shpgotCrtrType, String crtrCd) throws Exception;

	/**
	 * 기준정보 목록 조회
	 * @param shpgotCrtrVO
	 * @return
	 * @throws Exception
	 */
	public List<ShpgotCrtrVO> selectCrtrList(ShpgotCrtrVO shpgotCrtrVO) throws Exception;

	/**
	 * 기준상세 목록 조회
	 * @param shpgotCrtrVO
	 * @return
	 * @throws Exception
	 */
	public List<ShpgotCrtrVO> selectCrtrDtlList(ShpgotCrtrVO shpgotCrtrVO) throws Exception;

	/**
	 * 기준 등록
	 * @param shpgotMngVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertCrtr(ShpgotMngVO shpgotMngVO) throws Exception;

	/**
	 * 기준 삭제
	 * @param shpgotMngVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> deleteCrtr(ShpgotMngVO shpgotMngVO) throws Exception;

	/**
	 * 기준상세 등록
	 * @param shpgotMngVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertCrtrDtl(ShpgotMngVO shpgotMngVO) throws Exception;

	/**
	 * 기준상세 삭제
	 * @param shpgotMngVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> deleteCrtrDtl(ShpgotMngVO shpgotMngVO) throws Exception;

	/**
	 * 원물반품 등록
	 * @param shpgotMngVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertShpgotRsltRawMtr(ShpgotMngVO shpgotMngVO) throws Exception;

	/**
	 * 원물반품 삭제
	 * @param shpgotMngVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> deleteShpgotRsltRawMtr(ShpgotMngVO shpgotMngVO) throws Exception;

	/**
	 * 상품반품 등록
	 * @param shpgotMngVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertShpgotRsltGds(ShpgotMngVO shpgotMngVO) throws Exception;

	/**
	 * 상품반품 삭제
	 * @param shpgotMngVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> deleteShpgotRsltGds(ShpgotMngVO shpgotMngVO) throws Exception;

	/**
	 * 원물 반출 실적 조회
	 * @param shpgotRsltVO
	 * @return
	 * @throws Exception
	 */
	public List<ShpgotRsltVO> selectShpgotRsltRawMtrList(ShpgotRsltVO shpgotRsltVO) throws Exception;

	/**
	 * 상품 반출 실적 공통 조회
	 * @param shpgotRsltVO
	 * @return
	 * @throws Exception
	 */
	public List<ShpgotRsltVO> selectShpgotRsltGdsComList(ShpgotRsltVO shpgotRsltVO) throws Exception;

	/**
	 * 상품 반출 실적 상세 조회
	 * @param shpgotRsltVO
	 * @return
	 * @throws Exception
	 */
	public List<ShpgotRsltVO> selectShpgotRsltGdsList(ShpgotRsltVO shpgotRsltVO) throws Exception;



}
