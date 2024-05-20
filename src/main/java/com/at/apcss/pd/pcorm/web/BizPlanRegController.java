package com.at.apcss.pd.pcorm.web;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.pd.pcorm.service.BizPlanRegService;
import com.at.apcss.pd.pcorm.vo.BizPlanRegFileVO;
import com.at.apcss.pd.pcorm.vo.BizPlanRegVO;

import egovframework.let.utl.fcc.service.EgovFileUploadUtil;

@Controller
public class BizPlanRegController extends BaseController{

	@Resource(name= "BizPlanRegService")
	private BizPlanRegService bizPlanRegService;

	//화면이동
	@GetMapping(value = "/pd/pcorm/BizPlanReg.do")
	public String BizPlanReg() {
		return "apcss/pd/pcorm/BizPlanReg";
	}

	// 사용자 조회
	@PostMapping(value = "/pd/pcorm/selectBizPlanRegList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectBizPlanRegList(Model model, @RequestBody BizPlanRegVO bizPlanRegVO, HttpServletRequest request) throws Exception{
		System.out.println("==============selectBizPlanRegList=======================");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<BizPlanRegVO> resultList = new ArrayList<>();
		try {
			resultList = bizPlanRegService.selectBizPlanRegList(bizPlanRegVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	// 파일 리스트 조회
	@PostMapping(value = "/pd/pcorm/selectBizPlanRegFileList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectBizPlanRegFileList(Model model, @RequestBody BizPlanRegVO bizPlanRegVO, HttpServletRequest request) throws Exception{
		System.out.println("==============selectBizPlanRegFileList=======================");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<BizPlanRegVO> resultList = new ArrayList<>();
		try {
			resultList = bizPlanRegService.selectBizPlanRegFileList(bizPlanRegVO);

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	// 파일 리스트 조회
	@PostMapping(value = "/pd/pcorm/selectSrvy.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectSrvy(Model model, @RequestBody BizPlanRegVO bizPlanRegVO, HttpServletRequest request) throws Exception{
		System.out.println("==============selectSrvy=======================");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<BizPlanRegVO> resultList = new ArrayList<>();

		bizPlanRegVO.setSysFrstInptUserId(getUserId());
		try {
			resultList = bizPlanRegService.selectSrvy(bizPlanRegVO);

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	// 첨부파일 업로드
	//ResponseEntity<HashMap<String, Object>>
	@PostMapping("/pd/pcorm/fileUpload.do")
	public ResponseEntity<HashMap<String, Object>> fileUpload(
			@RequestParam("bizPlanFiles") List<MultipartFile> bizPlanFiles ,
			@RequestParam("sgntrFiles") List<MultipartFile> sgntrFiles,
			@RequestParam("brno") String brno,
			@RequestParam("srvyCn") String srvyCn,
			@RequestParam("rspnsCn") String rspnsCn,
			RedirectAttributes redirectAttributes
		) throws Exception{

		logger.debug("======================/pd/pcorm/fileUpload.do==========================");

		logger.debug("brno = " + brno);
		logger.debug("srvyCn = " + srvyCn);
		logger.debug("rspnsCn = " + rspnsCn);
		logger.debug(" bizPlanFiles.getSize() = " + bizPlanFiles.size());
		logger.debug(" sgntrFiles.getSize() = " + sgntrFiles.size());

		//업로드 경로
		String uploadPath = getFilepathPd();

		//String projectDir = System.getProperty("user.dir");
		//String uploadDir = projectDir + "/upload";

		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		int bizPlanFileChk = 0;
		if(bizPlanFiles != null) {
			//사업계획서
			for (MultipartFile bizPlanFile : bizPlanFiles) {
				BizPlanRegFileVO bizPlanRegFileVO = new BizPlanRegFileVO();
				//파일 사이즈
				long size = bizPlanFile.getSize();
				//파일 이름
				String fileRealName = bizPlanFile.getOriginalFilename();
				//확장자명
				String fileExtension = fileRealName.substring(fileRealName.lastIndexOf(".") , fileRealName.length());
				//서버에 저장할 파일명
				String physicalFileName = EgovFileUploadUtil.getPhysicalFileName();

				String folderPath = makeFolder();
				//uploadPath 업로드 경로
				//folderPath 날짜 폴더 경로
				String saveName = uploadPath + File.separator + folderPath +File.separator + physicalFileName + "_" + fileExtension;

				Path savePath = Paths.get(saveName);

				bizPlanRegFileVO.setBrno(brno);
				bizPlanRegFileVO.setDcmntKnd("BP");
				bizPlanRegFileVO.setFilePathNm(folderPath);
				bizPlanRegFileVO.setOrgFileNm(fileRealName);
				bizPlanRegFileVO.setSrvrFileNm(physicalFileName);
				bizPlanRegFileVO.setFileSz(size);
				bizPlanRegFileVO.setFileExtnNm(fileExtension);

				bizPlanRegFileVO.setSysFrstInptPrgrmId("pdFileUpload");
				bizPlanRegFileVO.setSysFrstInptUserId(getUserId());
				bizPlanRegFileVO.setSysLastChgPrgrmId("pdFileUpload");
				bizPlanRegFileVO.setSysLastChgUserId(getUserId());

				try {
					bizPlanFile.transferTo(savePath);
					bizPlanFileChk = bizPlanRegService.insertBizPlanRegFile(bizPlanRegFileVO);
				} catch (IOException e) {
					resultMap.put("error", e.getMessage());
					logger.debug(e.getMessage());
				}
			}
		}

		//서명서
		int sgntrFileChk = 0;
		//사업계획서
		if(sgntrFiles != null) {
			for (MultipartFile sgntrFile : sgntrFiles) {
				BizPlanRegFileVO bizPlanRegFileVO = new BizPlanRegFileVO();
				//파일 사이즈
				long size = sgntrFile.getSize();
				//파일 이름
				String fileRealName = sgntrFile.getOriginalFilename();
				//확장자명
				String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length());
				//서버에 저장할 파일명
				String physicalFileName = EgovFileUploadUtil.getPhysicalFileName();

				String folderPath = makeFolder();
				//uploadPath 업로드 경로
				//folderPath 날짜 폴더 경로
				String saveName = uploadPath + File.separator + folderPath +File.separator + physicalFileName + "_" + fileExtension;

				Path savePath = Paths.get(saveName);

				bizPlanRegFileVO.setBrno(brno);
				bizPlanRegFileVO.setDcmntKnd("S");
				bizPlanRegFileVO.setFilePathNm(folderPath);
				bizPlanRegFileVO.setOrgFileNm(fileRealName);
				bizPlanRegFileVO.setSrvrFileNm(physicalFileName);
				bizPlanRegFileVO.setFileSz(size);
				bizPlanRegFileVO.setFileExtnNm(fileExtension);

				bizPlanRegFileVO.setSysFrstInptPrgrmId("pdFileUpload");
				bizPlanRegFileVO.setSysFrstInptUserId(getUserId());
				bizPlanRegFileVO.setSysLastChgPrgrmId("pdFileUpload");
				bizPlanRegFileVO.setSysLastChgUserId(getUserId());

				try {
					sgntrFile.transferTo(savePath);
					sgntrFileChk = bizPlanRegService.insertBizPlanRegFile(bizPlanRegFileVO);
				} catch (IOException e) {
					resultMap.put("error", e.getMessage());
					logger.debug(e.getMessage());
				}
			}
		}

		//설문조사
		BizPlanRegVO srvyVO = new BizPlanRegVO();
		srvyVO.setSrvyCn(srvyCn);
		srvyVO.setRspnsCn(rspnsCn);
		srvyVO.setSrvyKnd("A");
		srvyVO.setSysFrstInptPrgrmId("pdFileUpload");
		srvyVO.setSysFrstInptUserId(getUserId());
		srvyVO.setSysLastChgPrgrmId("pdFileUpload");
		srvyVO.setSysLastChgUserId(getUserId());

		int srvyChk = bizPlanRegService.insertSrvy(srvyVO);

		redirectAttributes.addFlashAttribute("message", "File successfully uploaded!");

		//resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);
		resultMap.put("bizPlanFileChk", bizPlanFileChk);
		resultMap.put("sgntrFileChk", sgntrFileChk);
		resultMap.put("srvyChk", srvyChk);

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
