package com.at.apcss.am.clcln.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.am.clcln.vo.ClclnCrtrVO;

/**
 * 정산기준 Mapper 인터페이스
 * @author 신정철
 * @since 2024.09.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.06.91  신정철        최초 생성
 * </pre>
 */
@Mapper
public interface ClclnCrtrMapper {

	/**
	 * 정산기준 조회
	 * @param clclnCrtrVO
	 * @return
	 * @throws Exception
	 */
	public ClclnCrtrVO selectClclnCrtr(ClclnCrtrVO clclnCrtrVO) throws Exception;
	
	/**
	 * 정산기준 목록 조회
	 * @param clclnCrtrVO
	 * @return
	 * @throws Exception
	 */
	public List<ClclnCrtrVO> selectClclnCrtrList(ClclnCrtrVO clclnCrtrVO) throws Exception;
	
	/**
	 * 정산기준 상세 조회
	 * @param clclnCrtrVO
	 * @return
	 * @throws Exception
	 */
	public ClclnCrtrVO selectClclnCrtrDtl(ClclnCrtrVO clclnCrtrVO) throws Exception;
	
	/**
	 * 정산기준 상세 목록 조회
	 * @param clclnCrtrVO
	 * @return
	 * @throws Exception
	 */
	public List<ClclnCrtrVO> selectClclnCrtrDtlList(ClclnCrtrVO clclnCrtrVO) throws Exception;
	
	/**
	 * 정산기준 상세 목록 조회 (삭제대상조회)
	 * @param clclnCrtrVO
	 * @return
	 * @throws Exception
	 */
	public List<ClclnCrtrVO> selectCrtrDtlList(ClclnCrtrVO clclnCrtrVO) throws Exception;
	
	/**
	 * 정산기준 등록
	 * @param clclnMngVO
	 * @return
	 * @throws Exception
	 */
	public int insertClclnCrtr(ClclnCrtrVO clclnCrtrVO) throws Exception;
	
	/**
	 * 정산기준 변경
	 * @param clclnMngVO
	 * @return
	 * @throws Exception
	 */
	public int updateClclnCrtr(ClclnCrtrVO clclnCrtrVO) throws Exception;
	
	
	/**
	 * 정산기준 삭제
	 * @param clclnMngVO
	 * @return
	 * @throws Exception
	 */
	public int deleteClclnCrtr(ClclnCrtrVO clclnCrtrVO) throws Exception;
	
	/**
	 * 정산기준 상세 등록
	 * @param clclnMngVO
	 * @return
	 * @throws Exception
	 */
	public int insertClclnCrtrDtl(ClclnCrtrVO clclnCrtrVO) throws Exception;
	
	/**
	 * 정산기준 상세 변경
	 * @param clclnMngVO
	 * @return
	 * @throws Exception
	 */
	public int updateClclnCrtrDtl(ClclnCrtrVO clclnCrtrVO) throws Exception;
	
	/**
	 * 정산기준 상세 삭제
	 * @param clclnMngVO
	 * @return
	 * @throws Exception
	 */
	public int deleteClclnCrtrDtl(ClclnCrtrVO clclnCrtrVO) throws Exception;
}
