package com.at.apcss.pd.pcom.service;

import java.util.List;

import com.at.apcss.pd.pcom.vo.ItemUoStbltYnVO;
import com.at.apcss.pd.pcom.vo.PrdcrCrclOgnSpItmPurSalNMngVO;


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
public interface PrdcrCrclOgnSpItmPurSalNMngService {

	/**
	 * 정보를 조회한다.
	 * @param PrdcrCrclOgnSpItmPurSalNMngVO
	 * @return
	 * @throws Exception
	 */
	public PrdcrCrclOgnSpItmPurSalNMngVO selectPrdcrCrclOgnSpItmPurSalNMng(PrdcrCrclOgnSpItmPurSalNMngVO PrdcrCrclOgnSpItmPurSalNMngVO) throws Exception;

	public List<PrdcrCrclOgnSpItmPurSalNMngVO> selectPrdcrCrclOgnSpItmPurSalNMngList(PrdcrCrclOgnSpItmPurSalNMngVO PrdcrCrclOgnSpItmPurSalNMngVO) throws Exception;

	public int insertPrdcrCrclOgnSpItmPurSalNMng(PrdcrCrclOgnSpItmPurSalNMngVO PrdcrCrclOgnSpItmPurSalNMngVO) throws Exception;

	public int updatePrdcrCrclOgnSpItmPurSalNMng(PrdcrCrclOgnSpItmPurSalNMngVO PrdcrCrclOgnSpItmPurSalNMngVO) throws Exception;

	public int deletePrdcrCrclOgnSpItmPurSalNMng(PrdcrCrclOgnSpItmPurSalNMngVO PrdcrCrclOgnSpItmPurSalNMngVO) throws Exception;

	public int multiSavePrdcrCrclOgnSpItmPurSalNMngList(List<PrdcrCrclOgnSpItmPurSalNMngVO> PrdcrCrclOgnSpItmPurSalNMngVOList) throws Exception;

	public List<ItemUoStbltYnVO> selectItemUoStbltYnList(ItemUoStbltYnVO ItemUoStbltYnVo) throws Exception;

	public int updateItemUoStbltYn(ItemUoStbltYnVO ItemUoStbltYnVo) throws Exception;

	public List<PrdcrCrclOgnSpItmPurSalNMngVO> selectRawDataList(PrdcrCrclOgnSpItmPurSalNMngVO PrdcrCrclOgnSpItmPurSalYMngVO) throws Exception;

	//20241212 개발서버 신규 화면 조회
	public List<PrdcrCrclOgnSpItmPurSalNMngVO> selectPrdcrCrclOgnSpItmPurSalNMngListNew(PrdcrCrclOgnSpItmPurSalNMngVO PrdcrCrclOgnSpItmPurSalNMngVO) throws Exception;
	//20241212 개발서버 신규 화면 등록
	public int insertPrdcrCrclOgnSpItmPurSalNMngNew(PrdcrCrclOgnSpItmPurSalNMngVO PrdcrCrclOgnSpItmPurSalNMngVO) throws Exception;
	//20241212 개발서버 신규 화면 등록
	public int multiSavePrdcrCrclOgnSpItmPurSalNMngListNew(List<PrdcrCrclOgnSpItmPurSalNMngVO> PrdcrCrclOgnSpItmPurSalNMngVOList) throws Exception;
}
