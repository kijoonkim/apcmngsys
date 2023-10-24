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
import com.at.apcss.fm.farm.vo.ProductCodeInfoRegVO;
import com.at.apcss.fm.farm.service.ProductCodeInfoRegService;
import com.at.apcss.fm.farm.vo.ProductCodeInfoRegVO;

@Controller
public class ProductCodeInfoRegController extends BaseController{

	@Resource(name= "productCodeInfoRegService")
	private ProductCodeInfoRegService productCodeInfoRegService;

//화면이동
	@RequestMapping(value = "/fm/farm/productCodeInfoReg.do")
	public String productCodeInfoReg() {
		return "apcss/fm/farm/productCodeInfoReg";
	}

// 조회
		@PostMapping(value = "/fm/farm/selectproductCodeInfoRegList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> selectproductCodeInfoRegList(Model model, @RequestBody ProductCodeInfoRegVO productCodeInfoRegVO, HttpServletRequest request) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();
			List<ProductCodeInfoRegVO> resultList = new ArrayList<>();
			try {
				 resultList = productCodeInfoRegService.selectproductCodeInfoRegList(productCodeInfoRegVO);
			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}
			resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
			return getSuccessResponseEntity(resultMap);
		}



		//등록
		@PostMapping(value = "/fm/farm/insertproductCodeInfoReg.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> insertproductCodeInfoReg(@RequestBody ProductCodeInfoRegVO productCodeInfoRegVO, HttpServletRequest requset) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			// validation check

			// audit 항목
			productCodeInfoRegVO.setSysFrstInptUserId(getUserId());
			productCodeInfoRegVO.setSysFrstInptPrgrmId(getPrgrmId());
			productCodeInfoRegVO.setSysLastChgUserId(getUserId());
			productCodeInfoRegVO.setSysLastChgPrgrmId(getPrgrmId());

			int insertedCnt = 0;

			try {
				insertedCnt = productCodeInfoRegService.insertProductCodeInfoReg(productCodeInfoRegVO);
			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

			return getSuccessResponseEntity(resultMap);
		}


		@PostMapping(value = "/fm/farm/multiSaveproductCodeInfoRegList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> multiSaveproductCodeInfoRegList(@RequestBody List<ProductCodeInfoRegVO> productCodeInfoRegVOList, HttpServletRequest request) throws Exception {

			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			int savedCnt = 0;
			try {
				for (ProductCodeInfoRegVO productCodeInfoRegVO : productCodeInfoRegVOList) {
					productCodeInfoRegVO.setSysFrstInptPrgrmId(getPrgrmId());
					productCodeInfoRegVO.setSysFrstInptUserId(getUserId());
					productCodeInfoRegVO.setSysLastChgPrgrmId(getPrgrmId());
					productCodeInfoRegVO.setSysLastChgUserId(getUserId());
				}

				savedCnt = productCodeInfoRegService.multiSaveproductCodeInfoRegList(productCodeInfoRegVOList);
			}catch (Exception e) {
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
			return getSuccessResponseEntity(resultMap);
		}

		@PostMapping(value = "/fm/farm/deleteproductCodeInfoReg.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> deleteproductCodeInfoReg(@RequestBody ProductCodeInfoRegVO productCodeInfoRegVO, HttpServletRequest request) throws Exception {
			logger.debug("/fm/farm/deleteproductCodeInfoReg >>> 호출 >>> ");

			int result = 0;
			try {
				result =+ productCodeInfoRegService.deleteproductCodeInfoReg(productCodeInfoRegVO);
			}catch (Exception e) {
				return getErrorResponseEntity(e);
			}

			HashMap<String,Object> resultMap = new HashMap<String,Object>();
			resultMap.put("result", result);
			return getSuccessResponseEntity(resultMap);
		}

		// 생산농가 상세내역 변경
		@PostMapping(value = "/fm/Farm/updateProductCodeInfoReg.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> updateProductCodeInfoReg(@RequestBody ProductCodeInfoRegVO productCodeInfoRegVO, HttpServletRequest requset) throws Exception{

			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			// validation check

			// audit 항목
			productCodeInfoRegVO.setSysLastChgUserId(getUserId());
			productCodeInfoRegVO.setSysLastChgPrgrmId(getPrgrmId());

			int updatedCnt = 0;

			try {
				updatedCnt = productCodeInfoRegService.updateProductCodeInfoReg(productCodeInfoRegVO);
			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_UPDATED_CNT, updatedCnt);
			return getSuccessResponseEntity(resultMap);
		}

}
