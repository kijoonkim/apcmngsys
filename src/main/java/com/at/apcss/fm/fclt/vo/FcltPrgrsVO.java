package com.at.apcss.fm.fclt.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class FcltPrgrsVO extends ComVO{

	private String crtrYr;
	private String apcCd;
	private String apcNm;

	private String itemNm;

	private String prgrsSel;
	private String prgrsVal;

	private String prgrsSeCd;
	private String prgrs1;
	private String prgrs2;
	private String prgrs3;
	private String prgrs4;
	private String prgrs5;
	private String prgrs6;
	private String prgrs7;
	private String prgrs8;
	private String prgrs9;
	private String prgrs10;
	private String prgrs11;
	private String prgrs12;
	private String prgrs13;
	private String prgrs14;
	private String prgrsLast;
	private String cnt;

	private String aprvAtNm;	//승인자 이름 AT
	private String aprvAtUserId;	//승인자 아이디 AT
	private String aprvAtDt;	//승일일자 AT
	private String rjctAtRsn;	//반려사유 AT
	private String rjctAtNm;	//반려자 이름 AT
	private String rjctAtUserId;	//반려자 아이디 AT
	private String rjctAtDt;	//반려일자 AT

	private String aprvCtpvNm;	//승인자 이름 지자체(시도)
	private String aprvCtpvUserId;	//승인자 아이디 지자체(시도)
	private String aprvCtpvDt;	//승일일자 지자체(시도)
	private String rjctCtpvRsn;	//반려사유 지자체(시도)
	private String rjctCtpvNm;	//반려자 이름 지자체(시도)
	private String rjctCtpvUserId;	//반려자 아이디 지자체(시도)
	private String rjctCtpvDt;	//반려일자 지자체(시도)

	private String aprvSggNm;	//승인자 이름 지자체(시군구)
	private String aprvSggUserId;	//승인자 아이디 지자체(시군구)
	private String aprvSggDt;	//승일일자 지자체(시군구)
	private String rjctSggRsn;	//반려사유 지자체(시군구)
	private String rjctSggNm;	//반려자 이름 지자체(시군구)
	private String rjctSggUserId;	//반려자 아이디 지자체(시군구)
	private String rjctSggDt;	//반려일자 지자체(시군구)

	private String aprvAtStts;	//승인상태 AT
	private String aprvCtpvStts;	//승인상태 지자체(시도)
	private String aprvSggStts;	//승인상태 지자체(시군구)

	private String aprvYn;//승인 여부
	private String rjctRsn;//반려 이유

	private String userType;
	private String userId;
}











