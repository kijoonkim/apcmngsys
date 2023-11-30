package com.at.apcss.fm.bbs.vo;

import org.springframework.web.multipart.MultipartFile;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BbsFileVO extends ComVO{

	private String bbsNo;

	private String atchflno; /* 첨부파일 번호(PK) */
	private String atchflPrntsno; /* 부모글의 PK */
	private String atchflNm; /* 실제 저장된 파일명 */
	private String atchflOrgnNm; /* 사용자가 올린 원래 파일명 */
	private long atchflSz; /* 파일 사이즈   1024,  1024*1024 */
	private String atchflExtnType; /* 컨텐츠 타입 */
	private String atchflPath; /* 저장 경로(board/2020) */
	private int atchflDwnldNmtm; /* 다운로드 횟수 */




}
