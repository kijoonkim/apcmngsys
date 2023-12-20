package com.at.apcss.fm.bbs.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
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
import com.at.apcss.fm.bbs.service.BbsService;
import com.at.apcss.fm.bbs.vo.BbsFileVO;
import com.at.apcss.fm.bbs.vo.BbsVO;


import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;

import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;


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
public class BbsController extends BaseController {

	//파일 업로드 경로
	@Value("${upload.path}")
    private String uploadPath;

	// 게시판
	@Resource(name= "bbsService")
	private BbsService bbsService;

	// 게시판 화면이동
	@GetMapping("/fm/bbs/bbs.do")
	public String doBbs() {
		return "apcss/fm/bbs/bbs";
	}

	// 게시판 조회
	@PostMapping(value = "/fm/bbs/selectBbsList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectMenuList(Model model, @RequestBody BbsVO bbsVO, HttpServletRequest request) throws Exception{

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<BbsVO> resultList = new ArrayList<>();

		try {
			 resultList = bbsService.selectBbsList(bbsVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}
	// 게시판 등록
	@PostMapping(value = "/fm/bbs/insertBbs.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertBbs(@RequestBody BbsVO bbsVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		bbsVO.setSysFrstInptUserId(getUserId());
		bbsVO.setSysFrstInptPrgrmId(getPrgrmId());
		bbsVO.setSysLastChgUserId(getUserId());
		bbsVO.setSysLastChgPrgrmId(getPrgrmId());

		int insertedCnt = 0;

		try {
			insertedCnt = bbsService.insertBbs(bbsVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// 게시판 변경
	@PostMapping(value = "/fm/bbs/updateBbs.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateBbs(@RequestBody BbsVO bbsVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		bbsVO.setSysLastChgUserId(getUserId());
		bbsVO.setSysLastChgPrgrmId(getPrgrmId());

		int updatedCnt = 0;

		try {
			updatedCnt = bbsService.updateBbs(bbsVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_UPDATED_CNT, updatedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// 게시판 삭제
	@PostMapping(value = "/fm/bbs/deleteBbs.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteBbs(@RequestBody BbsVO bbsVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		bbsVO.setSysLastChgUserId(getUserId());
		bbsVO.setSysLastChgPrgrmId(getPrgrmId());

		int deletedCnt = 0;

		try {
			deletedCnt = bbsService.deleteBbs(bbsVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// 게시판 목록 삭제
	@PostMapping(value = "/fm/bbs/deleteBbsList.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteBbsList(@RequestBody List<BbsVO> bbsList, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		for (BbsVO bbsVO : bbsList ) {
			bbsVO.setSysLastChgUserId(getUserId());
			bbsVO.setSysLastChgPrgrmId(getPrgrmId());
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


	// 게시판 화면이동
	@GetMapping("/fm/bbs/xmlParshing.do")
	public String xmlParshing(@RequestBody List<BbsVO> bbsList, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();


		String urlstr = "https://uni.agrix.go.kr/api/srvc/farmerInfo?accessToken=eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE3MTk2NDcyOTI3NzMsImFwaU5tIjoiZmFybWVySW5mbyIsImlzcyI6IlNZU1RFTSJ9.f9oToC5zUynRzK5zCgu-zgvZNJ0bN-MSzA_FQxtaEPY&version=1.0&responseType=xml&frmerSn=\r\n"
				+ "AGUN47";
		URL url = new URL(urlstr);

		HttpURLConnection urlconnection  = (HttpURLConnection)url.openConnection();

		// xml 파싱 빌드업
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		DocumentBuilder builder = factory.newDocumentBuilder();


		// xml 파일을 document로 파싱하기
		//Document document = builder.parse("xml/sample.xml");
		Document document = builder.parse(urlconnection.getInputStream());


		// root 요소 가져오기
		Element root = document.getDocumentElement();
		// root 요소 확인 : 첫 태그 sample , items
		System.out.println(root.getNodeName());
		// root 요소의 첫번째 노드는 #Text
		Node firstNode = root.getFirstChild();
		// 다음 노드는 customer , item
		Node customer = firstNode.getNextSibling();
		// customer 요소 안의 노드 리스트
		NodeList childList = customer.getChildNodes();


		for(int i = 0; i < childList.getLength(); i++) {
			Node item = childList.item(i);
			if(item.getNodeType() == Node.ELEMENT_NODE) { // 노드의 타입이 Element일 경우(공백이 아닌 경우)
				System.out.println("item.getNodeName()========="+item.getNodeName());
				System.out.println("item.getTextContent()========="+item.getTextContent());
			} else {
				System.out.println("공백 입니다.");
			}
		}

		/* xml예시 파일
		 * <?xml version="1.0" encoding="UTF-8"?>
				<sample>
					<customer>
						<name>한국이</name>
						<age>25</age>
						<address>서울</address>
					</customer>
				</sample>
		 */
		/*
		 * <data>
				<script/>
				<code>200</code>
				<message>클라이언트 요청에 대해 정상 처리한 경우</message>
				<version>1.0</version>
				<updateDate>2023-10-19 16:49:08</updateDate>
				<totCnt/>
				<items>
					<item>
						<frmerSn>AGUN47</frmerSn>
						<bzobRgno>1001334324</bzobRgno>
						<mngerRelate>경영주</mngerRelate>
						<bzmCorpNm>박찬웅</bzmCorpNm>
						<addr>전라북도 순창군 쌍치면 운암리 375</addr>
						<rrsdAddr>전라북도 순창군 쌍치면 운암리 375</rrsdAddr>
						<rdnmAddr>전라북도 순창군 쌍치면 운암길 92-12</rdnmAddr>
						<twNm>운암</twNm>
						<perCorpDvcdNm>개인</perCorpDvcdNm>
						<nafoDvcdNm>내국인</nafoDvcdNm>
						<telno>0636522193</telno>
						<mblTelno>01088772193</mblTelno>
						<emailAddr>@</emailAddr>
						<famgStrYmd>19790101</famgStrYmd>
						<farmngBeginStleCdNm>전 생애 농업에 종사</farmngBeginStleCdNm>
						<farmngEngageStleCdNm>전업</farmngEngageStleCdNm>
						<reprAddr> </reprAddr>
						<brthdy>19510525</brthdy>
						<sexdstn>남성</sexdstn>
						<rgsde>20110120</rgsde>
						<updde>20220419</updde>
					</item>
				</items>
			</data>
		 */
		return "apcss/fm/bbs/xmlParshing";
	}

	// 첨부파일 조회
	@PostMapping(value = "/fm/bbs/selectBbsAttachesList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectFile(Model model, @RequestBody BbsVO bbsVO, HttpServletRequest request) throws Exception{

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<BbsFileVO> resultList = new ArrayList<>();

		try {
			 resultList = bbsService.selectBbsAttachesList(bbsVO);

			 logger.debug("$$$$$$$$$$$$$$$$$$$$$");
			 for (BbsFileVO bbsFile : resultList ) {
				 logger.debug("AtchNo : {}", bbsFile.getAtchflno());
			 }

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	// 첨부파일 업로드
    @PostMapping("/fm/bbs/fileUpload.do")
    public ResponseEntity<HashMap<String, Object>> handleFileUpload(@RequestParam("files") List<MultipartFile> files,@RequestParam("bbsNo") String bbsNo, RedirectAttributes redirectAttributes) throws Exception{

    	System.out.println("======================/fm/bbs/fileUpload.do==========================");

    	//String curWorkingDir = System.getProperty("user.dir");
		//System.out.println("현재 작업 폴더 : " + curWorkingDir);
		//System.out.println("폴더 : " + uploadPath1);

    	String projectDir = System.getProperty("user.dir");
        String uploadDir = projectDir + "/upload";

    	HashMap<String,Object> resultMap = new HashMap<String,Object>();

    	int insertedCnt = 0;
    	for (MultipartFile file : files) {
    		BbsFileVO bbsFileVO = new BbsFileVO();

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

    		bbsFileVO.setAtchflno(bbsNo);
    		bbsFileVO.setAtchflNm(uniqueName);
    		bbsFileVO.setAtchflOrgnNm(fileRealName);
    		bbsFileVO.setAtchflSz(size);
    		bbsFileVO.setAtchflExtnType(fileExtension);
    		bbsFileVO.setAtchflPath(folderPath);

    		//파일 생성
    		//file.transferTo(savePath);
    		 try {
                 file.transferTo(savePath);
                 insertedCnt += bbsService.insertAttach(bbsFileVO);
             } catch (IOException e) {
            	 resultMap.put("error", e.getMessage());
            	 logger.debug(e.getMessage());
             }

        }

		redirectAttributes.addFlashAttribute("message", "File successfully uploaded!");

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);
		resultMap.put("test", files.size());

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
	@PostMapping(value = "/fm/bbs/deleteBbsAttache.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteBbsAttache(@RequestBody BbsFileVO bbsFileVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		int deletedCnt = 0;

		try {
			deletedCnt = bbsService.deleteBbsAttache(bbsFileVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);

		return getSuccessResponseEntity(resultMap);
	}

    @GetMapping("/download/{atchflno}")
    public void downloadFile(@PathVariable String atchflno, HttpServletRequest requset, HttpServletResponse response) throws Exception {

    	System.out.println("============/fm/bbs/downloadFile.do=============");
    	BbsFileVO bbsFileVO = new BbsFileVO();
    	bbsFileVO.setAtchflno(atchflno);
    	BbsFileVO result;


    	result = bbsService.selectBbsAttaches(bbsFileVO);

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