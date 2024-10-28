package com.at.apcss.pd.pcm.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.pd.pcm.vo.PrfmncChckMngVO;

/**
 * 승인형조직 총취급액 실적점검 Mapper 인터페이스
 * @author ljw
 * @since 2024.10.24
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.10.24  ljw        최초 생성
 * </pre>
 */
@Mapper
public interface PrfmncChckMngMapper {

	/**
	 * 승인형 조직을 조회 한다.
	 * @param PrfmncChckMngVO
	 * @return PrfmncChckMngVO
	 */
	public PrfmncChckMngVO selectUoAprv(PrfmncChckMngVO PrfmncChckMngVO);

	/**
	 * 승인형 조직 리스트를 조회 한다.
	 * @param PrfmncChckMngVO
	 * @return PrfmncChckMngVO
	 */
	public List<PrfmncChckMngVO> selectUoAprvList(PrfmncChckMngVO PrfmncChckMngVO);

	/**
	 * 승인형 조직 총취급 실적 리스트를 조회 한다.
	 * @param PrfmncChckMngVO
	 * @return List<PrfmncChckMngVO>
	 */
	public List<PrfmncChckMngVO> selectPrfmncChckMngList(PrfmncChckMngVO PrfmncChckMngVO);

	/**
	 * 승인형 조직 총취급 실적을 저장 한다.
	 * @param PrfmncChckMngVO
	 * @return int
	 */
	public int insertPrfmncChckMng(PrfmncChckMngVO PrfmncChckMngVO);


}
