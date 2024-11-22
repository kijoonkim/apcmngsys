package com.at.apcss.am.tot.service;

import java.util.HashMap;
import java.util.List;

import com.at.apcss.am.tot.vo.TotMngVO;


/**
 * 집계 Service 인터페이스
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
public interface TotMngService {

	/**
	 * 집계기준정보조회
	 * @param TotMngVO
	 * @return
	 * @throws Exception
	 */
	public List<TotMngVO> selectTotCrtrInfoList(TotMngVO TotMngVO) throws Exception;

	/**
	 * 집계기준상세정보조회
	 * @param TotMngVO
	 * @return
	 * @throws Exception
	 */
	public List<TotMngVO> selectTotCrtrInfoDtlList(TotMngVO TotMngVO) throws Exception;

	/**
	 * 집계기준정보등록
	 * @param TotMngVO
	 * @return
	 * @throws Exception
	 */
	public int insertTotCrtrInfo(TotMngVO TotMngVO) throws Exception;

	/**
	 * 집계기준상세정보등록
	 * @param TotMngVO
	 * @return
	 * @throws Exception
	 */
	public int insertTotCrtrDtlInfo(List<TotMngVO> TotMngVO) throws Exception;


	/**
	 * 집계기준정보삭제
	 * @param TotMngVO
	 * @return
	 * @throws Exception
	 */
	public int deleteTotCrtrInfo(TotMngVO totMngVO) throws Exception;





}
