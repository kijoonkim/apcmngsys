package egovframework.com.cmm.interceptor;

import com.apcmngsys.apcss.co.constants.ComConstants;
import com.apcmngsys.apcss.co.sys.service.ComSysService;
import com.apcmngsys.apcss.co.sys.vo.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.mvc.WebContentInterceptor;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 인증여부 및 관리자권한 체크
 * @author 손민성
 * @since 2025.10.28
 * @version 1.0
 * @see
 */
public class AdminAuthorizationInterceptor extends WebContentInterceptor {

    private final Logger log = LoggerFactory.getLogger(AuthenticInterceptor.class);

    @Resource(name = "comSysService")
    private ComSysService comSysService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws ServletException {

        request.getSession().setAttribute(ComConstants.PROP_SYS_PRGRM_ID, request.getHeader(ComConstants.PROP_SYS_PRGRM_ID));
        LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();

        boolean isValidSession = false;

        if (loginVO.getId() != null && (loginVO.getUntyAuthrtType().equals("00") || loginVO.getUntyAuthrtType().equals("10"))) {
            return true;
        } else {
            throw new ModelAndViewDefiningException(getModelAndView(isValidSession));
        }
    }

    private ModelAndView getModelAndView(boolean isRtnJson) {
        ModelAndView modelAndView = new ModelAndView("redirect:/login.do");
        if (isRtnJson) {
            modelAndView = new ModelAndView("redirect:/accessDenied");
        }
        return modelAndView;
    }
}
