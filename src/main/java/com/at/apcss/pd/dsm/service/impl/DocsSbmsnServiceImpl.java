package com.at.apcss.pd.dsm.service.impl;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.pd.dsm.mapper.DocsSbmsnMapper;
import com.at.apcss.pd.dsm.service.DocsSbmsnService;
import com.at.apcss.pd.dsm.vo.DocsFileVO;
import com.at.apcss.pd.dsm.vo.DocsSbmsnVO;

import egovframework.let.utl.fcc.service.EgovFileUploadUtil;


/**
 * @Class Name : BbsServiceImpl.java
 * @Description : 게시판 서비스를 정의하기 위한 서비스 구현 클래스
 * @author ljw
 * @since 2024.11.03
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.11.03  ljw        최초 생성
 * </pre>
 */
@Service("DocsSbmsnService")
public class DocsSbmsnServiceImpl extends BaseServiceImpl implements DocsSbmsnService{

	@Autowired
	private DocsSbmsnMapper DocsSbmsnMapper;

	@Override
	public DocsSbmsnVO selectDocsSbmsnUoAprv(DocsSbmsnVO DocsSbmsnVO) throws Exception {
		DocsSbmsnVO resultVO = DocsSbmsnMapper.selectDocsSbmsnUoAprv(DocsSbmsnVO);

		return resultVO;
	}

	@Override
	public List<DocsSbmsnVO> selectDocsSbmsnUoAprvList(DocsSbmsnVO DocsSbmsnVO) throws Exception {
		List<DocsSbmsnVO> resultList = DocsSbmsnMapper.selectDocsSbmsnUoAprvList(DocsSbmsnVO);
		return resultList;
	}

	@Override
	public List<DocsSbmsnVO> selectDocsSbmsnBscList(DocsSbmsnVO DocsSbmsnVO) throws Exception {
		List<DocsSbmsnVO> resultList = DocsSbmsnMapper.selectDocsSbmsnBscList(DocsSbmsnVO);
		return resultList;
	}

	@Override
	public List<DocsSbmsnVO> selectDocsSbmsnDtlIsoList(DocsSbmsnVO DocsSbmsnVO) throws Exception {
		List<DocsSbmsnVO> resultList = DocsSbmsnMapper.selectDocsSbmsnDtlIsoList(DocsSbmsnVO);
		return resultList;
	}

	@Override
	public List<DocsSbmsnVO> selectDocsSbmsnDtlPoList(DocsSbmsnVO DocsSbmsnVO) throws Exception {
		List<DocsSbmsnVO> resultList = DocsSbmsnMapper.selectDocsSbmsnDtlPoList(DocsSbmsnVO);
		return resultList;
	}

	@Override
	public List<DocsSbmsnVO> selectDocsSbmsnList(DocsSbmsnVO DocsSbmsnVO) throws Exception {
		List<DocsSbmsnVO> resultList = DocsSbmsnMapper.selectDocsSbmsnList(DocsSbmsnVO);
		return resultList;
	}

	@Override
	public int multiSaveFileList(DocsSbmsnVO DocsSbmsnVO , String filepathPd) throws Exception {
		int saveCnt = 0;

		//fileList,fileSeList 동일한 길이로 처리
		//문서 파일 리스트
		List<MultipartFile> fileList = DocsSbmsnVO.getNewFileList();
		//문서 번호 리스트
		List<String> fileSeList = DocsSbmsnVO.getNewFileSeList();

		if(fileList != null && fileSeList != null) {
			for (int i = 0; i < fileList.size(); i++) {
				MultipartFile newFile = fileList.get(i);
				String sn = fileSeList.get(i);
				if(newFile != null) {
					DocsFileVO docsFileVO = new DocsFileVO();

					//파일 사이즈
					long size = newFile.getSize();
					//파일 이름
					String fileRealName = newFile.getOriginalFilename();
					//확장자명
					//String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length());
					String fileExtension = "";
					int lastDotIndex = fileRealName.lastIndexOf(".");
					// 마침표가 없는 경우 제외
					if (lastDotIndex != -1) {
						fileExtension = fileRealName.substring(lastDotIndex + 1);
					}

					//서버에 저장할 파일명
					String physicalFileName = EgovFileUploadUtil.getPhysicalFileName();

					//folderPath 날짜 폴더 경로
					String folderPath = makeFolder(filepathPd);
					if(folderPath == null) {
						continue;
					}

					//uploadPath 업로드 경로
					String uploadPath = filepathPd;

					//업로드 경로 + 날짜 폴더 경로 + 서버에 저장할 파일명 + "_" + 확장자
					String saveName = uploadPath + File.separator + folderPath +File.separator + physicalFileName + "_" + fileExtension;

					Path savePath = Paths.get(saveName);

					//등록년도
					docsFileVO.setYr(DocsSbmsnVO.getYr());
					//통합조직 사업자번호
					docsFileVO.setUoBrno(DocsSbmsnVO.getUoBrno());
					//선택조직 사업자번호
					docsFileVO.setBrno(DocsSbmsnVO.getBrno());
					//문서 구분
					docsFileVO.setDcmntKnd(DocsSbmsnVO.getDcmntKnd());
					//문서 구분 순서
					docsFileVO.setSn(sn);
					//선택 생산자조직 번호
					docsFileVO.setPrdcrOgnzSn(DocsSbmsnVO.getPrdcrOgnzSn());

					docsFileVO.setFilePathNm(folderPath);
					docsFileVO.setOrgFileNm(fileRealName);
					docsFileVO.setSrvrFileNm(physicalFileName);
					docsFileVO.setFileSz(size);
					docsFileVO.setFileExtnNm(fileExtension);

					docsFileVO.setSysFrstInptPrgrmId(DocsSbmsnVO.getSysPrgrmId());
					docsFileVO.setSysFrstInptUserId(DocsSbmsnVO.getSysUserId());
					docsFileVO.setSysLastChgPrgrmId(DocsSbmsnVO.getSysPrgrmId());
					docsFileVO.setSysLastChgUserId(DocsSbmsnVO.getSysUserId());

					newFile.transferTo(savePath);
					saveCnt += insertDocsFile(docsFileVO);
				}
			}
		}

		return saveCnt;
	}

	//업로드 폴더 생성
	private String makeFolder(String filepathPd){

		if(filepathPd == null) {
			return null;
		}
		String uploadPath = filepathPd;

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

	//파일정보 저장
	public int insertDocsFile(DocsFileVO DocsFileVO) throws Exception {
		int inserted = 0;
		inserted = DocsSbmsnMapper.insertSbmsnDcmntFile(DocsFileVO);
		if(DocsFileVO.getFileSn() != null) {
			System.out.println(DocsFileVO.getFileSn());
			DocsSbmsnMapper.insertSbmsnDcmnt(DocsFileVO);
		}
		return inserted;
	}

	@Override
	public int multiSaveList(DocsSbmsnVO DocsSbmsnVO) throws Exception {
		List<String> rmrkList = DocsSbmsnVO.getRmrkList();
		if(rmrkList != null) {
			for (int i = 0; i < rmrkList.size(); i++) {
				String rmrkVal = rmrkList.get(i);
				int sn = i+1;
				DocsSbmsnVO.setSn(Integer.toString(sn));
				DocsSbmsnVO.setRmrk(rmrkVal);
				DocsSbmsnMapper.insertSbmsnDcmntRmrk(DocsSbmsnVO);
			}
		}
		return 0;
	}

	@Override
	public int multiSaveDocsSbmsnAprv(List<DocsSbmsnVO> DocsSbmsnVOList) throws Exception {
		int saveCnt = 0;
		for (DocsSbmsnVO docsSbmsnVO : DocsSbmsnVOList) {
			saveCnt += updateDocsSbmsnAprv(docsSbmsnVO);
		}
		return saveCnt;
	}

	@Override
	public int updateDocsSbmsnAprv(DocsSbmsnVO docsSbmsnVO) throws Exception {
		int updated = DocsSbmsnMapper.updateDocsSbmsnAprv(docsSbmsnVO);
		return updated;
	}
}
