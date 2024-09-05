package com.at.apcss.co.ntc.web;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.ntc.service.ComMsgPopupService;
import com.at.apcss.co.ntc.vo.ComMsgPopupVO;
import com.at.apcss.co.sys.controller.BaseController;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

/**
 * 관리자 알림 처리 컨트롤러 클래스
 * @author SI개발부 손민성
 * @since 2024.09.05
 * @version 1.0
 * @see
 *
 * <pre>
 * << 권한관리(Modification Information) >>
 *
 *  수정일      	수정자      	수정내용
 *  ----------	----------	---------------------------
 *  2024.09.05  손민성     	최초 생성
 *
 *  </pre>
 */
@RestController
@Controller
public class ComMsgPopupController extends BaseController {

    @Resource(name="comMsgPopupService")
    private ComMsgPopupService comMsgPopupService;

    @PostMapping(value = "/co/ntc/selectMsgPopupList", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> selectMsgPopupList(@RequestBody ComMsgPopupVO comMsgPopupVO, HttpServletRequest request) throws Exception{
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        List<ComMsgPopupVO> resultList;

        try{
            resultList = comMsgPopupService.selectMsgPopupList(comMsgPopupVO);
        } catch (Exception e){
            return getErrorResponseEntity(e);
        } finally {
            HashMap<String, Object> rtnObj = setMenuComLog(request);
            if(rtnObj != null){
                return getErrorResponseEntity(rtnObj);
            }

        }
        resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
        return getSuccessResponseEntity(resultMap);
    }
    @PostMapping(value = "/co/ntc/updateMsgPopup", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> updateMsgPopup(@RequestBody ComMsgPopupVO comMsgPopupVO, HttpServletRequest request) throws Exception{
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        int resultCnt;

        try{
            resultCnt = comMsgPopupService.updateMsgPopup(comMsgPopupVO);
        } catch (Exception e){
            return getErrorResponseEntity(e);
        } finally {
            HashMap<String, Object> rtnObj = setMenuComLog(request);
            if(rtnObj != null){
                return getErrorResponseEntity(rtnObj);
            }

        }
        resultMap.put(ComConstants.PROP_UPDATED_CNT, resultCnt);
        return getSuccessResponseEntity(resultMap);
    }
}
