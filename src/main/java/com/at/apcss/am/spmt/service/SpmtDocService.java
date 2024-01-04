package com.at.apcss.am.spmt.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.at.apcss.am.spmt.vo.SpmtDocVO;
import com.at.apcss.am.spmt.vo.SpmtPrfmncVO;

/**
 * 출고실적 Service 인터페이스
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
public interface SpmtDocService {

	/**
	 * 
	 * @param spmtDocVO
	 * @return
	 * @throws Exception
	 */
	public List<HashMap<String, Object>> selectSpmtDocList(HashMap<String, Object> paramMap) throws Exception;

}
