package com.at.apcma.fi.ftr.trd.web;

import com.at.apcma.com.service.ApcMaComService;
import com.at.apcma.com.service.ApcMaCommDirectService;
import com.at.apcss.co.sys.controller.BaseController;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;

/**
 * 예적금거래전표생성을 처리하는 컨트롤러 클래스
 * @author 		인텔릭아이앤에스
 * @since 		2024.09.09
 * @version 	1.0
 * @see
 *
 * <pre>
 * << 인사정보 등록 >>
 *
 *  수정일      수정자		수정내용
 *  ----------	----------	---------------------------
 *  2024.09.09  이경한     	최초 생성
 *
 *  </pre>
 */
@Controller
public class ApcMaTrd2030Controller extends BaseController {
    @Resource(name= "apcMaCommDirectService")
    private ApcMaCommDirectService apcMaCommDirectService;

    @Resource(name= "apcMaComService")
    private ApcMaComService apcMaComService;
}
