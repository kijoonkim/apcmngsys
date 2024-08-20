package com.at.apcss.fm.fclt.service;

import java.util.List;

import com.at.apcss.fm.fclt.vo.FcltPrgrsVO;


/**
 * 진척도 Service 인터페이스
 * @author 임준완
 * @since 2024.07.23
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.07.23  임준완        최초 생성
 * </pre>
 */
public interface FcltPrgrsService {

	/**
	 * 진척도를 조회한다.
	 * @param fcltPrgrsVO
	 * @return
	 * @throws Exception
	 */
	public FcltPrgrsVO selectPrgrs(FcltPrgrsVO fcltPrgrsVO) throws Exception;

	/**
	 * 진척도 목록을 조회한다.
	 * @param fcltPrgrsVO
	 * @return
	 * @throws Exception
	 */
	public List<FcltPrgrsVO> selectPrgrsList(FcltPrgrsVO fcltPrgrsVO) throws Exception;

	/**
	 * 운영자개요정보를 등록한다.
	 * @param fcltPrgrsVO
	 * @return
	 * @throws Exception
	 */
	public int insertFcltPrgrs(FcltPrgrsVO fcltPrgrsVO) throws Exception;

}
