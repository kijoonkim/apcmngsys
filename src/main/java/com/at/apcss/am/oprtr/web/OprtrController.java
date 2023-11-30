package com.at.apcss.am.oprtr.web;

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

import com.at.apcss.am.oprtr.service.OprtrService;
import com.at.apcss.am.oprtr.vo.OprtrVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
/**
 * @Class Name : OprtrController.java
 * @Description : 생산작업자 관련 Controller 클래스
 * @author 김호
 * @since 2023.07.13
 * @version 1.0
 * @see
 *
 *      <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.07.13  김호        최초 생성
 *      </pre>
 */
@Controller
public class OprtrController extends BaseController{

	@Resource(name= "oprtrService")
	private OprtrService oprtrService;


	// APC 환경설정 - 입고차량정보 목록 조회
	@PostMapping(value = "/am/oprtr/selectOprtrList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectOprtrList(@RequestBody OprtrVO oprtrVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<OprtrVO> resultList = new ArrayList<>();
		try {

			resultList = oprtrService.selectOprtrList(oprtrVO);

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/cmns/compareOprtrList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> compareSpmtTrsprtList(@RequestBody Map<String, List<OprtrVO>> oprtrVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		int insertCnt = 0;
		try {
			List<OprtrVO> origin = oprtrVO.get("origin").stream().filter(e -> e.getDelYn().equals("N")).collect(Collectors.toList());
			List<OprtrVO> modified = oprtrVO.get("modified").stream().filter(e -> e.getDelYn().equals("N")).collect(Collectors.toList());

			List<OprtrVO> updateList = new ArrayList<OprtrVO>();
			List<OprtrVO> insertList = new ArrayList<OprtrVO>();
			boolean insrtChk = true;
			for (OprtrVO ei : modified) {
				insrtChk = true;
				for (OprtrVO ej : origin) {
					if (ei.getFlnm().equals(ej.getFlnm()) && ei.getBrdt().equals(ej.getBrdt())) {
						if (ei.hashCode() != ej.hashCode()) {
							updateList.add(ei);
						}
						insrtChk = false;
						break;
					}
				}
				if (insrtChk)
					insertList.add(ei);
			}

			for (OprtrVO element : insertList) {
				element.setSysFrstInptPrgrmId(getPrgrmId());
				element.setSysFrstInptUserId(getUserId());
				element.setSysLastChgPrgrmId(getPrgrmId());
				element.setSysLastChgUserId(getUserId());
				oprtrService.insertOprtr(element);
			}

			for (OprtrVO element : updateList) {
				element.setSysLastChgPrgrmId(getPrgrmId());
				element.setSysLastChgUserId(getUserId());
				oprtrService.updateOprtr(element);
			}
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertCnt);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/cmns/deleteOprtrList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteOprtrList(@RequestBody OprtrVO oprtrVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int result = 0;
		try {
			result = oprtrService.deleteOprtr(oprtrVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put("result", result);

		return getSuccessResponseEntity(resultMap);
	}
}
