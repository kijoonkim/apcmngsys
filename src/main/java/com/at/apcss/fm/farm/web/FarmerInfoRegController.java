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
import com.at.apcss.fm.farm.vo.FarmerInfoRegVO;
import com.at.apcss.fm.farm.service.FarmerInfoRegService;
import com.at.apcss.fm.farm.vo.FarmerInfoRegVO;

@Controller
public class FarmerInfoRegController extends BaseController{

	@Resource(name= "farmerInfoRegService")
	private FarmerInfoRegService farmerInfoRegService;

//화면이동
	@RequestMapping(value = "/fm/farm/farmerInfoReg.do")
	public String farmerInfoReg() {
		return "apcss/fm/farm/farmerInfoReg";
	}

// 조회
		@PostMapping(value = "/fm/farm/selectFarmerInfoRegList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> selectFarmerInfoRegList(Model model, @RequestBody FarmerInfoRegVO farmerInfoRegVO, HttpServletRequest request) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();
			List<FarmerInfoRegVO> resultList = new ArrayList<>();
			try {
				 resultList = farmerInfoRegService.selectFarmerInfoRegList(farmerInfoRegVO);
			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}
			resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
			return getSuccessResponseEntity(resultMap);
		}



		//등록
		@PostMapping(value = "/fm/farm/insertFarmerInfoReg.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> insertFarmerInfoReg(@RequestBody FarmerInfoRegVO farmerInfoRegVO, HttpServletRequest requset) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			// validation check

			// audit 항목
			farmerInfoRegVO.setSysFrstInptUserId(getUserId());
			farmerInfoRegVO.setSysFrstInptPrgrmId(getPrgrmId());
			farmerInfoRegVO.setSysLastChgUserId(getUserId());
			farmerInfoRegVO.setSysLastChgPrgrmId(getPrgrmId());

			int insertedCnt = 0;

			try {
				insertedCnt = farmerInfoRegService.insertFarmerInfoReg(farmerInfoRegVO);
			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

			return getSuccessResponseEntity(resultMap);
		}


		@PostMapping(value = "/fm/farm/multiSaveFarmerInfoRegList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> multiSaveFarmerInfoRegList(@RequestBody List<FarmerInfoRegVO> farmerInfoRegVOList, HttpServletRequest request) throws Exception {

			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			int savedCnt = 0;
			try {
				for (FarmerInfoRegVO farmerInfoRegVO : farmerInfoRegVOList) {
					farmerInfoRegVO.setSysFrstInptPrgrmId(getPrgrmId());
					farmerInfoRegVO.setSysFrstInptUserId(getUserId());
					farmerInfoRegVO.setSysLastChgPrgrmId(getPrgrmId());
					farmerInfoRegVO.setSysLastChgUserId(getUserId());
				}

				savedCnt = farmerInfoRegService.multiSaveFarmerInfoRegList(farmerInfoRegVOList);
			}catch (Exception e) {
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
			return getSuccessResponseEntity(resultMap);
		}

		@PostMapping(value = "/fm/farm/deleteFarmerInfoReg.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> deleteFarmerInfoReg(@RequestBody FarmerInfoRegVO farmerInfoRegVO, HttpServletRequest request) throws Exception {
			logger.debug("/fm/farm/deletefarmerInfoReg >>> 호출 >>> ");

			int result = 0;
			try {
				result =+ farmerInfoRegService.deleteFarmerInfoReg(farmerInfoRegVO);
			}catch (Exception e) {
				return getErrorResponseEntity(e);
			}

			HashMap<String,Object> resultMap = new HashMap<String,Object>();
			resultMap.put("result", result);
			return getSuccessResponseEntity(resultMap);
		}

		// 생산농가 상세내역 변경
		@PostMapping(value = "/fm/Farm/updateFarmerInfoReg.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> updateFarmerInfoReg(@RequestBody FarmerInfoRegVO farmerInfoRegVO, HttpServletRequest requset) throws Exception{

			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			// validation check

			// audit 항목
			farmerInfoRegVO.setSysLastChgUserId(getUserId());
			farmerInfoRegVO.setSysLastChgPrgrmId(getPrgrmId());

			int updatedCnt = 0;

			try {
				updatedCnt = farmerInfoRegService.updateFarmerInfoReg(farmerInfoRegVO);
			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_UPDATED_CNT, updatedCnt);
			return getSuccessResponseEntity(resultMap);
		}

}
