package com.at.apcss.am.ordr.mapper;


import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

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

}
