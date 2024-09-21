package com.at.apcss.am.cmns.service;

import java.util.HashMap;

import org.springframework.web.multipart.MultipartFile;

import com.at.apcss.am.cmns.vo.ComAtchflVO;

/**
 * 첨부파일 Service 인터페이스
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
public interface ComAtchflService {

	/**
	 * 첨부파일 등록
	 * @param comAtchflVO
	 * @return
	 * @throws Exception
	 */
	public int insertComAtchfl(ComAtchflVO comAtchflVO) throws Exception;
	/**
	 * 첨부파일 업로드 VO 방식
	 * @param comAtchflVO
	 * @return HashMap<String, Object>
	 * @throws Exception
	 */
	public HashMap<String, Object> fileUpload(ComAtchflVO comAtchflVO) throws Exception;

	/**
	 * 첨부파일 업로드 MultipartFile 방식
	 * @param multipartFile
	 * @return HashMap<String, Object>
	 * @throws Exception
	 */
	public ComAtchflVO fileUpload(MultipartFile multipartFile, String filePath) throws Exception;

	/**
	 * 첨부파일 파일 정보 갖고 오기
	 * @param comAtchflVO
	 * @return ComAtchflVO
	 * @throws Exception
	 */
	public ComAtchflVO selectComAtchfl(ComAtchflVO comAtchflVO) throws Exception;

	/**
	 * 첨부파일 삭제
	 * @param comAtchflVO
	 * @return HashMap<String, Object>
	 * @throws Exception
	 */
	public HashMap<String, Object> deleteComAtchfl(ComAtchflVO comAtchflVO) throws Exception;


}
