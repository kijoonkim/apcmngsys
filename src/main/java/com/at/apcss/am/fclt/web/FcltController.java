package com.at.apcss.am.fclt.web;

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

import com.at.apcss.am.fclt.service.FcltService;
import com.at.apcss.am.fclt.vo.FcltVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
/**
 * @Class Name : FcltController.java
 * @Description : 창고현황 관련 Controller 클래스
 * @author 김호
 * @since 2024.12.03
 * @version 1.0
 * @see
 *
 *      <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.12.03  김호        최초 생성
 *      </pre>
 */
@Controller
public class FcltController extends BaseController{

	@Resource(name= "fcltService")
	private FcltService fcltService;


	// 창고현황 목록 조회
	@PostMapping(value = "/am/fclt/selectWarehouseCurSiList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectWarehouseCurSiList(@RequestBody FcltVO fcltVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<FcltVO> resultList = new ArrayList<>();
		try {

			resultList = fcltService.selectWarehouseCurSiList(fcltVO);

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}
}
