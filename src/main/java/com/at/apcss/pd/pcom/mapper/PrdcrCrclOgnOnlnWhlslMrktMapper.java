package com.at.apcss.pd.pcom.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.pd.pcom.vo.PrdcrCrclOgnOnlnWhlslMrktVO;

/**
 * 온라인도매시장 판매목표 Mapper 인터페이스
 * @author ljw
 * @since 2025.01.07
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2025.01.07  ljw        최초 생성
 * </pre>
 */
@Mapper
public interface PrdcrCrclOgnOnlnWhlslMrktMapper {


	/**
	 * 온라인도매시장 판매목표 정보를 조회한다.
	 * @param PrdcrCrclOgnOnlnWhlslMrktVO
	 * @return PrdcrCrclOgnOnlnWhlslMrktVO
	 */
	public PrdcrCrclOgnOnlnWhlslMrktVO selectPrdcrCrclOgnOnlnWhlslMrkt(PrdcrCrclOgnOnlnWhlslMrktVO PrdcrCrclOgnOnlnWhlslMrktVO);

	/**
	 * 통합조직 목록을 조회한다.
	 * @param PrdcrCrclOgnOnlnWhlslMrktVO
	 * @return PrdcrCrclOgnOnlnWhlslMrktVO
	 */
	public List<PrdcrCrclOgnOnlnWhlslMrktVO> selectPrdcrCrclOgnOnlnWhlslMrktUoList(PrdcrCrclOgnOnlnWhlslMrktVO PrdcrCrclOgnOnlnWhlslMrktVO);

	/**
	 * 온라인도매시장 판매목표 정보를 저장한다.
	 * @param PrdcrCrclOgnOnlnWhlslMrktVO
	 * @return PrdcrCrclOgnOnlnWhlslMrktVO
	 */
	public int insertPrdcrCrclOgnOnlnWhlslMrkt(PrdcrCrclOgnOnlnWhlslMrktVO PrdcrCrclOgnOnlnWhlslMrktVO);

	/**
	 * 속한 조직 목록을 조회한다.
	 * @param PrdcrCrclOgnOnlnWhlslMrktVO
	 * @return List<PrdcrCrclOgnOnlnWhlslMrktVO>
	 */
	public List<PrdcrCrclOgnOnlnWhlslMrktVO> selectOgnzList(PrdcrCrclOgnOnlnWhlslMrktVO PrdcrCrclOgnOnlnWhlslMrktVO);

	/**
	 * 속한 조직 품목 목록을 조회한다.
	 * @param PrdcrCrclOgnOnlnWhlslMrktVO
	 * @return List<PrdcrCrclOgnOnlnWhlslMrktVO>
	 */
	public List<PrdcrCrclOgnOnlnWhlslMrktVO> selectItemList(PrdcrCrclOgnOnlnWhlslMrktVO PrdcrCrclOgnOnlnWhlslMrktVO);

	/**
	 * 온라인도매시장 출하실적 목록을 조회한다.
	 * @param PrdcrCrclOgnOnlnWhlslMrktVO
	 * @return List<PrdcrCrclOgnOnlnWhlslMrktVO>
	 */
	public List<PrdcrCrclOgnOnlnWhlslMrktVO> selectOnlnDtlList(PrdcrCrclOgnOnlnWhlslMrktVO PrdcrCrclOgnOnlnWhlslMrktVO);

	/**
	 * 온라인도매시장 출하실적 정보를 저장한다.
	 * @param PrdcrCrclOgnOnlnWhlslMrktVO
	 * @return int
	 */
	public int insertOnlnDtl(PrdcrCrclOgnOnlnWhlslMrktVO PrdcrCrclOgnOnlnWhlslMrktVO);

}
