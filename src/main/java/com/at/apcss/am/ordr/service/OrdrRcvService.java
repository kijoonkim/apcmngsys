package com.at.apcss.am.ordr.service;

import java.util.HashMap;
import java.util.List;

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
	

}
