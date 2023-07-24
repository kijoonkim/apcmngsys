package com.at.apcss.fm.fclt.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : FcltOperHfInfocontroller.java
 * @Description : 시설고용인력에 대한 Controller 클래스
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
public class FcltOperHfInfocontroller extends BaseController {

	// 시설고용인력
	@RequestMapping(value = "/fm/fclt/fcltOperHfInfo.do")
	public String doRegFormSpmtCmnd() {
		return "apcss/fm/fclt/fcltOperHfInfo";
	}
	// 시설고용인력
	@RequestMapping(value = "/fm/fclt/fcltOperHfInfoReg.do")
	public String doRegFormSpmtCmndReg() {
		return "apcss/fm/fclt/fcltOperHfInfoReg";
	}

	// 재배약정신청조회
	/*
	 * @RequestMapping(value = "fm/clt/cltvtnEnggtAplyMng.do") public String
	 * doSpmtCmnd() { return "apcss/fm/clt/cltvtnEnggtAplyMng"; }
	 */

}
