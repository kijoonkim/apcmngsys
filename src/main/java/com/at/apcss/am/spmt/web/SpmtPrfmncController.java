package com.at.apcss.am.spmt.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : SpmtPrfmncController.java
 * @Description : 출고실적에 대한 Controller 클래스
 * @author 신정철
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 *      <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21  신정철        최초 생성
 *      </pre>
 */
@Controller
public class SpmtPrfmncController extends BaseController {

	// 출하실적등록
	@RequestMapping(value = "/am/spmt/regSpmtPrfmnc.do")
	public String doRegFormSpmtPrfmnc() {
		return "apcss/am/spmt/regSpmtPrfmnc";
	}

	// 출하실적조회
	@RequestMapping(value = "/am/spmt/spmtPrfmnc.do")
	public String doSpmtPrfmnc() {
		return "apcss/am/spmt/spmtPrfmnc";
	}

	// 출하실적등록 태블릿
	@RequestMapping(value = "/am/spmt/regSpmtPrfmncTablet.do")
	public String doRegFormSpmtPrfmncTablet() {
		return "apcss/am/spmt/regSpmtPrfmncTablet";
	}

}
