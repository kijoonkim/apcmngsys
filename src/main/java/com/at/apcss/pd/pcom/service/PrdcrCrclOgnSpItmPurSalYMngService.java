package com.at.apcss.pd.pcom.service;

import java.util.List;

import com.at.apcss.pd.pcom.vo.ItemUoStbltYnVO;
import com.at.apcss.pd.pcom.vo.PrdcrCrclOgnSpItmPurSalYMngVO;


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
public interface PrdcrCrclOgnSpItmPurSalYMngService {

	/**
	 * 정보를 조회한다.
	 * @param PrdcrCrclOgnSpItmPurSalYMngVO
	 * @return
	 * @throws Exception
	 */
	public PrdcrCrclOgnSpItmPurSalYMngVO selectPrdcrCrclOgnSpItmPurSalYMng(PrdcrCrclOgnSpItmPurSalYMngVO PrdcrCrclOgnSpItmPurSalYMngVO) throws Exception;

	public List<PrdcrCrclOgnSpItmPurSalYMngVO> selectPrdcrCrclOgnSpItmPurSalYMngList(PrdcrCrclOgnSpItmPurSalYMngVO PrdcrCrclOgnSpItmPurSalYMngVO) throws Exception;

	public int insertPrdcrCrclOgnSpItmPurSalYMng(PrdcrCrclOgnSpItmPurSalYMngVO PrdcrCrclOgnSpItmPurSalYMngVO) throws Exception;

	public int updatePrdcrCrclOgnSpItmPurSalYMng(PrdcrCrclOgnSpItmPurSalYMngVO PrdcrCrclOgnSpItmPurSalYMngVO) throws Exception;

	public int deletePrdcrCrclOgnSpItmPurSalYMng(PrdcrCrclOgnSpItmPurSalYMngVO PrdcrCrclOgnSpItmPurSalYMngVO) throws Exception;

	public int multiSavePrdcrCrclOgnSpItmPurSalYMngList(List<PrdcrCrclOgnSpItmPurSalYMngVO> PrdcrCrclOgnSpItmPurSalYMngVOList) throws Exception;

	public List<ItemUoStbltYnVO> selectItemUoStbltYnList(ItemUoStbltYnVO ItemUoStbltYnVo) throws Exception;

	public int updateItemUoStbltYn(ItemUoStbltYnVO ItemUoStbltYnVo) throws Exception;

	public List<PrdcrCrclOgnSpItmPurSalYMngVO> selectRawDataList(PrdcrCrclOgnSpItmPurSalYMngVO PrdcrCrclOgnSpItmPurSalYMngVO) throws Exception;

	/* 개발서버 신규화면 조회 */
	public List<PrdcrCrclOgnSpItmPurSalYMngVO> selectPrdcrCrclOgnSpItmPurSalYMngListNew(PrdcrCrclOgnSpItmPurSalYMngVO PrdcrCrclOgnSpItmPurSalYMngVO) throws Exception;
	/* 개발서버 신규화면 등록 */
	public int insertPrdcrCrclOgnSpItmPurSalYMngNew(PrdcrCrclOgnSpItmPurSalYMngVO PrdcrCrclOgnSpItmPurSalYMngVO) throws Exception;
	/* 개발서버 신규화면 등록 */
	public int multiSavePrdcrCrclOgnSpItmPurSalYMngListNew(List<PrdcrCrclOgnSpItmPurSalYMngVO> PrdcrCrclOgnSpItmPurSalYMngVOList) throws Exception;
	/* 개발서버 신규화면 적합여부 체크 */
	public List<ItemUoStbltYnVO> selectItemUoStbltYnListNew(ItemUoStbltYnVO ItemUoStbltYnVo) throws Exception;
}
