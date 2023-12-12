package com.at.apcss.am.ordr.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : OrdrRcvVO.java
 * @Description : 발주 수신 정보에 대한 VO 클래스
 * @author 신정철
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21  신정철        최초 생성
 * </pre>
 */
@Getter
@Setter
public class OrdrRcvVO extends ComVO {

	/*
	 * APC코드
	 * */
	private String apcCd;
	/*
	 * APC구분코드
	 * */
	private String apcSeCd;

	
	private String orgnUrl;
	
	private String indexUrl;
	private String welcomeUrl;
	
	private String userType;
	private String userId;
	private String userPswd;
	
	private String crtrYmdType;
	private String crtrYmd;
	private String crtrYmdFrom;
	private String crtrYmdTo;
	
	private String lgszMrktCd;
	private String rcptnYmd;
	
	private String rtnCd;
	private String rtnMsg;
}