package com.at.apcss.am.spmt.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.am.spmt.vo.SlsMngVO;

@Mapper
public interface SlsMngMapper {
	
	/**
	 * 매출실적조회
	 * @param SlsMngVO
	 * @return List<SlsMngVO>
	 * @throws Exception
	 */
	public List<SlsMngVO> selectSlsPrfmnc(SlsMngVO slsMngVO);

	/**
	 * 매출실적삭제
	 * @param SlsMngVO
	 * @return 
	 * @throws Exception
	 */
	public int deleteSlsPrfmnc(SlsMngVO slsMngVO);

	/**
	 * 매출실적변경
	 * @param SlsMngVO
	 * @return 
	 * @throws Exception
	 */
	public int updateSlsPrfmnc(SlsMngVO vo);
	
	/**
	 * 매출단가조회
	 * @param SlsMngVO
	 * @return List<SlsMngVO>
	 * @throws Exception
	 */
	public List<SlsMngVO> selectSlsUntprc(SlsMngVO slsMngVO);

	/**
	 * 매출단가상세조회
	 * @param slsMngVO
	 * @return
	 * @throws Exception
	 */
    public List<SlsMngVO> selectSlsUntprcDtl(SlsMngVO slsMngVO) throws Exception;

	/**
	 * 매출단가 변경
	 * @param slsMngVO
	 * @return
	 * @throws Exception
	 */
	public int updateSlsUntprc(SlsMngVO slsMngVO) throws Exception;

	/**
	 * 매출단가 등록
	 * @param slsMngVO
	 * @return
	 * @throws Exception
	 */
	public int insertSlsUntprc(SlsMngVO slsMngVO) throws Exception;

	/**
	 * 매출단가삭제
	 * @param slsMngVO
	 * @return
	 * @throws Exception
	 */
	public int deleteSlsUntprc(SlsMngVO slsMngVO) throws Exception;

}
