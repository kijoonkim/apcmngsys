package com.at.apcss.pd.dsm.vo;

import org.springframework.web.multipart.MultipartFile;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DocsVO extends ComVO{
	private String yr;		//등록년도
	private String seq;		//순번
	private String brno;	//사업자번호
	private String aprv;	//승인형 육성형 구분
	private String corpNm;	//법인명
	private String apoCd;	//산지유통조직코드
	private String apoSe;	//산지유통조직구분
	private String crno;	//법인번호
	private String dcmntKnd;	//제출서류구분
	private String fileSn;	//파일 일련번호
	private String stts;	//상태
	private String sttsNm;	//상태
	private String regNm;	//등록자 이름
	private String regUserId;	//등록자 유저 아이디
	private String regDt;	//등록일자
	private String aprvNm;	//승인자 이름
	private String aprvUserId;	//승인자 유저 아이디
	private String aprvDt;	//승인일자
	private String rjctRsn;	//반려사유
	private String rjctNm;	//반려자 이름
	private String rjctUserId;	//반려자 유저 아이디
	private String rjctDt;	//반려일자
	private String rmrk;	//비고

	private String orgFileNm;	//원본 파일명

	//20241105 추가
	private String sn;			//문서 순번
	private String uoBrno;		//통합조직 사업자번호
	private String prdcrOgnzSn;	//생산자조직 코드

	private MultipartFile newfile;	//신규 파일

}
