package com.at.apcss.am.invntr.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : InvntrController.java
 * @Description : 재고관리 대한 Controller 클래스
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
public class InvntrController extends BaseController {

	@RequestMapping(value = "/am/invntr/invntr.do")
	public String doInvntr() {
		return "apcss/am/invntr/invntr";
	}
	@RequestMapping(value = "/am/invntr/regInvntr.do")
	public String doRegFormInvntr() {
		return "apcss/am/invntr/regInvntr";
	}

}
