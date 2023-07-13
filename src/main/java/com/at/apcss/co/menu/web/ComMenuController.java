package com.at.apcss.co.menu.web;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.menu.service.ComMenuService;
import com.at.apcss.co.menu.vo.ComMenuVO;
import com.at.apcss.co.menu.vo.ComUiJsonVO;
import com.at.apcss.co.sys.controller.BaseController;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class ComMenuController extends BaseController {

	@Resource(name = "comMenuService")
	private ComMenuService comMenuService;

	@RequestMapping("/co/menu/openPage.do/{menuId}")
	public String doOpenPage(Model model, @PathVariable String menuId, HttpServletRequest request) throws Exception {
		
		String pageUrl = ComConstants.CON_BLANK;
		
		try {
			ComMenuVO pageVO = comMenuService.selectComMenu(menuId);
			
			if (pageVO != null) {
				pageUrl = pageVO.getPageUrl();
			}
			
			ComUiJsonVO comUiJsonVO = new ComUiJsonVO();
			BeanUtils.copyProperties(pageVO, comUiJsonVO);
			ObjectMapper objMapper = new ObjectMapper();
			String jsonString = objMapper.writeValueAsString(comUiJsonVO);
			model.addAttribute("comUiJson", jsonString);
			logger.debug("jsonString", jsonString);
			
			model.addAttribute("comMenuVO", pageVO);
			
			request.getSession().setAttribute(ComConstants.PROP_SYS_PRGRM_ID, menuId);
			
		} catch( Exception e) {
		}
				
		return "apcss/" + pageUrl;
	}
	
	// 메뉴 관리
	@RequestMapping("/co/menu/menuMng.do")
	public String doMenu() {

		return "apcss/co/menu/comMenuManage";
	}

	// 화면 관리
	@RequestMapping("/co/menu/uiMng.do")
	public String doUi() {

		return "apcss/co/menu/comUiManage";
	}
}
