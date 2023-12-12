package com.at.apcss.am.ordr.vo;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : OrdrRcvHomeplusVO.java
 * @Description : 홈플러스 발주 수신 정보에 대한 VO 클래스
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
public class OrdrHomeplusSVO {
	
	private int sn;
	private String companyCode;
	private String diamondItem;
	private String freeQty;
	private String grQty;
	private String grType;
	private String grTypeNm;
	private String houseCode;
	private String ibsuQty;
	private String itemCode;
	private String itemNm;
	private String piecePrice;
	private String poAmt;
	private String poEaQty;
	private String poNo;
	private String poPrice;
	private String poQty;
	private String poUnit;
	private String priceTax;
	private String seq;
	private String storeCode;
	private String storeNm;
}