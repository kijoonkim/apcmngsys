package com.at.apcss.am.wrhs.web;

import com.at.apcss.am.cmns.vo.ComAtchflVO;
import com.at.apcss.am.wrhs.service.FrmerInfoService;
import com.at.apcss.am.wrhs.vo.CltvtnHstryVO;
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

/**
 * @Class Name : FrmerInfoApiController.java
 * @Description : 재배이력에 대한 ApiController 클래스
 * @author 윤필호
 * @since 2024.04.11
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.11.25  윤필호       최초 생성
 * </pre>
 */

@RestController
public class FrmerInfoApiController extends BaseController {

    @Resource(name = "frmerInfoService")
    private FrmerInfoService frmerInfoService;

    /**
     * 재배이력 목록 조회
     * @param cltvtnHstryVO
     * @param request
     * @return List<CltvtnHstryVO>
     * @throws Exception
     */
    @PostMapping(value = "/api/mobile/am/wrhs/selectCltvtnHstryList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
    public ResponseEntity<HashMap<String, Object>> selectCltvtnHstryList(@RequestBody CltvtnHstryVO cltvtnHstryVO, HttpServletRequest request) throws Exception {

        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        List<CltvtnHstryVO> resultList;
        try {

            resultList = frmerInfoService.selectCltvtnHstryList(cltvtnHstryVO);

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

    /**
     * 재배이력 등록
     * @param cltvtnHstryVO
     * @param request
     * @return List<CltvtnHstryVO>
     * @throws Exception
     */
    @PostMapping(value = "/api/mobile/am/wrhs/insertCltvtnHstry.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
    public ResponseEntity<HashMap<String, Object>> insertCltvtnHstry(@RequestBody CltvtnHstryVO cltvtnHstryVO, HttpServletRequest request) throws Exception {

        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        int resultList;
        try {
            if (cltvtnHstryVO.getComAtchflVO() != null)
                cltvtnHstryVO.getComAtchflVO().setAtchflPath(getFilepathAm());

            resultList = frmerInfoService.insertCltvtnHstry(cltvtnHstryVO);

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

    /**
     * 재배이력 수정
     * @param cltvtnHstryVO
     * @param request
     * @return List<CltvtnHstryVO>
     * @throws Exception
     */
    @PostMapping(value = "/api/mobile/am/wrhs/updateCltvtnHstry.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
    public ResponseEntity<HashMap<String, Object>> updateCltvtnHstry(@RequestBody CltvtnHstryVO cltvtnHstryVO, HttpServletRequest request) throws Exception {

        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        int resultList;
        try {

            resultList = frmerInfoService.updateCltvtnHstry(cltvtnHstryVO);

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
