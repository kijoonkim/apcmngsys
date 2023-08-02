package com.at.apcss.co.sys.service.impl;

import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import com.at.apcss.co.msg.mapper.ComMessageSource;
import com.at.apcss.co.msg.vo.ComMsgVO;

public abstract class BaseServiceImpl {
	public final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	protected ComMessageSource messageSource;
	
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
}
