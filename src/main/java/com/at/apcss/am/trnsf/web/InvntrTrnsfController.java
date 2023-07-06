package com.at.apcss.am.trnsf.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : InvntrTrnsfController.java
 * @Description : 재고이송에 대한 Controller 클래스
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
public class InvntrTrnsfController extends BaseController {

	// 재고이송등록
	@RequestMapping(value = "/am/trnsf/regInvntrTrnsf.do")
	public String doRegFormInvntrTrnsf() {
		return "apcss/am/trnsf/regInvntrTrnsf";
	}

	// 재고이송조회
	@RequestMapping(value = "/am/trnsf/invntrTrnsf.do")
	public String doInvntrTrnsf() {
		return "apcss/am/trnsf/invntrTrnsf";
	}

}
