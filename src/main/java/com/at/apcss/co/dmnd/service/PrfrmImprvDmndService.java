package com.at.apcss.co.dmnd.service;

import java.util.List;

import com.at.apcss.co.dmnd.vo.PrfrmImprvDmndVO;

/**
 * 프로그램개선요청 정보 Service 인터페이스
 * @author 김호
 * @since 2023.09.20
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.09.20  김호        최초 생성
 * </pre>
 */
public interface PrfrmImprvDmndService {


	/**
	 * 프로그램개선요청 목록 조회
	 * @param PrfrmImprvDmndVO
	 * @return List<PrfrmImprvDmndVO>
	 * @throws Exception
	 */
	List<PrfrmImprvDmndVO> selectPrfrmImprvDmndList(PrfrmImprvDmndVO prfrmImprvDmndVO) throws Exception;

	/**
	 * 프로그램개선요청 등록
	 * @param PrfrmImprvDmndVO
	 * @return integer
	 * @throws Exception
	 */
	int insertPrfrmImprvDmnd(PrfrmImprvDmndVO prfrmImprvDmndVO) throws Exception;

	/**
	 * 프로그램개선요청 수정
	 * @param PrfrmImprvDmndVO
	 * @return integer
	 * @throws Exception
	 */
	int updatePrfrmImprvDmnd(PrfrmImprvDmndVO prfrmImprvDmndVO) throws Exception;

	/**
	 * 프로그램개선요청 삭제
	 * @param PrfrmImprvDmndVO
	 * @return integer
	 * @throws Exception
	 */
	int deletePrfrmImprvDmnd(PrfrmImprvDmndVO prfrmImprvDmndVO) throws Exception;

	/**
	 * 프로그램개선요청 멀티 저장
	 * @param PrfrmImprvDmndVO
	 * @return integer
	 * @throws Exception
	 */
	int multiSavePrfrmImprvDmndList(List<PrfrmImprvDmndVO> prfrmImprvDmndList) throws Exception;

}
