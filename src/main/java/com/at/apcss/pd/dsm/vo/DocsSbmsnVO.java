package com.at.apcss.pd.dsm.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DocsSbmsnVO extends ComVO{
	private String yr;			//등록년도
	private String apoCd;		//조직코드
	private String apoSe;		//조직구분
	private String brno;		//사업자등록번호
	private String crno;		//법인등록번호
	private String corpNm;		//법인명
	private String aprv;		//승인형/육성형 구분
	private String aprvNm;		//승인형/육성형 구분

	private String dcmntAprvSe;	//문서승인 구분값

	private String uoBrno;		//통합조직 사업자등록번호
	private String uoCorpNm;	//통합조직 법인명

	private String prdcrOgnzSn;	//생산자조직 번호
	private String prdcrOgnzNm;	//생산자조직 명

	private String dcmntKnd;	//제출 서류 구분
	private String fileSn;		//파일순번
	private String stts;		//파일 상태
	private String sttsNm;		//파일 상태
	private String sn;			//순번
	private String orgFileNm;	//원본 파일명

	private String itemCd;		//품목코드
	private String itemNm;		//품목명
	private String itemNmList;	//보유 품목 리스트
	private String slctnYr;		//승인연도

	private String rmrk;		//비고

	private String sbmsnYn1;	//제출여부
	private String sttsNm1;		//승인여부
	private String sbmsnYn2;	//제출여부
	private String sttsNm2;		//승인여부
	private String sbmsnYn3;	//제출여부
	private String sttsNm3;		//승인여부
	private String sbmsnYn4;	//제출여부
	private String sttsNm4;		//승인여부
	private String sbmsnYn5;	//제출여부
	private String sttsNm5;		//승인여부
	private String sbmsnYn6;	//제출여부
	private String sttsNm6;		//승인여부

	private int fileCnt;		//서류 리스트 갯수

	private MultipartFile newfile;	//신규 파일

	private List<MultipartFile> newFileList;	//신규 파일
	private List<String> newFileSeList;		//신규 파일 구분
	private List<String> rmrkList;

}
