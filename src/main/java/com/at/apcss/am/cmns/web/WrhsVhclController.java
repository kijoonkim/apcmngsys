package com.at.apcss.am.cmns.web;

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

import com.at.apcss.am.cmns.service.WrhsVhclService;
import com.at.apcss.am.cmns.vo.WrhsVhclVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : WrhsVhclController.java
 * @Description : 입고차량 정보관리에 대한 Controller 클래스
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
public class WrhsVhclController extends BaseController {
	// 차량정보
	@Resource(name = "wrhsVhclService")
	private WrhsVhclService wrhsVhclService;

	// APC 환경설정 - 입고차량정보 목록 조회
	@PostMapping(value = "/am/cmns/selectWrhsVhclList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectWrhsVhclList(@RequestBody WrhsVhclVO wrhsVhclVO, HttpServletRequest request) throws Exception {
		logger.debug("selectWrhsVhclList 호출 <><><><> ");

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<WrhsVhclVO> resultList = new ArrayList<>();
		try {

			resultList = wrhsVhclService.selectWrhsVhclList(wrhsVhclVO);

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/cmns/compareWrhsVhclList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertRgnTrsprtCstList(@RequestBody Map<String, List<WrhsVhclVO>> apcWrhsVhclVO, HttpServletRequest request) throws Exception {
		logger.debug("compareWrhsVhclList 호출 <><><><> ");

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		int insertCnt = 0;
		try {
			List<WrhsVhclVO> origin = apcWrhsVhclVO.get("origin").stream().filter(e -> e.getDelYn().equals("N")).collect(Collectors.toList());
			List<WrhsVhclVO> modified = apcWrhsVhclVO.get("modified").stream().filter(e -> e.getDelYn().equals("N")).collect(Collectors.toList());

			List<String> originPk = origin.stream().map(e -> e.getVhclno()).collect(Collectors.toCollection(ArrayList::new));
			List<String> modifiedPk = modified.stream().map(e -> e.getVhclno()).collect(Collectors.toCollection(ArrayList::new));

			List<WrhsVhclVO> insertList = new ArrayList<WrhsVhclVO>(modified).stream().filter(e -> (modifiedPk.contains(e.getVhclno()) == true && originPk.contains(e.getVhclno()) == false)).collect(Collectors.toList());
			for (WrhsVhclVO element : insertList) {
				element.setSysFrstInptPrgrmId(getPrgrmId());
				element.setSysFrstInptUserId(getUserId());
				element.setSysLastChgPrgrmId(getPrgrmId());
				element.setSysLastChgUserId(getUserId());
				wrhsVhclService.insertWrhsVhcl(element);
			}

			List<WrhsVhclVO> updateList = new ArrayList<WrhsVhclVO>();
			for (WrhsVhclVO ei : origin) {
				for (WrhsVhclVO ej : modified) {
					if (ei.getVhclno().equals(ej.getVhclno())) {
						if (ei.equals(ej) == false) {
							ej.setSysLastChgPrgrmId(getPrgrmId());
							ej.setSysLastChgUserId(getUserId());
							updateList.add(ej);
						}
						break;
					}
				}
			}

			for (WrhsVhclVO element : updateList) {
				wrhsVhclService.updateWrhsVhcl(element);
			}
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertCnt);

		return getSuccessResponseEntity(resultMap);
	}


	@PostMapping(value = "/am/cmns/deleteWrhsVhclList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteWrhsVhclList(@RequestBody WrhsVhclVO wrhsVhclVO, HttpServletRequest request) throws Exception {
		logger.debug("deleteWrhsVhclList 호출 <><><><> ");

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int result = 0;
		try {
			result = wrhsVhclService.deleteWrhsVhcl(wrhsVhclVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put("result", result);

		return getSuccessResponseEntity(resultMap);
	}
}
