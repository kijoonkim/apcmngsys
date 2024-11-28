package com.at.apcss.am.wrhs.web;

import com.at.apcss.am.wrhs.service.PrdcrLandInfoService;
import com.at.apcss.am.wrhs.vo.PrdcrLandInfoVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@RestController
public class PrdcrLandInfoApiController extends BaseController {
    @Resource(name = "prdcrLandInfoService")
    private PrdcrLandInfoService prdcrLandInfoService;

    /**
     * 생산농지정보 목록 조회
     * @param prdcrLandInfoVO
     * @param request
     * @return List<PrdcrLandInfoVO>
     * @throws Exception
     */
    @PostMapping(value = "/api/mobile/am/wrhs/selectPrdcrLandInfoList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
    public ResponseEntity<HashMap<String, Object>> selectPrdcrLandInfoList(@RequestBody PrdcrLandInfoVO prdcrLandInfoVO, HttpServletRequest request) throws Exception {

        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        List<PrdcrLandInfoVO> resultList;
        try {

            resultList = prdcrLandInfoService.selectPrdcrLandInfoList(prdcrLandInfoVO);

        } catch (Exception e) {
            logger.debug(ComConstants.ERROR_CODE, e.getMessage());
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
