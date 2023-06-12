package com.at.apcss.co.cd.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.at.apcss.co.cd.service.ComCdService;
import com.at.apcss.co.sys.controller.BaseController;
/**
 * 공통코드정보 처리하는 컨트롤러 클래스
 * @author SI개발부 김호
 * @since 2023.06.12
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일      	수정자      	수정내용
 *  ----------	----------	---------------------------
 *  2023.06.12  김호     	최초 생성
 *
 *  </pre>
 */
@Controller
public class ComCdController extends BaseController {

	@Resource(name ="comCdService")
	private ComCdService comCdService;

	@RequestMapping(value = "/co/cd/cdManage.do")
	public String doCd() {
		return "apcss/co/cd/comCdManage";
	}

}
