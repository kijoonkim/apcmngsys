package com.at.apcss.pd.sprt.web;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.pd.pcorm.vo.SprtBizRegFileVO;
import com.at.apcss.pd.sprt.service.SprtBizClclnMngService;
import com.at.apcss.pd.sprt.vo.SprtBizClclnMngVO;
import egovframework.let.utl.fcc.service.EgovFileUploadUtil;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * @Class Name : SprtBizClclnMngController.java
 * @Description : 산지조직지원 정산관리에 대한 Controller 클래스
 * @author
 * @since 2025.07.09
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  	----------  ---------------------------
 * 2025.07.09	유민지       최초 생성
 * </pre>
 */
@Controller
public class SprtBizClclnMngController extends BaseController {

    @Resource(name="sprtBizClclnMngService")
    private SprtBizClclnMngService sprtBizClclnMngService;

    @GetMapping(value = "/pd/sprt/dtbnAplyPrvwPopup.do")
    public String dtbnAplyPrvwPopup() {
        return "apcss/pd/popup/dtbnAplyDocPrvwPopup";
    }

    @PostMapping(value = "/pd/sprt/selectSprtBizClclnList.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> selectSprtBizClclnList (@RequestBody SprtBizClclnMngVO sprtBizClclnMngVO, HttpServletRequest request) throws Exception{

        HashMap<String, Object> resultMap = new HashMap<String,Object>();
        List<SprtBizClclnMngVO> resultList = new ArrayList<>();

        String untyAuthrtType = getUntyAuthrtType();
        String untyOgnzCd = getUntyOgnzCd();

        sprtBizClclnMngVO.setSuperUserYn(null);
        sprtBizClclnMngVO.setUntyOgnzCd(null);

        if (ComConstants.CON_UNTY_AUTHRT_TYPE_SYS.equals(untyAuthrtType)) {
            sprtBizClclnMngVO.setSuperUserYn(ComConstants.CON_YES);
        } else if (ComConstants.CON_UNTY_AUTHRT_TYPE_AT.equals(untyAuthrtType)) {
            sprtBizClclnMngVO.setSuperUserYn(ComConstants.CON_YES);
        } else if (ComConstants.CON_UNTY_AUTHRT_TYPE_ADMIN.equals(untyAuthrtType)) {
            sprtBizClclnMngVO.setUntyOgnzCd(untyOgnzCd);
        } else {
            sprtBizClclnMngVO.setUntyOgnzCd(untyOgnzCd);
            //sprtBizClclnMngVO.setUntyOgnzCd(ComConstants.CON_X);
        }

        try {
            resultList = sprtBizClclnMngService.selectSprtBizDtbnMngList(sprtBizClclnMngVO);
        }  catch (Exception e) {
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

    @PostMapping("/pd/sprt/dtbnAplyDocReg.do")
    public ResponseEntity<HashMap<String, Object>> dtbnAplyDocReg (@ModelAttribute SprtBizClclnMngVO sprtBizClclnMngVO) throws Exception {

        //업로드 경로
        String uploadPath = getFilepathPd();

        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        List<MultipartFile> dtbnAplyFiles = sprtBizClclnMngVO.getDtbnAplyFiles();
        if (dtbnAplyFiles != null ) {
            for (MultipartFile dtbnAplyFile : dtbnAplyFiles){
                SprtBizRegFileVO sprtBizRegFile = new SprtBizRegFileVO();
                //파일 사이즈
                long size = dtbnAplyFile.getSize();
                //파일 이름
                String fileRealName = dtbnAplyFile.getOriginalFilename();
                //확장자명
                String fileExtension = fileRealName.substring(fileRealName.lastIndexOf(".") , fileRealName.length());
                //서버에 저장할 파일명
                String physicalFileName = EgovFileUploadUtil.getPhysicalFileName();

                String folderPath = makeFolder();
                //uploadPath 업로드 경로
                //folderPath 날짜 폴더 경로
                String saveName = uploadPath + File.separator + folderPath +File.separator + physicalFileName + "_" + fileExtension;

                Path savePath = Paths.get(saveName);

                sprtBizRegFile.setSprtBizYr(sprtBizClclnMngVO.getSprtBizYr());
                sprtBizRegFile.setSprtBizCd(sprtBizClclnMngVO.getSprtBizCd());
                sprtBizRegFile.setSprtOgnzId(sprtBizClclnMngVO.getSprtOgnzId());
                sprtBizRegFile.setBrno(sprtBizClclnMngVO.getBrno());
                sprtBizRegFile.setCrno(sprtBizClclnMngVO.getCrno());

                sprtBizRegFile.setAplyDocCd("DTBN_APLY");
                sprtBizRegFile.setFilePathNm(folderPath);
                sprtBizRegFile.setLgcFileNm(fileRealName);
                sprtBizRegFile.setPhysFileNm(physicalFileName);
                sprtBizRegFile.setFileSz(size);
                sprtBizRegFile.setFileExtnNm(fileExtension);

                sprtBizRegFile.setSysFrstInptPrgrmId("pdFileUpload");
                sprtBizRegFile.setSysFrstInptUserId(getUserId());
                sprtBizRegFile.setSysLastChgPrgrmId("pdFileUpload");
                sprtBizRegFile.setSysLastChgUserId(getUserId());

                try {
                    dtbnAplyFile.transferTo(savePath);
                    HashMap<String, Object> rtnObj = sprtBizClclnMngService.insertSprtDtbnAplyFile(sprtBizRegFile);
                    if(rtnObj != null) {
                        return getErrorResponseEntity(rtnObj);
                    }
                } catch (IOException e) {
                    logger.debug(ComConstants.ERROR_CODE, e.getMessage());
                    return getErrorResponseEntity(e);
                }
            }
        }
        return getSuccessResponseEntity(resultMap);
    }


    private String makeFolder(){

        String uploadPath = getFilepathPd();

        String str = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy/MM/dd"));
        //LocalDate를 문자열로 포멧
        String folderPath = str.replace("/", File.separator);
        //만약 Data 밑에 exam.jpg라는 파일을 원한다고 할때,
        //윈도우는 "Data\\"eaxm.jpg", 리눅스는 "Data/exam.jpg"라고 씁니다.
        //그러나 자바에서는 "Data" +File.separator + "exam.jpg" 라고 쓰면 됩니다.

        //make folder ==================
        File uploadPathFolder = new File(uploadPath, folderPath);
        //File newFile= new File(dir,"파일명");
        //->부모 디렉토리를 파라미터로 인스턴스 생성

        if(uploadPathFolder.exists() == false){
            uploadPathFolder.mkdirs();
            //만약 uploadPathFolder가 존재하지않는다면 makeDirectory 시도
            //mkdir(): 디렉토리에 상위 디렉토리가 존재하지 않을경우에는 생성이 불가능한 함수
        }
        return folderPath;
    }
}
