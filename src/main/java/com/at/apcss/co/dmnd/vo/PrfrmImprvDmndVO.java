package com.at.apcss.co.dmnd.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;
/**
 * @Class Name : PrfrmImprvDmndVO.java
 * @Description : 프로그램 개선요청에 대한 VO 클래스
 * @author 김호
 * @since 2023.09.20
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.09.20  김호        최초 생성
 * </pre>
 */
@Getter
@Setter
public class PrfrmImprvDmndVO extends ComVO{

	/*
	 * APC코드
	 * */
	private String apcCd;
	/*
	 * 요청일자
	 * */
	private String dmndYmd;
	/*
	 * 요청시작일자
	 * */
	private String dmndYmdFrom;
	/*
	 * 요청종료일자
	 * */
	private String dmndYmdTo;
	/*
	 * 순번
	 * */
	private String sn;
	/*
	 * 화면ID
	 * */
	private String menuId;
	private String menuNm;
	/*
	 * 요청자ID
	 * */
	private String userId;
	private String userNm;
	/*
	 * 요청내용
	 * */
	private String imprvDmndMttr;
	/*
	 * 조치예정일
	 * */
	private String actnPrnmntYmd;
	/*
	 * 조치예정자
	 * */
	private String pic;
	private String picNm;
	/*
	 * 조치결과
	 * */
	private String actnRslt;
	/*
	 * 조치상태
	 * */
	private String dmndStts;

}
