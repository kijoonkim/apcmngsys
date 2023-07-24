package com.at.apcss.fm.fclt.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : FcltPrcsPrfmncController.java
 * @Description : 산지유통처리실적에 대한 Controller 클래스
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
public class FcltPrcsPrfmncController extends BaseController {

	// 산지유통처리실적
	@RequestMapping(value = "/fm/fclt/fcltPrcsPrfmnc.do")
	public String doRegFormSpmtCmnd() {
		return "apcss/fm/fclt/fcltPrcsPrfmnc";
	}
	// 산지유통처리실적
	@RequestMapping(value = "/fm/fclt/fcltPrcsPrfmncReg.do")
	public String doRegFormSpmtCmndReg() {
		return "apcss/fm/fclt/fcltPrcsPrfmncReg";
	}

	// 재배약정신청조회
	/*
	 * @RequestMapping(value = "fm/clt/cltvtnEnggtAplyMng.do") public String
	 * doSpmtCmnd() { return "apcss/fm/clt/cltvtnEnggtAplyMng"; }
	 */

}
