package com.at.apcss.pd.dsm.service;

import java.util.List;

import com.at.apcss.pd.dsm.vo.DocsFileVO;
import com.at.apcss.pd.dsm.vo.DocsSbmsnVO;


/**
 * 증빙서류제출 Service 인터페이스
 * @author ljw
 * @since 2024.11.03
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.11.03  ljw        최초 생성
 * </pre>
 */
public interface DocsSbmsnService {

	/**
	 * 승인형 조직을 조회한다.
	 * @param DocsSbmsnVO
	 * @return DocsSbmsnVO
	 * @throws Exception
	 */
	public DocsSbmsnVO selectDocsSbmsnUoAprv(DocsSbmsnVO DocsSbmsnVO) throws Exception;

	/**
	 * 승인형 조직 리스트 조회한다.
	 * @param DocsSbmsnVO
	 * @return List<DocsSbmsnVO>
	 * @throws Exception
	 */
	public List<DocsSbmsnVO> selectDocsSbmsnUoAprvList(DocsSbmsnVO DocsSbmsnVO) throws Exception;

	/**
	 * 통합조직 및 소속 출자출하조직 리스트 조회한다.
	 * @param DocsSbmsnVO
	 * @return List<DocsSbmsnVO>
	 * @throws Exception
	 */
	public List<DocsSbmsnVO> selectDocsSbmsnBscList(DocsSbmsnVO DocsSbmsnVO) throws Exception;

	/**
	 * 소속 출자출하조직 리스트 조회한다.
	 * @param DocsSbmsnVO
	 * @return List<DocsSbmsnVO>
	 * @throws Exception
	 */
	public List<DocsSbmsnVO> selectDocsSbmsnDtlIsoList(DocsSbmsnVO DocsSbmsnVO) throws Exception;

	/**
	 * 소속 생산자조직 리스트 조회한다.
	 * @param DocsSbmsnVO
	 * @return List<DocsSbmsnVO>
	 * @throws Exception
	 */
	public List<DocsSbmsnVO> selectDocsSbmsnDtlPoList(DocsSbmsnVO DocsSbmsnVO) throws Exception;

	/**
	 * 제출 서류 리스트 조회한다.
	 * @param DocsSbmsnVO
	 * @return List<DocsSbmsnVO>
	 * @throws Exception
	 */
	public List<DocsSbmsnVO> selectDocsSbmsnList(DocsSbmsnVO DocsSbmsnVO) throws Exception;

	/**
	 * 제출 서류 파일 리스트를 저장한다.
	 * @param DocsSbmsnVO
	 * @return int
	 * @throws Exception
	 */
	public int multiSaveList(DocsSbmsnVO DocsSbmsnVO) throws Exception;

	/**
	 * 제출 서류 리스트를 저장한다.
	 * @param DocsSbmsnVO
	 * @return int
	 * @throws Exception
	 */
	public int multiSaveFileList(DocsSbmsnVO DocsSbmsnVO, String filepathPd) throws Exception;

	/**
	 * 제출 서류 리스트를 승인한다.
	 * @param List<DocsSbmsnVO>
	 * @return int
	 * @throws Exception
	 */
	public int multiSaveDocsSbmsnAprv(List<DocsSbmsnVO> DocsSbmsnVOList) throws Exception;

	/**
	 * 제출 서류 승인한다.
	 * @param DocsSbmsnVO
	 * @return int
	 * @throws Exception
	 */
	public int updateDocsSbmsnAprv(DocsSbmsnVO DocsSbmsnVO) throws Exception;

}
