package com.at.apcss.am.dscd.mapper;

import com.at.apcss.am.clcln.vo.ClclnCrtrVO;
import com.at.apcss.am.dscd.vo.DscdCrtrVO;
import com.at.apcss.am.dscd.vo.DscdMngVO;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import java.util.HashMap;
import java.util.List;

/**
 *폐기기준 Mapper 인터페이스
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
public interface DscdCrtrMapper {

	/**
	 * 폐기기준 조회
	 * @param dscdCrtrVO
	 * @return
	 * @throws Exception
	 */
	public DscdCrtrVO selectDscdCrtr(DscdCrtrVO dscdCrtrVO) throws Exception;

	/**
	 * 폐기기준 목록 조회
	 * @param dscdCrtrVO
	 * @return
	 * @throws Exception
	 */
	public List<DscdCrtrVO> selectDscdCrtrList(DscdCrtrVO dscdCrtrVO) throws Exception;

	/**
	 * 폐기기준 상세 조회
	 * @param dscdCrtrVO
	 * @return
	 * @throws Exception
	 */
	public DscdCrtrVO selectDscdCrtrDtl(DscdCrtrVO dscdCrtrVO) throws Exception;

	/**
	 * 폐기기준 상세 목록 조회
	 * @param dscdCrtrVO
	 * @return
	 * @throws Exception
	 */
	public List<DscdCrtrVO> selectDscdCrtrDtlList(DscdCrtrVO dscdCrtrVO) throws Exception;

	/**
	 * 폐기기준 상세 조회 (사용중)
	 * @param dscdCrtrVO
	 * @return
	 * @throws Exception
	 */
	public List<DscdCrtrVO> selectCrtrDtlListInUse(DscdCrtrVO dscdCrtrVO) throws Exception;

	/**
	 * 폐기기준 등록
	 * @param dscdCrtrVO
	 * @return
	 * @throws Exception
	 */
	public int insertDscdCrtr(DscdCrtrVO dscdCrtrVO) throws Exception;

	/**
	 * 폐기기준 변경
	 * @param dscdCrtrVO
	 * @return
	 * @throws Exception
	 */
	public int updateDscdCrtr(DscdCrtrVO dscdCrtrVO) throws Exception;
	
	
	/**
	 * 폐기기준 삭제
	 * @param dscdCrtrVO
	 * @return
	 * @throws Exception
	 */
	public int deleteDscdCrtr(DscdCrtrVO dscdCrtrVO) throws Exception;

	/**
	 * 폐기기준 상세 등록
	 * @param dscdCrtrVO
	 * @return
	 * @throws Exception
	 */
	public int insertDscdCrtrDtl(DscdCrtrVO dscdCrtrVO) throws Exception;

	/**
	 * 폐기기준 상세 변경
	 * @param dscdCrtrVO
	 * @return
	 * @throws Exception
	 */
	public int updateDscdCrtrDtl(DscdCrtrVO dscdCrtrVO) throws Exception;

	/**
	 * 폐기기준 상세 삭제
	 * @param dscdCrtrVO
	 * @return
	 * @throws Exception
	 */
	public int deleteDscdCrtrDtl(DscdCrtrVO dscdCrtrVO) throws Exception;
}
