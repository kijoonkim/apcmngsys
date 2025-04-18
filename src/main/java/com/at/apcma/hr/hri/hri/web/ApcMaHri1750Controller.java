package com.at.apcma.hr.hri.hri.web;

import com.at.apcma.com.service.ApcMaCommDirectService;
import com.at.apcss.co.sys.controller.BaseController;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

/**
 * 증명서 발급을 처리하는 컨트롤러 클래스
 * @author 		인텔릭아이앤에스
 * @since 		2024.05.14
 * @version 	1.0
 * @see
 *
 * <pre>
 * << 증명서 발급 >>
 *
 *  수정일      수정자		수정내용
 *  ----------	----------	---------------------------
 *  2024.05.14  이경한     	최초 생성
 *
 *  </pre>
 */
@Controller
public class ApcMaHri1750Controller extends BaseController {
    @Resource(name= "apcMaCommDirectService")
    private ApcMaCommDirectService apcMaCommDirectService;

    // 증명서 발급 조회
    @PostMapping(value = "/hr/hri/hri/selectHri1750List.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> selectHri1750List(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception{

        logger.info("=============selectHri1750List=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {

            param.put("procedure", 		"SP_HRI1750_Q");
            resultMap = apcMaCommDirectService.callProc(param, session, request, "");

        } catch (Exception e) {
            
            return getErrorResponseEntity(e);
        }

        logger.info("=============selectHri1750List=====end========");
        return getSuccessResponseEntityMa(resultMap);
    }

    @PostMapping(value = "/hr/hri/hri/insertHri1750.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertHri1750(
            @RequestBody Map<String, Object> param
            ,Model model
            ,HttpSession session
            ,HttpServletRequest request) throws Exception{

        logger.info("=============insertHri1750=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {
            param.put("procedure", 		"SP_HRI1750_S");
            resultMap = apcMaCommDirectService.callProc(param, session, request, "");
        } catch (Exception e) {
            
            return getErrorResponseEntity(e);
        }

        logger.info("=============insertHri1750=====end========");
        if(resultMap.get("resultStatus").equals("E")) {
            String errorCode = Optional.ofNullable(resultMap.get("v_errorCode")).orElse("").toString();
            String errorStr = Optional.ofNullable(resultMap.get("v_errorStr")).orElse("").toString();

            return getErrorResponseEntity(errorCode, errorStr);
        } else {
            return getSuccessResponseEntityMa(resultMap);
        }
    }
    
    //재직증명서, 경력증명서, 퇴직증명서 리포트 출력 데이터
	@PostMapping(value = "/hr/hri/hri/selectHri1750ReportList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectHri1750ReportList(
          @RequestBody Map<String, Object> param
          , Model model
          , HttpSession session
          , HttpServletRequest request) throws Exception{

      logger.info("=============selectHri1750ReportList=====start========");
      HashMap<String,Object> resultMap = new HashMap<String,Object>();

      try {

	        param.put("procedure", 		"SP_HRI1700_Q");
	        resultMap = apcMaCommDirectService.callProc(param, session, request, "");
          
			//self url 편집
			String f_path1 = request.getRequestURL().toString();
			String f_path2 = request.getRequestURI().toString();
			String f_path3 = f_path1.replaceAll(f_path2, "");
			resultMap.put("SEVER_ROOT_PATH", f_path3);
          

      } catch (Exception e) {
          
          return getErrorResponseEntity(e);
      }

      logger.info("=============selectHri1750ReportList=====end========");
      return getSuccessResponseEntityMa(resultMap);
	}
	//  근로소득 원천징수 영수증 리포트 출력 리스트
	@PostMapping(value = "/hr/hri/hri/selectHri1750ReportListIncomeC.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectHri1750ReportListIncomeC(
	  		@RequestBody Map<String, Object> param
	  		, Model model
	  		, HttpSession session
	  		, HttpServletRequest request) throws Exception{
	  	
  	logger.info("=============selectHri1750ReportListIncomeC=====start========");
	HashMap<String,Object> resultMap = new HashMap<String,Object>();
	
	try {
		
		param.put("procedure", 		"SP_HRA1600_2023_Q");
		resultMap = apcMaCommDirectService.callProc(param, session, request, "");
		
		//self url 편집
		String f_path1 = request.getRequestURL().toString();
		String f_path2 = request.getRequestURI().toString();
		String f_path3 = f_path1.replaceAll(f_path2, "");
		resultMap.put("SEVER_ROOT_PATH", f_path3);
	} catch (Exception e) {
		
		return getErrorResponseEntity(e);
	}
	
	logger.info("=============selectHri1750ReportListIncomeC=====end========");
	  	return getSuccessResponseEntityMa(resultMap);
	}
	
	//  근로소득 원천징수 영수증 리포트 출력 리스트
	@PostMapping(value = "/hr/hri/hri/selectHri1750ReportListIncomeD.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectHri1750ReportListIncomeD(
			@RequestBody Map<String, Object> param
			, Model model
			, HttpSession session
			, HttpServletRequest request) throws Exception{
		
		logger.info("=============selectHri1750ReportListIncomeD=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		try {
			
			param.put("procedure", 		"SP_HRA5200_2022_Q");
			resultMap = apcMaCommDirectService.callProc(param, session, request, "");
			
			//self url 편집
			String f_path1 = request.getRequestURL().toString();
			String f_path2 = request.getRequestURI().toString();
			String f_path3 = f_path1.replaceAll(f_path2, "");
			resultMap.put("SEVER_ROOT_PATH", f_path3);
		} catch (Exception e) {
			
			return getErrorResponseEntity(e);
		}
		
		logger.info("=============selectHri1750ReportListIncomeD=====end========");
		return getSuccessResponseEntityMa(resultMap);
	}
    
    
}
