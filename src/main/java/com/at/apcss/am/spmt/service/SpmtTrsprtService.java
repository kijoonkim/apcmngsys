package com.at.apcss.am.spmt.service;

import java.util.List;

import com.at.apcss.am.spmt.vo.SpmtTrsprtVO;

/**
 * 출하운송회사정보 Service 인터페이스
 * @author 김호
 * @since 2023.07.13
 * @version 1.0
 * @see
 *
 *      <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.07.13  김호        최초 생성
 *      </pre>
 */

public interface SpmtTrsprtService {

	/**
	 * 출하운송회사정보 단건 조회
	 * @param SpmtTrsprtVO
	 * @return SpmtTrsprtVO
	 * @throws Exception
	 */
	public SpmtTrsprtVO selectSpmtTrsprt(SpmtTrsprtVO spmtTrsprtVO) throws Exception;

	/**
	 * 출하운송회사정보 목록 조회
	 * @param SpmtTrsprtVO
	 * @return List<SpmtTrsprtVO>
	 * @throws Exception
	 */
	public List<SpmtTrsprtVO> selectSpmtTrsprtList(SpmtTrsprtVO spmtTrsprtVO)throws Exception;

	/**
	 * 출하운송회사정보 등록
	 * @param SpmtTrsprtVO
	 * @return Integer
	 * @throws Exception
	 */
	public int insertSpmtTrsprt(SpmtTrsprtVO spmtTrsprtVO)throws Exception;

	/**
	 * 출하운송회사정보 변경
	 * @param SpmtTrsprtVO
	 * @return Integer
	 * @throws Exception
	 */
	public int updateSpmtTrsprt(SpmtTrsprtVO spmtTrsprtVO)throws Exception;

	/**
	 * 출하운송회사정보 삭제
	 * @param SpmtTrsprtVO
	 * @return Integer
	 * @throws Exception
	 */
	public int deleteSpmtTrsprt(SpmtTrsprtVO spmtTrsprtVO)throws Exception;

}
