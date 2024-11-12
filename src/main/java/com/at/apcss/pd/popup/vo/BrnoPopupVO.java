package com.at.apcss.pd.popup.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BrnoPopupVO extends ComVO{

	private String corpNm;			//법인명
	private String brno;			//사업자등록번호
	private String crno;			//법인등록번호
	private String apoCd;			//조직코드
	private String yr;				//등록년도

	private String mno;				//본번
	private String sno;				//부번
	private String slctnYr;			//선정년도
}
