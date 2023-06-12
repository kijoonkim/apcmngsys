package com.at.apcss.co.authrt.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.at.apcss.co.authrt.service.ComAuthService;
import com.at.apcss.co.sys.controller.BaseController;
/**
 * 권한관리 처리하는 컨트롤러 클래스
 * @author SI개발부 김호
 * @since 2023.06.12
 * @version 1.0
 * @see
 *
 * <pre>
 * << 권한관리(Modification Information) >>
 *
 *  수정일      	수정자      	수정내용
 *  ----------	----------	---------------------------
 *  2023.06.12  김호     	최초 생성
 *
 *  </pre>
 */
@Controller
public class ComAuthController extends BaseController{

	@Resource(name = "comAuthService")
	private ComAuthService comAuthService;

	// 권한그룹관리
	@RequestMapping("/co/authrt/authartMng.do")
	public String doAuth() {

		return "apcss/co/authrt/comAuthrtManage";
	}
	// 권한그룹관리
	@RequestMapping("/co/authrt/authartUserMng.do")
	public String doAuthUser() {

		return "apcss/co/authrt/comAuthrtUserManage";
	}
}
