package com.at.apcss.fm.fclt.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : FcltOgnzPrcsPrfmncController.java
 * @Description : 유통조직처리실적에 대한 Controller 클래스
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
public class FcltOgnzPrcsPrfmncController extends BaseController {

	// 유통조직처리실적에
	@RequestMapping(value = "/fm/fclt/fcltOgnzPrcsPrfmnc.do")
	public String fcltOgnzPrcsPrfmnc() {
		return "apcss/fm/fclt/fcltOgnzPrcsPrfmnc";
	}
	// 유통조직처리실적에
	@RequestMapping(value = "/fm/fclt/fcltOgnzPrcsPrfmncReg.do")
	public String fcltOgnzPrcsPrfmncReg() {
		return "apcss/fm/fclt/fcltOgnzPrcsPrfmncReg";
	}

	// 재배약정신청조회
	/*
	 * @RequestMapping(value = "fm/clt/cltvtnEnggtAplyMng.do") public String
	 * doSpmtCmnd() { return "apcss/fm/clt/cltvtnEnggtAplyMng"; }
	 */

}
