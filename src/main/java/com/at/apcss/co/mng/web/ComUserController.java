package com.at.apcss.co.mng.web;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.mng.service.ComMngService;
import com.at.apcss.co.mng.vo.ComUserVO;
import com.at.apcss.co.sys.controller.BaseController;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 *
 */
@Controller
public class ComUserController extends BaseController {

    @Resource(name = "comMngService")
    private ComMngService comMngService;


    // 사용자 및 트래픽 조회
    @PostMapping(value = "/co/mng/selectUserCnt.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
    public ResponseEntity<HashMap<String, Object>> selectUserCnt(@RequestBody ComUserVO comUserVO, HttpServletRequest request) throws  Exception{
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        List<ComUserVO> resultList = new ArrayList<>();

        try {
            resultList = comMngService.selectUserCnt(comUserVO);
        } catch (Exception e) {
            return getErrorResponseEntity(e);
        }

        System.out.println(resultList);
        resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

        return getSuccessResponseEntity(resultMap);
    }


}
