package com.at.apcss.co.dashboard.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.at.apcss.co.dashboard.service.DashboardService;
import com.at.apcss.co.dashboard.vo.DashboardVO;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * 대시보드 최초진입 데이터 조회
 * @author SI개발부 손민성
 * @since 2023.11.14
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일      	수정자      	수정내용
 *  ----------	----------	---------------------------
 *  2023.11.14  손민성     	최초 생성
 *
 *  </pre>
 */
@Controller
public class MainDashboardController extends BaseController {

//	@Resource(name="dashBoardService")
@Qualifier("DashboardService")
@Autowired
	DashboardService dashBoardService;

	@PostMapping(value = "/co/dashboard/selectStats.do", consumes = { MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectStats(@RequestBody DashboardVO gv_apcCd, HttpServletRequest request) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<DashboardVO> resultList =dashBoardService.selectStats(gv_apcCd);
		resultMap.put("result", resultList);

		return getSuccessResponseEntity(resultMap);
	}
}
