package com.at.apcss.am.invntr.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.at.apcss.am.apc.vo.ApcEvrmntStngVO;
import com.at.apcss.am.cmns.vo.PrdcrVO;
import com.at.apcss.am.invntr.service.RawMtrInvntrService;
import com.at.apcss.am.invntr.vo.RawMtrInvntrVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : RawMtrInvntrController.java
 * @Description : 원물재고관리 대한 Controller 클래스
 * @author 신정철
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21  신정철        최초 생성
 * </pre>
 */
@Controller
public class RawMtrInvntrController extends BaseController {

	@Resource(name = "rawMtrInvntrService")
	private RawMtrInvntrService rawMtrInvntrService;
	
	@PostMapping(value = "/am/invntr/selectRawMtrInvntrList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectRawMtrInvntrList(@RequestBody RawMtrInvntrVO rawMtrInvntrVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<RawMtrInvntrVO> resultList;
		try {
			
			resultList = rawMtrInvntrService.selectRawMtrInvntrList(rawMtrInvntrVO);
			
		} catch (Exception e) {
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		}
		
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		
		return getSuccessResponseEntity(resultMap);
	}
	
	@PostMapping(value = "/am/invntr/updateRawMtrInvntrList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> updateInvntrSortPrfmnc(@RequestBody List<RawMtrInvntrVO> rawMtrInvntrList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		try {
			for ( RawMtrInvntrVO rawMtrInvntrVO : rawMtrInvntrList ) {
				rawMtrInvntrVO.setSysFrstInptUserId(getUserId());
				rawMtrInvntrVO.setSysFrstInptPrgrmId(getPrgrmId());
				rawMtrInvntrVO.setSysLastChgUserId(getUserId());
				rawMtrInvntrVO.setSysLastChgPrgrmId(getPrgrmId());
			}
			
			HashMap<String, Object> rtnObj = rawMtrInvntrService.updateRawMtrInvntrList(rawMtrInvntrList);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
			
		} catch (Exception e) {
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		}
		
		return getSuccessResponseEntity(resultMap);
		
	
//		HashMap<String, Object> resultMap = new HashMap<String, Object>();
//		RawMtrInvntrVO updateList = new RawMtrInvntrVO();
//		try {
//			
//			List<RawMtrInvntrVO> origin = rawMtrInvntrVO.get("origin").stream().filter(e -> e.getDelYn().equals("N")).collect(Collectors.toList());
//			List<RawMtrInvntrVO> modified = rawMtrInvntrVO.get("modified").stream().filter(e -> e.getDelYn().equals("N")).collect(Collectors.toList());
//
//			List<String> originPk = origin.stream().filter(e -> e.getTrsprtCoCd() != null && e.getTrsprtCoCd().equals("") == false).map(e -> e.getTrsprtCoCd()).collect(Collectors.toCollection(ArrayList::new));
//			List<String> modifiedPk = modified.stream().filter(e -> e.getTrsprtCoCd() != null && e.getTrsprtCoCd().equals("") == false).map(e -> e.getTrsprtCoCd()).collect(Collectors.toCollection(ArrayList::new));
//
//			List<RawMtrInvntrVO> updateList = new ArrayList<RawMtrInvntrVO>();
//			for (RawMtrInvntrVO ei : origin) {
//				for (RawMtrInvntrVO ej : modified) {
//					if (ei.getTrsprtCoCd().equals(ej.getTrsprtCoCd())) {
//						if (ei.hashCode() != ej.hashCode()) {
//							updateList.add(ej);
//						}
//						break;
//					}
//				}
//			}
//
//			for (RawMtrInvntrVO element : updateList) {
//				element.setSysLastChgPrgrmId(getPrgrmId());
//				element.setSysLastChgUserId(getUserId());
//				rawMtrInvntrService.updateInvntrSortPrfmnc(element);
//			}
//			
//		} catch (Exception e) {
//			logger.debug("error: {}", e.getMessage());
//			return getErrorResponseEntity(e);
//		}
//		return getSuccessResponseEntity(resultMap);
//	}
	}
}