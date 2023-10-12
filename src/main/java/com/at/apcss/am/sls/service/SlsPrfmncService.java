package com.at.apcss.am.sls.service;

import java.util.HashMap;
import java.util.List;

import com.at.apcss.am.sls.vo.SlsPrfmncVO;

/**
 * 매출실적 Service 인터페이스
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
public interface SlsPrfmncService {

	/**
	 * 매출실적 단건 조회
	 * @param SlsPrfmncVO
	 * @return SlsPrfmncVO
	 * @throws Exception
	 */
	public SlsPrfmncVO selectSlsPrfmnc(SlsPrfmncVO slsPrfmncVO) throws Exception;

	/**
	 * 매출실적 목록 조회
	 * @param SlsPrfmncVO
	 * @return List<SlsPrfmncVO>
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
	 * @param SlsPrfmncVO
	 * @return integer
	 * @throws Exception
	 */
	public int insertSlsPrfmnc(SlsPrfmncVO slsPrfmncVO) throws Exception;

	/**
	 * 매출실적 변경
	 * @param SlsPrfmncVO
	 * @return integer
	 * @throws Exception
	 */
	public int updateSlsPrfmnc(SlsPrfmncVO slsPrfmncVO) throws Exception;

	/**
	 * 매출실적 삭제
	 * @param SlsPrfmncVO
	 * @return integer
	 * @throws Exception
	 */
	public int deleteSlsPrfmnc(SlsPrfmncVO slsPrfmncVO) throws Exception;

	/**
	 * 매출실적 생성
	 * @param SlsPrfmncVO
	 * @return HashMap<String, Object>
	 * @throws Exception
	 */
	public HashMap<String, Object> insertSlsPrfmncCrt(SlsPrfmncVO slsPrfmncVO) throws Exception;


}
