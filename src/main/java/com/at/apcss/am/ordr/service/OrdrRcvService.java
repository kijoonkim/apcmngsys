package com.at.apcss.am.ordr.service;

import java.util.HashMap;
import java.util.List;

import com.at.apcss.am.ordr.vo.MrktHomeplusVO;
import com.at.apcss.am.ordr.vo.MrktOrdrVO;
import com.at.apcss.am.ordr.vo.OrdrRcvVO;
import com.at.apcss.am.ordr.vo.OrdrVO;

/**
 * 발주정보 Service 인터페이스
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
public interface OrdrRcvService {

	/**
	 * 발주정보 자동 등록
	 * @param ordrVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertOrdrAuto(OrdrVO ordrVO) throws Exception;
	
	/**
	 * 발주정보 수신
	 * @param ordrRcvVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertOutordrRcpt(OrdrRcvVO ordrRcvVO) throws Exception;
	
	
	/**
	 * 마켓주문수신
	 * @param ordrRcvVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertMrktOrdrRcpt(OrdrRcvVO ordrRcvVO) throws Exception;
	
	
	/**
	 * 마켓주문수신-홈플러스
	 * @param ordrRcvVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertMrktOrdrRcptHomeplus(OrdrRcvVO ordrRcvVO) throws Exception;
	
	
	/**
	 * 발주정보 자동 등록 : 롯데
	 * @param ordrRcvVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertMrktOrdrRcptLotteSuper(OrdrRcvVO ordrRcvVO) throws Exception;
	
	
	/**
	 * 발주정보 자동 등록 : 홈플러스
	 * @param ordrVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertHomplusOrdr(OrdrRcvVO ordrRcvVO) throws Exception;
	
	/**
	 * 발주정보 자동 등록 : 이마트
	 * @param ordrRcvVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertSSGOrdr(OrdrRcvVO ordrRcvVO) throws Exception;
	
	/**
	 * 발주정보 자동 등록 : 롯데
	 * @param ordrRcvVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertLotteOrdr(OrdrRcvVO ordrRcvVO) throws Exception;
	
	/**
	 * 발주정보 자동 등록 : 롯데
	 * @param ordrRcvVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertGSRetailOrdr(OrdrRcvVO ordrRcvVO) throws Exception;
	
	/**
	 * 발주정보 자동 등록 : 하나로
	 * @param ordrRcvVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertHanaroOrdr(OrdrRcvVO ordrRcvVO) throws Exception;
	
	
	/**
	 * 발주정보(원본) 조회 (홈플러스)
	 * @param mrktHomeplusVO
	 * @return
	 * @throws Exception
	 */
	public List<MrktHomeplusVO> selectOrdrListForHomeplus(MrktHomeplusVO mrktHomeplusVO) throws Exception;
	
	/**
	 * 발주정보(원본) 조회 (홈플러스)
	 * @param ordrApcCd
	 * @param wrhsYmd
	 * @return
	 * @throws Exception
	 */
	public List<HashMap<String, Object>> selectOrdrListForHomeplus(String ordrApcCd, String wrhsYmd) throws Exception;

	
	
	/**
	 * 발주정보(원본) 조회 (롯데)
	 * @param mrktHomeplusVO
	 * @return
	 * @throws Exception
	 */
	public List<MrktOrdrVO> selectOrdrListForLotte(MrktOrdrVO mrktHomeplusVO) throws Exception;
	
	/**
	 * 발주정보(원본) 조회 (롯데)
	 * @param ordrApcCd
	 * @param wrhsYmd
	 * @return
	 * @throws Exception
	 */
	public List<HashMap<String, Object>> selectOrdrListForLottesuper(String ordrApcCd, String wrhsYmd) throws Exception;

	
}
