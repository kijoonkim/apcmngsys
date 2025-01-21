package com.at.apcss.am.invntr.vo;

import java.util.List;
import java.util.stream.Collectors;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : InvntrVO.java
 * @Description : 재고정보에 대한 VO 클래스
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
public class InvntrAiMngVO extends ComVO {

	/**
	APC코드
	**/
	private String apcCd;

	/**
	재고실사기준유형
	**/
	private String aiCrtrType;

	/**
	기준코드
	**/
	private String crtrCd;

	/**
	기준값
	**/
	private int crtrVl;

	/**
	기준표시명
	**/
	private String crtrIndctNm;

	/**
	표시순서
	**/
	private int indctSeq;

	/**
	사용여부
	**/
	private String useYn;

	/**
	계획일자
	**/
	private String planYmd;
	/**
	계획순번
	**/
	private String planSn;
	/**
	계획순번
	**/
	private String planno;
	/**
	계획명
	**/
	private String planNm;
	/**
	계획비고
	**/
	private String planRmrk;

	/**
	품목
	**/
	private String itemCd;
	/**
	품종
	**/
	private String vrtyCd;
	/**
	창고
	**/
	private String warehouseSeCd;

	/**
	실사여부
	**/
	private String aiYn;


	/**
	사용여부
	**/
	private String gubun;

	/**
	실사일자
	**/
	private String aiYmd;
	/**
	실사일련번호
	**/
	private String aiSn;
	/**
	상세일련번호
	**/
	private int dtlSn;
	/**
	생산자코드
	**/
	private String prdcrCd;
	/**
	등급코드
	**/
	private String grdCd;

	/**
	등급명
	**/
	private String grdNm;
	/**
	규격코드
	**/
	private String spcfctCd;
	/**
	출하포장단위코드
	**/
	private String spmtPckgUnitCd;
	/**
	출하포장단위명
	**/
	private String spmtPckgUnitNm;
	/**
	상품구분코드
	**/
	private String gdsSeCd;
	/**
	입고구분코드
	**/
	private String wrhsSeCd;
	/**
	재고수량
	**/
	private int invntrQntt;
	/**
	재고중량
	**/
	private double invntrWght;

	/**
	재고구분코드
	**/
	private double invntrSeCd;







}
