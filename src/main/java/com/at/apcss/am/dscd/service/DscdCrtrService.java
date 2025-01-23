package com.at.apcss.am.dscd.service;

import com.at.apcss.am.dscd.vo.DscdCrtrVO;
import com.at.apcss.am.dscd.vo.DscdMngVO;

import java.util.HashMap;
import java.util.List;

/**
 * 폐기기준 Service 인터페이스
 * @author 신정철
 * @since 2024.09.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.09.21  신정철        최초 생성
 * </pre>
 */
public interface DscdCrtrService {
	
	/**
	 * 폐기기준 조회
	 * @param dscdCrtrVO
	 * @return
	 * @throws Exception
	 */
	public DscdCrtrVO selectDscdCrtr(DscdCrtrVO dscdCrtrVO) throws Exception;
	public DscdCrtrVO selectDscdCrtr(String apcCd, String dscdCrtrType, String crtrCd) throws Exception;
	
	/**
	 * 폐기기준 상세 조회
	 * @param dscdCrtrVO
	 * @return
	 * @throws Exception
	 */
	public DscdCrtrVO selectDscdCrtrDtl(DscdCrtrVO dscdCrtrVO) throws Exception;
	
	/**
	 * 폐기기준 상세 조회 (사용중)
	 * @param dscdCrtrVO
	 * @return
	 * @throws Exception
	 */
	public List<DscdCrtrVO> selectCrtrDtlListInUse(DscdCrtrVO dscdCrtrVO) throws Exception;


    /**
     * 폐기 기준 관리 - 폐기기준 목록 조회
     * @param dscdCrtrVO
     * @return
     * @throws Exception
     */
    public List<DscdCrtrVO> selectDscdCrtrList(DscdCrtrVO dscdCrtrVO) throws Exception;

    /**
     * 폐기 기준 관리 - 폐기기준 목록 추가
     * @param clclnMngVO
     * @return
     * @throws Exception
     */
    public HashMap<String, Object> insertDscdCrtr(DscdMngVO clclnMngVO) throws Exception;

    /**
     * 폐기 기준 관리 - 폐기기준 목록 삭제
     * @param dscdMngVO
     * @return
     * @throws Exception
     */
    public HashMap<String, Object> deleteDscdCrtr(DscdMngVO dscdMngVO) throws Exception;

    /**
     * 폐기 기준 관리 - 폐기기준 상세정보 조회
     * @param dscdCrtrVO
     * @return
     * @throws Exception
     */
    public List<DscdCrtrVO> selectDscdCrtrDtlList(DscdCrtrVO dscdCrtrVO) throws Exception;
	
	/**
	 * 폐기 기준 관리 - 폐기기준 상세정보 추가
	 * @param dscdCrtrVO
	 * @return
	 * @throws Exception
	 */
    public int insertDscdCrtrDtl(List<DscdCrtrVO> dscdCrtrVO) throws Exception;
	
	/**
	 * 폐기 기준 관리 - 폐기기준 상세정보 삭제
	 * @param dscdCrtrVO
	 * @return
	 * @throws Exception
	 */
    public int deleteDscdCrtrDtl(DscdCrtrVO dscdCrtrVO) throws Exception;

    /**
     * 폐기 등록 - 재고 목록 조회 (원물)
     * @param dscdCrtrVO
     * @return
     * @throws Exception
     */
    public List<DscdCrtrVO> selectRawMtrInvntrList(DscdCrtrVO dscdCrtrVO) throws Exception;

    /**
     * 폐기 등록 - 재고 목록 조회 (선별)
     * @param dscdCrtrVO
     * @return
     * @throws Exception
     */
    public List<DscdCrtrVO> selectSortInvntrList(DscdCrtrVO dscdCrtrVO) throws Exception;

    /**
     * 폐기 등록 - 재고 목록 조회 (상품)
     * @param dscdCrtrVO
     * @return
     * @throws Exception
     */
    public List<DscdCrtrVO> selectGdsInvntrList(DscdCrtrVO dscdCrtrVO) throws Exception;

    /**
     * 폐기 등록 - 폐기 등록 목록 조회
     * @param dscdCrtrVO
     * @return
     * @throws Exception
     */
    public List<DscdCrtrVO> selectDscdRegList(DscdCrtrVO dscdCrtrVO) throws Exception;

    /**
     * 폐기 등록 - 폐기 등록 목록 추가
     * @param dscdRegList
     * @return
     * @throws Exception
     */
    public int insertDscdRegList(List<DscdCrtrVO> dscdRegList) throws Exception;

    /**
     * 폐기 등록 - 폐기 등록 목록 삭제
     * @param dscdCrtrVO
     * @return
     * @throws Exception
     */
    public int deleteDscdRegList(DscdCrtrVO dscdCrtrVO) throws Exception;
	
    /**
     * 폐기 (실적 조회, 상세 관리) - 폐기 실적 목록 조회
     * @param dscdCrtrVO
     * @return
     * @throws Exception
     */
    public List<DscdCrtrVO> selectDscdPrfmncList(DscdCrtrVO dscdCrtrVO) throws Exception;

    /**
     * 폐기 상세 관리 - 폐기 실적 목록 삭제
     * @param dscdCrtrVO
     * @return
     * @throws Exception
     */
    public int deleteDscdPrfmncList(DscdCrtrVO dscdCrtrVO) throws Exception;
}
