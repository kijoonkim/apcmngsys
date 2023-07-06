package com.at.apcss.am.sort.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : SortInptPrfmncController.java
 * @Description : 선별투입실적정보관리에 대한 Controller 클래스
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
public class SortInptPrfmncController extends BaseController {

	// 선별실적등록
	@RequestMapping(value = "/am/sort/regFormSortInptPrfmnc.do")
	public String doRegFormSortInptPrfmnc() {
		return "apcss/am/sort/regFormSortInptPrfmnc";
	}

	// 선별실적조회
	@RequestMapping(value = "/am/sort/sortInptPrfmnc.do")
	public String doSorInpttCmnd() {
		return "apcss/am/sort/sortInptPrfmnc";
	}

	// 선별실적등록(태블릿)
	@RequestMapping(value = "/am/sort/regFormSortInptPrfmncTablet.do")
	public String doRegFormSortInptCmndTablet() {
		return "apcss/am/sort/regFormSortInptPrfmncTablet";
	}
}
