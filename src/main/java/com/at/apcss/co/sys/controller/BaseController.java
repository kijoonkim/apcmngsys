package com.at.apcss.co.sys.controller;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.msg.mapper.ComMessageSource;
import com.at.apcss.co.msg.vo.ComMsgVO;
import com.at.apcss.co.sys.vo.ComPageVO;
import com.at.apcss.co.sys.vo.LoginVO;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.util.EgovUserDetailsHelper;

public abstract class BaseController {
	
	public final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	protected EgovMessageSource message;

	@Autowired
	protected ComMessageSource messageSource;

	protected String getUserId() {
		
		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		
		if (loginVO != null) {
			return loginVO.getId();
		}
		
		return null;
	}
	
	protected String getPrgrmId() {
		
		String prgrmId = (String) RequestContextHolder.currentRequestAttributes().getAttribute("sysPrgrmId", RequestAttributes.SCOPE_SESSION);
		return prgrmId;
	}
	
	protected <T> boolean setPaginationInfo(ComPageVO comPageVO, T t) {
		
		if (comPageVO == null || !ComConstants.CON_YES.equals(comPageVO.getPagingYn())) {
			return false;
		}
		
		int currentPageNo = comPageVO.getCurrentPageNo();
		int recordCountPerPage = comPageVO.getRecordCountPerPage();
		int pageSize = comPageVO.getPageSize();
		
		if (currentPageNo < 1 || recordCountPerPage < 1 || pageSize < 1) {
			return false;
		}
		
		int totalRecordCount = 0;
		int totalPageCount = 0;
		int firstPageNoOnPageList = 0;
		int lastPageNoOnPageList = 0;
		int firstRecordIndex = (currentPageNo - 1) * recordCountPerPage + 1;
		int lastRecordIndex = 0;
		
		String className = t.getClass().getName();
		Class<?> targetClass;

		try {
			targetClass = Class.forName(className);
			//Method getTotalRecordCount = targetClass.getDeclaredMethod("getTotalRecordCount", null);
			Method getTotalRecordCount = targetClass.getMethod("getTotalRecordCount");
			totalRecordCount = (int)getTotalRecordCount.invoke(t);
			
			totalPageCount = (totalRecordCount - 1) / recordCountPerPage + 1;
			firstPageNoOnPageList = ((currentPageNo - 1) / pageSize) * pageSize + 1;
			lastPageNoOnPageList = firstPageNoOnPageList + pageSize - 1;
			if (lastPageNoOnPageList > totalPageCount) {
				lastPageNoOnPageList = totalPageCount;
			}
			lastRecordIndex = currentPageNo < totalPageCount ? currentPageNo * recordCountPerPage : totalRecordCount;
			
			comPageVO.setTotalRecordCount(totalRecordCount);
			comPageVO.setTotalPageCount(totalPageCount);
			comPageVO.setFirstPageNoOnPageList(firstPageNoOnPageList);
			comPageVO.setLastPageNoOnPageList(lastPageNoOnPageList);
			comPageVO.setFirstRecordIndex(firstRecordIndex);
			comPageVO.setLastRecordIndex(lastRecordIndex);
			
		} catch(ClassNotFoundException e) {
			return false;
		} catch(NoSuchMethodException e) {
			return false;
		} catch (Exception e) {
			return false;
		}
		
		return true;
	}
	
	/*
	protected <T> ResponseEntity<T> setSuccessEntity(T t) {
		return new ResponseEntity<T>(t, HttpStatus.OK);
	}
	 */
	protected ResponseEntity<HashMap<String, Object>> getSuccessResponseEntity(HashMap<String, Object> resultMap) {
		
		resultMap.put(ComConstants.PROP_RESULT_STATUS, ComConstants.RESULT_STATUS_OK);
		resultMap.put(ComConstants.PROP_RESULT_CODE, ComConstants.CON_BLANK);
		resultMap.put(ComConstants.PROP_RESULT_MESSAGE, ComConstants.CON_BLANK);
		
		return new ResponseEntity<HashMap<String, Object>>(resultMap, HttpStatus.OK);
	}
	
	protected ResponseEntity<HashMap<String, Object>> getErrorResponseEntity(HashMap<String, Object> resultMap) {
		
		resultMap.put(ComConstants.PROP_RESULT_STATUS, ComConstants.RESULT_STATUS_ERROR);
		return new ResponseEntity<HashMap<String, Object>>(resultMap, HttpStatus.OK);
	}
	
	protected ResponseEntity<Map<String, Object>> getErrorResponseEntity(String errorCode, String errorMessage) {
		
		HashMap<String, Object> resultMap = new HashMap<>();
		
		resultMap.put(ComConstants.PROP_RESULT_STATUS, ComConstants.RESULT_STATUS_ERROR);
		resultMap.put(ComConstants.PROP_RESULT_CODE, errorCode);
		resultMap.put(ComConstants.PROP_RESULT_MESSAGE, errorMessage);

		return new ResponseEntity<Map<String, Object>>(resultMap, HttpStatus.BAD_REQUEST);
	}
	
	protected ResponseEntity<HashMap<String, Object>> getErrorResponseEntity(Exception e) {
		
		HashMap<String, Object> resultMap = new HashMap<>();
		
		resultMap.put(ComConstants.PROP_RESULT_STATUS, ComConstants.RESULT_STATUS_ERROR);
		resultMap.put(ComConstants.PROP_RESULT_CODE, ComConstants.RESULT_CODE_DEFAULT);
		resultMap.put(ComConstants.PROP_RESULT_MESSAGE, e.getMessage());

		return new ResponseEntity<HashMap<String, Object>>(resultMap, HttpStatus.BAD_REQUEST);
	}
	
	protected String getMessage(String code) {
		return messageSource.getMessage(code);
	}
	
	protected String getMessage(String code, Object[] args) {
		return messageSource.getMessage(code, args, Locale.getDefault());
	}
	
	protected String getMessage(String code, Object[] args, Locale locale) {
		return messageSource.getMessage(code, args, locale);
	}
	
	protected List<ComMsgVO> getMessageList() throws Exception {
		return messageSource.getComMessageList();
	}
	
//	@Autowired
//	protected MessageSource message;

	/**
	 * Get message with code
	 * 
	 * <pre>
	 * 
	 * </pre>
	 * 
	 * @param code String
	 * @return String
	 * @throws Exception
	 
	public String getMessage(String code) throws Exception {
		return MessageUtil.getMessage(code);
	}*/

	/**
	 * Get message with code and parameter
	 * 
	 * <pre>
	 *
	 * </pre>
	 * 
	 * @param code      String
	 * @param parameter Object[]
	 * @return String
	 * @throws Exception
	 
	public <U extends Object> String getMessage(String code, U parameter[]) throws Exception {
		return MessageUtil.getMessage(code, parameter);
	}*/

	/**
	 * Get message with code and parameter
	 * 
	 * <pre>
	 *
	 * </pre>
	 * 
	 * @param code      String
	 * @param parameter String Obect[]
	 * @param locale    Locale
	 * @return String
	 * @throws Exception
	public <U extends Object> String getMessage(String code, U parameter[], Locale locale) throws Exception {
		return MessageUtil.getMessage(code, parameter, locale);
	} */

	/**
	 * Return default success message
	 * 
	 * <pre>
	 *
	 * </pre>
	 * 
	 * @return
	 * @throws Exception
	public Map<String, String> setSuccessMessage() throws Exception {

		Map<String, String> retMsg = new HashMap<String, String>();

		retMsg.put("msg", "The request service is successfully ended.");
		retMsg.put("code", DefaultConstants.SUCCESS_CODE);
		retMsg.put("statusCode", DefaultConstants.STATUS_SUCCESS);
		return retMsg;
	}
*/
	/**
	 * Success Message
	 * 
	 * <pre>
	 *
	 * </pre>
	 * 
	 * @param mav ModelAndView
	 * @throws Exception
	public Map<String, String> setSuccessMessage(String msgCode) throws Exception {

		Assert.notNull(msgCode, "Message Code is null");

		Map<String, String> retMsg = new HashMap<String, String>();

		retMsg.put("message", getMessage(msgCode));
		retMsg.put("code", msgCode);
		retMsg.put("statusCode", DefaultConstants.STATUS_SUCCESS);

		return retMsg;
	}*/

	/**
	 * Success Message
	 * 
	 * <pre>
	 *
	 * </pre>
	 * 
	 * @param mav      ModelAndView
	 * @param msgCode  String
	 * @param msgParam Object[]
	 * @throws Exception
	public Map<String, String> setSuccessMessage(ModelAndView mav, String msgCode, Object[] msgParam) throws Exception {

		Assert.notNull(msgCode, "Message Code is null");

		Map<String, String> retMsg = new HashMap<String, String>();

		retMsg.put("message", getMessage(msgCode, msgParam));
		retMsg.put("code", msgCode);
		retMsg.put("statusCode", DefaultConstants.STATUS_SUCCESS);
		return retMsg;
	}
	*/

	/**
	 * Set Error Message
	 * 
	 * <pre>
	 *
	 * </pre>
	 * 
	 * @param mav     ModelAndView
	 * @param msg     String
	 * @param msgCode String
	 * @throws Exception
	public Map<String, String> setErrorMessage(ModelAndView mav, String errCode) throws Exception {
		Assert.notNull(errCode, "Message Code is null");

		Map<String, String> retMsg = new HashMap<String, String>();

		retMsg.put("statusCode", DefaultConstants.STATUS_ERROR);
		retMsg.put("code", errCode);
		retMsg.put("message", getMessage(errCode));
		return retMsg;
	}
	*/

	/**
	 * Set Error Code
	 * 
	 * <pre>
	 *
	 * </pre>
	 * 
	 * @param mav      ModelAndView
	 * @param errCode  String
	 * @param msgParam Object[]
	 * @throws Exception
	public Map<String, String> setErrorMessage(ModelAndView mav, String errCode, Object[] msgParam) throws Exception {
		Assert.notNull(errCode, "Message Code is null");

		Map<String, String> retMsg = new HashMap<String, String>();

		retMsg.put("statusCode", DefaultConstants.STATUS_ERROR);
		retMsg.put("code", errCode);
		retMsg.put("message", getMessage(errCode, msgParam));
		return retMsg;
	}
	*/
	/**
	 * Validation Error 처리
	 * 
	 * <pre>
	 *
	 * </pre>
	 * 
	 * @param mav      ModelAndView
	 * @param errorMsg Map<String, String>
	 * @throws Exception
	public Map<String, String> setValidateError(ModelAndView mav, Map<String, String> errorMsg) throws Exception {
		if (errorMsg == null) {
			return null;
		}

		StringBuilder sb = new StringBuilder();
		Iterator<String> itr = errorMsg.keySet().iterator();
		while (itr.hasNext()) {
			String key = itr.next();
			sb.append(key).append("::").append(errorMsg.get(key)).append(" ");
		}
		Map<String, String> retMsg = new HashMap<String, String>();

		retMsg.put("statusCode", DefaultConstants.STATUS_ERROR);
		retMsg.put("code", DefaultConstants.VALIDATE_ERR_CODE);
		retMsg.put("message", sb.toString());
		return retMsg;
	}
	*/

}
