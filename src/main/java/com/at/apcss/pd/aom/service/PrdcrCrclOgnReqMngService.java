package com.at.apcss.pd.aom.service;

import java.util.List;

import com.at.apcss.pd.aom.vo.PrdcrCrclOgnReqMngVO;
import com.at.apcss.pd.aom.vo.ApcInfoVO;
import com.at.apcss.pd.aom.vo.GpcVO;


/**
 * 평가등록결과 Service 인터페이스
 * @author 김동제
 * @since 2023.10.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.10.01  김동제        최초 생성
 * </pre>
 */
public interface PrdcrCrclOgnReqMngService {

	/**
	 * 통합조직 신청정보를 조회한다.
	 * @param PrdcrCrclOgnReqMngVO
	 * @return PrdcrCrclOgnReqMngVO
	 * @throws Exception
	 */
	public PrdcrCrclOgnReqMngVO selectPrdcrCrclOgnReqMng(PrdcrCrclOgnReqMngVO PrdcrCrclOgnReqMngVO) throws Exception;

	/**
	 * 통합조직 신청정보 리스트를 조회한다.
	 * @param PrdcrCrclOgnReqMngVO
	 * @return List<PrdcrCrclOgnReqMngVO>
	 * @throws Exception
	 */
	public List<PrdcrCrclOgnReqMngVO> selectPrdcrCrclOgnReqMngList(PrdcrCrclOgnReqMngVO PrdcrCrclOgnReqMngVO) throws Exception;

	/**
	 * 통합조직 조직정보를 등록한다.
	 * @param PrdcrCrclOgnReqMngVO
	 * @return int
	 * @throws Exception
	 */
	public int insertPrdcrCrclOgnReqMng(PrdcrCrclOgnReqMngVO PrdcrCrclOgnReqMngVO) throws Exception;

	/**
	 * 통합조직 조직정보를 수정한다.
	 * @param PrdcrCrclOgnReqMngVO
	 * @return int
	 * @throws Exception
	 */
	public int updatePrdcrCrclOgnReqMng(PrdcrCrclOgnReqMngVO PrdcrCrclOgnReqMngVO) throws Exception;

	/**
	 * 통합조직 조직정보 리스트를 수정한다.
	 * @param PrdcrCrclOgnReqMngVO
	 * @return int
	 * @throws Exception
	 */
	public int multiSavePrdcrCrclOgnReqMngList(List<PrdcrCrclOgnReqMngVO> PrdcrCrclOgnReqMngVOList) throws Exception;

	/**
	 * 품목 리스트를 조회한다.
	 * @param GpcVO
	 * @return List<GpcVO>
	 * @throws Exception
	 */
	public List<GpcVO> selectGpcList(GpcVO gpcVO) throws Exception;

	/**
	 * 품목 리스트를 등록한다.
	 * @param GpcVO
	 * @return int
	 * @throws Exception
	 */
	public int multiSaveGpcList(List<GpcVO> gpcVOList) throws Exception;

	/**
	 * 품목을 등록한다.
	 * @param GpcVO
	 * @return int
	 * @throws Exception
	 */
	public int insertGpc(GpcVO gpcVO) throws Exception;

	/**
	 * 품목을 삭제한다.
	 * @param GpcVO
	 * @return int
	 * @throws Exception
	 */
	public int deleteGpc(GpcVO gpcVO) throws Exception;

	/**
	 * 통합조직 신청마감 한다.
	 * @param PrdcrCrclOgnReqMngVO
	 * @return int
	 * @throws Exception
	 */
	public int updateCorpDdlnSeCd(PrdcrCrclOgnReqMngVO PrdcrCrclOgnReqMngVO) throws Exception;

	/**
	 * 통합조직 신청정보 로우데이터를 조회 한다
	 * @param PrdcrCrclOgnReqMngVO
	 * @return int
	 * @throws Exception
	 */
	public List<PrdcrCrclOgnReqMngVO> hiddenGrdUoSelectList(PrdcrCrclOgnReqMngVO PrdcrCrclOgnReqMngVO) throws Exception;

	/**
	 * 해당 통합조직의 APC정보를 가져온다
	 * @param ApcInfoVO
	 * @return List<ApcInfoVO>
	 * @throws Exception
	 */
	public List<ApcInfoVO> SelectApcInfoList(ApcInfoVO apcInfoVO) throws Exception;

	/**
	 * 통합조직 신청정보를 삭제한다.
	 * @param PrdcrCrclOgnReqMngVO
	 * @return int
	 * @throws Exception
	 */
	public int deleteUoAply(PrdcrCrclOgnReqMngVO PrdcrCrclOgnReqMngVO) throws Exception;

	/**
	 * 통합조직 조직관계 정보를 삭제한다.
	 * @param PrdcrCrclOgnReqMngVO
	 * @return int
	 * @throws Exception
	 */
	public int deleteUoUoCd(PrdcrCrclOgnReqMngVO PrdcrCrclOgnReqMngVO) throws Exception;

	/**
	 * 통합조직 품목정보를 삭제한다.
	 * @param PrdcrCrclOgnReqMngVO
	 * @return int
	 * @throws Exception
	 */
	public int deleteUoItem(PrdcrCrclOgnReqMngVO PrdcrCrclOgnReqMngVO) throws Exception;

	/**
	 * 통합조직 조직구분을 수정한다.
	 * @param PrdcrCrclOgnReqMngVO
	 * @return int
	 * @throws Exception
	 */
	public int updateUoApoSe(PrdcrCrclOgnReqMngVO PrdcrCrclOgnReqMngVO) throws Exception;
}
