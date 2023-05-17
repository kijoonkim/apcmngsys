package com.at.apcss.co.sys.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import egovframework.com.cmm.EgovMessageSource;

public abstract class BaseController {
	
	public final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	protected EgovMessageSource message;

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
