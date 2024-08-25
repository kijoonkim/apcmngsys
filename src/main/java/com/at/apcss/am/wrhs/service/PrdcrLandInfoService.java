package com.at.apcss.am.wrhs.service;

import java.util.List;

import com.at.apcss.am.wrhs.vo.PrdcrLandInfoVO;

/**
 * 영농관리 - 생산자농지정보 Service 인터페이스
 * @author 김  호
 * @since 2024.07.31
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.07.31  김  호        최초 생성
 * </pre>
 */
public interface PrdcrLandInfoService {

	/**
	 * 생산자농지정보 목록 조회
	 * @param prdcrLandInfoVO
	 * @return List<PrdcrLandInfoVO>
	 * @throws Exception
	 */
	public List<PrdcrLandInfoVO> selectPrdcrLandInfoList(PrdcrLandInfoVO prdcrLandInfoVO) throws Exception;

	/**
	 * 생산자농지정보 번호 발번
	 * @param prdcrLandInfoVO
	 * @return String
	 * @throws Exception
	 */
	public String selectGetPrdcrLandInfoNo(PrdcrLandInfoVO prdcrLandInfoVO) throws Exception;

	/**
	 * 생산자농지정보 등록
	 * @param prdcrLandInfoVO
	 * @return Integer
	 * @throws Exception
	 */
	public int insertPrdcrLandInfo(PrdcrLandInfoVO prdcrLandInfoVO) throws Exception;

	/**
	 * 생산자농지정보 수정
	 * @param prdcrLandInfoVO
	 * @return Integer
	 * @throws Exception
	 */
	public int updatePrdcrLandInfo(PrdcrLandInfoVO prdcrLandInfoVO) throws Exception;

	/**
	 * 생산자농지정보 삭제
	 * @param prdcrLandInfoVO
	 * @return Integer
	 * @throws Exception
	 */
	public int deletePrdcrLandInfo(PrdcrLandInfoVO prdcrLandInfoVO) throws Exception;

}
