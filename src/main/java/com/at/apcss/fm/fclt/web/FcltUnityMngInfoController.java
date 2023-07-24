package com.at.apcss.fm.fclt.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : FcltUnityMngInfoController.java
 * @Description : 통합관리시스템에 대한 Controller 클래스
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
public class FcltUnityMngInfoController extends BaseController {

	// 통합관리시스템에
	@RequestMapping(value = "/fm/fclt/fcltUnityMngInfo.do")
	public String fcltUnityMngInfo() {
		return "apcss/fm/fclt/fcltUnityMngInfo";
	}
	// 통합관리시스템에
	@RequestMapping(value = "/fm/fclt/fcltUnityMngInfoReg.do")
	public String fcltUnityMngInfoReg() {
		return "apcss/fm/fclt/fcltUnityMngInfoReg";
	}

	// 재배약정신청조회
	/*
	 * @RequestMapping(value = "fm/clt/cltvtnEnggtAplyMng.do") public String
	 * doSpmtCmnd() { return "apcss/fm/clt/cltvtnEnggtAplyMng"; }
	 */

}
