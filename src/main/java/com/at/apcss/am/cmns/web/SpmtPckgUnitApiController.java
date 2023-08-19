package com.at.apcss.am.cmns.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.at.apcss.am.cmns.service.SpmtPckgUnitService;
import com.at.apcss.am.cmns.service.SpmtSlsUntprcRegService;
import com.at.apcss.am.cmns.vo.SpmtPckgUnitVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
/**
 * @Class Name : SpmtPckgUnitController.java
 * @Description : 출하포장단위 서비스를 정의하기 위한 Controller 구현 클래스
 * @author 김호
 * @since 2023.07.31
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.07.31  김호        최초 생성
 * </pre>
 */
@RestController
public class SpmtPckgUnitApiController extends BaseController{

	@Resource(name= "spmtPckgUnitService")
	private SpmtPckgUnitService spmtPckgUnitService;

	@Resource(name= "spmtSlsUntprcRegService")
	private SpmtSlsUntprcRegService spmtSlsUntprcRegService;

	@PostMapping(value = "/am/cmns/spmtPckgUnits", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectSpmtPckgUnitList(@RequestBody SpmtPckgUnitVO spmtPckgUnitVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<SpmtPckgUnitVO> resultList = new ArrayList<>();
		try {

			resultList = spmtPckgUnitService.selectSpmtPckgUnitList(spmtPckgUnitVO);

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}
}
