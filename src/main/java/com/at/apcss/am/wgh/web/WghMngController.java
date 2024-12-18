package com.at.apcss.am.wgh.web;

import com.at.apcss.am.wgh.service.WghMngService;
import com.at.apcss.am.wgh.vo.WghFcltVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@Controller
public class WghMngController extends BaseController {

    @Resource(name = "wghMngService")
    private WghMngService wghMngService;

    @PostMapping(value = "/am/wgh/selectWghFclt.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> selectWghFclt(@RequestBody WghFcltVO wghFcltVO, HttpServletRequest request) throws Exception{
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        List<WghFcltVO> resultList;
        try {
            resultList = wghMngService.selectWghFclt(wghFcltVO);
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
