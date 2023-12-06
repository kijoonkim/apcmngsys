package com.at.apcss.fm.popup.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MngmstInfoIdPopupVO extends ComVO{

	private String rprsvNm;			//경영주
	private String rprsvAddr;		//대표주소
	private String admstOwnrCorpNm;	//법인명
	private String brno;			//법인등록번호
	private String mngmstRegno;		//경영체번호

	private String lotnoAddr;		//지번주소

}
