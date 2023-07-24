package com.at.apcss.fm.clt.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : CltvtnEnggtAplyMngController.java
 * @Description : 재배약정신청관리에 대한 Controller 클래스
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
public class CltvtnEnggtAplyMngController extends BaseController {

	// 재배약정신청관리
	@RequestMapping(value = "/fm/clt/cltvtnEnggtAplyMng.do")
	public String cltvtnEnggtAplyMng() {
		return "apcss/fm/clt/cltvtnEnggtAplyMng";
	}


}
