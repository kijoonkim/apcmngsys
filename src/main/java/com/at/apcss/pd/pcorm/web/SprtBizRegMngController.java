package com.at.apcss.pd.pcorm.web;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.pd.pcorm.service.SprtBizRegMngService;
import com.at.apcss.pd.pcorm.vo.BizPlanRegFileVO;
import com.at.apcss.pd.pcorm.vo.BizPlanReqMngVO;
import com.at.apcss.pd.pcorm.vo.SprtBizRegFileVO;
import com.at.apcss.pd.pcorm.vo.SprtBizRegMngVO;
import egovframework.let.utl.fcc.service.EgovFileUploadUtil;
import egovframework.let.utl.fcc.service.EgovFormBasedFileUtil;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.StreamUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

/**
 * @Class Name : SprtBizRegMngController.java
 * @Description : 산지조직지원신청관리에 대한 Controller 클래스
 * @author
 * @since 2025.06.09
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  	----------  ---------------------------
 * 2025.06.09	유민지       최초 생성
 * </pre>
 */
@Controller
public class SprtBizRegMngController extends BaseController {


    @Resource(name= "sprtBizRegMngService")
    private SprtBizRegMngService sprtBizRegMngService;

    // 신청서 팝업
    @GetMapping(value = "/pd/popup/aplyDocPrvwPopup.do")
    public String aplyDocPrvwPopup() {
        return "apcss/pd/popup/aplyDocPrvwPopup";
    }

    // 사업계획서 팝업
    @GetMapping(value = "/pd/popup/sprtBizPlanPrvwPopup.do")
    public String sprtBizPlanPrvwPopup() {
        return "apcss/pd/popup/sprtBizPlanPrvwPopup";
    }

    // 산지조직지원신청관리 신청목록 조회
    @PostMapping(value = "/pd/pcorm/selectApoSprtAplyList.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> selectApoSprtAplyList (@RequestBody SprtBizRegMngVO sprtBizRegMngVO, HttpServletRequest request) throws Exception{

        HashMap<String, Object> resultMap = new HashMap<String,Object>();
        List<SprtBizRegMngVO> resultList = new ArrayList<>();

        String untyAuthrtType = getUntyAuthrtType();
        String untyOgnzCd = getUntyOgnzCd();

        sprtBizRegMngVO.setSuperUserYn(null);
        sprtBizRegMngVO.setUntyOgnzCd(null);

        if (ComConstants.CON_UNTY_AUTHRT_TYPE_SYS.equals(untyAuthrtType)) {
            sprtBizRegMngVO.setSuperUserYn(ComConstants.CON_YES);
        } else if (ComConstants.CON_UNTY_AUTHRT_TYPE_AT.equals(untyAuthrtType)) {
            sprtBizRegMngVO.setSuperUserYn(ComConstants.CON_YES);
        } else if (ComConstants.CON_UNTY_AUTHRT_TYPE_ADMIN.equals(untyAuthrtType)) {
            sprtBizRegMngVO.setUntyOgnzCd(untyOgnzCd);
        } else {
            sprtBizRegMngVO.setUntyOgnzCd(untyOgnzCd);
            //sprtBizRegMngVO.setUntyOgnzCd(ComConstants.CON_X);
        }

        try {
            resultList = sprtBizRegMngService.selectApoSprtAplyList(sprtBizRegMngVO);
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

    // 산지조직지원신청관리 저장
    @PostMapping(value = "/pd/pcorm/updateSprtAplyList.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> updateSprtAplyList(@RequestBody List<SprtBizRegMngVO> sprtBizRegMngList, HttpServletRequest request) throws Exception{

        HashMap<String, Object> resultMap = new HashMap<String,Object>();

        // audit 항목
        for (SprtBizRegMngVO sprtBizRegMngVO:sprtBizRegMngList) {
            sprtBizRegMngVO.setSysFrstInptUserId(getUserId());
            sprtBizRegMngVO.setSysFrstInptPrgrmId(getPrgrmId());
            sprtBizRegMngVO.setSysLastChgUserId(getUserId());
            sprtBizRegMngVO.setSysLastChgPrgrmId(getPrgrmId());
        }

        try {
            HashMap<String, Object> rtnObj = sprtBizRegMngService.updateSprtAplyList(sprtBizRegMngList);
            if(rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        }  catch (Exception e) {
            logger.debug(ComConstants.ERROR_CODE, e.getMessage());
            return getErrorResponseEntity(e);
        } finally {
            setMenuComLog(request);
        }

        return getSuccessResponseEntity(resultMap);
    }

    // 지원사업 제출 서류 등록
    @PostMapping("/pd/pcorm/sprtBizAplyDocReg.do")
    public ResponseEntity<HashMap<String, Object>> sprtBizAplyDocReg (@ModelAttribute SprtBizRegMngVO sprtBizRegMngVO) throws Exception {

        //업로드 경로
        String uploadPath = getFilepathPd();

        HashMap<String,Object> resultMap = new HashMap<String,Object>();
        // 신청서
        int sprtAplyChk = 0;
        List<MultipartFile> sprtAplyFiles = sprtBizRegMngVO.getSprtAplyFiles();

        if(sprtAplyFiles != null) {
            // 신청서
            for (MultipartFile sprtAplyFile : sprtAplyFiles) {
                SprtBizRegFileVO sprtBizRegFile = new SprtBizRegFileVO();
                //파일 사이즈
                long size = sprtAplyFile.getSize();
                //파일 이름
                String fileRealName = sprtAplyFile.getOriginalFilename();
                //확장자명
                String fileExtension = fileRealName.substring(fileRealName.lastIndexOf(".") , fileRealName.length());
                //서버에 저장할 파일명
                String physicalFileName = EgovFileUploadUtil.getPhysicalFileName();

                String folderPath = makeFolder();
                //uploadPath 업로드 경로
                //folderPath 날짜 폴더 경로
                String saveName = uploadPath + File.separator + folderPath +File.separator + physicalFileName + "_" + fileExtension;

                Path savePath = Paths.get(saveName);

                sprtBizRegFile.setSprtBizYr(sprtBizRegMngVO.getSprtBizYr());
                sprtBizRegFile.setSprtBizCd(sprtBizRegMngVO.getSprtBizCd());
                sprtBizRegFile.setSprtOgnzId(sprtBizRegMngVO.getSprtOgnzId());
                sprtBizRegFile.setBrno(sprtBizRegMngVO.getBrno());
                sprtBizRegFile.setCrno(sprtBizRegMngVO.getCrno());

                sprtBizRegFile.setAplyDocCd("BIZ_APLY");
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
                    sprtAplyFile.transferTo(savePath);
                    HashMap<String, Object> rtnObj = sprtBizRegMngService.insertSprtAplyFile(sprtBizRegFile);
                    if(rtnObj != null) {
                        return getErrorResponseEntity(rtnObj);
                    }
                } catch (IOException e) {
                    logger.debug(ComConstants.ERROR_CODE, e.getMessage());
                    return getErrorResponseEntity(e);
                }
            }
        }

        // 사업계획서
        int sprtBizPlanChk = 0;
        List<MultipartFile> sprtBizPlanFiles = sprtBizRegMngVO.getSprtBizPlanFiles();

        if(sprtBizPlanFiles != null) {
            // 사업계획서
            for (MultipartFile sprtBizPlanFile : sprtBizPlanFiles) {
                SprtBizRegFileVO sprtBizRegFile = new SprtBizRegFileVO();
                //파일 사이즈
                long size = sprtBizPlanFile.getSize();
                //파일 이름
                String fileRealName = sprtBizPlanFile.getOriginalFilename();
                //확장자명
                String fileExtension = fileRealName.substring(fileRealName.lastIndexOf(".") , fileRealName.length());
                //서버에 저장할 파일명
                String physicalFileName = EgovFileUploadUtil.getPhysicalFileName();

                String folderPath = makeFolder();
                //uploadPath 업로드 경로
                //folderPath 날짜 폴더 경로
                String saveName = uploadPath + File.separator + folderPath +File.separator + physicalFileName + "_" + fileExtension;

                Path savePath = Paths.get(saveName);

                sprtBizRegFile.setSprtBizYr(sprtBizRegMngVO.getSprtBizYr());
                sprtBizRegFile.setSprtBizCd(sprtBizRegMngVO.getSprtBizCd());
                sprtBizRegFile.setSprtOgnzId(sprtBizRegMngVO.getSprtOgnzId());
                sprtBizRegFile.setBrno(sprtBizRegMngVO.getBrno());
                sprtBizRegFile.setCrno(sprtBizRegMngVO.getCrno());

                sprtBizRegFile.setAplyDocCd("BIZ_PLAN");
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
                    sprtBizPlanFile.transferTo(savePath);
                    HashMap<String, Object> rtnObj = sprtBizRegMngService.insertSprtAplyFile(sprtBizRegFile);
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

    // 지원사업 팝업 - 파일경로 조회
    @PostMapping(value = "/pd/pcorm/selectSprtBizFilePath.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> selectSprtBizFilePath (@RequestBody SprtBizRegMngVO sprtBizRegMngVO, HttpServletRequest request) throws Exception{

        HashMap<String, Object> resultMap = new HashMap<String,Object>();
        List<SprtBizRegMngVO> resultList = new ArrayList<>();

        try {
            resultList = sprtBizRegMngService.selectSprtBizFilePath(sprtBizRegMngVO);
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

    // 지원사업신청 팝업 - 확인/미확인 업데이트
    @PostMapping(value = "/pd/pcorm/updateSprtBizAplyDoc.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> updateSprtBizAplyDoc(@RequestBody SprtBizRegMngVO sprtBizRegMngVO, HttpServletRequest request) throws Exception{

        HashMap<String, Object> resultMap = new HashMap<String,Object>();

        sprtBizRegMngVO.setSysFrstInptUserId(getUserId());
        sprtBizRegMngVO.setSysFrstInptPrgrmId(getPrgrmId());
        sprtBizRegMngVO.setSysLastChgUserId(getUserId());
        sprtBizRegMngVO.setSysLastChgPrgrmId(getPrgrmId());

        try {
            HashMap<String, Object> rtnObj = sprtBizRegMngService.updateSprtBizAplyDoc(sprtBizRegMngVO);
            if(rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        }  catch (Exception e) {
            logger.debug(ComConstants.ERROR_CODE, e.getMessage());
            return getErrorResponseEntity(e);
        } finally {
            setMenuComLog(request);
        }

        return getSuccessResponseEntity(resultMap);
    }

    // 제출 서류 다운로드
    @GetMapping("/pd/pcorm/downloadSprtDoc/{fileSn}")
    public void downloadSprtDoc (@PathVariable int fileSn, HttpServletRequest requset, HttpServletResponse response) throws Exception {

        String uploadPath = getFilepathPd();

        SprtBizRegFileVO sprtBizRegFileVO = new SprtBizRegFileVO();
        sprtBizRegFileVO.setAtchFileSn(fileSn);

        SprtBizRegFileVO result = sprtBizRegMngService.selectSprtBizAtchfl(sprtBizRegFileVO);

        //서버 저장 파일명
        String srvrFileNm = result.getPhysFileNm();
        //확장자명
        String fileExtnNm = result.getFileExtnNm();
        //파일 경로명
        String filePathNm = result.getFilePathNm();
        //원본 파일명
        String lgcFileNm = result.getLgcFileNm();
        //법인명
        String corpNm = result.getCorpNm();
        //사업자번호
        String brno = result.getBrno();

        String fileNm = corpNm + "_" + brno + "_" + lgcFileNm;
        String convertFileNm = URLEncoder.encode(fileNm, "utf-8").replaceAll("\\+", "%20");

        //물리 파일명
        String filename = srvrFileNm + "_" + fileExtnNm;

        EgovFormBasedFileUtil.downloadFile(response, uploadPath, filePathNm, filename, convertFileNm);

    }

    // 신청서 일괄 확인
    @PostMapping(value = "/pd/pcorm/updateSprtBizAplyDocAllAprv.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> updateSprtBizAplyDocAllAprv(@RequestBody List<SprtBizRegMngVO> updateSprtBizAplyDocAllAprvList, HttpServletRequest request) throws Exception{

        HashMap<String, Object> resultMap = new HashMap<String,Object>();

        for (SprtBizRegMngVO sprtBizRegMngVO : updateSprtBizAplyDocAllAprvList){
            sprtBizRegMngVO.setSysFrstInptUserId(getUserId());
            sprtBizRegMngVO.setSysFrstInptPrgrmId(getPrgrmId());
            sprtBizRegMngVO.setSysLastChgUserId(getUserId());
            sprtBizRegMngVO.setSysLastChgPrgrmId(getPrgrmId());
        }

        try {
            HashMap<String, Object> rtnObj = sprtBizRegMngService.updateSprtBizAplyDocAllAprv(updateSprtBizAplyDocAllAprvList);
            if(rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        }  catch (Exception e) {
            logger.debug(ComConstants.ERROR_CODE, e.getMessage());
            return getErrorResponseEntity(e);
        } finally {
            setMenuComLog(request);
        }

        return getSuccessResponseEntity(resultMap);
    }

    @GetMapping("/pd/pcorm/sprtDownloadAll/{sprtBizYr}/{sprtBizCd}")
    public void sprtDownloadAll(@PathVariable String sprtBizYr,@PathVariable String sprtBizCd, HttpServletRequest request, HttpServletResponse response) throws Exception {

        String zipFileNm = "산지조직지원 신청관리 제출 서류 일괄 다운로드.zip";
        String convertFileNm = URLEncoder.encode(zipFileNm, "utf-8").replaceAll("\\+", "%20");

        response.setStatus(HttpServletResponse.SC_OK);
        response.setContentType("application/zip");
        response.addHeader("Content-Disposition", "attachment; filename=\"" + convertFileNm +  "\";");

        String uploadPath = getFilepathPd();

        SprtBizRegFileVO sprtBizRegFileVO = new SprtBizRegFileVO();
        sprtBizRegFileVO.setSprtBizYr(sprtBizYr);
        sprtBizRegFileVO.setSprtBizCd(sprtBizCd);

        List<SprtBizRegFileVO> resultList = sprtBizRegMngService.selectSprtFileInfoList(sprtBizRegFileVO);

        if(resultList != null) {
            ZipOutputStream zipOut = null;
            FileInputStream fis = null;

            try {

                zipOut = new ZipOutputStream(response.getOutputStream());

                for (SprtBizRegFileVO result : resultList) {
                    //서버 저장 파일명
                    String physFileNm = result.getPhysFileNm();
                    //확장자명
                    String fileExtnNm = result.getFileExtnNm();
                    //파일 경로명
                    String filePathNm = result.getFilePathNm();
                    //원본 파일명
                    String lgcFileNm = result.getLgcFileNm();
                    //법인명
                    String corpNm = result.getCorpNm();
                    //사업자번호
                    String brno = result.getBrno();
                    //서류 종류
                    String aplyDocCd = result.getAplyDocCd();

                    String dcmntKndNm = "";
                    if (aplyDocCd.equals("BIZ_APLY")) {
                        dcmntKndNm = "신청서";
                    } else if (aplyDocCd.equals("BIZ_PLAN")) {
                        dcmntKndNm = "사업계획서";
                    }
                    //압축할 실제 파일명
                    String realFileName = corpNm + "_" + brno + "_" + dcmntKndNm + "_" + lgcFileNm;
                    //String convertFileNm = URLEncoder.encode(orgFileNm, "utf-8").replaceAll("\\+", "%20");

                    //파일 경로
                    String filePath = uploadPath + File.separator + filePathNm + File.separator;
                    //물리 파일명
                    String fileName = physFileNm + "_" + fileExtnNm;

                    File newFile = new File(filePath + fileName);

                    //파일 존재 여부 체크
                    if(newFile.exists()) {
                        zipOut.putNextEntry(new ZipEntry(realFileName));
                        fis = new FileInputStream(newFile);

                        StreamUtils.copy(fis, zipOut);
                        fis.close();
                        zipOut.closeEntry();
                    }
                }
                zipOut.close();

//			}
//			catch (IOException e) {
//				if (fis != null) {
//					fis.close();
//				}
//				if (zipOut != null) {
//					zipOut.closeEntry();
//				}
//				try { if(fis != null)fis.close(); } catch (IOException e1) {logger.debug(e1.getMessage());/*ignore*/}
//				try { if(zipOut != null)zipOut.closeEntry();} catch (IOException e2) {logger.debug(e2.getMessage());/*ignore*/}
//				try { if(zipOut != null)zipOut.close();} catch (IOException e3) {logger.debug(e3.getMessage());/*ignore*/}
            } finally {
                if (fis != null) {
                    fis.close();
                }
                if (zipOut != null) {
                    zipOut.close();
                }
            }
        }
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

    @PostMapping(value = "/pd/pcorm/selectSprtBizRawData.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> selectSprtBizRawData (@RequestBody SprtBizRegMngVO sprtBizRegMngVO, HttpServletRequest request) throws Exception{

        HashMap<String, Object> resultMap = new HashMap<String,Object>();
        List<SprtBizRegMngVO> resultList = new ArrayList<>();

        try {
            resultList = sprtBizRegMngService.selectSprtBizRawData(sprtBizRegMngVO);
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
}
