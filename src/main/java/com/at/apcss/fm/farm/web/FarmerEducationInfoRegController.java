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
import com.at.apcss.fm.farm.vo.FarmerEducationInfoRegVO;
import com.at.apcss.fm.farm.service.FarmerEducationInfoRegService;
import com.at.apcss.fm.farm.vo.FarmerEducationInfoRegVO;

@Controller
public class FarmerEducationInfoRegController extends BaseController{

	@Resource(name= "farmerEducationInfoRegService")
	private FarmerEducationInfoRegService farmerEducationInfoRegService;

//화면이동
	@RequestMapping(value = "/fm/farm/farmerEducationInfoReg.do")
	public String farmerEducationInfoReg() {
		return "apcss/fm/farm/farmerEducationInfoReg";
	}

// 조회
		@PostMapping(value = "/fm/farm/selectfarmerEducationInfoRegList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> selectfarmerEducationInfoRegList(Model model, @RequestBody FarmerEducationInfoRegVO farmerEducationInfoRegVO, HttpServletRequest request) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();
			List<FarmerEducationInfoRegVO> resultList = new ArrayList<>();
			try {
				 resultList = farmerEducationInfoRegService.selectfarmerEducationInfoRegList(farmerEducationInfoRegVO);
			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}
			resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
			return getSuccessResponseEntity(resultMap);
		}



		//등록
		@PostMapping(value = "/fm/farm/insertfarmerEducationInfoReg.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> insertfarmerEducationInfoReg(@RequestBody FarmerEducationInfoRegVO farmerEducationInfoRegVO, HttpServletRequest requset) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			// validation check

			// audit 항목
			farmerEducationInfoRegVO.setSysFrstInptUserId(getUserId());
			farmerEducationInfoRegVO.setSysFrstInptPrgrmId(getPrgrmId());
			farmerEducationInfoRegVO.setSysLastChgUserId(getUserId());
			farmerEducationInfoRegVO.setSysLastChgPrgrmId(getPrgrmId());

			int insertedCnt = 0;

			try {
				insertedCnt = farmerEducationInfoRegService.insertFarmerEducationInfoReg(farmerEducationInfoRegVO);
			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

			return getSuccessResponseEntity(resultMap);
		}


		@PostMapping(value = "/fm/farm/multiSavefarmerEducationInfoRegList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> multiSavefarmerEducationInfoRegList(@RequestBody List<FarmerEducationInfoRegVO> farmerEducationInfoRegVOList, HttpServletRequest request) throws Exception {

			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			int savedCnt = 0;
			try {
				for (FarmerEducationInfoRegVO farmerEducationInfoRegVO : farmerEducationInfoRegVOList) {
					farmerEducationInfoRegVO.setSysFrstInptPrgrmId(getPrgrmId());
					farmerEducationInfoRegVO.setSysFrstInptUserId(getUserId());
					farmerEducationInfoRegVO.setSysLastChgPrgrmId(getPrgrmId());
					farmerEducationInfoRegVO.setSysLastChgUserId(getUserId());
				}

				savedCnt = farmerEducationInfoRegService.multiSavefarmerEducationInfoRegList(farmerEducationInfoRegVOList);
			}catch (Exception e) {
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
			return getSuccessResponseEntity(resultMap);
		}

		@PostMapping(value = "/fm/farm/deletefarmerEducationInfoReg.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> deletefarmerEducationInfoReg(@RequestBody FarmerEducationInfoRegVO farmerEducationInfoRegVO, HttpServletRequest request) throws Exception {
			logger.debug("/fm/farm/deletefarmerEducationInfoReg >>> 호출 >>> ");

			int result = 0;
			try {
				result =+ farmerEducationInfoRegService.deletefarmerEducationInfoReg(farmerEducationInfoRegVO);
			}catch (Exception e) {
				return getErrorResponseEntity(e);
			}

			HashMap<String,Object> resultMap = new HashMap<String,Object>();
			resultMap.put("result", result);
			return getSuccessResponseEntity(resultMap);
		}

		// 생산농가 상세내역 변경
		@PostMapping(value = "/fm/Farm/updateFarmerEducationInfoReg.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> updateFarmerEducationInfoReg(@RequestBody FarmerEducationInfoRegVO farmerEducationInfoRegVO, HttpServletRequest requset) throws Exception{

			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			// validation check

			// audit 항목
			farmerEducationInfoRegVO.setSysLastChgUserId(getUserId());
			farmerEducationInfoRegVO.setSysLastChgPrgrmId(getPrgrmId());

			int updatedCnt = 0;

			try {
				updatedCnt = farmerEducationInfoRegService.updateFarmerEducationInfoReg(farmerEducationInfoRegVO);
			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_UPDATED_CNT, updatedCnt);
			return getSuccessResponseEntity(resultMap);
		}

}
