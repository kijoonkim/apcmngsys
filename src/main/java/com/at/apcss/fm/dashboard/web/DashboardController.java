package com.at.apcss.fm.dashboard.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
public class DashboardController extends BaseController{

	@Resource(name = "apcEvrmntStngService")
	private ApcEvrmntStngService apcEvrmntStngService;

	@Resource(name= "dashboardService")
	private DashboardService dashboardService;


	@GetMapping(value = "/fm/dashboard/mapchart.do")
	public String mapchart() {
		return "apcss/fm/dashboard/mapchart";
	}

		@PostMapping(value = "/fm/dashboard/selectDashboardInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> selectDashboardInfoList(Model model, @RequestBody DashboardVO dashboardVO, HttpServletRequest request) throws Exception{

			HashMap<String,Object> resultMap = new HashMap<String,Object>();
			List<DashboardVO> resultList = new ArrayList<>();
			List<DashboardVO> resultListCnt = new ArrayList<>();
			logger.debug("=========================dashboardVO.toString()========================");
			logger.debug(dashboardVO.toString());
			logger.debug(dashboardVO.getPagingYn());
			dashboardVO.setPagingYn("N");
			try {
				 resultList = dashboardService.selectDashboardInfoList(dashboardVO);
				// resultListCnt = dashboardService.selectDashboardInfoListCnt(dashboardVO);

//				 logger.debug("$$$$$$$$$$$$$$$$$$$$$");
//				 for (DashboardVO msg : resultList ) {
//					 logger.debug("getA : {}", msg.getA());
//				 }

			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
			//resultMap.put(ComConstants.PROP_RESULT_LIST, resultListCnt);

			return getSuccessResponseEntity(resultMap);
		}

		@PostMapping(value = "/fm/dashboard/selectDashboardInfoListCnt.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> selectDashboardInfoListCnt(Model model, @RequestBody DashboardVO dashboardVO, HttpServletRequest request) throws Exception{

			HashMap<String,Object> resultMap = new HashMap<String,Object>();
			List<DashboardVO> resultList = new ArrayList<>();
			List<DashboardVO> resultListCnt = new ArrayList<>();
			logger.debug("=========================dashboardVO.toString()========================");
			logger.debug(dashboardVO.toString());
			logger.debug(dashboardVO.getPagingYn());
			dashboardVO.setPagingYn("N");
			try {
				//resultList = dashboardService.selectDashboardInfoList(dashboardVO);
				resultList = dashboardService.selectDashboardInfoListCnt(dashboardVO);

//				logger.debug("$$$$$$$$$$$$$$$$$$$$$");
//				for (DashboardVO msg : resultListCnt ) {
//					logger.debug("getMainCnt : {}", msg.getMainCnt());
//				}

			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}

			//resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
			resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

			return getSuccessResponseEntity(resultMap);
		}


}
