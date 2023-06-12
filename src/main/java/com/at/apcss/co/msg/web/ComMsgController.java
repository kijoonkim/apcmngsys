package com.at.apcss.co.msg.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.at.apcss.co.msg.service.ComMsgService;
import com.at.apcss.co.sys.controller.BaseController;
/**
 * 메시지관리 처리하는 컨트롤러 클래스
 * @author SI개발부 김호
 * @since 2023.06.12
 * @version 1.0
 * @see
 *
 * <pre>
 * << 메시지관리(Modification Information) >>
 *
 *  수정일      	수정자      	수정내용
 *  ----------	----------	---------------------------
 *  2023.06.12  김호     	최초 생성
 *
 *  </pre>
 */
@Controller
public class ComMsgController extends BaseController{

	@Resource(name= "comMsgService")
	private ComMsgService comMsgService;

	@RequestMapping("/co/msg/msgManage.do")
	public String doMsg() {
		return "apcss/co/msg/comMsgManage";
	}
}
