package com.at.apcss.am.pckg.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : PckgCmndController.java
 * @Description : 포장지시에 대한 Controller 클래스
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
@Controller
public class PckgCmndController extends BaseController {

	// 포장지시등록
	@RequestMapping(value = "/am/pckg/regFormPckgCmnd.do")
	public String doRegFormPckgmnd() {
		return "apcss/am/pckg/regFormPckgCmnd";
	}

	// 포장지시조회
	@RequestMapping(value = "/am/pckg/pckgCmnd.do")
	public String doPckgCmnd() {
		return "apcss/am/pckg/pckgCmnd";
	}
}
