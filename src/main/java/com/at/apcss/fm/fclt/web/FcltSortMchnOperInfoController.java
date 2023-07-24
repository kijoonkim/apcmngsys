package com.at.apcss.fm.fclt.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : FcltSortMchnOperInfoController.java
 * @Description : 선별기운영기간에 대한 Controller 클래스
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
public class FcltSortMchnOperInfoController extends BaseController {

	// 선별기운영기간
	@RequestMapping(value = "/fm/fclt/fcltSortMchnOperInfo.do")
	public String doRegFormSpmtCmnd() {
		return "apcss/fm/fclt/fcltSortMchnOperInfo";
	}
	// 선별기운영기간
	@RequestMapping(value = "/fm/fclt/fcltSortMchnOperInfoReg.do")
	public String doRegFormSpmtCmndReg() {
		return "apcss/fm/fclt/fcltSortMchnOperInfoReg";
	}

	// 재배약정신청조회
	/*
	 * @RequestMapping(value = "fm/clt/cltvtnEnggtAplyMng.do") public String
	 * doSpmtCmnd() { return "apcss/fm/clt/cltvtnEnggtAplyMng"; }
	 */

}
