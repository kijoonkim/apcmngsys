package com.at.apcss.co.cd.web;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.BeanUtils;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.at.apcss.co.cd.service.ComCdService;
import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.co.sys.vo.ComPageVO;

@RestController
public class ComCdApiController extends BaseController {


	@Resource(name = "comCdService")
	private ComCdService comCdService;
	
	
	@PostMapping(value = "/co/cd/comCds", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public HashMap<String, Object> selectComCdList(@RequestBody ComCdVO comCdVO, HttpServletRequest request) throws Exception {
		
		HashMap<String,Object> rtnMap = new HashMap<String,Object>();
		
		try {
			List<ComCdVO> resultList = comCdService.selectComCdList(comCdVO);
			
			if (resultList != null) {			
				rtnMap.put(ComConstants.RESULT_LIST, resultList);
				rtnMap.put(ComConstants.RESULT_CODE, "200");
				rtnMap.put(ComConstants.RESULT_MESSAGE, "성공 !!!");
			} else {
				//resultMap.put("resultList", resultList);
				rtnMap.put(ComConstants.RESULT_CODE, "500");
				rtnMap.put(ComConstants.RESULT_MESSAGE, "메뉴정보없음");
				// resultMap.put("resultMessage", egovMessageSource.getMessage("fail.common.login"));
			}
		} catch (Exception e) {
			rtnMap.put(ComConstants.RESULT_CODE, "500");
			rtnMap.put(ComConstants.RESULT_MESSAGE, e.getMessage());
		} finally {
			
		}
		
		return rtnMap;
	}

	@PostMapping(value = "/co/cd/comCdDtls", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public HashMap<String, Object> selectComCdDtlList(@RequestBody ComCdVO comCdVO, HttpServletRequest request) throws Exception {
		
		HashMap<String,Object> rtnMap = new HashMap<String,Object>();
		try {
			List<ComCdVO> resultList = comCdService.selectComCdDtlList(comCdVO);
			
			if (resultList != null) {			
				rtnMap.put(ComConstants.RESULT_LIST, resultList);
				rtnMap.put(ComConstants.RESULT_CODE, "200");
				rtnMap.put(ComConstants.RESULT_MESSAGE, "성공 !!!");
				
				if (!resultList.isEmpty()) {
					ComPageVO comPageVO = new ComPageVO();
					BeanUtils.copyProperties(comCdVO, comPageVO);
					
					boolean hasPageInfo = setPaginationInfo(comPageVO, resultList.get(0)); 
					if (hasPageInfo) {
						rtnMap.put(ComConstants.PAGINATION_MAP, comPageVO);
					}
				}
				
			} else {
				//resultMap.put("resultList", resultList);
				rtnMap.put(ComConstants.RESULT_CODE, "500");
				rtnMap.put(ComConstants.RESULT_MESSAGE, "코드정보없음");
				// resultMap.put("resultMessage", egovMessageSource.getMessage("fail.common.login"));
			}
		} catch (Exception e) {
			rtnMap.put(ComConstants.RESULT_CODE, "500");
			rtnMap.put(ComConstants.RESULT_MESSAGE, e.getMessage());
		} finally {
			
		}
		
		return rtnMap;
	}
}
