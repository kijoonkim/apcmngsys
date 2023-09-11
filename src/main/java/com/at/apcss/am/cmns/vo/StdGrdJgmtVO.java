package com.at.apcss.am.cmns.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class StdGrdJgmtVO extends StdGrdVO{
	/*
	 * 판정유형
	 * */
	private String jgmtType;
	/*
	 * 판정값
	 * */
	private int jgmtVl;
	/*
	 * 판정최소값
	 * */
	private int jgmtMinVl;
	/*
	 * 판정최대값
	 * */
	private int jgmtMaxVl;
}
