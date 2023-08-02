package com.at.apcss.am.wgh.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.at.apcss.am.wgh.vo.WghPrfmncDtlVO;
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
	 * 계량실적정보 목록 조회
	 * @param wghPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public List<WghPrfmncVO> selectWghPrfmncList(WghPrfmncVO wghPrfmncVO) throws Exception;
	
	/**
	 * 계량실적 공통 단건 조회
	 * @param wghPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public WghPrfmncVO selectWghPrfmncCom(WghPrfmncVO wghPrfmncVO) throws Exception;
	
	/**
	 * 계량실적 공통 목록 조회
	 * @param wghPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public List<WghPrfmncVO> selectWghPrfmncComList(WghPrfmncVO wghPrfmncVO) throws Exception;
	
	/**
	 * 계량실적 공통 등록
	 * @param wghPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public int insertWghPrfmncCom(WghPrfmncVO wghPrfmncVO) throws Exception;
	
	/**
	 * 계량실적 공통변경
	 * @param wghPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public int updateWghPrfmncCom(WghPrfmncVO wghPrfmncVO) throws Exception;
	
	/**
	 * 계량실적 공통 삭제
	 * @param wghPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public int deleteWghPrfmncCom(WghPrfmncVO wghPrfmncVO) throws Exception;
	
	
	
	/** 상세 **/
	
	/**
	 * 계량실적 상세 단건 조회
	 * @param wghPrfmncDtlVO
	 * @return
	 * @throws Exception
	 */
	public WghPrfmncDtlVO selectWghPrfmncDtl(WghPrfmncDtlVO wghPrfmncDtlVO) throws Exception;
	
	/**
	 * 계량실적 상세 목록 조회
	 * @param wghPrfmncDtlVO
	 * @return
	 * @throws Exception
	 */
	public List<WghPrfmncDtlVO> selectWghPrfmncDtlList(WghPrfmncDtlVO wghPrfmncDtlVO) throws Exception;
	
	/**
	 * 계량실적 상세 등록
	 * @param wghPrfmncDtlVO
	 * @return
	 * @throws Exception
	 */
	public int insertWghPrfmncDtl(WghPrfmncDtlVO wghPrfmncDtlVO) throws Exception;
	
	/**
	 * 계량실적 상세 변경
	 * @param wghPrfmncDtlVO
	 * @return
	 * @throws Exception
	 */
	public int updateWghPrfmncDtl(WghPrfmncDtlVO wghPrfmncDtlVO) throws Exception;
	
	/**
	 * 계량실적 상세 삭제
	 * @param wghPrfmncDtlVO
	 * @return
	 * @throws Exception
	 */
	public int deleteWghPrfmncDtl(WghPrfmncDtlVO wghPrfmncDtlVO) throws Exception;
}
