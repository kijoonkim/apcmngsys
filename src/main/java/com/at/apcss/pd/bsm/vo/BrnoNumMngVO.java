package com.at.apcss.pd.bsm.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BrnoNumMngVO extends ComVO{
	private String brno;		//사업자번호
	private String corpNm;		//법인명
	private String mno;			//본번
	private String sno;			//부번
	private String slctnYr;		//선정년도
	private String rmrk;		//비고

}
