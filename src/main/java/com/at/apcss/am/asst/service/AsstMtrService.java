package com.at.apcss.am.asst.service;

import java.util.HashMap;
import java.util.List;

import com.at.apcss.am.asst.vo.AsstMtrVO;
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
	 * @param AsstMtrVO
	 * @return
	 * @throws Exception
	 */
	public List<AsstMtrVO> selectAsstMtrCrtrInfoList(AsstMtrVO sortFcltVO) throws Exception;

	/**
	 * 부자재기준상세정보조회
	 * @param AsstMtrVO
	 * @return
	 * @throws Exception
	 */
	public List<AsstMtrVO> selectAsstMtrCrtrInfoDtlList(AsstMtrVO sortFcltVO) throws Exception;

	/**
	 * 부자재기준정보등록
	 * @param AsstMtrVO
	 * @return
	 * @throws Exception
	 */
	public int insertAsstMtrCrtrInfo(List<AsstMtrVO> sortFcltVO) throws Exception;

	/**
	 * 부자재기준상세정보등록
	 * @param AsstMtrVO
	 * @return
	 * @throws Exception
	 */
	public int insertAsstMtrCrtrDtlInfo(List<AsstMtrVO> sortFcltVO) throws Exception;

	/**
	 * 부자재기준상세정보삭제
	 * @param AsstMtrVO
	 * @return
	 * @throws Exception
	 */

	public int deleteAsstMtrCrtrInfo(AsstMtrVO bomVOList) throws Exception;

	/**
	 * BOM기준상세정보조회
	 * @param AsstMtrVO
	 * @return
	 * @throws Exception
	 */
	public List<AsstMtrVO> selectBomMstrList(AsstMtrVO bomVO) throws Exception;

	/**
	 * BOM기준상세정보조회
	 * @param AsstMtrVO
	 * @return
	 * @throws Exception
	 */
	public List<AsstMtrVO> selectBomDtlList(AsstMtrVO bomVO) throws Exception;


	/**
	 * BOM기준정보등록
	 * @param AsstMtrVO
	 * @return
	 * @throws Exception
	 */
	public int insertBomMstrInfo(AsstMtrVO bomVO) throws Exception;

	/**
	 * BOM기준상세정보등록
	 * @param AsstMtrVO
	 * @return
	 * @throws Exception
	 */
	public int insertBomDtlInfo(List<AsstMtrVO> bomVO) throws Exception;

	/**
	 * BOM기준정보삭제
	 * @param AsstMtrVO
	 * @return
	 * @throws Exception
	 */

	public int deleteBomCrtrInfo(AsstMtrVO bomVO) throws Exception;

	/**
	 * BOM기준정보상세삭제
	 * @param AsstMtrVO
	 * @return
	 * @throws Exception
	 */
	public int deleteBomDtlList(AsstMtrVO bomVO) throws Exception;/**

	/**
	 * BOM입고정보조회
	 * @param AsstMtrVO
	 * @return
	 * @throws Exception
	 */
	public List<AsstMtrVO> selectBomWrhsInfoList(AsstMtrVO bomVO) throws Exception;


	/**
	 * BOM입고정보등록
	 * @param AsstMtrVO
	 * @return
	 * @throws Exception
	 */
	public int insertBomWrhsInfoList(List<AsstMtrVO> bomVO) throws Exception;


	/**
	 * BOM재고정보조회
	 * @param AsstMtrVO
	 * @return
	 * @throws Exception
	 */
	public List<AsstMtrVO> selectBomInvntrInfoList(AsstMtrVO bomVO) throws Exception;

	/**
	 * BOM출고정보조회
	 * @param AsstMtrVO
	 * @return
	 * @throws Exception
	 */
	public List<AsstMtrVO> selectBomSpmtInfoList(AsstMtrVO bomVO) throws Exception;

	/**
	 * BOM출고정보등록
	 * @param AsstMtrVO
	 * @return
	 * @throws Exception
	 */
	public int insertBomSpmtInfoList(List<AsstMtrVO> bomVO) throws Exception;

	/**
	 * BOM입고정보삭제
	 * @param AsstMtrVO
	 * @return
	 * @throws Exception
	 */
	public int deleteBomWrhsInfoList(List<AsstMtrVO> bomVO) throws Exception;

	/**
	 * BOM출고정보삭제
	 * @param AsstMtrVO
	 * @return
	 * @throws Exception
	 */
	public int deleteBomSpmtInfoList(List<AsstMtrVO> bomVO) throws Exception;


}
