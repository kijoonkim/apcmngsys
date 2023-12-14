package com.at.apcss.am.bbs.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

import com.at.apcss.am.bbs.service.apcBbsService;
import com.at.apcss.am.bbs.vo.apcBbsCmntVO;
import com.at.apcss.am.bbs.vo.apcBbsFileVO;
import com.at.apcss.am.bbs.vo.apcBbsVO;


/**
 * @Class Name : BbsController.java
 * @Description : 게시판 대한 Controller 클래스
 * @author 정연두
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21  정연두        최초 생성
 * </pre>
 */
@Controller
public class apcBbsController extends BaseController {

	//파일 업로드 경로
	@Value("${upload.path}")
    private String uploadPath;

	// 게시판
	@Resource(name= "apcBbsService")
	private apcBbsService bbsService;

	// 게시판 화면이동
	@GetMapping("/am/bbs/bbs.do")
	public String doBbs() {
		return "apcss/am/bbs/bbs";
	}

	// 게시판 조회
	@PostMapping(value = "/am/bbs/selectBbsList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectMenuList(Model model, @RequestBody apcBbsVO apcBbsVO, HttpServletRequest request) throws Exception{

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<apcBbsVO> resultList = new ArrayList<>();

		try {
			 resultList = bbsService.selectBbsList(apcBbsVO);

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}
	// 게시판 등록
	@PostMapping(value = "/am/bbs/insertBbs.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertBbs(@RequestBody apcBbsVO apcBbsVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		apcBbsVO.setSysFrstInptUserId(getUserId());
		apcBbsVO.setSysFrstInptPrgrmId(getPrgrmId());
		apcBbsVO.setSysLastChgUserId(getUserId());
		apcBbsVO.setSysLastChgPrgrmId(getPrgrmId());

		int insertedCnt = 0;

		try {
			insertedCnt = bbsService.insertBbs(apcBbsVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

		return getSuccessResponseEntity(resultMap);
	}


	// 게시판 변경
	@PostMapping(value = "/am/bbs/updateBbs.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateBbs(@RequestBody apcBbsVO apcBbsVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		apcBbsVO.setSysLastChgUserId(getUserId());
		apcBbsVO.setSysLastChgPrgrmId(getPrgrmId());

		int updatedCnt = 0;

		try {
			updatedCnt = bbsService.updateBbs(apcBbsVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_UPDATED_CNT, updatedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// 게시판 삭제
	@PostMapping(value = "/am/bbs/deleteBbs.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteBbs(@RequestBody apcBbsVO apcBbsVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		apcBbsVO.setSysLastChgUserId(getUserId());
		apcBbsVO.setSysLastChgPrgrmId(getPrgrmId());

		int deletedCnt = 0;

		try {
			deletedCnt = bbsService.deleteBbs(apcBbsVO);
			deletedCnt = bbsService.deleteBbsAllCmnt(apcBbsVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// 게시판 목록 삭제
	@PostMapping(value = "/am/bbs/deleteBbsList.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteBbsList(@RequestBody List<apcBbsVO> bbsList, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		for (apcBbsVO apcBbsVO : bbsList ) {
			apcBbsVO.setSysLastChgUserId(getUserId());
			apcBbsVO.setSysLastChgPrgrmId(getPrgrmId());
		}

		int deletedCnt = 0;

		try {
			deletedCnt = bbsService.deleteBbsList(bbsList);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	//게시판댓글등록
		@PostMapping(value = "/am/bbs/insertBbsCmnt.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> insertBbsCmnt(@RequestBody apcBbsCmntVO apcBbsCmntVO, HttpServletRequest requset) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			// validation check

			// audit 항목
			apcBbsCmntVO.setSysFrstInptUserId(getUserId());
			apcBbsCmntVO.setSysFrstInptPrgrmId(getPrgrmId());
			apcBbsCmntVO.setSysLastChgUserId(getUserId());
			apcBbsCmntVO.setSysLastChgPrgrmId(getPrgrmId());

			int insertedCnt = 0;
			String cmntSeNum = apcBbsCmntVO.getCmntChildNo();
			try {

					insertedCnt = bbsService.insertBbsCmnt(apcBbsCmntVO);

			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

			return getSuccessResponseEntity(resultMap);
		}
		//게시판대댓글등록
		@PostMapping(value = "/am/bbs/insertBbsChildCmnt.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> insertBbsChildCmnt(@RequestBody apcBbsCmntVO apcBbsCmntVO, HttpServletRequest requset) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			// validation check

			// audit 항목
			apcBbsCmntVO.setSysFrstInptUserId(getUserId());
			apcBbsCmntVO.setSysFrstInptPrgrmId(getPrgrmId());
			apcBbsCmntVO.setSysLastChgUserId(getUserId());
			apcBbsCmntVO.setSysLastChgPrgrmId(getPrgrmId());

			int insertedCnt = 0;
			String cmntSeNum = apcBbsCmntVO.getCmntChildNo();
			try {

					insertedCnt = bbsService.insertBbsChildCmnt(apcBbsCmntVO);

			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

			return getSuccessResponseEntity(resultMap);
		}
		//게시판댓글삭제
		@PostMapping(value = "/am/bbs/deleteCmntBbs.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> deleteBbsCmnt(@RequestBody apcBbsCmntVO apcBbsCmntVO, HttpServletRequest requset) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			// validation check

			// audit 항목


			int insertedCnt = 0;

			try {
				insertedCnt = bbsService.deleteBbsCmnt(apcBbsCmntVO);
			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

			return getSuccessResponseEntity(resultMap);
		}
		//게시판댓글조회
		@PostMapping(value = "/am/bbs/selectBbsCmntList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> selectBbsCmntList(Model model, @RequestBody apcBbsVO apcBbsVO, HttpServletRequest request) throws Exception{

			HashMap<String,Object> resultMap = new HashMap<String,Object>();
			List<apcBbsCmntVO> resultList = new ArrayList<>();

			try {
				 resultList = bbsService.selectBbsCmntList(apcBbsVO);

			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

			return getSuccessResponseEntity(resultMap);
		}

		/*   첨부파일   */

		// 첨부파일 조회
		@PostMapping(value = "/am/bbs/selectBbsAttachesList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> selectFile(Model model, @RequestBody apcBbsVO apcBbsVO, HttpServletRequest request) throws Exception{

			HashMap<String,Object> resultMap = new HashMap<String,Object>();
			List<apcBbsFileVO> resultList = new ArrayList<>();

			try {
				 resultList = bbsService.selectBbsAttachesList(apcBbsVO);

			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

			return getSuccessResponseEntity(resultMap);
		}

		// 첨부파일 업로드
	    @PostMapping("/am/bbs/fileUpload.do")
	    public ResponseEntity<HashMap<String, Object>> handleFileUpload(@RequestParam("files") List<MultipartFile> files,@RequestParam("bbsNo") String bbsNo, RedirectAttributes redirectAttributes) throws Exception{

	    	HashMap<String,Object> resultMap = new HashMap<String,Object>();

	    	int insertedCnt1 = 0;
	    	for (MultipartFile file : files) {
	    		apcBbsFileVO apcBbsFileVO = new apcBbsFileVO();

	    		long size = file.getSize(); //파일 사이즈
	    		String fileRealName = file.getOriginalFilename();//파일 이름
	    		//System.out.println("파일명 : "  + fileRealName);
	    		//System.out.println("용량크기(byte) : " + size);

	    		//서버에 저장할 파일이름 fileextension으로 .jsp이런식의  확장자 명을 구함
	    		String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length());

	    		UUID uuid = UUID.randomUUID();
	    		//System.out.println(uuid.toString());
	    		String[] uuids = uuid.toString().split("-");

	    		String uniqueName = uuids[0];
	    		//System.out.println("생성된 고유문자열" + uniqueName);
	    		//System.out.println("확장자명" + fileExtension);

	    		String folderPath = makeFolder();
	    		//uploadPath 업로드 경로
	    		//folderPath 날짜 폴더 경로
	    		String saveName = uploadPath + File.separator + folderPath +File.separator + uniqueName + "_" + fileExtension;

	    		Path savePath = Paths.get(saveName);

	    		apcBbsFileVO.setAtchflno(bbsNo);
	    		apcBbsFileVO.setAtchflNm(uniqueName);
	    		apcBbsFileVO.setAtchflOrgnNm(fileRealName);
	    		apcBbsFileVO.setAtchflSz(size);
	    		apcBbsFileVO.setAtchflExtnType(fileExtension);
	    		apcBbsFileVO.setAtchflPath(folderPath);

	    		//파일 생성
	    		//file.transferTo(savePath);
	    		 try {
	                 file.transferTo(savePath);
	                 insertedCnt1 += bbsService.insertAttach(apcBbsFileVO);
	             } catch (IOException e) {
	            	 getErrorResponseEntity(e);
	             }

	        }

			redirectAttributes.addFlashAttribute("message", "File successfully uploaded!");

			resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt1);

			return getSuccessResponseEntity(resultMap);
	    }

	    private String makeFolder(){

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


		// 첨부파일 삭제
		@PostMapping(value = "/am/bbs/deleteBbsAttache.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> deleteBbsAttache(@RequestBody apcBbsFileVO apcBbsFileVO, HttpServletRequest requset) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			// validation check

			int deletedCnt = 0;

			try {
				deletedCnt = bbsService.deleteBbsAttache(apcBbsFileVO);
			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);

			return getSuccessResponseEntity(resultMap);
		}

	    @GetMapping("/am/bbs/download/{atchflno}")
	    public void downloadFile(@PathVariable String atchflno, HttpServletRequest requset, HttpServletResponse response) throws Exception {

	    	apcBbsFileVO apcBbsFileVO = new apcBbsFileVO();
	    	apcBbsFileVO.setAtchflno(atchflno);
	    	apcBbsFileVO result;


	    	result = bbsService.selectBbsAttaches(apcBbsFileVO);

	    	String atchFileName = result.getAtchflNm();
	    	String fileExtension = result.getAtchflExtnType();
	    	String folderPath = result.getAtchflPath();
	    	String atchOriginalName = result.getAtchflOrgnNm();

	    	String downloadPath = uploadPath + File.separator + folderPath +File.separator ;
	    	String filename = atchFileName + "_" + fileExtension;

	    	File f = new File(downloadPath, filename);
	        // file 다운로드 설정
	        response.setContentType("application/download");
	        response.setContentLength((int)f.length());
	        response.setHeader("Content-disposition", "attachment;filename=\"" + URLEncoder.encode(atchOriginalName,"UTF-8") + "\"");
	        // response 객체를 통해서 서버로부터 파일 다운로드
	        OutputStream os = response.getOutputStream();
	        // 파일 입력 객체 생성
	        FileInputStream fis = new FileInputStream(f);
	        FileCopyUtils.copy(fis, os);
	        fis.close();
	        os.close();

	    }

}