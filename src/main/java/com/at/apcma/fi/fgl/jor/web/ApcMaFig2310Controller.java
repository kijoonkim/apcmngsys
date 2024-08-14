package com.at.apcma.fi.fgl.jor.web;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.at.apcma.com.service.ApcMaComService;
import com.at.apcma.com.service.ApcMaCommDirectService;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * 미결반제전표 처리하는 컨트롤러 클래스
 * @author 		인텔릭아이앤에스
 * @since 		2024.07.29
 * @version 	1.0
 * @see
 *
 * <pre>
 * << 미결반제전표(Modification Information) >>
 *
 *  수정일      수정자		수정내용
 *  ----------	----------	---------------------------
 *  2024.08.09  장성주     	최초 생성
 *
 *  </pre>
 */
@Controller
public class ApcMaFig2310Controller extends BaseController {

    @Resource(name= "apcMaCommDirectService")
    private ApcMaCommDirectService apcMaCommDirectService;

    @Resource(name= "apcMaComService")
    private ApcMaComService apcMaComService;
    


    
}
