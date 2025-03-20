package com.at.apcss.am.wrhs.web;

import com.at.apcss.am.cmns.service.ComAtchflService;
import com.at.apcss.am.cmns.vo.ComAtchflVO;
import com.at.apcss.am.wrhs.service.FrmerInfoService;
import com.at.apcss.am.wrhs.vo.CltvtnHstryVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import org.springframework.beans.BeanUtils;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.URLEncoder;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    @Resource(name="comAtchflService")
    private ComAtchflService comAtchflService;

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
            if (cltvtnHstryVO.getComAtchflVO() != null)
                cltvtnHstryVO.getComAtchflVO().setAtchflPath(getFilepathAm());

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

    @PostMapping(value = "/api/mobile/am/wrhs/getImage.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
    public ResponseEntity<?> getImage(@RequestBody ComAtchflVO comAtchflVO) throws Exception {
        try {

            ComAtchflVO resultVO = comAtchflService.selectComAtchfl(comAtchflVO);

            Path imageLocation = Paths.get(resultVO.getAtchflPath()); 	// 이미지 파일이 저장된 디렉토리

            Path file = imageLocation.resolve(resultVO.getAtchflNm()).normalize();
            org.springframework.core.io.Resource resource = new UrlResource(file.toUri());

            if (resource.exists() || resource.isReadable()) {
                return ResponseEntity.ok()
                        .header(HttpHeaders.CONTENT_TYPE, comAtchflVO.getAtchflExtnType()) // 이미지 타입에 맞게 조정
                        .body(resource);
            } else {
                return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
            }
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    /**
     * 영농관리 - 재배이력 파일 삭제
     * @param cltvtnHstryVO
     * @param request
     * @return HashMap<String, Object>
     * @throws Exception
     */
    @PostMapping(value = "/api/mobile/am/wrhs/deleteFile.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
    public ResponseEntity<HashMap<String, Object>> deleteFile(@RequestBody CltvtnHstryVO cltvtnHstryVO, HttpServletRequest request) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        try {
            ComAtchflVO comAtchflVO = new ComAtchflVO();

            BeanUtils.copyProperties(cltvtnHstryVO, comAtchflVO);

            HashMap<String, Object> rtnObj = comAtchflService.deleteComAtchfl(comAtchflVO);
            if (rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }

        } catch (Exception e) {
            logger.debug(ComConstants.ERROR_CODE, e.getMessage());
            return getErrorResponseEntity(e);
        } finally {
            HashMap<String, Object> rtnObj = setMenuComLog(request);
            if (rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        }
        return getSuccessResponseEntity(resultMap);
    }
}
