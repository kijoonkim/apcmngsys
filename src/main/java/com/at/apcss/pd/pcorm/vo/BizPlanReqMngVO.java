package com.at.apcss.pd.pcorm.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BizPlanReqMngVO extends ComVO{
	private String yr;	//등록년도
	private String seq;	//순번
	private String brno;	//사업자번호
	private String corpNm;	//법인명
	private String apoCd;	//산지유통조직코드
	private String apoSe;	//산지유통조직구분
	private String crno;	//법인번호

	private String lastUldDt;	//최종업로드시간

	private String bizPlanSbmsnYn;	//사업계획서 제출여부
	private String bizPlanAprvYn;	//사업계획서 승인여부

	private String sgntrSbmsnYn;	//서명서 제출여부
	private String sgntrAprvYn;	//서명서 승인여부

	private String rmrk;	//비고

	private String bpChk;	//사업계획서/전환서 파일 체크
	private String sChk;	//서명포함 스캔본 파일 체크

	private String dcmntKnd;	//문서 종류
	private String fileSn;	//파일 일련번호
	private String filePathNm;	//파일 경로
	private String orgFileNm;	//원본 파일 명
	private String srvrFileNm;	//서버에 저장된 파일명
	private String fileExtnNm;	//확장자명

	private String aprv;	//승인형 육성형 구분
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

	private String updtSeCd;	//업데이트 구분

}
