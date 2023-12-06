package com.at.apcss.am.sls.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.am.sls.vo.SlsPrfmncVO;

/**
 * 매출실적 Mapper 인터페이스
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
public interface SlsPrfmncMapper {

	/**
	 * 매출실적 단건 조회
	 * @param slsPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public SlsPrfmncVO selectSlsPrfmnc(SlsPrfmncVO slsPrfmncVO) throws Exception;
	/**
	 * 매출실적 확정여부 조회
	 * @param slsPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public SlsPrfmncVO selectSlsPrfmncCfmtnYn(SlsPrfmncVO slsPrfmncVO) throws Exception;

	/**
	 * 매출실적 목록 조회
	 * @param slsPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public List<SlsPrfmncVO> selectSlsPrfmncList(SlsPrfmncVO slsPrfmncVO) throws Exception;

	/**
	 * 매출실적 대상 목록 조회
	 * @param SlsPrfmncVO
	 * @return List<SlsPrfmncVO>
	 * @throws Exception
	 */
	public List<SlsPrfmncVO> selectRegSlsPrfmncList(SlsPrfmncVO slsPrfmncVO) throws Exception;

	/**
	 * 매출실적 등록
	 * @param slsPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public int insertSlsPrfmnc(SlsPrfmncVO slsPrfmncVO) throws Exception;

	/**
	 * 매출실적 변경
	 * @param slsPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public int updateSlsPrfmnc(SlsPrfmncVO slsPrfmncVO) throws Exception;

	/**
	 * 매출실적 삭제
	 * @param slsPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public int deleteSlsPrfmnc(SlsPrfmncVO slsPrfmncVO) throws Exception;

	/**
	 * 매출실적 전체 삭제
	 * @param SlsPrfmncVO
	 * @return integer
	 * @throws Exception
	 */
	public int deleteSlsPrfmncAll(SlsPrfmncVO slsPrfmncVO) throws Exception;

	/**
	 * 매출실적 생성
	 * @param slsPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public void insertSlsPrfmncCrt(SlsPrfmncVO slsPrfmncVO) throws Exception;
}
