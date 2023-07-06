package com.at.apcss.am.sls.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : SlsPrfmncController.java
 * @Description : 매출실적에 대한 Controller 클래스
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
public class SlsPrfmncController extends BaseController {

	// 정산조회
	@RequestMapping(value = "/am/sls/slsPrfmnc.do")
	public String doSlsPrfmnc() {
		return "apcss/am/sls/slsPrfmnc";
	}

	// 정산등록
	@RequestMapping(value = "/am/sls/regFormslsPrfmnc.do")
	public String doRegFormSlsPrfmnc() {
		return "apcss/am/sls/regFormSlsPrfmnc";
	}
}
