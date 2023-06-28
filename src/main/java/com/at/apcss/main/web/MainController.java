package com.at.apcss.main.web;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.menu.service.ComMenuService;
import com.at.apcss.co.menu.vo.ComMenuJsonVO;
import com.at.apcss.co.menu.vo.ComMenuVO;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class MainController {
	
	@Resource(name = "comMenuService")
	private ComMenuService comMenuService;
	
	@RequestMapping("/main.do")
	public String doMain(Model model, HttpServletRequest request) {
		
		request.getSession().setAttribute("sysPrgrmId", "main");
		
		List<String> menuList = new ArrayList<>();
		try {
			List<ComMenuVO> resultList = comMenuService.selectTopMenuList(new ComMenuVO());
			if (resultList != null && !resultList.isEmpty()) {
				for ( ComMenuVO rslt : resultList ) {
					
					ComMenuJsonVO menu = new ComMenuJsonVO();					
					menu.setId(rslt.getMenuId());
					menu.setPid(rslt.getUpMenuId());
					menu.setOrder(rslt.getIndctSeq());
					menu.setText(rslt.getMenuNm());
					//menu.setLink(rslt.getPageUrl() == null ? ComConstants.CON_BLANK : rslt.getPageUrl());
					menu.setTopMenuNm(rslt.getUpMenuNm() == null ? ComConstants.CON_BLANK : rslt.getUpMenuNm());
					menu.setUrl(rslt.getPageUrl() == null ? ComConstants.CON_BLANK : rslt.getPageUrl());
					menu.setValue(rslt.getUpMenuNm() == null ? ComConstants.CON_BLANK : rslt.getUpMenuNm());
					ObjectMapper mapper = new ObjectMapper();
					String jsonString = mapper.writeValueAsString(menu);
					System.out.println(jsonString);
					menuList.add(jsonString);
				}
			}
		} catch (Exception e) {
			
		}
		
		model.addAttribute("topMenuList", menuList);
		
		return "main/main";
	}
}
