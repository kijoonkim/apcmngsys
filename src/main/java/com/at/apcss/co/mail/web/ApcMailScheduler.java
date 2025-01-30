package com.at.apcss.co.mail.web;

import com.at.apcss.co.mail.service.ApcMailService;
import com.at.apcss.co.sys.controller.BaseController;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

@Component
public class ApcMailScheduler extends BaseController {

    @Resource(name = "apcMailService")
    private ApcMailService apcMailService;

    @Scheduled(fixedDelay = 300000)
    public void sendMailScheduler () {

        if (isScheduleAvailable()) {
            logger.info("스케쥴 활성화 테스트!");
            try {
                apcMailService.updateComEmlLogForStandby();
            } catch( Exception e) {
                getErrorResponseEntity(e);
            }
        } else {
            logger.info("스케쥴 활성화 안됨!");
        }

    }
}
