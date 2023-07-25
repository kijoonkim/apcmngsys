package com.at.apcss.fm.fclt.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : FcltLwtpStrgMchnInfoController.java
 * @Description : 저온저장고운영기간에 대한 Controller 클래스
 * @author 정연두
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21  정연두        최초 생성
 * </pre>
 */
@Controller
public class FcltLwtpStrgMchnInfoController extends BaseController {

	// 저온저장고운영기간
	@RequestMapping(value = "/fm/fclt/fcltLwtpStrgMchnInfo.do")
	public String fcltLwtpStrgMchnInfo() {
		return "apcss/fm/fclt/fcltLwtpStrgMchnInfo";
	}
	// 저온저장고운영기간
	@RequestMapping(value = "/fm/fclt/fcltLwtpStrgMchnInfoReg.do")
	public String fcltLwtpStrgMchnInfoReg() {
		return "apcss/fm/fclt/fcltLwtpStrgMchnInfoReg";
	}

	// 재배약정신청조회
	/*
	 * @RequestMapping(value = "fm/clt/cltvtnEnggtAplyMng.do") public String
	 * doSpmtCmnd() { return "apcss/fm/clt/cltvtnEnggtAplyMng"; }
	 */

}
