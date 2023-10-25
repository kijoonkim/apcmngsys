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
import com.at.apcss.fm.farm.vo.SearchCorpFarmerNoRegVO;
import com.at.apcss.fm.farm.service.SearchCorpFarmerNoRegService;
import com.at.apcss.fm.farm.vo.SearchCorpFarmerNoRegVO;

@Controller
public class SearchCorpFarmerNoRegController extends BaseController{

	@Resource(name= "searchCorpFarmerNoRegService")
	private SearchCorpFarmerNoRegService searchCorpFarmerNoRegService;

//화면이동
	@RequestMapping(value = "/fm/farm/searchCorpFarmerNoReg.do")
	public String searchCorpFarmerNoReg() {
		return "apcss/fm/farm/searchCorpFarmerNoReg";
	}

// 조회
		@PostMapping(value = "/fm/farm/selectSearchCorpFarmerNoRegList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> selectSearchCorpFarmerNoRegList(Model model, @RequestBody SearchCorpFarmerNoRegVO searchCorpFarmerNoRegVO, HttpServletRequest request) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();
			List<SearchCorpFarmerNoRegVO> resultList = new ArrayList<>();
			try {
				 resultList = searchCorpFarmerNoRegService.selectSearchCorpFarmerNoRegList(searchCorpFarmerNoRegVO);
			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}
			resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
			return getSuccessResponseEntity(resultMap);
		}



		//등록
		@PostMapping(value = "/fm/farm/insertSearchCorpFarmerNoReg.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> insertSearchCorpFarmerNoReg(@RequestBody SearchCorpFarmerNoRegVO searchCorpFarmerNoRegVO, HttpServletRequest requset) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			// validation check

			// audit 항목
			searchCorpFarmerNoRegVO.setSysFrstInptUserId(getUserId());
			searchCorpFarmerNoRegVO.setSysFrstInptPrgrmId(getPrgrmId());
			searchCorpFarmerNoRegVO.setSysLastChgUserId(getUserId());
			searchCorpFarmerNoRegVO.setSysLastChgPrgrmId(getPrgrmId());

			int insertedCnt = 0;

			try {
				insertedCnt = searchCorpFarmerNoRegService.insertSearchCorpFarmerNoReg(searchCorpFarmerNoRegVO);
			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

			return getSuccessResponseEntity(resultMap);
		}


		@PostMapping(value = "/fm/farm/multiSaveSearchCorpFarmerNoRegList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> multiSaveSearchCorpFarmerNoRegList(@RequestBody List<SearchCorpFarmerNoRegVO> searchCorpFarmerNoRegVOList, HttpServletRequest request) throws Exception {

			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			int savedCnt = 0;
			try {
				for (SearchCorpFarmerNoRegVO searchCorpFarmerNoRegVO : searchCorpFarmerNoRegVOList) {
					searchCorpFarmerNoRegVO.setSysFrstInptPrgrmId(getPrgrmId());
					searchCorpFarmerNoRegVO.setSysFrstInptUserId(getUserId());
					searchCorpFarmerNoRegVO.setSysLastChgPrgrmId(getPrgrmId());
					searchCorpFarmerNoRegVO.setSysLastChgUserId(getUserId());
				}

				savedCnt = searchCorpFarmerNoRegService.multiSaveSearchCorpFarmerNoRegList(searchCorpFarmerNoRegVOList);
			}catch (Exception e) {
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
			return getSuccessResponseEntity(resultMap);
		}

		@PostMapping(value = "/fm/farm/deleteSearchCorpFarmerNoReg.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> deleteSearchCorpFarmerNoReg(@RequestBody SearchCorpFarmerNoRegVO searchCorpFarmerNoRegVO, HttpServletRequest request) throws Exception {
			logger.debug("/fm/farm/deletesearchCorpFarmerNoReg >>> 호출 >>> ");

			int result = 0;
			try {
				result =+ searchCorpFarmerNoRegService.deleteSearchCorpFarmerNoReg(searchCorpFarmerNoRegVO);
			}catch (Exception e) {
				return getErrorResponseEntity(e);
			}

			HashMap<String,Object> resultMap = new HashMap<String,Object>();
			resultMap.put("result", result);
			return getSuccessResponseEntity(resultMap);
		}

		// 생산농가 상세내역 변경
		@PostMapping(value = "/fm/Farm/updateSearchCorpFarmerNoReg.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> updateSearchCorpFarmerNoReg(@RequestBody SearchCorpFarmerNoRegVO searchCorpFarmerNoRegVO, HttpServletRequest requset) throws Exception{

			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			// validation check

			// audit 항목
			searchCorpFarmerNoRegVO.setSysLastChgUserId(getUserId());
			searchCorpFarmerNoRegVO.setSysLastChgPrgrmId(getPrgrmId());

			int updatedCnt = 0;

			try {
				updatedCnt = searchCorpFarmerNoRegService.updateSearchCorpFarmerNoReg(searchCorpFarmerNoRegVO);
			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_UPDATED_CNT, updatedCnt);
			return getSuccessResponseEntity(resultMap);
		}

}
