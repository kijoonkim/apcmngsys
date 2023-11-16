package com.at.apcss.fm.fclt.web;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.fm.fclt.service.MdRtlFcltService;
import com.at.apcss.fm.fclt.vo.MdRtlFcltVO;
/**
 * @Class Name : MdRtlFcltController.java
 * @Description : APC전수조사 대시보드 Controller 클래스
 * @author 김현호
 * @since 2023.11.15
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.11.15  김현호        최초 생성
 * </pre>
 */
@Controller
public class MdRtlFcltController extends BaseController {
	
	// APC전수조사 대시보드
	@Resource(name= "mdRtlFcltService")
	private MdRtlFcltService mdRtlFcltService;

	// 대시보드 조회
	@PostMapping(value = "/fm/fclt/selectFirstGridList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectFirstGridList(@RequestBody MdRtlFcltVO mdRtlFcltVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			resultMap = mdRtlFcltService.selectFirstGridList(mdRtlFcltVO);
		} catch (Exception e) {
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		}
		return getSuccessResponseEntity(resultMap);
	}
}
