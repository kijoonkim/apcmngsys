package com.at.apcss.am.wgh.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.at.apcss.am.wgh.vo.WghPrfmncVO;

/**
 * 계량실적 Mapper 인터페이스
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
public interface WghPrfmncMapper {
	
	/**
	 * 계량실적 단건 조회
	 * @param wghPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public WghPrfmncVO selectWghPrfmnc(WghPrfmncVO wghPrfmncVO) throws Exception;
	
	/**
	 * 계량실적 목록 조회
	 * @param wghPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public List<WghPrfmncVO> selectWghPrfmncList(WghPrfmncVO wghPrfmncVO) throws Exception;
	
	/**
	 * 계량실적 등록
	 * @param wghPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public int insertWghPrfmnc(WghPrfmncVO wghPrfmncVO) throws Exception;
	
	/**
	 * 계량실적 변경
	 * @param wghPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public int updateWghPrfmnc(WghPrfmncVO wghPrfmncVO) throws Exception;
	
	/**
	 * 계량실적 삭제
	 * @param wghPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public int deleteWghPrfmnc(WghPrfmncVO wghPrfmncVO) throws Exception;
}
