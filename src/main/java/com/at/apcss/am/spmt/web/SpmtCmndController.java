package com.at.apcss.am.spmt.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : SpmtCmndController.java
 * @Description : 출고지시에 대한 Controller 클래스
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
public class SpmtCmndController extends BaseController {

	// 출하지시등록
	@RequestMapping(value = "/am/spmt/regSpmtCmnd.do")
	public String doRegFormSpmtCmnd() {
		return "apcss/am/spmt/regSpmtCmnd";
	}

	// 출하지시조회
	@RequestMapping(value = "/am/spmt/spmtCmnd.do")
	public String doSpmtCmnd() {
		return "apcss/am/spmt/spmtCmnd";
	}

}
