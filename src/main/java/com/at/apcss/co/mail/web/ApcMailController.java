package com.at.apcss.co.mail.web;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.mail.service.ApcMailService;
import com.at.apcss.co.mail.vo.ApcMailVO;
import com.at.apcss.co.mail.vo.AttachFileVO;
import com.at.apcss.co.mail.vo.EmsMailVO;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.co.sys.util.ComUtil;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Value;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@Controller
public class ApcMailController extends BaseController {

    @Resource(name = "apcMailService")
    private ApcMailService apcMailService;

    @PostMapping(value="/mail/sendApcMail", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE, MediaType.MULTIPART_FORM_DATA_VALUE})
    public ResponseEntity<HashMap<String, Object>> sendApcMail (
            HttpServletRequest request,
            //@RequestParam("apcMailVO") ApcMailVO apcMailVO,
            @RequestParam("mailFrom") String mailFrom,
            @RequestParam("recipientsTo") String recipientsTo,
            @RequestParam(value="recipientsCc", required = false) String recipientsCc,
            @RequestParam(value="recipientsBcc", required = false) String recipientsBcc,
            @RequestParam(value="subject", required = false) String subject,
            @RequestParam(value="content", required = false) String content,
            @RequestParam(value="charset", required = false) String charset,
            @RequestParam(value="files", required = false) List<MultipartFile> files
        ) throws Exception {

        HashMap<String,Object> resultMap = new HashMap<String,Object>();
        try {
            HashMap<String, Object> rtnObj;

            ApcMailVO apcMailVO = new ApcMailVO(
                    mailFrom,
                    recipientsTo,
                    recipientsCc,
                    recipientsBcc,
                    subject,
                    content,
                    charset
            );

            if (files != null && !files.isEmpty()) {
                rtnObj = apcMailService.sendMail(apcMailVO, files);
            } else {
                rtnObj = apcMailService.sendMail(apcMailVO);
            }

            if (rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }

        } catch( Exception e) {
            getErrorResponseEntity(e);
        } finally {
            setMenuComLog(request);
        }

        return getSuccessResponseEntity(resultMap);

    }

    @PostMapping(value="/mail/sendApcMailSimple", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE, MediaType.MULTIPART_FORM_DATA_VALUE})
    public ResponseEntity<HashMap<String, Object>> sendApcMailSimpleTest (
            HttpServletRequest request,
            @RequestParam("mailFrom") String mailFrom,
            @RequestParam("recipientsTo") String recipientsTo,
            @RequestParam(value="recipientsCc", required = false) String recipientsCc,
            @RequestParam(value="recipientsBcc", required = false) String recipientsBcc,
            @RequestParam(value="subject", required = false) String subject,
            @RequestParam(value="content", required = false) String content,
            @RequestParam(value="charset", required = false) String charset
    ) throws Exception {

        HashMap<String,Object> resultMap = new HashMap<String,Object>();
        try {

            HashMap<String, Object> rtnObj = null;
            if (ComConstants.SERVER_TYPE_PRD.equals(getServerType())) {
                EmsMailVO emsMailVO = new EmsMailVO();
                emsMailVO.setTitle(ComUtil.nullToDefault(subject, "[제목없음]"));   // 메일 발송 제목
                emsMailVO.setContent(content);          // 메일 발송 내용
                emsMailVO.setSendInfo(mailFrom);        // 발송자 정보 : (이메일주소 이름) 이메일 주소와 이름 띄어쓰기로 구분
                emsMailVO.setRcvInfo(recipientsTo);     // 수신자 정보 : (이메일주소 이름) 이메일 주소와 이름 띄어쓰기로 구분
                emsMailVO.setSendType("D");             // D : 즉시전송(기본값), R : 예약전송
                rtnObj = apcMailService.sendEmsMailSimple(emsMailVO);

            } else {
                ApcMailVO apcMailVO = new ApcMailVO(
                        mailFrom,
                        recipientsTo,
                        recipientsCc,
                        recipientsBcc,
                        subject,
                        content,
                        charset
                );
                rtnObj = apcMailService.sendMail(apcMailVO);
            }

            if (rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        } catch( Exception e) {
            return getErrorResponseEntity(e);
        } finally {
            setMenuComLog(request);
        }

        return getSuccessResponseEntity(resultMap);

    }

    @PostMapping(value="/mail/sendApcMailSimple.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE, MediaType.MULTIPART_FORM_DATA_VALUE})
    public ResponseEntity<HashMap<String, Object>> sendApcMailSimple (
            HttpServletRequest request,
            @RequestParam("mailFrom") String mailFrom,
            @RequestParam("recipientsTo") String recipientsTo,
            @RequestParam(value="recipientsCc", required = false) String recipientsCc,
            @RequestParam(value="recipientsBcc", required = false) String recipientsBcc,
            @RequestParam(value="subject", required = false) String subject,
            @RequestParam(value="content", required = false) String content,
            @RequestParam(value="charset", required = false) String charset
    ) throws Exception {

        HashMap<String,Object> resultMap = new HashMap<String,Object>();
        try {

            HashMap<String, Object> rtnObj = null;
            if (ComConstants.SERVER_TYPE_PRD.equals(getServerType())) {
                EmsMailVO emsMailVO = new EmsMailVO();
                emsMailVO.setTitle(ComUtil.nullToDefault(subject, "[제목없음]"));   // 메일 발송 제목
                emsMailVO.setContent(content);          // 메일 발송 내용
                emsMailVO.setSendInfo(mailFrom);        // 발송자 정보 : (이메일주소 이름) 이메일 주소와 이름 띄어쓰기로 구분
                emsMailVO.setRcvInfo(recipientsTo);     // 수신자 정보 : (이메일주소 이름) 이메일 주소와 이름 띄어쓰기로 구분
                emsMailVO.setSendType("D");             // D : 즉시전송(기본값), R : 예약전송
                rtnObj = apcMailService.sendEmsMailSimple(emsMailVO);

            } else {
                ApcMailVO apcMailVO = new ApcMailVO(
                        mailFrom,
                        recipientsTo,
                        recipientsCc,
                        recipientsBcc,
                        subject,
                        content,
                        charset
                );
                rtnObj = apcMailService.sendMail(apcMailVO);
            }

            if (rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        } catch( Exception e) {
            return getErrorResponseEntity(e);
        } finally {
            setMenuComLog(request);
        }

        return getSuccessResponseEntity(resultMap);
    }


}