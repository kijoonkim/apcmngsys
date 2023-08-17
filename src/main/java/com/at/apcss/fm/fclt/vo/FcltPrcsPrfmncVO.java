package com.at.apcss.fm.fclt.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FcltPrcsPrfmncVO extends ComVO{

	private String trgtYr;
	private String apcCd;
	private int sN;
	private String fcltPrcsSeCd;
	private String fcltPrcsTrmtCd;
	private int fcltPrcsTrmtAmt;
}



