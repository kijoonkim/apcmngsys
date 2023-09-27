package com.at.apcss.pd.pcorm.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.at.apcss.am.apc.service.ApcEvrmntStngService;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.fm.dashboard.service.DashboardService;
import com.at.apcss.fm.dashboard.vo.DashboardVO;
import com.at.apcss.fm.fclt.service.FcltOperInfoClctAgreInfoService;
import com.at.apcss.fm.fclt.vo.FcltOperInfoClctAgreInfoVO;

@Controller
public class PrdcrCrclOgnVluIdctrMngController extends BaseController{

	@Resource(name = "apcEvrmntStngService")
	private ApcEvrmntStngService apcEvrmntStngService;

	@Resource(name= "dashboardService")
	private DashboardService dashboardService;


	@RequestMapping(value = "pd/pcorm/PrdcrCrclOgnVluIdctrMng.do")
	public String PrdcrCrclOgnVluIdctrMng() {
		return "apcss/pd/pcorm/PrdcrCrclOgnVluIdctrMng";
	}


}
