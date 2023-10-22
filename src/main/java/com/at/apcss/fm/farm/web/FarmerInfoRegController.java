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
		@PostMapping(value = "/fm/farm/selectfarmerInfoRegList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> selectfarmerInfoRegList(Model model, @RequestBody FarmerInfoRegVO farmerInfoRegVO, HttpServletRequest request) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();
			List<FarmerInfoRegVO> resultList = new ArrayList<>();
			try {
				 resultList = farmerInfoRegService.selectfarmerInfoRegList(farmerInfoRegVO);
			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}
			resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
			return getSuccessResponseEntity(resultMap);
		}



		//등록
		@PostMapping(value = "/fm/farm/insertfarmerInfoReg.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> insertfarmerInfoReg(@RequestBody FarmerInfoRegVO farmerInfoRegVO, HttpServletRequest requset) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			// validation check

			// audit 항목
			farmerInfoRegVO.setSysFrstInptUserId(getUserId());
			farmerInfoRegVO.setSysFrstInptPrgrmId(getPrgrmId());
			farmerInfoRegVO.setSysLastChgUserId(getUserId());
			farmerInfoRegVO.setSysLastChgPrgrmId(getPrgrmId());

			int insertedCnt = 0;

			try {
				insertedCnt = farmerInfoRegService.insertfarmerInfoReg(farmerInfoRegVO);
			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

			return getSuccessResponseEntity(resultMap);
		}


		@PostMapping(value = "/fm/farm/multiSavefarmerInfoRegList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> multiSavefarmerInfoRegList(@RequestBody List<FarmerInfoRegVO> farmerInfoRegVOList, HttpServletRequest request) throws Exception {

			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			int savedCnt = 0;
			try {
				for (FarmerInfoRegVO farmerInfoRegVO : farmerInfoRegVOList) {
					farmerInfoRegVO.setSysFrstInptPrgrmId(getPrgrmId());
					farmerInfoRegVO.setSysFrstInptUserId(getUserId());
					farmerInfoRegVO.setSysLastChgPrgrmId(getPrgrmId());
					farmerInfoRegVO.setSysLastChgUserId(getUserId());
				}

				savedCnt = farmerInfoRegService.multiSavefarmerInfoRegList(farmerInfoRegVOList);
			}catch (Exception e) {
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
			return getSuccessResponseEntity(resultMap);
		}

		@PostMapping(value = "/fm/farm/deletefarmerInfoReg.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> deletefarmerInfoReg(@RequestBody FarmerInfoRegVO farmerInfoRegVO, HttpServletRequest request) throws Exception {
			logger.debug("/fm/farm/deletefarmerInfoReg >>> 호출 >>> ");

			int result = 0;
			try {
				result =+ farmerInfoRegService.deletefarmerInfoReg(farmerInfoRegVO);
			}catch (Exception e) {
				return getErrorResponseEntity(e);
			}

			HashMap<String,Object> resultMap = new HashMap<String,Object>();
			resultMap.put("result", result);
			return getSuccessResponseEntity(resultMap);
		}

}
