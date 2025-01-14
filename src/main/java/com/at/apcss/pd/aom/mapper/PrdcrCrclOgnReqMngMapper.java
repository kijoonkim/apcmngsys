package com.at.apcss.pd.aom.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.pd.aom.vo.ApcInfoVO;
import com.at.apcss.pd.aom.vo.GpcVO;
import com.at.apcss.pd.aom.vo.LoanVO;
import com.at.apcss.pd.aom.vo.PrdcrCrclOgnReqMngVO;

/**
 * 게시판 Mapper 인터페이스
 * @author
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21          최초 생성
 * </pre>
 */
@Mapper
public interface PrdcrCrclOgnReqMngMapper {


	/**
	 * 통합조직 신청정보를 조회한다.
	 * @param PrdcrCrclOgnReqMngVO
	 * @return PrdcrCrclOgnReqMngVO
	 */
	public PrdcrCrclOgnReqMngVO selectPrdcrCrclOgnReqMng(PrdcrCrclOgnReqMngVO PrdcrCrclOgnReqMngVO);

	/**
	 * 통합조직 신청정보 리스트를 조회한다.
	 * @param PrdcrCrclOgnReqMngVO
	 * @return List<PrdcrCrclOgnReqMngVO>
	 */
	public List<PrdcrCrclOgnReqMngVO> selectPrdcrCrclOgnReqMngList(PrdcrCrclOgnReqMngVO PrdcrCrclOgnReqMngVO);

	/**
	 * 통합조직 조직정보를 등록한다.
	 * @param PrdcrCrclOgnReqMngVO
	 * @return int
	 */
	public int insertPrdcrCrclOgnReqMng(PrdcrCrclOgnReqMngVO PrdcrCrclOgnReqMngVO);

	/**
	 * 통합조직 조직정보를 수정한다.
	 * @param PrdcrCrclOgnReqMngVO
	 * @return int
	 */
	public int updatePrdcrCrclOgnReqMng(PrdcrCrclOgnReqMngVO PrdcrCrclOgnReqMngVO);

	/**
	 * 통합조직 조직정보 이력정보를 수정한다.
	 * @param PrdcrCrclOgnReqMngVO
	 * @return int
	 */
	public int updatePrdcrCrclOgnReqMngHstry(PrdcrCrclOgnReqMngVO PrdcrCrclOgnReqMngVO);

	/**
	 * 통합조직 신청정보를 등록한다.
	 * @param PrdcrCrclOgnReqMngVO
	 * @return int
	 */
	public int insertEvAplyMng(PrdcrCrclOgnReqMngVO PrdcrCrclOgnReqMngVO);

	/**
	 * 통합조직 품목 리스트를 조회한다.
	 * @param GpcVO
	 * @return List<GpcVO>
	 */
	public List<GpcVO> selectGpcList(GpcVO gpcVO);

	/**
	 * 통합조직 품목정보를 등록한다.
	 * @param GpcVO
	 * @return int
	 */
	public int insertGpc(GpcVO gpcVO);

	/**
	 * 통합조직 품목정보를 삭제한다.
	 * @param GpcVO
	 * @return int
	 */
	public int deleteGpc(GpcVO gpcVO);

	/**
	 * 통합조직 신청을 마감 한다.
	 * @param PrdcrCrclOgnReqMngVO
	 * @return int
	 */
	public int updateCorpDdlnSeCd(PrdcrCrclOgnReqMngVO PrdcrCrclOgnReqMngVO);

	/**
	 * 통합조직 신청정보 로우데이터를 조회 한다
	 * @param PrdcrCrclOgnReqMngVO
	 * @return List<PrdcrCrclOgnReqMngVO>
	 */
	public List<PrdcrCrclOgnReqMngVO> hiddenGrdUoSelectList(PrdcrCrclOgnReqMngVO PrdcrCrclOgnReqMngVO);

	/**
	 * 통합조직의 APC정보 리스트를 조회 한다
	 * @param ApcInfoVO
	 * @return List<ApcInfoVO>
	 */
	public List<ApcInfoVO> SelectApcInfoList(ApcInfoVO apcInfoVO);

	/**
	 * 통합조직 신청정보를 삭제한다.
	 * @param PrdcrCrclOgnReqMngVO
	 * @return int
	 */
	public int deleteUoAply(PrdcrCrclOgnReqMngVO PrdcrCrclOgnReqMngVO);

	/**
	 * 통합조직 조직관계 정보를 삭제한다.
	 * @param PrdcrCrclOgnReqMngVO
	 * @return int
	 */
	public int deleteUoUoCd(PrdcrCrclOgnReqMngVO PrdcrCrclOgnReqMngVO);

	/**
	 * 통합조직 품목정보를 삭제한다.
	 * @param PrdcrCrclOgnReqMngVO
	 * @return int
	 */
	public int deleteUoItem(PrdcrCrclOgnReqMngVO PrdcrCrclOgnReqMngVO);

	/**
	 * 통합조직 조직구분을 수정한다.
	 * @param PrdcrCrclOgnReqMngVO
	 * @return int
	 */
	public int updateUoApoSe(PrdcrCrclOgnReqMngVO PrdcrCrclOgnReqMngVO);

	/**
	 * 통합조직 조직구분을 수정한다.
	 * @param PrdcrCrclOgnReqMngVO
	 * @return int
	 */
	public int updateUoApoSeHstry(PrdcrCrclOgnReqMngVO PrdcrCrclOgnReqMngVO);

	/**
	 * 대출잔액 현황 리스트를 조회한다.
	 * @param LoanVO
	 * @return List<LoanVO>
	 */
	public List<LoanVO> selectLoanList(LoanVO LoanVO);

}
