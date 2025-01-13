package com.at.apcss.am.cmns.service.impl;

import java.security.SecureRandom;
import java.util.HashMap;

import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.at.apcss.am.cmns.mapper.ComAtchflMapper;
import com.at.apcss.am.cmns.service.ComAtchflService;
import com.at.apcss.am.cmns.vo.ComAtchflVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;

import java.util.Base64;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import org.springframework.util.StringUtils;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

/**
 * @Class Name : ComAtchflServiceImpl.java
 * @Description : 첨부파일 서비스를 정의하기 위한 서비스 구현 클래스
 * @author 김호
 * @since 2024.07.11
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.07.11  김호        최초 생성
 * </pre>
 */
@Service("comAtchflService")
public class ComAtchflServiceImpl extends BaseServiceImpl implements ComAtchflService {

	@Autowired
	private ComAtchflMapper comAtchflMapper;

	@Override
	public int insertComAtchfl(ComAtchflVO comAtchflVO) throws Exception {

		String atchflNo = comAtchflMapper.selectGetComAtchflNo(comAtchflVO);
		comAtchflVO.setAtchflNo(atchflNo);
		int insertedCnt =  comAtchflMapper.insertComAtchfl(comAtchflVO);
		return insertedCnt;
	}


	/**
	 * 파일 업로드 VO 에 정보로 파일 업로드 한다 파일 DECODING 구현
	 * @param CltvtnListVO
	 * @param request
	 * @return HashMap<String, Object>
	 * @throws Exception
	 */
	@Override
	public HashMap<String, Object> fileUpload(ComAtchflVO comAtchflVO) throws Exception {

		try {
            // Base64 파일 데이터 추출
            String base64File = comAtchflVO.getBase64File();
            byte[] decodedBytes = Base64.getDecoder().decode(base64File);  // Base64 디코딩

            // 파일 저장 경로 설정
            String filePath = comAtchflVO.getAtchflPath();
            long t = System.currentTimeMillis();

     		//int r = (int)(Math.random()*1000000);
			int r = ComUtil.generateRandomNum(6);
        	String atchflExtnType =  StringUtils.getFilenameExtension(comAtchflVO.getAtchflOrgnNm());

            String fileName = "" + t + r + "." + atchflExtnType;

            File file = new File(filePath, fileName);
			boolean isSuccessMkdir = false;
			if (file.getParentFile() != null) {
				isSuccessMkdir = file.getParentFile().mkdirs();  // 디렉토리 생성
			}

			if (!isSuccessMkdir) {
				throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "파일 업로 중 오류가 발생 하였습니다."))); // E0000	{0}
			}

            comAtchflVO.setAtchflNm(fileName);

            // 파일 저장
            try (FileOutputStream fos = new FileOutputStream(file)) {
                fos.write(decodedBytes);
            }
        } catch (IOException e) {
            //e.printStackTrace();
            throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "파일 업로 중 오류가 발생 하였습니다."))); // E0000	{0}
        }

	return null;
	}


	/**
	 * 파일 업로드 MultipartFile 방식 파일 저장 후 파일 업로드 vo리턴
	 * @param MultipartFile
	 * @param filePath
	 * @param request
	 * @return ComAtchflVO
	 * @throws Exception
	 */
	@Override
	public ComAtchflVO fileUpload(MultipartFile file, String filePath) throws Exception {
        double fileSize = file.getSize();
        String fileType = file.getContentType();
        String contentType = "";

        // 경로에 폴더 존재 하지 않는 경우 폴더 생성
        Path uploadPath = Paths.get(filePath);
        if (!Files.exists(uploadPath)) {
             Files.createDirectories(uploadPath);
        }

        // 파일 확장자 구하기
        String originalFileName = file.getOriginalFilename();
        if (originalFileName != null) {
        	contentType =  StringUtils.getFilenameExtension(originalFileName);
        }

        long t = System.currentTimeMillis();
		//int r = (int)(Math.random()*1000000);
		int r = ComUtil.generateRandomNum(6);
        String orgnNm = new String(file.getOriginalFilename().getBytes("8859_1"),"utf-8");
        String fileName = ""+t+r + "."+contentType;
	
         // 파일 객체 생성
 	    File uploadfile = new File(filePath, fileName);

 	    byte[] bytes = file.getBytes();

 	    // 파일 업로드
 	    try (FileOutputStream fos = new FileOutputStream(uploadfile)) {
 	        fos.write(bytes); // 파일 쓰기
 	    } catch (IOException e) {
 	        //e.printStackTrace();
 	       throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "파일 업로 중 오류가 발생 하였습니다."))); // E0000	{0}
 	    }

 	    // 업로드 파일 DB생성
 	    ComAtchflVO comAtchflVO = new ComAtchflVO();

		comAtchflVO.setAtchflNm(fileName);
		comAtchflVO.setAtchflOrgnNm(orgnNm);
		comAtchflVO.setAtchflSz(fileSize);
		comAtchflVO.setAtchflPath(filePath);
		comAtchflVO.setAtchflExtnType(fileType);

		return comAtchflVO;
	}


	/**
	 * 파일 조회
	 * @param ComAtchflVO
	 * @return ComAtchflVO
	 * @throws Exception
	 */
	@Override
	public ComAtchflVO selectComAtchfl(ComAtchflVO comAtchflVO) throws Exception {

		ComAtchflVO resultVO = comAtchflMapper.selectComAtchfl(comAtchflVO);
		return resultVO;
	}

	/**
	 * 파일 삭제
	 * @param ComAtchflVO
	 * @return Integer
	 * @throws Exception
	 */
	@Override
	public HashMap<String, Object> deleteComAtchfl(ComAtchflVO comAtchflVO) throws Exception {

		if (0 == comAtchflMapper.deleteComAtchfl(comAtchflVO)) {
			throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "삭제 중 오류가 발생 했습니다."))); // E0000	{0}
		}

		return null;
	}
}
