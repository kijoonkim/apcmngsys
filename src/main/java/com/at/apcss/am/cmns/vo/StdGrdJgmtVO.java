package com.at.apcss.am.cmns.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class StdGrdJgmtVO extends StdGrdVO{

	/*
	 * 등급코드
	 * */
	private String grdCd;
	/*
	 * 등급명
	 * */
	private String grdNm;
	/*
	 * 등급값
	 * */
	private int grdVl;
	/*
	 * 판정유형
	 * */
	private String jgmtType;
	/*
	 * 판정최소값
	 * */
	private int jgmtMinVl;
	/*
	 * 판정최대값
	 * */
	private int jgmtMaxVl;
	/*
	 * 순번
	 * */
	private int sn;

}
