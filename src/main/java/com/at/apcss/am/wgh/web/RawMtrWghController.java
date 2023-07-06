package com.at.apcss.am.wgh.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Class Name : RawMtrWghController.java
 * @Description : 원물계량에 대한 Controller 클래스
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
public class RawMtrWghController {

	// 원물계량등록
	@RequestMapping(value = "/am/wgh/ramMtrWgh.do")
	public String doRamMtrWgh() {
		return "apcss/am/wgh/ramMtrWgh";
	}

	// 원물계량등록(태블릿)
	@RequestMapping(value = "/am/wgh/ramMtrWghTablet.do")
	public String doRamMtrWghTablet() {
		return "apcss/am/wgh/ramMtrWghTablet";
	}

	// 입고실적조회
	@RequestMapping(value = "/am/wgh/rawMtrWrhsPrfmnc.do")
	public String doRawMtrWrhsPrfmnc() {
		return "apcss/am/wgh/rawMtrWrhsPrfmnc";
	}

	// 원물입고등록
	@RequestMapping(value = "/am/wgh/regFormRawMtrWrhsPrfmnc.do")
	public String doRegFormRawMtrWrhsPrfmnc() {
		return "apcss/am/wgh/regFormRawMtrWrhsPrfmnc";
	}

	// 원물입고등록(태블릿)
	@RequestMapping(value = "/am/wgh/regFormRawMtrWrhsPrfmncTablet.do")
	public String doRegFormRawMtrWrhsPrfmncTeblet() {
		return "apcss/am/wgh/regFormRawMtrWrhsPrfmncTeblet";
	}

	// 원물입고 팔레트/박스관리
	@RequestMapping(value = "/am/wgh/doRamMtrWghPltBxMng.do")
	public String doRamMtrWghPltBxMng() {
		return "apcss/am/wgh/ramMtrWghPltBxMng";
	}

	// 원물입고계획관리
	@RequestMapping(value = "/am/wgh/rawMtrWrhsPlan.do")
	public String doRawMtrWrhsPlan() {
		return "apcss/am/wgh/rawMtrWrhsPlan";
	}

	// 상품입고등록
	@RequestMapping(value = "/am/wgh/gdsWrhs.do")
	public String doGdsWrhsn() {
		return "apcss/am/wgh/gdsWrhs";
	}
}
