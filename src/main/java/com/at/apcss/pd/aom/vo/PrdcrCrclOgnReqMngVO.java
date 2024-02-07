package com.at.apcss.pd.aom.vo;

import java.util.List;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PrdcrCrclOgnReqMngVO extends ComVO{
	private String apoCd;
	private String apoSe;
	private String frmhsHld;
	private String frmhsHldYn;
	private String frmhsCnt;
	private String wrtYn;
	private String userType;

	private String cmptnInst;
	private String ctpv;
	private String sgg;
	private String corpSeCd;
	private String corpDtlSeCd;
	private String brno;
	private String crno;
	private String corpNm;
	private String picFlnm;
	private String mngmstYn;

	private String lotnoAddr;
	private String lotnoDtlAddr;
	private String zip;
	private String roadNmAddr;
	private String roadNmDtlAddr;

	private String corpFndnDay;
	private String invstNope;
	private String invstExpndFrmerNope;
	private String invstAmt;

	private String frmerInvstAmt;
	private String prdcrGrpInvstAmt;
	private String locgovInvstAmt;
	private String etcInvstAmt;

	private String rgllbrNope;
	private String dwNope;
	private String dlbrrNope;

	private String untyYn;
	private String uoNm;
	private String uoBrno;
	private String untyYr;

	private String isoHldYn;
	private String aprv;

	private String uoCd;
	private String yr;
	private String yrChk;
	private String aplyDay;
	private String corpDdlnSeCd;//법인체 마감
	private String rawMtrEnsr;//값 확인용
	private String rawMtrEnsrSigunCnt;
	private String rawMtrEnsrCtpvCnt;
	private String ctpvNm;
	private String sigunNm;
	private String pruoFundAplyAmt;
	private String isoFundAplyAmt;

	private String aplyTrgtSe;

	private String stbltYnNm; //적합품목
	private String stbltHldYn; //적합품목 보유 여부
	private String stbltYnBrno;//통합조직 사용자로 적합품목 검색시 사용

	private String sysFrstInptUserIdNm;
	private String sysLastChgUserIdNm;
	private String sysFrstInptDtYmd;
	private String sysLastChgDtYmd;

	private String ctgryNm;
	private String sttgUpbrItemNm;
	private String itemNm;
	private String addr;
	private String frmerInvstAmtRt;
	private String nopeTot;
	private String fundAplyAmtTot;
	private String picTelno;
	private String picMoblno;
	private String picEml;

	private List<GpcVO> gpcList;
}

