package com.at.apcss.pd.dsm.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DocsFileVO extends ComVO{
	private String yr;			//등록년도
	private String apoSe;		//조직구분
	private String brno;		//사업자번호
	private String uoBrno;		//통합조직 사업자번호
	private String prdcrOgnzSn;	//생산자조직 번호
	private String sn;			//문서 종류 순서
	private String dcmntKnd;	//문서 종류

	private String fileSn;		//파일 일련번호
	private String filePathNm;	//파일 경로
	private String orgFileNm;	//원본파일명
	private String srvrFileNm;	//서버파일명
	private long fileSz;		//파일 사이즈
	private String fileExtnNm;	//확장자
	private String dwnldCnt;	//다운로드 횟수

}
