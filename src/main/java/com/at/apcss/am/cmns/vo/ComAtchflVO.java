package com.at.apcss.am.cmns.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : ComAtchflVO.java
 * @Description : 공통첨부파일 대한 VO 클래스
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
@Getter
@Setter
public class ComAtchflVO extends ComVO {

	/*
	 * 첨부파일번호
	 * */
	private String atchflNo;
	/*
	 * 부모테이블번호
	 * */
	private String prntsTblNo;
	/*
	 * 부모테이블코드
	 * */
	private String prntsTblSeCd;
	/*
	 * 파일이름
	 * */
	private String atchflNm;
	/*
	 * 파일원본이름
	 * */
	private String atchflOrgnNm;
	/*
	 * 파일사이즈
	 * */
	private double atchflSz;
	/*
	 * 파일타입
	 * */
	private String atchflExtnType;
	/*
	 * 파일저장경로
	 * */
	private String atchflPath;
	/*
	 * 파일인코딩정보
	 * */
	private String base64File;

}
