package com.at.apcss.am.spmt.web;

import com.at.apcss.am.ordr.vo.OrdrVO;
import com.at.apcss.am.spmt.service.ShpgotMngService;
import com.at.apcss.am.spmt.service.SpmtCmndService;
import com.at.apcss.am.spmt.vo.ShpgotApcCrtrDtlVO;
import com.at.apcss.am.spmt.vo.ShpgotApcCrtrVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import lombok.Getter;
import lombok.Setter;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @Class Name : ShpgotMngController.java
 * @Description : 반품 기준 관리에 대한 Controller 클래스
 * @author 손민성
 * @since 2025.01.04
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2025.01.04  손민성        최초 생성
 * </pre>
 */
@Controller
public class ShpgotMngController extends BaseController {

    @Resource(name = "shpgotMngService")
    private ShpgotMngService shpgotMngService;

    @Getter
    @Setter
    public static class RequestData{
        private List<ShpgotApcCrtrVO> shpgotApcCrtrVoList;
        public List<ShpgotApcCrtrVO> getShpgotApcCrtrVoList() {
            return shpgotApcCrtrVoList == null ? null : shpgotApcCrtrVoList.stream().collect(Collectors.toList());
        }
        public void setShpgotApcCrtrVoList(List<ShpgotApcCrtrVO> shpgotApcCrtrVoList) {
            this.shpgotApcCrtrVoList = shpgotApcCrtrVoList == null ? null : shpgotApcCrtrVoList.stream().collect(Collectors.toList());
        }

        private List<ShpgotApcCrtrDtlVO> shpgotApcCrtrDtlVoList;
        public List<ShpgotApcCrtrDtlVO> getShpgotApcCrtrDtlVoList() {
            return shpgotApcCrtrDtlVoList == null ? null : shpgotApcCrtrDtlVoList.stream().collect(Collectors.toList());
        }
        public void setShpgotApcCrtrDtlVoList(List<ShpgotApcCrtrDtlVO> shpgotApcCrtrDtlVoList) {
            this.shpgotApcCrtrDtlVoList = shpgotApcCrtrDtlVoList == null ? null : shpgotApcCrtrDtlVoList.stream().collect(Collectors.toList());
        }
    }

    @PostMapping(value = "/am/spmt/insertShpgotApcCrtr.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
    public ResponseEntity<HashMap<String, Object>> insertShpgotApcCrtr(@RequestBody RequestData requestData, HttpServletRequest request) throws Exception {

        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        int insertCnt = 0;

        List<ShpgotApcCrtrVO> shpgotApcCrtrVoList = requestData.getShpgotApcCrtrVoList();
        List<ShpgotApcCrtrDtlVO> shpgotApcCrtrDtlVoList = requestData.getShpgotApcCrtrDtlVoList();

        try {
            for(ShpgotApcCrtrVO shpgotApcCrtrVO : shpgotApcCrtrVoList){
                /** 공통정보 셋팅 **/
                shpgotApcCrtrVO.setDelYn("N");
                shpgotApcCrtrVO.setSysFrstInptUserId(getUserId());
                shpgotApcCrtrVO.setSysFrstInptPrgrmId(getPrgrmId());
                shpgotApcCrtrVO.setSysLastChgUserId(getUserId());
                shpgotApcCrtrVO.setSysLastChgPrgrmId(getPrgrmId());
            }

            for(ShpgotApcCrtrDtlVO shpgotApcCrtrDtlVO : shpgotApcCrtrDtlVoList){
                /** 상세 공통정보 셋팅 **/
                shpgotApcCrtrDtlVO.setDelYn("N");
                shpgotApcCrtrDtlVO.setSysFrstInptUserId(getUserId());
                shpgotApcCrtrDtlVO.setSysFrstInptPrgrmId(getPrgrmId());
                shpgotApcCrtrDtlVO.setSysLastChgUserId(getUserId());
                shpgotApcCrtrDtlVO.setSysLastChgPrgrmId(getPrgrmId());
            }

            insertCnt = shpgotMngService.insertShpgotApcCrtr(shpgotApcCrtrVoList, shpgotApcCrtrDtlVoList);

        } catch (Exception e) {
            return getErrorResponseEntity(e);
        } finally {
            HashMap<String, Object> rtnObj = setMenuComLog(request);
            if (rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        }

        resultMap.put(ComConstants.PROP_INSERTED_CNT, insertCnt);

        return getSuccessResponseEntity(resultMap);
    }
}
