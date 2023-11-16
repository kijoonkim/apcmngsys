package com.at.apcss.pd.bsm.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PrdcrCrclOgnMngVO extends ComVO{
	private String apoCd;			//산지유통조직코드
	private String apoNm;			//산지유통조직명
	private String aprv;			//승인육성형구분

	private String ctpv;			//시도
	private String sgg;				//시군
	private String corpNm;			//법인명
	private String brno;			//사업자번호
	private String apoSe;			//참여조직여부
	private String rmk;				//비고

	private String crno;			//법인등록번호
	private String mngmstInfoId;	//경영체번호
	private String mngmstYn;		//경영체여부
	private String nonghyupCd;		//환코드
	private String cmptnInst;		//관할기관

	private String zip;				//우편번호
	private String lotnoAddr;		//지번 주소
	private String lotnoDtlAddr;	//지번 주소 상세
	private String roadNmAddr;		//도로명 주소
	private String roadNmDtlAddr;	//도로명 주소 상세

	private String corpSeCd;		//법인구분
	private String corpDtlSeCd;		//법인형태
	private String corpYr;			//법인설립일
	private String isoHldYn;		//출자출하조직여부
	private String invstNope;		//출자자수
	private String invstExpndFrmerNope;//출자자중 농업인수
	private String invstAmt;		//출자금액

	private String frmerInvstAmt;	//농업인 출자금액
	private String prdcrGrpInvstAmt;//생산자단체 출자금액
	private String locgovInvstAmt;	//지자체 출자금액
	private String etcAmt;			//기타 출자금액

	private String rgllbrNope;		//정규직 종사자 수
	private String dwNope;			//파견직 종사자 수
	private String dlbrrNope;		//일용직 종사자 수

	private String rprsvFlnm;		//대표자성명
	private String rprsvTelno;		//대표자전화번호
	private String rprsvMoblno;		//대표자핸드폰번호
	private String rprsvEml;		//대표자이메일주소

	private String picPosition;		//작성자직위
	private String picFlnm;			//작성자성명
	private String picTelno;		//작성자전화번호
	private String picMoblno;		//작성자핸드폰번호
	private String picEml;			//작성자이메일주소
	private String fxno;			//팩스번호
	private String jisoAt;			//품목농협지소여부

	private String uoBrno;			//통합조직사업자번호
	private String uoNm;			//통합조직명


	private String sysFrstInptUserNm;		//시스템최초입력사용자이름
	private String sysFrstInptDtYmd;		//시스템최초입력일시ymd

	private String sysLastChgUserNm;		//시스템최종변경사용자이름
	private String sysLastChgDtYmd;			//시스템최종변경일시ymd

}
