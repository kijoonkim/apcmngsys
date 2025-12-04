package com.apcmngsys.apcss.pd.pcom.web;

import com.apcmngsys.apcss.co.constants.ComConstants;
import com.apcmngsys.apcss.co.sys.controller.BaseController;
import com.apcmngsys.apcss.pd.pcom.service.PrdcrCrclOgnGenalTblMngService;
import com.apcmngsys.apcss.pd.pcom.service.PruoMngService;
import com.apcmngsys.apcss.pd.pcom.vo.ItemUoStbltYnVO;
import com.apcmngsys.apcss.pd.pcom.vo.PrdcrCrclOgnGenalTblMngVO;
import com.apcmngsys.apcss.pd.pcom.vo.PrdcrCrclOgnSpItmPurSalYMngVO;
import com.apcmngsys.apcss.pd.pcom.vo.PruoMstVO;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
public class PruoMngController extends BaseController{

	@Resource(name= "pruoMngService")
	private PruoMngService pruoMngService;

	@PostMapping(value = "/pd/pcom/selectPruoRegMstList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectPruoRegMstList(Model model, @RequestBody PruoMstVO pruoMstVO, HttpServletRequest request) throws Exception{

		HashMap<String, Object> resultMap = new HashMap<>();
		List<PruoMstVO> resultList = new ArrayList<>();

		try {
			resultList = pruoMngService.selectPruoRegMstList(pruoMstVO);
		} catch (SQLException e) {
			return getSqlErrorResponseEntity(e);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}
}
