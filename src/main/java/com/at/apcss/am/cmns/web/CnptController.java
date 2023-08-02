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

import com.at.apcss.am.cmns.service.CnptService;
import com.at.apcss.am.cmns.vo.CnptVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : CnptController.java
 * @Description : 거래처 정보관리에 대한 Controller 클래스
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
public class CnptController extends BaseController {

	@Resource(name = "cnptService")
	private CnptService cnptService;

	// APC 환경설정 - 입고차량정보 목록 조회
	@PostMapping(value = "/am/cmns/selectCnptList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectCnptList(@RequestBody CnptVO cnptVO, HttpServletRequest request) throws Exception {
		logger.debug("selectCnptList 호출 <><><><> ");

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<CnptVO> resultList = new ArrayList<>();
		try {

			resultList = cnptService.selectCnptList(cnptVO);

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/cmns/compareCnptList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> compareCnptList(@RequestBody Map<String, List<CnptVO>> cnptVO, HttpServletRequest request) throws Exception {
		logger.debug("compareCnptList 호출 <><><><> ");
		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		int insertCnt = 0;
		try {
			List<CnptVO> origin = cnptVO.get("origin").stream().filter(e -> e.getDelYn().equals("N")).collect(Collectors.toList());
			List<CnptVO> modified = cnptVO.get("modified").stream().filter(e -> e.getDelYn().equals("N")).collect(Collectors.toList());

			List<String> originPk = origin.stream().filter(e -> e.getCnptCd() != null && e.getCnptCd().equals("") == false).map(e -> e.getCnptCd()).collect(Collectors.toCollection(ArrayList::new));
			List<String> modifiedPk = modified.stream().filter(e -> e.getCnptCd() != null && e.getCnptCd().equals("") == false).map(e -> e.getCnptCd()).collect(Collectors.toCollection(ArrayList::new));

			List<CnptVO> insertList = new ArrayList<CnptVO>(modified).stream().filter(e -> e.getCnptCd() == null || e.getCnptCd().equals("")).collect(Collectors.toList());
			for (CnptVO element : insertList) {
				element.setSysFrstInptPrgrmId(getPrgrmId());
				element.setSysFrstInptUserId(getUserId());
				element.setSysLastChgPrgrmId(getPrgrmId());
				element.setSysLastChgUserId(getUserId());
				cnptService.insertCnpt(element);
			}

			List<CnptVO> deleteList = new ArrayList<CnptVO>(origin).stream().filter(e -> (modifiedPk.contains(e.getCnptCd()) == false && originPk.contains(e.getCnptCd()) == true)).collect(Collectors.toList());
			for (CnptVO element : deleteList) {
				cnptService.deleteCnpt(element);
			}

			List<CnptVO> updateList = new ArrayList<CnptVO>();
			for (CnptVO ei : origin) {
				for (CnptVO ej : modified) {
					if (ei.getCnptCd().equals(ej.getCnptCd())) {
						if (ei.hashCode() != ej.hashCode()) {
							updateList.add(ej);
						}
						break;
					}
				}
			}

			for (CnptVO element : updateList) {
				element.setSysLastChgPrgrmId(getPrgrmId());
				element.setSysLastChgUserId(getUserId());
				cnptService.updateCnpt(element);
			}
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertCnt);

		return getSuccessResponseEntity(resultMap);
	}
}
