package com.at.apcss.co.authrt.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ComDpcnLgnVO extends ComVO {
	/**
	 * 사용자 아이디
	 */
	private String userId;
	/**
	 * 로그인 중복 체크 여부
	 */
	private String dpcnLgnPsbltyYn;
	/**
	 * ip 정보
	 */
	private String ipInfo;
	/**
	 * ip 제한여부
	 */
	private String ipLmtYn;
	/**
	 * 사용여부
	 */
	private String useYn;
}
