package com.at.apcss.am.cmns.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : PltBxVO.java
 * @Description : 팔레트/박스 정보에 대한 VO 클래스
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
@EqualsAndHashCode(callSuper = false)
public class PltBxVO extends ComVO {
	/**
	 * APC코드
	 */
	private String apcCd;
	/**
	 * 팔레트/박스 구분코드
	 */
	private String pltBxSeCd;
	/**
	 * 팔레트/박스 구분명칭
	 */
	private String pltBxSeNm;
	/**
	 * 팔레트/박스 코드
	 */
	private String pltBxCd;
	/**
	 * 팔레트/박스 명칭
	 */
	private String pltBxNm;
	/**
	 * 단중
	 */
	private double unitWght;
	/**
	 * 단위
	 */
	private String unitCd;
	/**
	 * 단위명
	 */
	private String unitNm;
	/**
	 * 사용유무
	 */
	private String useYn;
	/**
	 * 비고(대여업체)
	 */
	private String rmrk;

	/**
	 * 기초재고수량 = 전일재고수량
	 */
	private int bssInvntrQntt;

	/**
	 * 기초재고중량 = 전일재고중량
	 */
	private double bssInvntrWght;

	/**
	 * 입고수량
	 */
	private int wrhsQntt;

	/**
	 * 입고중량
	 */
	private double wrhsWght;

	/**
	 * 출고수량
	 */
	private int spmtQntt;

	/**
	 * 출고중량
	 */
	private double spmtWght;

	/**
	 * 현재고수량
	 */
	private int invntrQntt;

	/**
	 * 현재고중량
	 */
	private double invntrWght;

	/**
	 * 대여업체명
	 */
	private String pltCnptNm;
}
