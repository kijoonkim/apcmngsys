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
import com.at.apcss.fm.farm.vo.FarmLandGrantsInfoRegVO;
import com.at.apcss.fm.farm.service.FarmLandGrantsInfoRegService;
import com.at.apcss.fm.farm.vo.FarmLandGrantsInfoRegVO;

@Controller
public class FarmLandGrantsInfoRegController extends BaseController{

	@Resource(name= "farmLandGrantsInfoRegService")
	private FarmLandGrantsInfoRegService farmLandGrantsInfoRegService;

//화면이동
	@RequestMapping(value = "/fm/farm/farmLandGrantsInfoReg.do")
	public String farmLandGrantsInfoReg() {
		return "apcss/fm/farm/farmLandGrantsInfoReg";
	}

// 조회
		@PostMapping(value = "/fm/farm/selectfarmLandGrantsInfoRegList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> selectfarmLandGrantsInfoRegList(Model model, @RequestBody FarmLandGrantsInfoRegVO farmLandGrantsInfoRegVO, HttpServletRequest request) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();
			List<FarmLandGrantsInfoRegVO> resultList = new ArrayList<>();
			try {
				 resultList = farmLandGrantsInfoRegService.selectfarmLandGrantsInfoRegList(farmLandGrantsInfoRegVO);
			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}
			resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
			return getSuccessResponseEntity(resultMap);
		}



		//등록
		@PostMapping(value = "/fm/farm/insertfarmLandGrantsInfoReg.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> insertfarmLandGrantsInfoReg(@RequestBody FarmLandGrantsInfoRegVO farmLandGrantsInfoRegVO, HttpServletRequest requset) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			// validation check

			// audit 항목
			farmLandGrantsInfoRegVO.setSysFrstInptUserId(getUserId());
			farmLandGrantsInfoRegVO.setSysFrstInptPrgrmId(getPrgrmId());
			farmLandGrantsInfoRegVO.setSysLastChgUserId(getUserId());
			farmLandGrantsInfoRegVO.setSysLastChgPrgrmId(getPrgrmId());

			int insertedCnt = 0;

			try {
				insertedCnt = farmLandGrantsInfoRegService.insertFarmLandGrantsInfoReg(farmLandGrantsInfoRegVO);
			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

			return getSuccessResponseEntity(resultMap);
		}


		@PostMapping(value = "/fm/farm/multiSavefarmLandGrantsInfoRegList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> multiSavefarmLandGrantsInfoRegList(@RequestBody List<FarmLandGrantsInfoRegVO> farmLandGrantsInfoRegVOList, HttpServletRequest request) throws Exception {

			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			int savedCnt = 0;
			try {
				for (FarmLandGrantsInfoRegVO farmLandGrantsInfoRegVO : farmLandGrantsInfoRegVOList) {
					farmLandGrantsInfoRegVO.setSysFrstInptPrgrmId(getPrgrmId());
					farmLandGrantsInfoRegVO.setSysFrstInptUserId(getUserId());
					farmLandGrantsInfoRegVO.setSysLastChgPrgrmId(getPrgrmId());
					farmLandGrantsInfoRegVO.setSysLastChgUserId(getUserId());
				}

				savedCnt = farmLandGrantsInfoRegService.multiSavefarmLandGrantsInfoRegList(farmLandGrantsInfoRegVOList);
			}catch (Exception e) {
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
			return getSuccessResponseEntity(resultMap);
		}

		@PostMapping(value = "/fm/farm/deletefarmLandGrantsInfoReg.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> deletefarmLandGrantsInfoReg(@RequestBody FarmLandGrantsInfoRegVO farmLandGrantsInfoRegVO, HttpServletRequest request) throws Exception {
			logger.debug("/fm/farm/deletefarmLandGrantsInfoReg >>> 호출 >>> ");

			int result = 0;
			try {
				result =+ farmLandGrantsInfoRegService.deletefarmLandGrantsInfoReg(farmLandGrantsInfoRegVO);
			}catch (Exception e) {
				return getErrorResponseEntity(e);
			}

			HashMap<String,Object> resultMap = new HashMap<String,Object>();
			resultMap.put("result", result);
			return getSuccessResponseEntity(resultMap);
		}

		// 생산농가 상세내역 변경
		@PostMapping(value = "/fm/Farm/updateFarmLandGrantsInfoReg.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> updateFarmLandGrantsInfoReg(@RequestBody FarmLandGrantsInfoRegVO farmLandGrantsInfoRegVO, HttpServletRequest requset) throws Exception{

			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			// validation check

			// audit 항목
			farmLandGrantsInfoRegVO.setSysLastChgUserId(getUserId());
			farmLandGrantsInfoRegVO.setSysLastChgPrgrmId(getPrgrmId());

			int updatedCnt = 0;

			try {
				updatedCnt = farmLandGrantsInfoRegService.updateFarmLandGrantsInfoReg(farmLandGrantsInfoRegVO);
			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_UPDATED_CNT, updatedCnt);
			return getSuccessResponseEntity(resultMap);
		}

}
