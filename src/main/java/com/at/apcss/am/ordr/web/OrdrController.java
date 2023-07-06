package com.at.apcss.am.ordr.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : OrdrController.java
 * @Description : 발주정보관리 대한 Controller 클래스
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
public class OrdrController extends BaseController {

	// 발주정보조회
	@RequestMapping(value = "/am/ordr/outordrInfo.do")
	public String doOutordrInfo() {
		return "apcss/am/ordr/outordrInfo";
	}

	// 발주정보등록
	@RequestMapping(value = "/am/ordr/regFormOutordrInfo.do")
	public String doRegFormOutordrInfo() {
		return "apcss/am/ordr/regFormOutordrInfo";
	}
}
