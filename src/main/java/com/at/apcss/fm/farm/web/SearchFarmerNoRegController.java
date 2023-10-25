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
import com.at.apcss.fm.farm.vo.SearchFarmerNoRegVO;
import com.at.apcss.fm.farm.service.SearchFarmerNoRegService;
import com.at.apcss.fm.farm.vo.SearchFarmerNoRegVO;

@Controller
public class SearchFarmerNoRegController extends BaseController{

	@Resource(name= "searchFarmerNoRegService")
	private SearchFarmerNoRegService searchFarmerNoRegService;

//화면이동
	@RequestMapping(value = "/fm/farm/searchFarmerNoReg.do")
	public String searchFarmerNoReg() {
		return "apcss/fm/farm/searchFarmerNoReg";
	}

// 조회
		@PostMapping(value = "/fm/farm/selectSearchFarmerNoRegList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> selectSearchFarmerNoRegList(Model model, @RequestBody SearchFarmerNoRegVO searchFarmerNoRegVO, HttpServletRequest request) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();
			List<SearchFarmerNoRegVO> resultList = new ArrayList<>();
			try {
				 resultList = searchFarmerNoRegService.selectSearchFarmerNoRegList(searchFarmerNoRegVO);
			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}
			resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
			return getSuccessResponseEntity(resultMap);
		}



		//등록
		@PostMapping(value = "/fm/farm/insertSearchFarmerNoReg.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> insertSearchFarmerNoReg(@RequestBody SearchFarmerNoRegVO searchFarmerNoRegVO, HttpServletRequest requset) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			// validation check

			// audit 항목
			searchFarmerNoRegVO.setSysFrstInptUserId(getUserId());
			searchFarmerNoRegVO.setSysFrstInptPrgrmId(getPrgrmId());
			searchFarmerNoRegVO.setSysLastChgUserId(getUserId());
			searchFarmerNoRegVO.setSysLastChgPrgrmId(getPrgrmId());

			int insertedCnt = 0;

			try {
				insertedCnt = searchFarmerNoRegService.insertSearchFarmerNoReg(searchFarmerNoRegVO);
			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

			return getSuccessResponseEntity(resultMap);
		}


		@PostMapping(value = "/fm/farm/multiSaveSearchFarmerNoRegList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> multiSaveSearchFarmerNoRegList(@RequestBody List<SearchFarmerNoRegVO> searchFarmerNoRegVOList, HttpServletRequest request) throws Exception {

			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			int savedCnt = 0;
			try {
				for (SearchFarmerNoRegVO searchFarmerNoRegVO : searchFarmerNoRegVOList) {
					searchFarmerNoRegVO.setSysFrstInptPrgrmId(getPrgrmId());
					searchFarmerNoRegVO.setSysFrstInptUserId(getUserId());
					searchFarmerNoRegVO.setSysLastChgPrgrmId(getPrgrmId());
					searchFarmerNoRegVO.setSysLastChgUserId(getUserId());
				}

				savedCnt = searchFarmerNoRegService.multiSaveSearchFarmerNoRegList(searchFarmerNoRegVOList);
			}catch (Exception e) {
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
			return getSuccessResponseEntity(resultMap);
		}

		@PostMapping(value = "/fm/farm/deleteSearchFarmerNoReg.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> deleteSearchFarmerNoReg(@RequestBody SearchFarmerNoRegVO searchFarmerNoRegVO, HttpServletRequest request) throws Exception {
			logger.debug("/fm/farm/deletesearchFarmerNoReg >>> 호출 >>> ");

			int result = 0;
			try {
				result =+ searchFarmerNoRegService.deleteSearchFarmerNoReg(searchFarmerNoRegVO);
			}catch (Exception e) {
				return getErrorResponseEntity(e);
			}

			HashMap<String,Object> resultMap = new HashMap<String,Object>();
			resultMap.put("result", result);
			return getSuccessResponseEntity(resultMap);
		}

		// 생산농가 상세내역 변경
		@PostMapping(value = "/fm/Farm/updateSearchFarmerNoReg.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> updateSearchFarmerNoReg(@RequestBody SearchFarmerNoRegVO searchFarmerNoRegVO, HttpServletRequest requset) throws Exception{

			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			// validation check

			// audit 항목
			searchFarmerNoRegVO.setSysLastChgUserId(getUserId());
			searchFarmerNoRegVO.setSysLastChgPrgrmId(getPrgrmId());

			int updatedCnt = 0;

			try {
				updatedCnt = searchFarmerNoRegService.updateSearchFarmerNoReg(searchFarmerNoRegVO);
			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_UPDATED_CNT, updatedCnt);
			return getSuccessResponseEntity(resultMap);
		}

}
