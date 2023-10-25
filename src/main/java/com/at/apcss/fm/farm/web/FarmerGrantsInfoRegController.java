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
import com.at.apcss.fm.farm.vo.FarmerGrantsInfoRegVO;
import com.at.apcss.fm.farm.service.FarmerGrantsInfoRegService;
import com.at.apcss.fm.farm.vo.FarmerGrantsInfoRegVO;

@Controller
public class FarmerGrantsInfoRegController extends BaseController{

	@Resource(name= "farmerGrantsInfoRegService")
	private FarmerGrantsInfoRegService farmerGrantsInfoRegService;

//화면이동
	@RequestMapping(value = "/fm/farm/farmerGrantsInfoReg.do")
	public String farmerGrantsInfoReg() {
		return "apcss/fm/farm/farmerGrantsInfoReg";
	}

// 조회
		@PostMapping(value = "/fm/farm/selectFarmerGrantsInfoRegList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> selectFarmerGrantsInfoRegList(Model model, @RequestBody FarmerGrantsInfoRegVO farmerGrantsInfoRegVO, HttpServletRequest request) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();
			List<FarmerGrantsInfoRegVO> resultList = new ArrayList<>();
			try {
				 resultList = farmerGrantsInfoRegService.selectFarmerGrantsInfoRegList(farmerGrantsInfoRegVO);
			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}
			resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
			return getSuccessResponseEntity(resultMap);
		}



		//등록
		@PostMapping(value = "/fm/farm/insertFarmerGrantsInfoReg.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> insertFarmerGrantsInfoReg(@RequestBody FarmerGrantsInfoRegVO farmerGrantsInfoRegVO, HttpServletRequest requset) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			// validation check

			// audit 항목
			farmerGrantsInfoRegVO.setSysFrstInptUserId(getUserId());
			farmerGrantsInfoRegVO.setSysFrstInptPrgrmId(getPrgrmId());
			farmerGrantsInfoRegVO.setSysLastChgUserId(getUserId());
			farmerGrantsInfoRegVO.setSysLastChgPrgrmId(getPrgrmId());

			int insertedCnt = 0;

			try {
				insertedCnt = farmerGrantsInfoRegService.insertFarmerGrantsInfoReg(farmerGrantsInfoRegVO);
			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

			return getSuccessResponseEntity(resultMap);
		}


		@PostMapping(value = "/fm/farm/multiSaveFarmerGrantsInfoRegList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> multiSaveFarmerGrantsInfoRegList(@RequestBody List<FarmerGrantsInfoRegVO> farmerGrantsInfoRegVOList, HttpServletRequest request) throws Exception {

			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			int savedCnt = 0;
			try {
				for (FarmerGrantsInfoRegVO farmerGrantsInfoRegVO : farmerGrantsInfoRegVOList) {
					farmerGrantsInfoRegVO.setSysFrstInptPrgrmId(getPrgrmId());
					farmerGrantsInfoRegVO.setSysFrstInptUserId(getUserId());
					farmerGrantsInfoRegVO.setSysLastChgPrgrmId(getPrgrmId());
					farmerGrantsInfoRegVO.setSysLastChgUserId(getUserId());
				}

				savedCnt = farmerGrantsInfoRegService.multiSaveFarmerGrantsInfoRegList(farmerGrantsInfoRegVOList);
			}catch (Exception e) {
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
			return getSuccessResponseEntity(resultMap);
		}

		@PostMapping(value = "/fm/farm/deleteFarmerGrantsInfoReg.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> deleteFarmerGrantsInfoReg(@RequestBody FarmerGrantsInfoRegVO farmerGrantsInfoRegVO, HttpServletRequest request) throws Exception {
			logger.debug("/fm/farm/deletefarmerGrantsInfoReg >>> 호출 >>> ");

			int result = 0;
			try {
				result =+ farmerGrantsInfoRegService.deleteFarmerGrantsInfoReg(farmerGrantsInfoRegVO);
			}catch (Exception e) {
				return getErrorResponseEntity(e);
			}

			HashMap<String,Object> resultMap = new HashMap<String,Object>();
			resultMap.put("result", result);
			return getSuccessResponseEntity(resultMap);
		}

		// 생산농가 상세내역 변경
		@PostMapping(value = "/fm/Farm/updateFarmerGrantsInfoReg.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> updateFarmerGrantsInfoReg(@RequestBody FarmerGrantsInfoRegVO farmerGrantsInfoRegVO, HttpServletRequest requset) throws Exception{

			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			// validation check

			// audit 항목
			farmerGrantsInfoRegVO.setSysLastChgUserId(getUserId());
			farmerGrantsInfoRegVO.setSysLastChgPrgrmId(getPrgrmId());

			int updatedCnt = 0;

			try {
				updatedCnt = farmerGrantsInfoRegService.updateFarmerGrantsInfoReg(farmerGrantsInfoRegVO);
			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_UPDATED_CNT, updatedCnt);
			return getSuccessResponseEntity(resultMap);
		}

}
