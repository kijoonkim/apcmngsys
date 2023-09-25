package com.at.apcss.fm.popup.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class InvstmntSpmtPopupVO extends ComVO{

	private String mainCode;	//생산유통통합조직코드
	private String mainCodeNm;	//생산유통통합조직명
	private String subCode;		//출자출하조직코드
	private String subCodeNm;	//출자출하조직명
	private String mainGbn;		//생산유통통합조직여부
	private String subGbn;		//출자출하조직여부
	private String gbnNmRemark;	//계약형태

	private String searchCode;	//사업자번호
	private String searchCodeNm;//조직명
}
