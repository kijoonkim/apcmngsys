package com.at.apcss.am.ordr.mapper;


import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.am.ordr.vo.MrktOrdrDtlVO;
import com.at.apcss.am.ordr.vo.MrktOrdrVO;
import com.at.apcss.am.ordr.vo.OrdrRcvHomeplusVO;
import com.at.apcss.am.ordr.vo.OrdrRcvVO;

/**
 * 발주정보 수신 Mapper 인터페이스
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
public interface OrdrRcvMapper {

	/**
	 * 발주수신(홈플러스)정보 등록
	 * @param ordrRcvHomeplusVO
	 * @return
	 * @throws Exception
	 */
	public int insertOrdrRcvHomeplus(OrdrRcvHomeplusVO ordrRcvHomeplusVO) throws Exception;

	/**
	 * from 발주수신정보 to 발주정보 등록 : 홈플러스 
	 * @param ordrRcvVO
	 * @throws Exception
	 */
	public void insertSpOrdrRcvHmpls(OrdrRcvVO ordrRcvVO) throws Exception;
	
	
	/**
	 * 마켓발주정보등록-홈플러스
	 * @param mrktHomeplusVO
	 * @throws Exception
	 */
	public void insertSpMrktOrdrHpReg(MrktOrdrVO mrktHomeplusVO) throws Exception;

	/**
	 * 마켓발주정보상세등록-홈플러스
	 * @param mrktHomeplusDtlVO
	 * @throws Exception
	 */
	public void insertSpMrktOrdrHpDtlReg(MrktOrdrDtlVO mrktHomeplusDtlVO) throws Exception;

	/**
	 * 마켓발주정보등록 to 주분정보-홈플러스
	 * @param mrktHomeplusVO
	 * @throws Exception
	 */
	public void insertSpMrktOrdrRcvHmpls(MrktOrdrVO mrktHomeplusVO) throws Exception;
	
	/**
	 * 마켓발주정보등록-롯데
	 * @param mrktLotteVO
	 * @throws Exception
	 */
	public void insertSpMrktOrdrLtReg(MrktOrdrVO mrktLotteVO) throws Exception;

	/**
	 * 마켓발주정보상세등록-롯데
	 * @param mrktLotteVO
	 * @throws Exception
	 */
	public void insertSpMrktOrdrLtDtlReg(MrktOrdrDtlVO mrktLotteVO) throws Exception;

	/**
	 * 마켓발주정보등록 to 주분정보-롯데
	 * @param mrktLotteVO
	 * @throws Exception
	 */
	public void insertSpMrktOrdrRcvLotte(MrktOrdrVO mrktLotteVO) throws Exception;
	
	
	/**
	 * 홈플러스 마켓정보 단건 조회
	 * @param mrktHomeplusVO
	 * @return
	 * @throws Exception
	 */
	public MrktOrdrVO selectMrktHomeplus(MrktOrdrVO mrktHomeplusVO) throws Exception;
	
	/**
	 * 롯데 마켓정보 단건 조회
	 * @param mrktLotteVO
	 * @return
	 * @throws Exception
	 */
	public MrktOrdrVO selectMrktLotte(MrktOrdrVO mrktLotteVO) throws Exception;
	
	
	/**
	 * 원본주문정보조회-홈플러스
	 * @param mrktHomeplusDtlVO
	 * @return
	 * @throws Exception
	 */
	public List<MrktOrdrDtlVO> selectOrglnOrdrHomeplusDtl(MrktOrdrDtlVO mrktHomeplusDtlVO) throws Exception;
	
	
	/**
	 * 원본주문정보조회-롯데
	 * @param mrktHomeplusDtlVO
	 * @return
	 * @throws Exception
	 */
	public List<MrktOrdrDtlVO> selectOrglnOrdrLotteDtl(MrktOrdrDtlVO mrktLotteDtlVO) throws Exception;

	/**
	 * 홈플러스 연계처리
	 * @param mrktLotteDtlVO
	 * @return
	 * @throws Exception
	 */
	public int updateMrktLinkPrcsHomeplus(MrktOrdrDtlVO mrktLotteDtlVO) throws Exception;

	/**
	 * 롯데 연계처리
	 * @param mrktLotteDtlVO
	 * @return
	 * @throws Exception
	 */
	public int updateMrktLinkPrcsLotte(MrktOrdrDtlVO mrktLotteDtlVO) throws Exception;
}
