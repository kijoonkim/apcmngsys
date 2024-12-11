package com.at.apcss.am.asst.service;

import java.util.HashMap;
import java.util.List;

import com.at.apcss.am.asst.vo.AsstMtrVO;


/**
 * 부자재 Service 인터페이스
 * @author 박승진
 * @since 2024.09.03
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.09.03  박승진        최초 생성
 * </pre>
 */
public interface AsstMtrService {

	/**
	 * 부자재기준정보조회
	 * @param sortFcltVO
	 * @return
	 * @throws Exception
	 */
	public List<AsstMtrVO> selectAsstMtrCrtrInfoList(AsstMtrVO sortFcltVO) throws Exception;

	/**
	 * 부자재기준상세정보조회
	 * @param sortFcltVO
	 * @return
	 * @throws Exception
	 */
	public List<AsstMtrVO> selectAsstMtrCrtrInfoDtlList(AsstMtrVO sortFcltVO) throws Exception;

	/**
	 * 부자재기준정보등록
	 * @param sortFcltVO
	 * @return
	 * @throws Exception
	 */
	public int insertAsstMtrCrtrInfo(AsstMtrVO sortFcltVO) throws Exception;

	/**
	 * 부자재기준상세정보등록
	 * @param sortFcltVO
	 * @return
	 * @throws Exception
	 */
	public int insertAsstMtrCrtrDtlInfo(List<AsstMtrVO> sortFcltVO) throws Exception;

	/**
	 * 선별가동기준관리 조회
	 * @param sortFcltVO
	 * @return
	 * @throws Exception
	 */
//	public List<SortFcltVO> selectSortOprtngCrtrList(SortFcltVO sortFcltVO) throws Exception;

	/**
	 * 가동기준관리정보 삭제
	 * @param sortFcltVO
	 * @return
	 * @throws Exception
	 */
//	public int deleteSortOprtngCrtr(SortFcltVO sortFcltVO) throws Exception;



}
