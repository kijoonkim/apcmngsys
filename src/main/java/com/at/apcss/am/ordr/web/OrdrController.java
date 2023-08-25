package com.at.apcss.am.ordr.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.at.apcss.am.cmns.service.CmnsTaskNoService;
import com.at.apcss.am.ordr.service.OrdrService;
import com.at.apcss.am.ordr.vo.OrdrVO;
import com.at.apcss.am.pckg.vo.PckgCmndVO;
import com.at.apcss.am.pckg.service.PckgCmndService;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : OrdrController.java
 * @Description : 발주정보관리 대한 Controller 클래스
 * @author 신정철
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 *      <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21  신정철        최초 생성
 *      </pre>
 */
@Controller
public class OrdrController extends BaseController {
	
	// 발주정보조회
	@Resource(name = "ordrService")
	private OrdrService ordrService;
	
	@Resource(name = "pckgCmndService")
	private PckgCmndService pckgCmndService;
	
	@Resource(name = "cmnsTaskNoService")
	private CmnsTaskNoService cmnsTaskNoService;

	// 발주정보조회
	@RequestMapping(value = "/am/ordr/outordrInfo.do")
	public String doOutordrInfo() {
		return "apcss/am/ordr/outordrInfo";
	}
	
	// 발주정보 조회
	@PostMapping(value = "/am/ordr/selectOrdrList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectOrdrList(@RequestBody OrdrVO OrdrVO, HttpServletRequest request) throws Exception {
		logger.debug("selectOrdrList 호출 <><><><> ");

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<OrdrVO> resultList = new ArrayList<>();
		try {
			resultList = ordrService.selectOrdrList(OrdrVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}
	
	// 포장지시 등록
//	@PostMapping(value = "/am/ordr/regPckgCmndOrdr.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
//	public ResponseEntity<HashMap<String, Object>> regPckgCmndOrdr(@RequestBody List<OrdrVO> ordrList, HttpServletRequest request) throws Exception {
//		logger.debug("regPckgCmndOrdr 호출 <><><><> ");
//
//		HashMap<String, Object> resultMap = new HashMap<String, Object>();
//		List<OrdrVO> updateList = new ArrayList<OrdrVO>();
//		try {
//			String pckgCmndno = cmnsTaskNoService.selectPckgCmndno(ordrList.get(0).getApcCd(), ordrList.get(0).getPckgCmndYmd());
//			int sn = 1;
//			for ( OrdrVO ordrVO : ordrList ) {
//				PckgCmndVO pckgCmndVO = new PckgCmndVO();
//				pckgCmndVO.setApcCd(ordrVO.getApcCd());
//				pckgCmndVO.setPckgCmndno(pckgCmndno);
//				pckgCmndVO.setPckgCmndSn(sn);
//				pckgCmndVO.setPckgCmndYmd(ordrVO.getPckgCmndYmd());
//				pckgCmndVO.setFcltCd(ordrVO.getFcltCd());
//				pckgCmndVO.setCnptCd(ordrVO.getApcCnptCd());
//				pckgCmndVO.setDudtYmd(ordrVO.getWrhsYmd());
//				pckgCmndVO.setItemCd(ordrVO.getItemCd());
//				pckgCmndVO.setVrtyCd(ordrVO.getVrtyCd());
//				pckgCmndVO.setSpcfctCd(ordrVO.getSpcfctCd());
//				pckgCmndVO.setOrdrQntt(ordrVO.getOutordrQntt());
//				pckgCmndVO.setOrdrWght(0);
//				pckgCmndVO.setBxGdsQntt(ordrVO.getBxGdsQntt());
//				pckgCmndVO.setCmndQntt(0);
//				pckgCmndVO.setCmndWght(0);
//				pckgCmndVO.setOrdrNo(ordrVO.getOutordrno());
//				pckgCmndVO.setDelYn(ordrVO.getDelYn());
//				pckgCmndVO.setSysFrstInptUserId(getUserId());
//				pckgCmndVO.setSysFrstInptPrgrmId(getPrgrmId());
//				pckgCmndVO.setSysLastChgUserId(getPrgrmId());
//				pckgCmndVO.setSysLastChgPrgrmId(getPrgrmId());
//				sn++;
//			}
//			
//			for ( OrdrVO OrdrVO : ordrList ) {
//				OrdrVO.setSysFrstInptUserId(getUserId());
//				OrdrVO.setSysFrstInptPrgrmId(getPrgrmId());
//				OrdrVO.setSysLastChgUserId(getUserId());
//				OrdrVO.setSysLastChgPrgrmId(getPrgrmId());
//				updateList.add(OrdrVO);
//			}
//
//			HashMap<String, Object> rtnObj = ordrService.multiOrdrList(updateList);
//			if (rtnObj != null) {
//				return getErrorResponseEntity(rtnObj);
//			}
//
//		} catch (Exception e) {
//			logger.debug("error: {}", e.getMessage());
//			return getErrorResponseEntity(e);
//		}
//		return getSuccessResponseEntity(resultMap);
//	}
	
	// 발주정보 수정
	@PostMapping(value = "/am/ordr/multiOrdrList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> multiOrdrList(@RequestBody List<OrdrVO> ordrList, HttpServletRequest request) throws Exception {
		logger.debug("multiOrdrList 호출 <><><><> ");

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<OrdrVO> updateList = new ArrayList<OrdrVO>();
		try {
			for ( OrdrVO OrdrVO : ordrList ) {
				OrdrVO.setSysFrstInptUserId(getUserId());
				OrdrVO.setSysFrstInptPrgrmId(getPrgrmId());
				OrdrVO.setSysLastChgUserId(getUserId());
				OrdrVO.setSysLastChgPrgrmId(getPrgrmId());
				updateList.add(OrdrVO);
			}

			HashMap<String, Object> rtnObj = ordrService.multiOrdrList(updateList);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

		} catch (Exception e) {
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		}
		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/ordr/insertOrdrList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertOrdrList(@RequestBody List<OrdrVO> insertList, HttpServletRequest request) throws Exception {
		logger.debug("insertOrdrList 호출 <><><><> ");

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int inserted = 0;
		try {
			for (OrdrVO OrdrVO : insertList) {
				OrdrVO.setSysFrstInptPrgrmId(getPrgrmId());
				OrdrVO.setSysFrstInptUserId(getUserId());
				OrdrVO.setSysLastChgPrgrmId(getPrgrmId());
				OrdrVO.setSysLastChgUserId(getUserId());
				inserted += ordrService.insertOrdr(OrdrVO);
			}

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, inserted);

		return getSuccessResponseEntity(resultMap);
	}
	
	// 발주정보등록
	@RequestMapping(value = "/am/ordr/regOutordrInfo.do")
	public String doRegFormOutordrInfo() {
		return "apcss/am/ordr/regOutordrInfo";
	}
}
