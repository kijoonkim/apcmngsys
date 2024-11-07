package com.at.apcss.pd.dsm.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.pd.dsm.vo.DocsFileVO;
import com.at.apcss.pd.dsm.vo.DocsSbmsnVO;

/**
 * 증빙서류제출 Mapper 인터페이스
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
@Mapper
public interface DocsSbmsnMapper {


	/**
	 * 승인형 조직을 조회한다.
	 * @param DocsSbmsnVO
	 * @return DocsSbmsnVO
	 */
	public DocsSbmsnVO selectDocsSbmsnUoAprv(DocsSbmsnVO DocsSbmsnVO);

	/**
	 * 승인형 조직 리스트 조회한다.
	 * @param DocsSbmsnVO
	 * @return List<DocsSbmsnVO>
	 */
	public List<DocsSbmsnVO> selectDocsSbmsnUoAprvList(DocsSbmsnVO DocsSbmsnVO);

	/**
	 * 통합조직 및 소속 출자출하조직 리스트 조회한다.
	 * @param DocsSbmsnVO
	 * @return List<DocsSbmsnVO>
	 */
	public List<DocsSbmsnVO> selectDocsSbmsnBscList(DocsSbmsnVO DocsSbmsnVO);

	/**
	 * 소속 출자출하조직 리스트 조회한다.
	 * @param DocsSbmsnVO
	 * @return List<DocsSbmsnVO>
	 */
	public List<DocsSbmsnVO> selectDocsSbmsnDtlIsoList(DocsSbmsnVO DocsSbmsnVO);

	/**
	 * 소속 생산자조직 리스트 조회한다.
	 * @param DocsSbmsnVO
	 * @return List<DocsSbmsnVO>
	 */
	public List<DocsSbmsnVO> selectDocsSbmsnDtlPoList(DocsSbmsnVO DocsSbmsnVO);

	/**
	 * 제출서류 리스트 조회한다.
	 * @param DocsSbmsnVO
	 * @return List<DocsSbmsnVO>
	 */
	public List<DocsSbmsnVO> selectDocsSbmsnList(DocsSbmsnVO DocsSbmsnVO);

	/**
	 * 제출서류 파일정보를 저장한다.
	 * @param DocsFileVO
	 * @return int
	 */
	public int insertSbmsnDcmntFile(DocsFileVO DocsFileVO);

	/**
	 * 제출서류 서류정보를 저장한다.
	 * @param DocsFileVO
	 * @return int
	 */
	public int insertSbmsnDcmnt(DocsFileVO DocsFileVO);

	/**
	 * 제출서류 서류정보를 저장한다.
	 * @param DocsFileVO
	 * @return int
	 */
	public int insertSbmsnDcmntRmrk(DocsSbmsnVO DocsSbmsnVO);

	/**
	 * 제출서류 서류정보를 승인한다.
	 * @param DocsFileVO
	 * @return int
	 */
	public int updateDocsSbmsnAprv(DocsSbmsnVO DocsSbmsnVO);

}
