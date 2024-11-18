package com.at.apcss.fm.fclt.service;

import java.util.List;

import com.at.apcss.fm.fclt.vo.FcltPrgrsVO;


/**
 * 진척도 Service 인터페이스
 * @author
 * @since 2024.07.23
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.07.23          최초 생성
 * </pre>
 */
public interface FcltPrgrsService {

	/**
	 * 진척도를 조회한다.
	 * @param fcltPrgrsVO
	 * @return FcltPrgrsVO
	 * @throws Exception
	 */
	public FcltPrgrsVO selectPrgrs(FcltPrgrsVO fcltPrgrsVO) throws Exception;

	/**
	 * 진척도 목록을 조회한다.
	 * @param fcltPrgrsVO
	 * @return List<FcltPrgrsVO>
	 * @throws Exception
	 */
	public List<FcltPrgrsVO> selectPrgrsList(FcltPrgrsVO fcltPrgrsVO) throws Exception;

	/**
	 * 진척도를 등록한다.
	 * @param fcltPrgrsVO
	 * @return int
	 * @throws Exception
	 */
	public int insertFcltPrgrs(FcltPrgrsVO fcltPrgrsVO) throws Exception;

	/**
	 * 최종제출 여부를 업데이트 한다
	 * @param fcltPrgrsVO
	 * @return int
	 * @throws Exception
	 */
	public int updatePrgrsLast(FcltPrgrsVO fcltPrgrsVO) throws Exception;

	/**
	 * 승인 여부를 업데이트 한다
	 * @param fcltPrgrsVO
	 * @return int
	 * @throws Exception
	 */
	public int updateAprv(FcltPrgrsVO fcltPrgrsVO) throws Exception;

	/**
	 * 최종제출 여부를 업데이트 한다
	 * @param List<FcltPrgrsVO>
	 * @return int
	 * @throws Exception
	 */
	public int multiSavePrgrsLast(List<FcltPrgrsVO> fcltPrgrsVOList) throws Exception;

	/**
	 * 승인 여부를 업데이트 한다
	 * @param List<FcltPrgrsVO>
	 * @return int
	 * @throws Exception
	 */
	public int multiSaveAprv(List<FcltPrgrsVO> fcltPrgrsVOList) throws Exception;

	/**
	 * 진척도 로우데이터를 조회한다.
	 * @param fcltPrgrsVO
	 * @return List<FcltPrgrsVO>
	 * @throws Exception
	 */
	public List<FcltPrgrsVO> selectPrgrsRawData(FcltPrgrsVO fcltPrgrsVO) throws Exception;

}
