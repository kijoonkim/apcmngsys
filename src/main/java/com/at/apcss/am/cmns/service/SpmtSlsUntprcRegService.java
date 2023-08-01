package com.at.apcss.am.cmns.service;

import java.util.List;

import com.at.apcss.am.cmns.vo.SpmtSlsUntprcRegVO;

/**
 * 출하매출단가 service 인터페이스
 * @author 김호
 * @since 2023.08.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.08.01  김호        최초 생성
 * </pre>
 */
public interface SpmtSlsUntprcRegService {
	/**
	 * 출하매출단가 단건 조회
	 * @param SpmtSlsUntprcRegVO
	 * @return SpmtSlsUntprcRegVO
	 * @throws Exception
	 */
	public SpmtSlsUntprcRegVO selectSpmtSlsUntprcReg(SpmtSlsUntprcRegVO spmtSlsUntprcRegVO) throws Exception;

	/**
	 * 출하매출단가 목록 조회
	 * @param SpmtSlsUntprcRegVO
	 * @return List<SpmtSlsUntprcRegVO>
	 * @throws Exception
	 */
	public List<SpmtSlsUntprcRegVO> selectSpmtSlsUntprcRegList(SpmtSlsUntprcRegVO spmtSlsUntprcRegVO) throws Exception;

	/**
	 * 출하매출단가 등록
	 * @param SpmtSlsUntprcRegVO
	 * @return Integer
	 * @throws Exception
	 */
	public int insertSpmtSlsUntprcReg(SpmtSlsUntprcRegVO spmtSlsUntprcRegVO) throws Exception;

	/**
	 * 출하매출단가 변경
	 * @param SpmtSlsUntprcRegVO
	 * @return Integer
	 * @throws Exception
	 */
	public int updateSpmtSlsUntprcReg(SpmtSlsUntprcRegVO spmtSlsUntprcRegVO) throws Exception;

	/**
	 * 출하매출단가 삭제
	 * @param SpmtSlsUntprcRegVO
	 * @return Integer
	 * @throws Exception
	 */
	public int deleteSpmtSlsUntprcReg(SpmtSlsUntprcRegVO spmtSlsUntprcRegVO) throws Exception;

	/**
	 * 출하매출단가 자동발번 코드 조회
	 * @param SpmtSlsUntprcRegVO
	 * @return SpmtSlsUntprcRegVO
	 * @throws Exception
	 */
	public SpmtSlsUntprcRegVO getSpmtSlsUntprcCd(SpmtSlsUntprcRegVO spmtSlsUntprcRegVO) throws Exception;
}
