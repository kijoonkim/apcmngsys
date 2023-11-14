package com.at.apcss.main.web;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.at.apcss.co.authrt.service.ComAuthrtService;
import com.at.apcss.co.authrt.vo.ComAuthrtMenuVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.log.service.ComLogService;
import com.at.apcss.co.log.vo.ComLogVO;
import com.at.apcss.co.menu.service.ComMenuService;
import com.at.apcss.co.menu.vo.ComMenuJsonVO;
import com.at.apcss.co.menu.vo.ComMenuVO;
import com.at.apcss.co.menu.vo.ComUiJsonVO;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.co.sys.vo.LoginVO;
import com.fasterxml.jackson.databind.ObjectMapper;

import egovframework.com.cmm.util.EgovUserDetailsHelper;

@Controller
public class MainController extends BaseController {

	@Resource(name = "comMenuService")
	private ComMenuService comMenuService;

	@Resource(name = "comAuthrtService")
	private ComAuthrtService comAuthrtService;

	@Autowired
	ComLogService comLogService;


	@GetMapping("/main.do")
	public String doMain(Model model, HttpServletRequest request) {

		List<String> menuList = new ArrayList<>();
		try {

			LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();

			String menuId = "main";
			ComUiJsonVO comUiJsonVO = new ComUiJsonVO();
			comUiJsonVO.setMenuId(menuId);
			ObjectMapper objMapper = new ObjectMapper();
			String comUiJsonString = objMapper.writeValueAsString(comUiJsonVO);
			model.addAttribute("comUiJson", comUiJsonString);

			ComMenuVO pageVO = new ComMenuVO();
			pageVO.setMenuId(menuId);
			pageVO.setMenuNm("메인페이지");
			model.addAttribute("comMenuVO", pageVO);

			request.getSession().setAttribute(ComConstants.PROP_SYS_PRGRM_ID, menuId);

			ComAuthrtMenuVO paramVO = new ComAuthrtMenuVO();
			paramVO.setUserId(loginVO.getUserId());


			List<ComAuthrtMenuVO> resultList = comAuthrtService.selectTopMenuTreeList(paramVO);
			if (resultList != null && !resultList.isEmpty()) {
				for ( ComAuthrtMenuVO rslt : resultList ) {

					if (ComConstants.CON_YES.equals(rslt.getUseYn())) {
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
			}

		} catch (Exception e) {

		}

		model.addAttribute("topMenuList", menuList);
		model.addAttribute("reportDbName", getReportDbName());
		model.addAttribute("reportUrl", getReportUrl());
		model.addAttribute("reportType", getReportType());
		model.addAttribute("reportPath", getReportPath());

		return "main/main";
	}
}
