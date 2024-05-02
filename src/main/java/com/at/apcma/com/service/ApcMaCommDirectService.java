package com.at.apcma.com.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

/**
 * 공통으로 처리하는 Service 인터페이스
 * @author 		: 인텔릭아이앤에스
 * @since 		: 2024.04.29
 * @version 	: 1.0
 * @see
 *
 * <pre>
 * << 공통Service (Modification Information) >>
 *
 *  수정일      수정자		수정내용
 *  ----------	----------	---------------------------
 *  2024.04.29  장성주     	최초 생성
 *
 *  </pre>
 */
/**
 * @author admin
 *
 */
public interface ApcMaCommDirectService {

	
	/**
	 * 공통으로 처리하는 Service
	 * @param request
	 * @param rtype
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> callProc(Map<String, Object> param, String rtype) throws Exception;

}
