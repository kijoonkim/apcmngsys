package com.at.apcss.pd.bsm.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BrnoMngVO extends ComVO{
	private String mngNo;			//관리번호
	private String corpNm;			//법인명
	private String brno;			//사업자번호
	private String crno;			//법인등록번호
	private String rmrk;			//비고
	private String indctSeq;		//표시순서

	private String reqDt;			//등록일
	private String clsbizYmd;		//폐업일
}
