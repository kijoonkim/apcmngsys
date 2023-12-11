package com.at.apcss.co.msg.mapper;

import java.text.MessageFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.MessageSourceResolvable;
import org.springframework.context.NoSuchMessageException;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.util.StringUtils;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.msg.service.ComMsgService;
import com.at.apcss.co.msg.vo.ComMsgVO;
import com.tmax.tibero.Debug;

public class ComMessageSource implements MessageSource {

	@Autowired
	private ComMsgService comMsgService;

	private Date comMessageDate;

	private List<ComMsgVO> comMsgList;

	private ReloadableResourceBundleMessageSource reloadableResourceBundleMessageSource;

	/**
	 * getReloadableResourceBundleMessageSource()
	 * @param reloadableResourceBundleMessageSource - resource MessageSource
	 * @return ReloadableResourceBundleMessageSource
	 */
	public void setReloadableResourceBundleMessageSource(ReloadableResourceBundleMessageSource reloadableResourceBundleMessageSource) {
		this.reloadableResourceBundleMessageSource = reloadableResourceBundleMessageSource;
	}

	/**
	 * getReloadableResourceBundleMessageSource()
	 * @return ReloadableResourceBundleMessageSource
	 */
	public ReloadableResourceBundleMessageSource getReloadableResourceBundleMessageSource() {
		return reloadableResourceBundleMessageSource;
	}

	/**
	 * 정의된 메세지 조회
	 * @param code - 메세지 코드
	 * @return String
	 */
	public String getMessage(String code) {
		try {
			return getReloadableResourceBundleMessageSource().getMessage(code, null, Locale.getDefault());
		} catch (Exception e) {
			return getComMessage(code);
		}
	}

	/**
	 * 정의된 메세지 조회
	 * @param code
	 * @param locale
	 * @return
	 */
	public String getMessage(String code, Locale locale) {
		try {
			return getReloadableResourceBundleMessageSource().getMessage(code, null, locale);
		} catch (Exception e) {
			return getComMessage(code);
		}
	}

	@Override
	public String getMessage(String code, Object[] args, String defaultMessage, Locale locale) {
		try {
			return getReloadableResourceBundleMessageSource().getMessage(code, args, defaultMessage, locale);
		} catch (Exception e) {
			return getComMessage(code, args);
		}
	}

	@Override
	public String getMessage(String code, Object[] args, Locale locale) throws NoSuchMessageException {
		try {
			return getReloadableResourceBundleMessageSource().getMessage(code, args, locale);
		} catch (Exception e) {
			return getComMessage(code, args);
		}
	}

	@Override
	public String getMessage(MessageSourceResolvable resolvable, Locale locale) throws NoSuchMessageException {
		try {
			return getReloadableResourceBundleMessageSource().getMessage(resolvable, locale);
		} catch (Exception e) {

			String[] codes = resolvable.getCodes();
			if (codes != null) {
				for (String code : codes) {
					String message = getComMessage(code);
					if (message != null) {
						return message;
					}
				}
			}
		}

		return null;
	}

	public List<ComMsgVO> getComMessageList() throws Exception {

		Date nowDate = new Date();

		if (comMsgList == null || comMsgList.isEmpty() || comMessageDate == null
				|| nowDate.getTime() > comMessageDate.getTime() + 60 * 1000) {
			ComMsgVO param = new ComMsgVO();
			param.setDelYn(ComConstants.CON_NONE);
			comMsgList = comMsgService.selectComMsgList(param);

			comMessageDate = nowDate;
		}

		return comMsgList;
	}

	private String getComMessage(String code) {
		return getComMessage(code, null);
	}

	private String getComMessage(String code, Object[] args) {
		if (!StringUtils.hasText(code)) {
			return null;
		}

		try {

			comMsgList = getComMessageList();

			ComMsgVO msgVO = comMsgList.stream()
					.filter(msg -> code.equals(msg.getMsgKey()))
					.findAny()
					.orElse(null);

			//ComMsgVO msgVO = comMsgService.selectComMsg(code);

			if (msgVO != null) {

				String message = msgVO.getMsgCn();
				if (args == null || args.length == 0) {
					return message;
				}

				MessageFormat mf = new MessageFormat(message);
				if (mf != null) {
					synchronized (mf) {
						message = mf.format(args);
					}
				}

				return message;
			}

		} catch (Exception e) {
			getComMessage(code, args);
		}

		return null;
	}

}
