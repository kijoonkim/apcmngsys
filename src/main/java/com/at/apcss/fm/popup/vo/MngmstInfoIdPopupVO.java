package com.at.apcss.fm.popup.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MngmstInfoIdPopupVO extends ComVO{

	private String corpNm;			//법인명
	private String mngmstInfoId;	//경영체번호
	private String mngmstYn;		//경영체여부
	private String crno;			//법인등록번호
	private String rprsvFlnm;		//경영주 //임시로 넣은것 컬럼확인후 수정할것

	private String lotnoAddr;		//지번주소

}
