package com.at.apcss.fm.spmt.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : SpmtEnggtInfoMngController.java
 * @Description : 출하약정관리에 대한 Controller 클래스
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
public class SpmtEnggtInfoMngController extends BaseController {

	// 출하약정관리
	@RequestMapping(value = "/fm/spmt/spmtEnggtInfoMng.do")
	public String spmtEnggtInfoMng() {
		return "apcss/fm/spmt/spmtEnggtInfoMng";
	}

}
