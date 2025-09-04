package com.at.apcss.pd.sprt.web;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.co.sys.util.ComUtil;
import com.at.apcss.pd.pcorm.vo.SprtBizRegFileVO;
import com.at.apcss.pd.sprt.service.SprtBizClclnMngService;
import com.at.apcss.pd.sprt.vo.SprtBizClclnDmndDocVO;
import com.at.apcss.pd.sprt.vo.SprtBizClclnDmndDtlVO;
import com.at.apcss.pd.sprt.vo.SprtBizClclnMngVO;
import com.fasterxml.jackson.databind.ObjectMapper;
import egovframework.let.utl.fcc.service.EgovFileUploadUtil;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.StreamUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.method.annotation.StreamingResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

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

    @GetMapping(value = "/pd/sprt/clclnAplyDocPrvwPopup.do")
    public String clclnAplyDocPrvwPopup() {
        return "apcss/pd/popup/clclnAplyDocPrvwPopup";
    }

    @GetMapping(value = "/pd/sprt/clclnPurfPrvwPopup.do")
    public String clclnPurfPrvwPopup() {
        return "apcss/pd/popup/clclnPurfPrvwPopup";
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

    @PostMapping("/pd/sprt/dtbnDcsnDocReg.do")
    public ResponseEntity<HashMap<String, Object>> dtbnDcsnDocReg (@ModelAttribute SprtBizClclnMngVO sprtBizClclnMngVO) throws Exception {

        //업로드 경로
        String uploadPath = getFilepathPd();

        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        List<MultipartFile> dtbnDscnDocFiles = sprtBizClclnMngVO.getDtbnDscnDocFiles();
        if (dtbnDscnDocFiles != null ) {
            for (MultipartFile dtbnDscnDocFile : dtbnDscnDocFiles){
                SprtBizRegFileVO sprtBizRegFile = new SprtBizRegFileVO();
                //파일 사이즈
                long size = dtbnDscnDocFile.getSize();
                //파일 이름
                String fileRealName = dtbnDscnDocFile.getOriginalFilename();
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

                sprtBizRegFile.setClclnSeq(sprtBizClclnMngVO.getClclnSeq());
                sprtBizRegFile.setDocSeq(sprtBizClclnMngVO.getDocSeq());
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
                    dtbnDscnDocFile.transferTo(savePath);
                    HashMap<String, Object> rtnObj = sprtBizClclnMngService.insertDtbnDcsnDocFile(sprtBizRegFile);
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

    // 정산관리 파일다운로드
    @GetMapping("/pd/downloadSrptClclnAtchFile.do")
    public ResponseEntity<?> downloadSrptAtchFile(HttpServletRequest request, HttpServletResponse response, @RequestParam("fileSn") long fileSn) throws Exception {

        try {
            // 0. 파일 정보 조회
            SprtBizRegFileVO sprtBizRegFileVO = new SprtBizRegFileVO();
            sprtBizRegFileVO.setAtchFileSn(fileSn);

            SprtBizRegFileVO fileInfo = sprtBizClclnMngService.selectSprtBizClclnAtchfl(sprtBizRegFileVO);
            if (fileInfo == null || !StringUtils.hasText(fileInfo.getPhysFileNm())) {
                // 파일 없음
                return ResponseEntity.status(HttpStatus.NOT_FOUND).body("파일정보를 찾을 수 없습니다.");
            }
            // 1. 권한 확인
            String untyAuthrtType = getUntyAuthrtType();
            String untyOgnzCd = getUntyOgnzCd();
            if (!ComConstants.CON_UNTY_AUTHRT_TYPE_SYS.equals(untyAuthrtType)
                    &&
                    !ComConstants.CON_UNTY_AUTHRT_TYPE_AT.equals(untyAuthrtType)) {
                // 관리자가 아니면 해당 조직 소속 여부를 확인한다.
                if (!ComUtil.nullToEmpty(untyOgnzCd).equals(ComUtil.nullToEmpty("UO" + fileInfo.getApoCd()))) {
                    //response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                    return ResponseEntity.status(HttpStatus.NOT_FOUND).body("잘못된 요청입니다.");
                    //return getErrorResponseEntity(ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "접근권한"));
                }
            }
            String uploadPath = getFilepathPd();

            //서버 저장 파일명
            String srvrFileNm = fileInfo.getPhysFileNm();
            //확장자명
            String fileExtnNm = fileInfo.getFileExtnNm();
            //파일 경로명
            String filePathNm = uploadPath + fileInfo.getFilePathNm();
            //원본 파일명
            String lgcFileNm = fileInfo.getLgcFileNm();
            //법인명
            String corpNm = fileInfo.getCorpNm();
            //사업자번호
            String brno = fileInfo.getBrno();

            String fileNm = corpNm + "_" + brno + "_" + lgcFileNm;
            String convertFileNm = URLEncoder.encode(fileNm, StandardCharsets.UTF_8).replaceAll("\\+", "%20");
            //"utf-8"

            //물리 파일명
            String filename = srvrFileNm + "_" + fileExtnNm;

            //EgovFormBasedFileUtil.downloadFile(response, uploadPath, filePathNm, filename, convertFileNm);

            // 2. 경로 보안 처리 (예: 디렉토리 탈출 방지)
            if (filePathNm.contains("..")) {
                //response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                return ResponseEntity.status(HttpStatus.NOT_FOUND).body("잘못된 요청입니다.");
            }

            // 3. 파일 확인
            File atchFile = new File(filePathNm, filename);

            if (!atchFile.exists()) {
                //response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                return ResponseEntity.status(HttpStatus.NOT_FOUND).body("파일을 찾을 수 없습니다.");
            }

            FileSystemResource resource = new FileSystemResource(atchFile);


            // 4. 응담 설정
            /*
            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "inline; filename=\"" + fileNm + "\"");
            response.setContentLengthLong(atchFile.length());
             */

            // String contentDisposition = "inline; filename=\"" + convertFileNm + "\"";
            String contentDisposition = "attachment; filename=\"" + convertFileNm + "\"";

            /*
            // 4. 응답 반환
            return ResponseEntity.ok()
                    .contentType(MediaType.APPLICATION_OCTET_STREAM)
                    .header(HttpHeaders.CONTENT_DISPOSITION, contentDzisposition)
                    .body(resource);
             */
            MediaType mediaType = ComUtil.getMediaType(fileNm); // 예: application/pdf, image/png 등

            return ResponseEntity.ok()
                    .contentType(mediaType)
                    .header(HttpHeaders.CONTENT_DISPOSITION, contentDisposition)
                    .body(resource);

        } catch (Exception e) {
            // 5. 예외 처리
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("오류가 발생했습니다. 관리자에게 문의하세요.");
        }

        /*
        // 5. 파일스트림 전송
        try (
            InputStream in = new FileInputStream(atchFile);
            OutputStream out = response.getOutputStream()
        ) {
            byte[] buffer = new byte[4096];
            int read;
            while ((read = in.read(buffer)) != -1) {
                out.write(buffer, 0, read);
            }
        }

         */
    }

    // 정산신청 목록 조회
    @PostMapping(value = "/pd/sprt/selectSprtBizClclnAplyList.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> selectSprtBizClclnAplyList (@RequestBody SprtBizClclnMngVO sprtBizClclnMngVO, HttpServletRequest request) throws Exception{

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
            resultList = sprtBizClclnMngService.selectSprtBizClclnAplyList(sprtBizClclnMngVO);
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
    @PostMapping("/pd/sprt/clclnAplyDocReg.do")
    public ResponseEntity<HashMap<String, Object>> clclnAplyDocReg (@ModelAttribute SprtBizClclnMngVO sprtBizClclnMngVO) throws Exception {

        //업로드 경로
        String uploadPath = getFilepathPd();

        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        // 정산신청 서류 등록
        List<MultipartFile> clclnAplyDocFiles = sprtBizClclnMngVO.getclclnAplyDocFiles();
        if (clclnAplyDocFiles != null ) {
            for (MultipartFile clclnAplyFile : clclnAplyDocFiles){
                SprtBizRegFileVO sprtBizRegFile = new SprtBizRegFileVO();
                //파일 사이즈
                long size = clclnAplyFile.getSize();
                //파일 이름
                String fileRealName = clclnAplyFile.getOriginalFilename();
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

                sprtBizRegFile.setClclnSeq(sprtBizClclnMngVO.getClclnSeq());
                sprtBizRegFile.setDocSeq(sprtBizClclnMngVO.getDocSeq());
                sprtBizRegFile.setAplyDocCd(sprtBizClclnMngVO.getAplyDocCd());
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
                    clclnAplyFile.transferTo(savePath);
                    HashMap<String, Object> rtnObj = sprtBizClclnMngService.insertSprtclclnAplyFile(sprtBizRegFile);
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

    // 정산관리 - 파일경로 조회
    @PostMapping(value = "/pd/sprt/selectSprtClclnFilePath.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> selectSprtClclnFilePath (@RequestBody SprtBizClclnMngVO sprtBizClclnMngVO, HttpServletRequest request) throws Exception{

        HashMap<String, Object> resultMap = new HashMap<String,Object>();
        List<SprtBizClclnMngVO> resultList = new ArrayList<>();

        try {
            resultList = sprtBizClclnMngService.selectSprtClclnFilePath(sprtBizClclnMngVO);
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

    // 증빙코드 조회
    @PostMapping(value = "/pd/sprt/selectSprtPrufCdList.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> selectSprtPrufCdList (@RequestBody SprtBizClclnMngVO sprtBizClclnMngVO, HttpServletRequest request) throws Exception{

        HashMap<String, Object> resultMap = new HashMap<String,Object>();
        List<SprtBizClclnMngVO> resultList = new ArrayList<>();

        try {
            resultList = sprtBizClclnMngService.selectSprtPrufCdList(sprtBizClclnMngVO);
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

    @GetMapping("/pd/viewSrptClclnAtchFile.do")
    public ResponseEntity<?> viewSrptClclnAtchFile(HttpServletRequest request, HttpServletResponse response, @RequestParam("fileSn") long fileSn) throws Exception {

        try {
            // 0. 파일 정보 조회
            SprtBizRegFileVO sprtBizRegFileVO = new SprtBizRegFileVO();
            sprtBizRegFileVO.setAtchFileSn(fileSn);

            SprtBizRegFileVO fileInfo = sprtBizClclnMngService.selectSprtClclnBizAtchfl(sprtBizRegFileVO);
            if (fileInfo == null || !StringUtils.hasText(fileInfo.getPhysFileNm())) {
                // 파일 없음
                //response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                return ResponseEntity.status(HttpStatus.NOT_FOUND).body("파일정보를 찾을 수 없습니다.");
                //return getErrorResponseEntity(ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "파일정보"));
            }
            // 1. 권한 확인
            String untyAuthrtType = getUntyAuthrtType();
            String untyOgnzCd = getUntyOgnzCd();
            // String untyAuthrtMngYn = getUntyAuthrtMngYn();
            if (!ComConstants.CON_UNTY_AUTHRT_TYPE_SYS.equals(untyAuthrtType)
                    &&
                    !ComConstants.CON_UNTY_AUTHRT_TYPE_AT.equals(untyAuthrtType)) {
                // 관리자가 아니면 해당 조직 소속 여부를 확인한다.
                if (!ComUtil.nullToEmpty(untyOgnzCd).equals(ComUtil.nullToEmpty("UO" + fileInfo.getApoCd()))) {
                    //response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                    return ResponseEntity.status(HttpStatus.NOT_FOUND).body("잘못된 요청입니다.");
                    //return getErrorResponseEntity(ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "접근권한"));
                }
            }
            String uploadPath = getFilepathPd();

            //서버 저장 파일명
            String srvrFileNm = fileInfo.getPhysFileNm();
            //확장자명
            String fileExtnNm = fileInfo.getFileExtnNm();
            //파일 경로명
            String filePathNm = uploadPath + fileInfo.getFilePathNm();
            //원본 파일명
            String lgcFileNm = fileInfo.getLgcFileNm();
            //법인명
            String corpNm = fileInfo.getCorpNm();
            //사업자번호
            String brno = fileInfo.getBrno();

            String fileNm = corpNm + "_" + brno + "_" + lgcFileNm;
            String convertFileNm = URLEncoder.encode(fileNm, StandardCharsets.UTF_8).replaceAll("\\+", "%20");
            //"utf-8"

            //물리 파일명
            String filename = srvrFileNm + "_" + fileExtnNm;

            //EgovFormBasedFileUtil.downloadFile(response, uploadPath, filePathNm, filename, convertFileNm);

            // 2. 경로 보안 처리 (예: 디렉토리 탈출 방지)
            if (filePathNm.contains("..")) {
                //response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                return ResponseEntity.status(HttpStatus.NOT_FOUND).body("잘못된 요청입니다.");
            }

            // 3. 파일 확인
            File atchFile = new File(filePathNm, filename);

            if (!atchFile.exists()) {
                //response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                return ResponseEntity.status(HttpStatus.NOT_FOUND).body("파일을 찾을 수 없습니다.");
            }

            FileSystemResource resource = new FileSystemResource(atchFile);


            // 4. 응담 설정
            /*
            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "inline; filename=\"" + fileNm + "\"");
            response.setContentLengthLong(atchFile.length());
             */

            String contentDisposition = "inline; filename=\"" + convertFileNm + "\"";
            //String contentDisposition = "attachment; filename=\"" + fileNm + "\"";

            /*
            // 4. 응답 반환
            return ResponseEntity.ok()
                    .contentType(MediaType.APPLICATION_OCTET_STREAM)
                    .header(HttpHeaders.CONTENT_DISPOSITION, contentDzisposition)
                    .body(resource);
             */
            MediaType mediaType = ComUtil.getMediaType(convertFileNm); // 예: application/pdf, image/png 등

            return ResponseEntity.ok()
                    .contentType(mediaType)
                    .header(HttpHeaders.CONTENT_DISPOSITION, contentDisposition)
                    .body(resource);

        } catch (Exception e) {
            // 5. 예외 처리
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("오류가 발생했습니다. 관리자에게 문의하세요.");
        }

        /*
        // 5. 파일스트림 전송
        try (
            InputStream in = new FileInputStream(atchFile);
            OutputStream out = response.getOutputStream()
        ) {
            byte[] buffer = new byte[4096];
            int read;
            while ((read = in.read(buffer)) != -1) {
                out.write(buffer, 0, read);
            }
        }

         */

    }

    @PostMapping(value = "/pd/sprt/updateSprtClclnAplyDoc.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> updateSprtBizAplyDoc(@RequestBody SprtBizClclnMngVO sprtBizClclnMngVO, HttpServletRequest request) throws Exception{

        HashMap<String, Object> resultMap = new HashMap<String,Object>();

        sprtBizClclnMngVO.setSysFrstInptUserId(getUserId());
        sprtBizClclnMngVO.setSysFrstInptPrgrmId(getPrgrmId());
        sprtBizClclnMngVO.setSysLastChgUserId(getUserId());
        sprtBizClclnMngVO.setSysLastChgPrgrmId(getPrgrmId());

        try {
            HashMap<String, Object> rtnObj = sprtBizClclnMngService.updateSprtBizAplyDoc(sprtBizClclnMngVO);
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

    @PostMapping(value = "/pd/sprt/clclnDDocReg.do",consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<HashMap<String, Object>> insertClclnDDocReg (
           @RequestParam("saveObj") String saveObj,
           @RequestPart(value = "prufFileList", required = false) List<MultipartFile> prufFileList,
           ObjectMapper om
    ) throws Exception {

        //업로드 경로
        String uploadPath = getFilepathPd();

        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        SprtBizClclnDmndDocVO sprtBizClclnDmndDocVO = om.readValue(saveObj, SprtBizClclnDmndDocVO.class);

        if (prufFileList != null && !prufFileList.isEmpty()) {
            Map<String, MultipartFile> fileMap = prufFileList.stream().collect(Collectors.toMap(MultipartFile::getOriginalFilename, file -> file));

            List<SprtBizClclnDmndDtlVO> fileSaveList = new ArrayList<>();

            for (SprtBizClclnDmndDtlVO fileInfo : sprtBizClclnDmndDocVO.getClclnFileInfoList()) {

                String fileId = fileInfo.getFileId();

                MultipartFile matchedFile = fileMap.get(fileId);
                if (matchedFile != null) {
                    long size = matchedFile.getSize();
                    String fileNm = matchedFile.getOriginalFilename();
                    String originalFileNm = fileInfo.getOriginalFileName();
                    // 확장자
                    String fileExtension = fileNm.substring(fileNm.lastIndexOf(".") , fileNm.length());
                    //서버에 저장할 파일명
                    String physicalFileName = EgovFileUploadUtil.getPhysicalFileName();

                    // 폴더 경로
                    String folderPath = makeFolder();

                    String saveName = uploadPath + File.separator + folderPath +File.separator + physicalFileName + "_" + fileExtension;
                    Path savePath = Paths.get(saveName);

                    fileInfo.setFilePathNm(folderPath);
                    fileInfo.setLgcFileNm(originalFileNm);
                    fileInfo.setPhysFileNm(physicalFileName);
                    fileInfo.setFileSz(size);
                    fileInfo.setFileExtnNm(fileExtension);
                    matchedFile.transferTo(savePath);

                    fileSaveList.add(fileInfo);
                }
            }
            sprtBizClclnDmndDocVO.setClclnFileInfoList(fileSaveList);
        }


        sprtBizClclnDmndDocVO.setSysFrstInptUserId(getUserId());
        sprtBizClclnDmndDocVO.setSysFrstInptPrgrmId(getPrgrmId());
        sprtBizClclnDmndDocVO.setSysLastChgUserId(getUserId());
        sprtBizClclnDmndDocVO.setSysLastChgPrgrmId(getPrgrmId());


        try {
            HashMap<String, Object> rtnObj = sprtBizClclnMngService.insertClclnDDocReg(sprtBizClclnDmndDocVO);
            if(rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        }  catch (Exception e) {
            logger.debug(ComConstants.ERROR_CODE, e.getMessage());
            return getErrorResponseEntity(e);
        }

        return getSuccessResponseEntity(resultMap);
    }

    // 정산결과 목록 조회
    @PostMapping(value = "/pd/sprt/selectSprtClclnRsltList.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> selectSprtClclnRsltList (@RequestBody SprtBizClclnMngVO sprtBizClclnMngVO, HttpServletRequest request) throws Exception{

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
            resultList = sprtBizClclnMngService.selectSprtClclnRsltList(sprtBizClclnMngVO);
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

    @PostMapping(value = "/pd/sprt/updateClclnAprvAmt.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> updateClclnAprvAmt(@RequestBody List<SprtBizClclnMngVO> clclnUpdateList, HttpServletRequest request) throws Exception{

        HashMap<String, Object> resultMap = new HashMap<String,Object>();

        // audit 항목
        for (SprtBizClclnMngVO sprtBizClclnMngVO:clclnUpdateList) {
            sprtBizClclnMngVO.setSysFrstInptUserId(getUserId());
            sprtBizClclnMngVO.setSysFrstInptPrgrmId(getPrgrmId());
            sprtBizClclnMngVO.setSysLastChgUserId(getUserId());
            sprtBizClclnMngVO.setSysLastChgPrgrmId(getPrgrmId());
        }

        try {
            HashMap<String, Object> rtnObj = sprtBizClclnMngService.updateClclnAprvAmt(clclnUpdateList);
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

    @PostMapping(value = "/pd/sprt/selectClclnPrufList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
    public ResponseEntity<HashMap<String, Object>> selectDailyGdsInvntrTotalList(@RequestBody SprtBizClclnDmndDtlVO sprtBizClclnDmndDtlVO, HttpServletRequest request) throws Exception {

        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        List<SprtBizClclnDmndDtlVO> resultList = new ArrayList<>();
        try {
            resultList = sprtBizClclnMngService.selectClclnPrufList(sprtBizClclnDmndDtlVO);
        } catch (Exception e) {
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

    @PostMapping(value = "/pd/sprt/updateClclnPrufDoc.do",consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<HashMap<String, Object>> updateClclnPrufDoc (
            @RequestParam("updateObj") String updateObj,
            @RequestPart(value = "prufFileList", required = false) List<MultipartFile> prufFileList,
            ObjectMapper om
    ) throws Exception {

        //업로드 경로
        String uploadPath = getFilepathPd();

        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        SprtBizClclnDmndDocVO sprtBizClclnDmndDocVO = om.readValue(updateObj, SprtBizClclnDmndDocVO.class);

        if (prufFileList != null && !prufFileList.isEmpty()) {

            Map<String, MultipartFile> fileMap = prufFileList.stream().collect(Collectors.toMap(MultipartFile::getOriginalFilename, file -> file));

            List<SprtBizClclnDmndDtlVO> fileUpdateList = new ArrayList<>();

            for (SprtBizClclnDmndDtlVO fileInfo : sprtBizClclnDmndDocVO.getClclnFileInfoList()) {

                String fileId = fileInfo.getFileId();

                MultipartFile matchedFile = fileMap.get(fileId);
                if (matchedFile != null) {
                    long size = matchedFile.getSize();
                    String fileNm = matchedFile.getOriginalFilename();
                    String originalFileNm = fileInfo.getOriginalFileName();
                    // 확장자
                    String fileExtension = fileNm.substring(fileNm.lastIndexOf("."), fileNm.length());
                    //서버에 저장할 파일명
                    String physicalFileName = EgovFileUploadUtil.getPhysicalFileName();

                    // 폴더 경로
                    String folderPath = makeFolder();

                    String saveName = uploadPath + File.separator + folderPath + File.separator + physicalFileName + "_" + fileExtension;
                    Path savePath = Paths.get(saveName);

                    fileInfo.setFilePathNm(folderPath);
                    fileInfo.setLgcFileNm(originalFileNm);
                    fileInfo.setPhysFileNm(physicalFileName);
                    fileInfo.setFileSz(size);
                    fileInfo.setFileExtnNm(fileExtension);
                    matchedFile.transferTo(savePath);

                    fileUpdateList.add(fileInfo);
                }
            }
            sprtBizClclnDmndDocVO.setClclnFileInfoList(fileUpdateList);
        }

        sprtBizClclnDmndDocVO.setSysFrstInptUserId(getUserId());
        sprtBizClclnDmndDocVO.setSysFrstInptPrgrmId(getPrgrmId());
        sprtBizClclnDmndDocVO.setSysLastChgUserId(getUserId());
        sprtBizClclnDmndDocVO.setSysLastChgPrgrmId(getPrgrmId());


        try {
            HashMap<String, Object> rtnObj = sprtBizClclnMngService.updateClclnPrufDoc(sprtBizClclnDmndDocVO);
            if(rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        }  catch (Exception e) {
            logger.debug(ComConstants.ERROR_CODE, e.getMessage());
            return getErrorResponseEntity(e);
        }

        return getSuccessResponseEntity(resultMap);
    }

    @PostMapping(value = "/pd/sprt/deleteClclnPrufDoc.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> deleteClclnPrufDoc(@RequestBody SprtBizClclnDmndDtlVO sprtBizClclnDmndDtlVO, HttpServletRequest request) throws Exception{

        HashMap<String, Object> resultMap = new HashMap<String,Object>();

        sprtBizClclnDmndDtlVO.setSysFrstInptUserId(getUserId());
        sprtBizClclnDmndDtlVO.setSysFrstInptPrgrmId(getPrgrmId());
        sprtBizClclnDmndDtlVO.setSysLastChgUserId(getUserId());
        sprtBizClclnDmndDtlVO.setSysLastChgPrgrmId(getPrgrmId());

        try {
            HashMap<String, Object> rtnObj = sprtBizClclnMngService.deleteClclnPrufDoc(sprtBizClclnDmndDtlVO);
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

    @GetMapping("/pd/viewSrptClclnPrufAtchFile.do")
    public ResponseEntity<?> viewSrptClclnPrufAtchFile(HttpServletRequest request, HttpServletResponse response, @RequestParam("fileSn") long fileSn) throws Exception {
        try {
            // 0. 파일 정보 조회
            SprtBizRegFileVO sprtBizRegFileVO = new SprtBizRegFileVO();
            sprtBizRegFileVO.setAtchFileSn(fileSn);

            SprtBizRegFileVO fileInfo = sprtBizClclnMngService.selectSprtClclnPrufAtchfl(sprtBizRegFileVO);
            if (fileInfo == null || !StringUtils.hasText(fileInfo.getPhysFileNm())) {
                // 파일 없음
                //response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                return ResponseEntity.status(HttpStatus.NOT_FOUND).body("파일정보를 찾을 수 없습니다.");
                //return getErrorResponseEntity(ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "파일정보"));
            }
            // 1. 권한 확인
            String untyAuthrtType = getUntyAuthrtType();
            String untyOgnzCd = getUntyOgnzCd();
            // String untyAuthrtMngYn = getUntyAuthrtMngYn();
            if (!ComConstants.CON_UNTY_AUTHRT_TYPE_SYS.equals(untyAuthrtType)
                    &&
                    !ComConstants.CON_UNTY_AUTHRT_TYPE_AT.equals(untyAuthrtType)) {
                // 관리자가 아니면 해당 조직 소속 여부를 확인한다.
                if (!ComUtil.nullToEmpty(untyOgnzCd).equals(ComUtil.nullToEmpty("UO" + fileInfo.getApoCd()))) {
                    //response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                    return ResponseEntity.status(HttpStatus.NOT_FOUND).body("잘못된 요청입니다.");
                    //return getErrorResponseEntity(ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "접근권한"));
                }
            }
            String uploadPath = getFilepathPd();

            //서버 저장 파일명
            String srvrFileNm = fileInfo.getPhysFileNm();
            //확장자명
            String fileExtnNm = fileInfo.getFileExtnNm();
            //파일 경로명
            String filePathNm = uploadPath + fileInfo.getFilePathNm();
            //원본 파일명
            String lgcFileNm = fileInfo.getLgcFileNm();
            //법인명
            String corpNm = fileInfo.getCorpNm();
            //사업자번호
            String brno = fileInfo.getBrno();

            String fileNm = corpNm + "_" + brno + "_" + lgcFileNm;
            String convertFileNm = URLEncoder.encode(fileNm, StandardCharsets.UTF_8).replaceAll("\\+", "%20");
            //"utf-8"

            //물리 파일명
            String filename = srvrFileNm + "_" + fileExtnNm;

            //EgovFormBasedFileUtil.downloadFile(response, uploadPath, filePathNm, filename, convertFileNm);

            // 2. 경로 보안 처리 (예: 디렉토리 탈출 방지)
            if (filePathNm.contains("..")) {
                //response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                return ResponseEntity.status(HttpStatus.NOT_FOUND).body("잘못된 요청입니다.");
            }

            // 3. 파일 확인
            File atchFile = new File(filePathNm, filename);

            if (!atchFile.exists()) {
                //response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                return ResponseEntity.status(HttpStatus.NOT_FOUND).body("파일을 찾을 수 없습니다.");
            }

            FileSystemResource resource = new FileSystemResource(atchFile);


            // 4. 응담 설정
            /*
            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "inline; filename=\"" + fileNm + "\"");
            response.setContentLengthLong(atchFile.length());
             */

            String contentDisposition = "inline; filename=\"" + convertFileNm + "\"";
            //String contentDisposition = "attachment; filename=\"" + fileNm + "\"";

            /*
            // 4. 응답 반환
            return ResponseEntity.ok()
                    .contentType(MediaType.APPLICATION_OCTET_STREAM)
                    .header(HttpHeaders.CONTENT_DISPOSITION, contentDzisposition)
                    .body(resource);
             */
            MediaType mediaType = ComUtil.getMediaType(convertFileNm); // 예: application/pdf, image/png 등

            return ResponseEntity.ok()
                    .contentType(mediaType)
                    .header(HttpHeaders.CONTENT_DISPOSITION, contentDisposition)
                    .body(resource);

        } catch (Exception e) {
            // 5. 예외 처리
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("오류가 발생했습니다. 관리자에게 문의하세요.");
        }
    }

    @GetMapping("/pd/downloadSrptClclnPrufAtchFile.do")
    public ResponseEntity<?> downloadSrptClclnPrufAtchFile(HttpServletRequest request, HttpServletResponse response, @RequestParam("fileSn") long fileSn) throws Exception {
        try {
            // 0. 파일 정보 조회
            SprtBizRegFileVO sprtBizRegFileVO = new SprtBizRegFileVO();
            sprtBizRegFileVO.setAtchFileSn(fileSn);

            SprtBizRegFileVO fileInfo = sprtBizClclnMngService.selectSprtClclnPrufAtchfl(sprtBizRegFileVO);
            if (fileInfo == null || !StringUtils.hasText(fileInfo.getPhysFileNm())) {
                // 파일 없음
                return ResponseEntity.status(HttpStatus.NOT_FOUND).body("파일정보를 찾을 수 없습니다.");
            }
            // 1. 권한 확인
            String untyAuthrtType = getUntyAuthrtType();
            String untyOgnzCd = getUntyOgnzCd();
            if (!ComConstants.CON_UNTY_AUTHRT_TYPE_SYS.equals(untyAuthrtType)
                    &&
                    !ComConstants.CON_UNTY_AUTHRT_TYPE_AT.equals(untyAuthrtType)) {
                // 관리자가 아니면 해당 조직 소속 여부를 확인한다.
                if (!ComUtil.nullToEmpty(untyOgnzCd).equals(ComUtil.nullToEmpty("UO" + fileInfo.getApoCd()))) {
                    //response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                    return ResponseEntity.status(HttpStatus.NOT_FOUND).body("잘못된 요청입니다.");
                    //return getErrorResponseEntity(ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "접근권한"));
                }
            }
            String uploadPath = getFilepathPd();

            //서버 저장 파일명
            String srvrFileNm = fileInfo.getPhysFileNm();
            //확장자명
            String fileExtnNm = fileInfo.getFileExtnNm();
            //파일 경로명
            String filePathNm = uploadPath + fileInfo.getFilePathNm();
            //원본 파일명
            String lgcFileNm = fileInfo.getLgcFileNm();
            //법인명
            String corpNm = fileInfo.getCorpNm();
            //사업자번호
            String brno = fileInfo.getBrno();

            String fileNm = corpNm + "_" + brno + "_" + lgcFileNm;
            String convertFileNm = URLEncoder.encode(fileNm, StandardCharsets.UTF_8).replaceAll("\\+", "%20");
            //"utf-8"

            //물리 파일명
            String filename = srvrFileNm + "_" + fileExtnNm;

            //EgovFormBasedFileUtil.downloadFile(response, uploadPath, filePathNm, filename, convertFileNm);

            // 2. 경로 보안 처리 (예: 디렉토리 탈출 방지)
            if (filePathNm.contains("..")) {
                //response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                return ResponseEntity.status(HttpStatus.NOT_FOUND).body("잘못된 요청입니다.");
            }

            // 3. 파일 확인
            File atchFile = new File(filePathNm, filename);

            if (!atchFile.exists()) {
                //response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                return ResponseEntity.status(HttpStatus.NOT_FOUND).body("파일을 찾을 수 없습니다.");
            }

            FileSystemResource resource = new FileSystemResource(atchFile);

            // 4. 응담 설정
            /*
            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "inline; filename=\"" + fileNm + "\"");
            response.setContentLengthLong(atchFile.length());
             */

            // String contentDisposition = "inline; filename=\"" + convertFileNm + "\"";
            String contentDisposition = "attachment; filename=\"" + convertFileNm + "\"";

            /*
            // 4. 응답 반환
            return ResponseEntity.ok()
                    .contentType(MediaType.APPLICATION_OCTET_STREAM)
                    .header(HttpHeaders.CONTENT_DISPOSITION, contentDzisposition)
                    .body(resource);
             */
            MediaType mediaType = ComUtil.getMediaType(fileNm); // 예: application/pdf, image/png 등

            return ResponseEntity.ok()
                    .contentType(mediaType)
                    .header(HttpHeaders.CONTENT_DISPOSITION, contentDisposition)
                    .body(resource);

        } catch (Exception e) {
            // 5. 예외 처리
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("오류가 발생했습니다. 관리자에게 문의하세요.");
        }
    }

/*    @GetMapping("/pd/downloadAllSprtClclnPrufDoc.do")
    public ResponseEntity<?> downloadAllSprtClclnPrufDoc (HttpServletRequest request, HttpServletResponse response
            , @RequestParam("sprtBizYr") String sprtBizYr
            , @RequestParam("clclnSeq") int clclnSeq
            , @RequestParam(value = "brno" , required = false) String brno
            , @RequestParam(value = "corpNm" , required = false) String corpNm
    ) throws Exception {
        try {
            logger.debug("sprtBizYr : {}, clclnSeq : {}, brno :{}, corpNm :{}",sprtBizYr,clclnSeq,brno,corpNm);

            // 1. 파일 정보 조회
            SprtBizClclnDmndDtlVO sprtBizClclnDmndDtlVO = new SprtBizClclnDmndDtlVO();
            sprtBizClclnDmndDtlVO.setSprtBizYr(sprtBizYr);
            sprtBizClclnDmndDtlVO.setClclnSeq(clclnSeq);
            sprtBizClclnDmndDtlVO.setBrno(brno);
            sprtBizClclnDmndDtlVO.setCorpNm(corpNm);


            List<SprtBizClclnDmndDtlVO> prufDocList = sprtBizClclnMngService.selectSprtClclnPrufDocList(sprtBizClclnDmndDtlVO);
            logger.debug("파일은???????"+prufDocList);

            // 파일 없음
            if (prufDocList == null || prufDocList.isEmpty()) {
                return ResponseEntity.status(HttpStatus.NOT_FOUND).body("파일정보를 찾을 수 없습니다.");
            }

            // 헤더용 파일명
            String zipFileNm = "산지조직 증빙서류 일괄 다운로드.zip";
            String convertFileNm = URLEncoder.encode(zipFileNm, StandardCharsets.UTF_8).replaceAll("\\+", "%20");
            String contentDisposition = "attachment; filename=\"" + convertFileNm + "\"";

            // 파일경로
            String uploadPath = getFilepathPd();

            // 2. 권한 확인
            String untyAuthrtType = getUntyAuthrtType();
            String untyOgnzCd = getUntyOgnzCd();

            // 확인들
            for (SprtBizClclnDmndDtlVO prufDocInfo : prufDocList) {

                // 권한 체크
                if (!ComConstants.CON_UNTY_AUTHRT_TYPE_SYS.equals(untyAuthrtType)
                        && !ComConstants.CON_UNTY_AUTHRT_TYPE_AT.equals(untyAuthrtType)) {
                    if (!ComUtil.nullToEmpty(untyOgnzCd)
                            .equals(ComUtil.nullToEmpty("UO" + prufDocInfo.getApoCd()))) {
                        return ResponseEntity.status(HttpStatus.NOT_FOUND).body("잘못된 요청입니다.11");
                    }
                }

                String filePathNm = prufDocInfo.getFilePathNm();
                String physFileNm = prufDocInfo.getPhysFileNm();
                String fileExtnNm = prufDocInfo.getFileExtnNm();
                String filePath = uploadPath + filePathNm;
                String fileNm = physFileNm + "_" + fileExtnNm;

                if (filePath == null || filePath.contains("..")) {
                    return ResponseEntity.status(HttpStatus.NOT_FOUND).body("잘못된 요청입니다.");
                }

                File atchFile = new File(filePath, fileNm);

                logger.debug("!!!!!!!!파일은?? : {}",atchFile);
                if (!atchFile.exists() || !atchFile.isFile()) {
                    return ResponseEntity.status(HttpStatus.NOT_FOUND).body("파일을 찾을 수 없습니다.");
                }
            }

            FileSystemResource resource = null;

            // 확인통과되면 여기서 생성,전송
            StreamingResponseBody stream = out -> {
                ZipOutputStream zos = new ZipOutputStream(out);
                try {
                    for (SprtBizClclnDmndDtlVO prufDocInfo : prufDocList) {
                        // 서버 저장 파일명
                        String physFileNm = prufDocInfo.getPhysFileNm();
                        // 확장자명
                        String fileExtnNm = prufDocInfo.getFileExtnNm();
                        // 파일 경로명
                        String filePathNm = prufDocInfo.getFilePathNm();
                        // 원본 파일명
                        String lgcFileNm = prufDocInfo.getLgcFileNm();
                        // 법인명
                        String coprNm = prufDocInfo.getCorpNm();
                        // 회차
                        int seq = prufDocInfo.getClclnSeq();
                        // 주요항목명
                        String dmndArtclKndNm = prufDocInfo.getDmndArtclKndNm();
                        // 세부항목명
                        String dmndArtclNm = prufDocInfo.getDmndArtclCdNm();
                        // 증빙명
                        String docNm = prufDocInfo.getDocNm();

                        // 예시: 법인명_1차_조직화_1.농가교육비_영수증_파일명
                        String fileNm = coprNm + "_" + seq + "차_" + dmndArtclKndNm + "_"
                                + dmndArtclNm + "_" + docNm + "_" + lgcFileNm;
//                        String convertFlNm = URLEncoder.encode(fileNm, StandardCharsets.UTF_8).replaceAll("\\+", "%20");

                        // 물리 파일명
                        String filename = physFileNm + "_" + fileExtnNm;

                        String filePath = uploadPath + filePathNm;
                        logger.debug("file");
                        File atchFile = new File(filePath, filename);
                        logger.debug("!@@@@@@@@@파일은?? : {}",atchFile);


                        try (FileInputStream fis = new FileInputStream(atchFile)){
                            zos.putNextEntry(new ZipEntry(fileNm));

                            StreamUtils.copy(fis, zos);
//                            fis.close();
                            zos.closeEntry();
                        }
                    }
                } finally {
                    zos.close();
                }
            };

            return ResponseEntity.ok()
                    .contentType(MediaType.valueOf("application/zip"))
                    .header(HttpHeaders.CONTENT_DISPOSITION, contentDisposition)
                    .body(stream);

        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("오류가 발생했습니다. 관리자에게 문의하세요.");
        }

    }*/
}
