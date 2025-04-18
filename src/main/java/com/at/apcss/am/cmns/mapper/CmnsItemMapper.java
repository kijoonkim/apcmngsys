package com.at.apcss.am.cmns.mapper;

import java.util.ArrayList;
import java.util.List;

import com.at.apcss.am.cmns.vo.ApcItemCrtrDtlVO;
import com.at.apcss.am.cmns.vo.ApcSeedCrtrVO;
import com.at.apcss.am.sort.vo.SortBffaGrdVO;
import com.at.apcss.am.sort.vo.SortBffaWrhsStdGrdVO;
import com.at.apcss.co.cd.vo.ComCdVO;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.am.cmns.vo.CmnsItemVO;

/**
 * 품목정보 Mapper 인터페이스
 * @author 신정철
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21  신정철        최초 생성
 * </pre>
 */
@Mapper
public interface CmnsItemMapper {

	/**
	 * 품목정보 단건 조회
	 * @param cmnsItemVO
	 * @return CmnsItemVO
	 * @throws Exception
	 */
	public CmnsItemVO selectCmnsItem(CmnsItemVO cmnsItemVO) throws Exception;

	/**
	 * 품목정보 목록 조회
	 * @param cmnsItemVO
	 * @return List<CmnsItemVO>
	 * @throws Exception
	 */
	public List<CmnsItemVO> selectCmnsItemList(CmnsItemVO cmnsItemVO) throws Exception;

	/**
	 * APC 품목정보 목록 조회
	 * @param cmnsItemVO
	 * @return List<CmnsItemVO>
	 * @throws Exception
	 */
	public List<CmnsItemVO> selectApcCmnsItemList(CmnsItemVO cmnsItemVO) throws Exception;

	/**
	 * 품목정보 등록
	 * @param cmnsItemVO
	 * @return Integer
	 * @throws Exception
	 */
	public int insertCmnsItem(CmnsItemVO cmnsItemVO) throws Exception;

	/**
	 * 품목정보 변경
	 * @param cmnsItemVO
	 * @return Integer
	 * @throws Exception
	 */
	public int updateCmnsItem(CmnsItemVO cmnsItemVO) throws Exception;

	/**
	 * APC 품목정보 변경
	 * @param cmnsItemVO
	 * @return Integer
	 * @throws Exception
	 */
	public int updateApcCmnsItem(CmnsItemVO cmnsItemVO) throws Exception;

	/**
	 * 품목정보 삭제
	 * @param cmnsItemVO
	 * @return Integer
	 * @throws Exception
	 */
	public int deleteCmnsItem(CmnsItemVO cmnsItemVO) throws Exception;

	/**
	 * 품목정보 단건 조회
	 * @param cmnsItemVO
	 * @return CmnsItemVO
	 * @throws Exception
	 */
	public CmnsItemVO selectCmnsApcItem(CmnsItemVO cmnsItemVO) throws Exception;

	/**
	 * APC 품목 삭제 가능 여부
	 * @param cmnsItemVO
	 * @return List<CmnsItemVO>
	 * @throws Exception
	 */
	public List<CmnsItemVO> itemDelible(CmnsItemVO cmnsItemVO) throws Exception;
	/**
	 * APC 품목 정보 업데이트
	 * @param cmnsItemVO
	 * @return integer
	 * @throws Exception
	 */
	public int updateComItem(CmnsItemVO cmnsItemVO) throws Exception;
	/**
	 * APC 육안선별 타입정보 조회
	 * @param cmnsItemVO
	 * @return List<ComCdVO>
	 * @throws Exception
	 */
    List<ComCdVO> selectApcBffaTypeList(CmnsItemVO cmnsItemVO) throws Exception;
	/**
	 * APC 육안선별 타입정보목록 조회
	 * @param sortBffaGrdVO
	 * @return List<ComCdVO>
	 * @throws Exception
	 */
	List<SortBffaGrdVO> selectApcBffaGrdDtlList(SortBffaGrdVO sortBffaGrdVO) throws Exception;
	/**
	 * APC기준 육안선별 타입목록 선택 checkbox 조회
	 * @param sortBffaWrhsStdGrdVO
	 * @return HashMap<String, Object>
	 * @throws Exception
	 */
    List<SortBffaWrhsStdGrdVO> selectBffaGrdKndList(SortBffaWrhsStdGrdVO sortBffaWrhsStdGrdVO) throws Exception;
	/**
	 * APC기준 품목 상세 목록조회
	 * @param apcItemCrtrDtlVO
	 * @return ArrayList<ApcItemCrtrDtlVO>
	 * @throws Exception
	 */
	ArrayList<ApcItemCrtrDtlVO> selectApcItemCrtrDtlList(ApcItemCrtrDtlVO apcItemCrtrDtlVO) throws Exception;
	/**
	 * APC기준 종자 목록조회
	 * @param apcSeedCrtrVO
	 * @return ArrayList<ApcSeedCrtr>
	 * @throws Exception
	 */
	ArrayList<ApcSeedCrtrVO> selectApcSeedCrtrList(ApcSeedCrtrVO apcSeedCrtrVO) throws Exception;
	/**
	 * APC기준 품목 상세 merge
	 * @param apcItemCrtrDtlList
	 * @return int
	 * @throws Exception
	 */
    int mergeApcItemCrtrDtlList(List<ApcItemCrtrDtlVO> apcItemCrtrDtlList) throws Exception;
	/**
	 * APC기준 품목 종자 merge
	 * @param apcSeedCrtrVOList
	 * @return int
	 * @throws Exception
	 */
	int mergeSeedCrtrList(List<ApcSeedCrtrVO> apcSeedCrtrVOList) throws Exception;
	/**
	 * APC기준 품목 상세 delete
	 * @param apcItemCrtrDtlVO
	 * @return int
	 * @throws Exception
	 */
	int deleteApcItemCrtrDtl(ApcItemCrtrDtlVO apcItemCrtrDtlVO) throws Exception;
	/**
	 * APC기준 품목 종자 delete
	 * @param apcSeedCrtrVO
	 * @return int
	 * @throws Exception
	 */
	int deleteSeedCrtr(ApcSeedCrtrVO apcSeedCrtrVO) throws Exception;

	/**
	 * 품종의 품목 상세 조회
	 * @param cmnsItemVO
	 * @return List<CmnsItemVO>
	 * @throws Exception
	 */
	public List<CmnsItemVO> selectItemVrtyDtlList(CmnsItemVO cmnsItemVO) throws Exception;

	/**
	 * 품종 조회
	 * @param cmnsItemVO
	 * @return List<CmnsItemVO>
	 * @throws Exception
	 */
	public List<CmnsItemVO> selectVrtyByItemCd(CmnsItemVO cmnsItemVO) throws Exception;
}
