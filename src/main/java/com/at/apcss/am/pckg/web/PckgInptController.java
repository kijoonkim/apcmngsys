package com.at.apcss.am.pckg.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : PckgInptController.java
 * @Description : 포장투입에 대한 Controller 클래스
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
public class PckgInptController extends BaseController {


	// 포장실적등록
	@RequestMapping(value = "/am/pckg/regPckgInpt.do")
	public String doRegFormPckgInpt() {
		return "apcss/am/pckg/regPckgInpt";
	}

	// 포장실적조회
	@RequestMapping(value = "/am/pckg/pckgInpt.do")
	public String doPckgInpt() {
		return "apcss/am/pckg/pckgInpt";
	}
	// 포장실적등록
	@RequestMapping(value = "/am/pckg/regPckgInptTablet.do")
	public String doRegFormPckInptTablet() {
		return "apcss/am/pckg/regPckgInptTablet";
	}

	// 상품코드조회
	@RequestMapping(value = "/am/pckg/gdsCd.do")
	public String doGdsCd() {
		return "apcss/am/pckg/gdsCd";
	}
}
