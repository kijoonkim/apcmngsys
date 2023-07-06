package com.at.apcss.am.clcln.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : ClclnPrfmncController.java
 * @Description : 정산실적관리 대한 Controller 클래스
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
public class ClclnPrfmncController extends BaseController {

	// 매출실적조회
	@RequestMapping(value = "/am/clcln/clclnPrfmnc.do")
	public String doClclnPrfmnc() {
		return "apcss/am/clcln/clclnPrfmnc";
	}

	// 매출확정등록
	@RequestMapping(value = "/am/clcln/regFormClclnPrfmnc.do")
	public String doRegFormClclnPrfmnc() {
		return "apcss/am/clcln/regFormClclnPrfmnc";
	}
}

