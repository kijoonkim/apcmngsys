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

import com.at.apcss.am.cmns.service.RgnTrsprtCstService;
import com.at.apcss.am.cmns.service.WrhsVhclService;
import com.at.apcss.am.cmns.vo.RgnTrsprtCstVO;
import com.at.apcss.am.cmns.vo.WrhsVhclVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

@Controller
public class RgnTrsprtCstController extends BaseController {

	// 지역별운임비
	@Resource(name = "rgnTrsprtCstService")
	private RgnTrsprtCstService rgnTrsprtCstService;

	@Resource(name = "wrhsVhclService")
	private WrhsVhclService wrhsVhclService;
	// APC 환경설정 - 지역별 운임비 목록 조회
	@PostMapping(value = "/am/cmns/selectRgnTrsprtCstList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectRgnTrsprtCstList(@RequestBody RgnTrsprtCstVO rgnTrsprtCstVO, HttpServletRequest request) throws Exception {
		logger.debug("selectRgnTrsprtCstList 호출 <><><><> ");

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<RgnTrsprtCstVO> resultList = new ArrayList<>();
		try {

			resultList = rgnTrsprtCstService.selectRgnTrsprtCstList(rgnTrsprtCstVO);

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}
	
	@PostMapping(value = "/am/cmns/compareRgnTrsprtCstList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertRgnTrsprtCstList(@RequestBody Map<String, List<WrhsVhclVO>> apcWrhsVhclVO, HttpServletRequest request) throws Exception {
		logger.debug("insertRgnTrsprtCstList 호출 <><><><> ");

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

			List<WrhsVhclVO> deleteList = new ArrayList<WrhsVhclVO>(origin).stream().filter(e -> (modifiedPk.contains(e.getVhclno()) == false && originPk.contains(e.getVhclno()) == true)).collect(Collectors.toList());
			for (WrhsVhclVO element : deleteList) {
				wrhsVhclService.deleteWrhsVhcl(element);
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

}
