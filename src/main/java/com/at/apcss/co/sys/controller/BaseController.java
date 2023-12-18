package com.at.apcss.co.sys.controller;

import java.lang.reflect.Method;
import java.net.InetAddress;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.core.env.Environment;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.StringUtils;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.msg.mapper.ComMessageSource;
import com.at.apcss.co.msg.vo.ComMsgVO;
import com.at.apcss.co.sys.service.ComSysService;
import com.at.apcss.co.sys.util.ComUtil;
import com.at.apcss.co.sys.vo.ComPageVO;
import com.at.apcss.co.sys.vo.ComSysVO;
import com.at.apcss.co.sys.vo.LoginVO;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.util.EgovUserDetailsHelper;

public abstract class BaseController {

	public final Logger logger = LoggerFactory.getLogger(this.getClass());

	protected EgovMessageSource message;

	@Autowired
	protected ComMessageSource messageSource;

	@Resource(name = "comSysService")
	private ComSysService comSysService;

	@Autowired
	Environment env;
	private String reportDbName;
	private String reportUrl;
	private String reportType;
	private String reportPath;

	@PostConstruct
	protected void init() {
		reportDbName = env.getProperty("spring.report.dbName");
		reportUrl = env.getProperty("spring.report.url");
		reportType = env.getProperty("spring.report.type");
		reportPath = env.getProperty("spring.report.path");
	}

	/**
	 * @return [Report DbName 설정]
	 */
	protected String getReportDbName() {
		return reportDbName;
	}
	/**
	 * @return [Report Url 설정]
	 */
	protected String getReportUrl() {
		return reportUrl;
	}

	/**
	 * @return [Report Type 설정]
	 */
	protected String getReportType() {
		return reportType;
	}

	/**
	 * @return [Report Path 설정]
	 */
	@Bean(name = {"reportPath"})
	protected String getReportPath() {
		return reportPath;
	}

	protected String getUserId() {

		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();

		if (loginVO != null) {
			return loginVO.getId();
		}

		return null;
	}
	
	protected String getUserNm() {

		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();

		if (loginVO != null) {
			return loginVO.getName();
		}

		return null;
	}
	
	protected String getUserType() {
		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();

		if(loginVO != null) {
			return loginVO.getUserType();
		}
		return null;
	}

	protected String getApcCd() {

		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();

		if (loginVO != null) {
			return loginVO.getApcCd();
		}

		return null;
	}

	protected String getPrgrmId() {

		String prgrmId = (String) RequestContextHolder.currentRequestAttributes().getAttribute(ComConstants.PROP_SYS_PRGRM_ID, RequestAttributes.SCOPE_SESSION);
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
		
		String errorCode = (String)resultMap.getOrDefault(ComConstants.PROP_RESULT_CODE, ComConstants.CON_BLANK);
		String errorMessage = (String)resultMap.getOrDefault(ComConstants.PROP_RESULT_MESSAGE, ComConstants.CON_BLANK);
		
		insertSysErrorLog(errorCode + ComConstants.CON_COMMA + errorMessage);
		
		return new ResponseEntity<HashMap<String, Object>>(resultMap, HttpStatus.OK);
	}

	protected ResponseEntity<Map<String, Object>> getErrorResponseEntity(String errorCode, String errorMessage) {

		HashMap<String, Object> resultMap = new HashMap<>();

		resultMap.put(ComConstants.PROP_RESULT_STATUS, ComConstants.RESULT_STATUS_ERROR);
		resultMap.put(ComConstants.PROP_RESULT_CODE, errorCode);
		resultMap.put(ComConstants.PROP_RESULT_MESSAGE, errorMessage);

		insertSysErrorLog(ComUtil.nullToEmpty(errorCode) + ComConstants.CON_COMMA + ComUtil.nullToEmpty(errorMessage));
		
		return new ResponseEntity<Map<String, Object>>(resultMap, HttpStatus.BAD_REQUEST);
	}
	
	protected ResponseEntity<HashMap<String, Object>> getErrorResponseEntity(EgovBizException e) {

		HashMap<String, Object> resultMap = new HashMap<>();

		resultMap.put(ComConstants.PROP_RESULT_STATUS, ComConstants.RESULT_STATUS_ERROR);
		resultMap.put(ComConstants.PROP_RESULT_CODE, ComConstants.RESULT_CODE_DEFAULT);
		resultMap.put(ComConstants.PROP_RESULT_MESSAGE, e.getMessage());

		insertSysErrorLog(e.getMessage());
		
		return new ResponseEntity<HashMap<String, Object>>(resultMap, HttpStatus.BAD_REQUEST);
	}
	
	protected ResponseEntity<HashMap<String, Object>> getErrorResponseEntity(Exception e) {

		HashMap<String, Object> resultMap = new HashMap<>();

		resultMap.put(ComConstants.PROP_RESULT_STATUS, ComConstants.RESULT_STATUS_ERROR);
		resultMap.put(ComConstants.PROP_RESULT_CODE, ComConstants.RESULT_CODE_DEFAULT);
		resultMap.put(ComConstants.PROP_RESULT_MESSAGE, e.getMessage());
		
		if (StringUtils.hasText(e.getMessage())) {
			if (e.getMessage().contains("java.sql.SQLException")) {
				resultMap.put(ComConstants.PROP_RESULT_MESSAGE, ComConstants.RESULT_MESSAGE_DEFAULT);
			}
		}
		
		insertSysErrorLog(e.getMessage());
		
		//resultMap.put(ComConstants.PROP_RESULT_MESSAGE, ComConstants.RESULT_MESSAGE_DEFAULT);

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
	
	protected String getUserIp(HttpServletRequest request) throws Exception{
		String clientIp = null;
		boolean isIpInHeader = false;

		List<String> headerList = new ArrayList<>();
		headerList.add("X-Forwarded-For");
		headerList.add("HTTP_CLIENT_IP");
		headerList.add("HTTP_X_FORWARDED_FOR");
		headerList.add("HTTP_X_FORWAREDE");
		headerList.add("HTTP_FORWARDED_FOR");
		headerList.add("HTTP_FORWARDED");
		headerList.add("Proxy-Client-IP");
		headerList.add("WL-Proxy-Client-IP");
		headerList.add("HTTP_VIA");
		headerList.add("IPV6_ADR");

		for(String header : headerList) {
			clientIp = request.getHeader(header);
			if(StringUtils.hasText(clientIp) && !clientIp.equals("unknown")) {
				isIpInHeader = true;
				break;
			}
		}
		if(!isIpInHeader) {
			clientIp = request.getRemoteAddr();
		}
		if(clientIp.equals("0:0:0:0:0:0:0:1") || clientIp.equals("127.0.0.1")) {
			InetAddress address = InetAddress.getLocalHost();
			clientIp =  address.getHostAddress();
		}
		return clientIp;
	}
	
	protected HashMap<String, Object> setSessionInfo(HttpServletRequest request) throws Exception {
		
		// user id 로 조회
		String jsseionId = request.getSession().getId();
		//System.out.println(String.format("jsseionId : %s", jsseionId));
		
		// 세션정보 db insert
		ComSysVO comSysVO = new ComSysVO();
		comSysVO.setSessId(jsseionId);
		comSysVO.setUserId(getUserId());
		
		HashMap<String, Object> rtnObj = comSysService.insertComSession(comSysVO);
		if (rtnObj != null) {
			return rtnObj;
		}
		
		// String sessionId = UUID.randomUUID().toString();
		// System.out.println(String.format("sessionid : %s", sessionId));
		// Cookie sessionCookie = new Cookie("sessionid", sessionId);
		// response.addCookie(sessionCookie);
		
		// 세션id로 조회
		
		// 만료안된 세션정보가 있다면 만료 처리 
		// insert session 정보
		return null;
	}
	
	protected HashMap<String, Object> terminateSession(HttpServletRequest request) throws Exception {
		
		// user id 로 조회
		String jsseionId = request.getSession().getId();
		
		// 세션정보 만료 update
		ComSysVO comSysVO = new ComSysVO();
		comSysVO.setSessId(jsseionId);
		comSysVO.setUserId(getUserId());
		
		HashMap<String, Object> rtnObj = comSysService.updateComSessionExpiry(comSysVO);
		if (rtnObj != null) {
			return rtnObj;
		}
		
		return null;
	}
	
	protected HashMap<String, Object> terminateSessionByUser(String userId) throws Exception {
		
		// 세션정보 만료 update
		ComSysVO comSysVO = new ComSysVO();
		comSysVO.setUserId(userId);
		comSysVO.setFrcdExpryYn(ComConstants.CON_YES);
		HashMap<String, Object> rtnObj = comSysService.updateComSessionExpiryByUser(comSysVO);
		if (rtnObj != null) {
			return rtnObj;
		}
		
		return null;
	}
	
	protected boolean checkDuplicatedUser(String userId, String userIp) throws Exception {
		return comSysService.checkDuplicatedUser(userId, userIp);
	}
	
	
	protected HashMap<String, Object> setMenuComLog(HttpServletRequest request) throws Exception {
	
		ComSysVO comSysVO = new ComSysVO();
		
		comSysVO.setUserId(getUserId());
		comSysVO.setPrgrmId(getPrgrmId());
		comSysVO.setUserNm(getUserNm());
		comSysVO.setUserType(getUserType());
		comSysVO.setLgnScsYn(StringUtils.hasText(getUserId()) ? ComConstants.CON_YES : ComConstants.CON_NONE);
		comSysVO.setUserIp(getUserIp(request));
		comSysVO.setApcCd(getApcCd());
		
		String uri = request.getRequestURI();
		if (StringUtils.hasText(uri)) {
			
			comSysVO.setPrslType(ComConstants.CON_PRSL_TYPE_UI_ACTION);
			
			String flfmtTaskSeCd = ComConstants.CON_BLANK;
			
			if (uri.contains("insert")) {
				flfmtTaskSeCd = ComConstants.CON_FLFMT_TASK_SE_CD_CREATE;
			} else if (uri.contains("update")) {
				flfmtTaskSeCd = ComConstants.CON_FLFMT_TASK_SE_CD_UPDATE;
			} else if (uri.contains("delete")) {
				flfmtTaskSeCd = ComConstants.CON_FLFMT_TASK_SE_CD_DELETE;
			} else if (uri.contains("multi")) {
				flfmtTaskSeCd = ComConstants.CON_FLFMT_TASK_SE_CD_UPDATE;
			} else if (uri.contains("select")) {
				flfmtTaskSeCd = ComConstants.CON_FLFMT_TASK_SE_CD_READ;
			} else if (uri.contains("action")) {
				flfmtTaskSeCd = ComConstants.CON_FLFMT_TASK_SE_CD_UPDATE;
			} else {
				flfmtTaskSeCd = ComConstants.CON_FLFMT_TASK_SE_CD_DEFAULT;
			}
			
			comSysVO.setFlfmtTaskSeCd(flfmtTaskSeCd);
			
			HashMap<String, Object> rtnObj = comSysService.insertComeMenuLogPrsnaInfo(comSysVO);
			if (rtnObj != null) {
				return rtnObj;
			}
		}
		
		return null;
	}
	
	/**
	 * 시스템 로그 등록
	 * @param errCnts
	 */
	protected void insertSysErrorLog(String errCnts) {
		try {
			comSysService.insertSysErrLog(getUserId(), getPrgrmId(), errCnts);
		} catch (Exception e) {
			logger.error("insert log error {}", e.getMessage());
		} finally {
			
		}		
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
