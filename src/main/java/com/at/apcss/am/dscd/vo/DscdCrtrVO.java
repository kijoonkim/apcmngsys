package com.at.apcss.am.dscd.vo;

import com.at.apcss.co.sys.vo.ComVO;
import lombok.Getter;
import lombok.Setter;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @Class Name : DscdCrtrVO.java
 * @Description : APC폐기기준에 대한 VO 클래스
 * @author 신정철
 * @since 2023.10.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.10.21  신정철        최초 생성
 * </pre>
 */
@Getter
@Setter
public class DscdCrtrVO extends ComVO {
    /**
     * APC 코드
     */
	private String apcCd;

    /**
     * APC명
     */
    private String apcNm;

    /**
     * 폐기 기준 유형
     */
	private String dscdCrtrType;

    /**
     * 폐기 기준 유형명
     */
	private String dscdCrtrTypeNm;

    /**
     * 기준 유형 순서
     */
	private int crtrTypeSeq;

    /**
     * 기준 코드
     */
	private String crtrCd;

    /**
     * 기준 표시명
     */
	private String crtrIndctNm;

    /**
     * 기준값
     */
	private double crtrVl;

    /**
     * 표시 순서
     */
	private int indctSeq;

    /**
     * 사용유무
     */
	private String useYn;

    /**
     * 기준 사용유무
     */
	private String crtrUseYn;

    /**
     * 상세 일련번호
     */
	private int dtlSn;

    /**
     * 상세 코드
     */
	private String dtlCd;

    /**
     * 상세값
     */
	private double dtlVl;

    /**
     * 상세 표시명
     */
	private String dtlIndctNm;

    /**
     * 상세 기준 코드
     */
	private String dtlCrtrCd;

    /**
     * 기준 상세 사용유무
     */
	private String crtrDtlUseYn;

    /**
     * 상세 연결 코드
     */
	private String dtlLnkgCd;

    /**
     * 기준 비고
     */
	private String crtrRmrk;

    /**
     * 순서
     */
	private String seq;

    /**
     * 상세 품목 코드
     */
	private String dtlItemCd;

    /**
     * 상세 품목명
     */
	private String dtlItemNm;

    /**
     * 상세 품종 코드
     */
    private String dtlVrtyCd;

    /**
     * 상세 품종명
     */
    private String dtlVrtyNm;

    /**
     * 기준 순서
     */
	private int crtrSeq;

    /**
     * 기준 상세 순서
     */
	private int crtrDtlSeq;

    /**
     * 기준 상세 품목 순서
     */
	private int crtrDtlItemSeq;

    /**
     * 최대 상세 일련번호
     */
	private int maxDtlSn;

	private boolean needsInsert;

    /**
     * 폐기 일자
     */
    private String dscdYmd;

    /**
     * 폐기 시작 일자
     */
    private String dscdYmdTo;

    /**
     * 폐기 끝 일자
     */
    private String dscdYmdFrom;

    /**
     * 폐기 일련번호 (폐기 순번)
     */
    private int dscdSn;

    /**
     * 재고 구분 코드
     */
    private String invntrSeCd;

    /**
     * 재고 번호
     */
    private String invntrNo;
    private String pckgno;

    /**
     * 재고 일련번호 (재고 순번)
     */
    private int invntrSn;

    /**
     * 대표 생산자 코드
     */
    private String rprsPrdcdCd;

    /**
     * 생산자 코드
     */
    private String prdcrCd;

    /**
     * 생산자명
     */
    private String prdcrNm;

    /**
     * 품목 코드
     */
    private String itemCd;

    /**
     * 품목명
     */
    private String itemNm;

    /**
     * 품종 코드
     */
    private String vrtyCd;

    /**
     * 품종명
     */
    private String vrtyNm;

    /**
     * 등급 코드
     */
    private String grdCd;

    /**
     * 등급 코드
     */
    private String sortGrdCd;

    /**
     * 규격 코드
     */
    private String spcfctCd;

    /**
     * 출고 포장 단위 코드 (출하 포장 단위 코드)
     */
    private String spmtPckgUnitCd;

    /**
     * 상품 구분 코드
     */
    private String gdsSeCd;

    /**
     * 입고 구분 코드
     */
    private String wrhsSeCd;

    /**
     * 창고 구분 코드
     */
    private String warehouseSeCd;

    /**
     * 폐기 수량
     */
    private int dscdQntt;
    private int invntrQntt;

    /**
     * 폐기 중량 (폐기 무게)
     */
    private double dscdWght;
    private double invntrWght;

    /**
     * 폐기 사유
     */
    private String dscdRsn;

    /**
     * 폐기 번호
     */
    private String dscdNo;

    /**
     * 폐기 실적 목록
     */
    private List<DscdCrtrVO> dscdPrfmncList;

    public List<DscdCrtrVO> getDscdPrfmncList() {
        return dscdPrfmncList;
    }

    public void setDscdPrfmncList(List<DscdCrtrVO> dscdPrfmncList) {
        this.dscdPrfmncList = dscdPrfmncList;
    }

}
