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
import com.at.apcss.fm.farm.service.farmLandInfoService;
import com.at.apcss.fm.farm.vo.farmLandInfoVO;

@Controller
public class farmLandInfoController extends BaseController{

	@Resource(name= "farmLandInfoService")
	private farmLandInfoService farmLandInfoService;

//화면이동
	@RequestMapping(value = "/fm/farm/farmLandInfo.do")
	public String farmLandInfo() {
		return "apcss/fm/farm/farmLandInfo";
	}

// 조회
		@PostMapping(value = "/fm/farm/selectfarmLandInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> selectfarmLandInfoList(Model model, @RequestBody farmLandInfoVO farmLandInfoVO, HttpServletRequest request) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();
			List<farmLandInfoVO> resultList = new ArrayList<>();
			try {
				 resultList = farmLandInfoService.selectfarmLandInfoList(farmLandInfoVO);
			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}
			resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
			return getSuccessResponseEntity(resultMap);
		}



		//등록
		@PostMapping(value = "/fm/farm/insertfarmLandInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> insertfarmLandInfo(@RequestBody farmLandInfoVO farmLandInfoVO, HttpServletRequest requset) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			// validation check

			// audit 항목
			farmLandInfoVO.setSysFrstInptUserId(getUserId());
			farmLandInfoVO.setSysFrstInptPrgrmId(getPrgrmId());
			farmLandInfoVO.setSysLastChgUserId(getUserId());
			farmLandInfoVO.setSysLastChgPrgrmId(getPrgrmId());

			int insertedCnt = 0;

			try {
				insertedCnt = farmLandInfoService.insertfarmLandInfo(farmLandInfoVO);
			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

			return getSuccessResponseEntity(resultMap);
		}


		@PostMapping(value = "/fm/farm/multiSavefarmLandInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> multiSavefarmLandInfoList(@RequestBody List<farmLandInfoVO> farmLandInfoVOList, HttpServletRequest request) throws Exception {

			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			int savedCnt = 0;
			try {
				for (farmLandInfoVO farmLandInfoVO : farmLandInfoVOList) {
					farmLandInfoVO.setSysFrstInptPrgrmId(getPrgrmId());
					farmLandInfoVO.setSysFrstInptUserId(getUserId());
					farmLandInfoVO.setSysLastChgPrgrmId(getPrgrmId());
					farmLandInfoVO.setSysLastChgUserId(getUserId());
				}

				savedCnt = farmLandInfoService.multiSavefarmLandInfoList(farmLandInfoVOList);
			}catch (Exception e) {
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
			return getSuccessResponseEntity(resultMap);
		}

		@PostMapping(value = "/fm/farm/deletefarmLandInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> deletefarmLandInfo(@RequestBody farmLandInfoVO farmLandInfoVO, HttpServletRequest request) throws Exception {
			logger.debug("/fm/farm/deletefarmLandInfo >>> 호출 >>> ");

			int result = 0;
			try {
				result =+ farmLandInfoService.deletefarmLandInfo(farmLandInfoVO);
			}catch (Exception e) {
				return getErrorResponseEntity(e);
			}

			HashMap<String,Object> resultMap = new HashMap<String,Object>();
			resultMap.put("result", result);
			return getSuccessResponseEntity(resultMap);
		}

}
