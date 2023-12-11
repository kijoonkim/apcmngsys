package com.at.apcss.co.sys.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ComSessionVO {
	
	private String sessId;
	private String sessCrtDt;
	private String lastAccessDt;
	private int maxNactvtnIntrvl;
	private String sessExpryDt;
	private String frcdExpryYn;
	private String userId;
	private int cntSess;
}
