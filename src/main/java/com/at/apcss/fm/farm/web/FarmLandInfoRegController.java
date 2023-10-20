package com.at.apcss.fm.farm.web;

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
import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.fm.dashboard.service.DashboardService;
import com.at.apcss.fm.dashboard.vo.DashboardVO;
import com.at.apcss.fm.fclt.service.FcltOperInfoClctAgreInfoService;
import com.at.apcss.fm.fclt.vo.FcltOperInfoClctAgreInfoVO;
import com.at.apcss.fm.farm.service.farmLandInfoRegService;
import com.at.apcss.fm.farm.vo.farmLandInfoRegVO;

@Controller
public class farmLandInfoRegController extends BaseController{

	@Resource(name= "farmLandInfoRegService")
	private farmLandInfoRegService farmLandInfoRegService;

//화면이동
	@RequestMapping(value = "/fm/farm/farmLandInfoReg.do")
	public String farmLandInfoReg() {
		return "apcss/fm/farm/farmLandInfoReg";
	}

// 조회
		@PostMapping(value = "/fm/farm/selectfarmLandInfoRegList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> selectfarmLandInfoRegList(Model model, @RequestBody farmLandInfoRegVO farmLandInfoRegVO, HttpServletRequest request) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();
			List<farmLandInfoRegVO> resultList = new ArrayList<>();
			try {
				 resultList = farmLandInfoRegService.selectfarmLandInfoRegList(farmLandInfoRegVO);
			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}
			resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
			return getSuccessResponseEntity(resultMap);
		}



		//등록
		@PostMapping(value = "/fm/farm/insertfarmLandInfoReg.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> insertfarmLandInfoReg(@RequestBody farmLandInfoRegVO farmLandInfoRegVO, HttpServletRequest requset) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			// validation check

			// audit 항목
			farmLandInfoRegVO.setSysFrstInptUserId(getUserId());
			farmLandInfoRegVO.setSysFrstInptPrgrmId(getPrgrmId());
			farmLandInfoRegVO.setSysLastChgUserId(getUserId());
			farmLandInfoRegVO.setSysLastChgPrgrmId(getPrgrmId());

			int insertedCnt = 0;

			try {
				insertedCnt = farmLandInfoRegService.insertfarmLandInfoReg(farmLandInfoRegVO);
			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

			return getSuccessResponseEntity(resultMap);
		}


		@PostMapping(value = "/fm/farm/multiSavefarmLandInfoRegList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> multiSavefarmLandInfoRegList(@RequestBody List<farmLandInfoRegVO> farmLandInfoRegVOList, HttpServletRequest request) throws Exception {

			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			int savedCnt = 0;
			try {
				for (farmLandInfoRegVO farmLandInfoRegVO : farmLandInfoRegVOList) {
					farmLandInfoRegVO.setSysFrstInptPrgrmId(getPrgrmId());
					farmLandInfoRegVO.setSysFrstInptUserId(getUserId());
					farmLandInfoRegVO.setSysLastChgPrgrmId(getPrgrmId());
					farmLandInfoRegVO.setSysLastChgUserId(getUserId());
				}

				savedCnt = farmLandInfoRegService.multiSavefarmLandInfoRegList(farmLandInfoRegVOList);
			}catch (Exception e) {
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
			return getSuccessResponseEntity(resultMap);
		}

		@PostMapping(value = "/fm/farm/deletefarmLandInfoReg.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> deletefarmLandInfoReg(@RequestBody farmLandInfoRegVO farmLandInfoRegVO, HttpServletRequest request) throws Exception {
			logger.debug("/fm/farm/deletefarmLandInfoReg >>> 호출 >>> ");

			int result = 0;
			try {
				result =+ farmLandInfoRegService.deletefarmLandInfoReg(farmLandInfoRegVO);
			}catch (Exception e) {
				return getErrorResponseEntity(e);
			}

			HashMap<String,Object> resultMap = new HashMap<String,Object>();
			resultMap.put("result", result);
			return getSuccessResponseEntity(resultMap);
		}

}
