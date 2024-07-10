package com.at.apcma.fi.far.rec;

import com.at.apcma.com.service.ApcMaComService;
import com.at.apcma.com.service.ApcMaCommDirectService;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;

/**
 * 송장등록및조회(매출) 처리하는 컨트롤러 클래스
 * @author 		인텔릭아이앤에스
 * @since 		2024.07.08
 * @version 	1.0
 * @see
 *
 * <pre>
 * << 송장등록및조회(매출)(Modification Information) >>
 *
 *  수정일      수정자		수정내용
 *  ----------	----------	---------------------------
 *  2024.07.08  이경한     	최초 생성
 *
 *  </pre>
 */
@Controller
public class ApcMaFig3400Controller {
    @Resource(name= "apcMaCommDirectService")
    private ApcMaCommDirectService apcMaCommDirectService;

    @Resource(name= "apcMaComService")
    private ApcMaComService apcMaComService;
}
