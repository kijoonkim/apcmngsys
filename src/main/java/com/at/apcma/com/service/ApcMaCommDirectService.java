package com.at.apcma.com.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	public HashMap<String, Object> callProc(Map<String, Object> param, HttpSession session, HttpServletRequest request, String ptype) throws Exception;

	/**
	 * 내부에서 공통으로 처리하는 Service
	 * @param request
	 * @param rtype
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> InnerCallProc2(Map<String, Object> param, String[][] plist) throws Exception;

	/**
	 * 내부에서 공통으로 수식을 확인하는 Service
	 * @param request
	 * @param rtype
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> checkFormula(Map<String, Object> param) throws Exception;

	/**
	 * tree level 생성
	 * @param node
	 * @param deptMap
	 * @param sortedDepartments
	 * @param level
	 * @return
	 * @throws Exception
	 */
	void buildTree(Map<String, Object> node, Map<String, Map<String, Object>> deptMap,
				   List<Map<String, Object>> sortedDepartments, int level);

	/**
	 * 에러메시지 처리하는 Service
	 * @param request
	 * @param rtype
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> checkError(Map<String, Object> param) throws Exception;
	
}
