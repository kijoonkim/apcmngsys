package com.at.apcss.am.dscd.vo;

import com.at.apcss.co.sys.vo.ComVO;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DscdPrfmncVO extends ComVO {

    /**
     * APC코드
     * */
    private String apcCd;

    /**
     *  입고번호
     *  */
    private String wrhsNo;

    /**
     * 팔레트번호
     * */
    private String pltNo;

    /**
     *  입고일자
     *  */
    private String wrhsYmd;

    /**
     * 입고 시작일자
     */
    private String invntrYmdFrom;

    /**
     * 입고 종료일자
     */
    private String invntrYmdTo;

    /**
     * 생산자코드
     * */
    private String prdcrCd;

    /**
     *  품목코드
     *  */
    private String itemCd;

    /**
     * 품종코드
     * */
    private String vrtyCd;

    /**
     *  상품구분코드
     *  */
    private String gdsSeCd;

    /**
     * 입고구분코드
     * */
    private String wrhsSeCd;

    /**
     *  운송구분코드
     *  */
    private String trsprtSeCd;

    /**
     * 창고구분코드
     * */
    private String warehouseSeCd;

    /**
     * 박스종류
     * */
    private String bxKnd;

    /**
     *  삭제여부
     *  */
    private String delYn;

    /**
     * 시스템최초입력일시
     * */
    private String sysFrstInptDt;

    /**
     *  시스템최초입력사용자아이디
     *  */
    private String sysFrstInptUserId;

    /**
     * 시스템최초입력프로그램아이디
     * */
    private String sysFrstInptPrgrmId;

    /**
     *  시스템최종변경일시
     *  */
    private String sysLastChgDt;

    /**
     * 시스템최종입력사용자아이디
     * */
    private String sysLastChgUserId;

    /**
     *  시스템최종변경프로그램아이디
     *  */
    private String sysLastChgPrgrmId;

    /**
     * 등급코드
     * */
    private String grdCd;

    /**
     * 생산연도
     * */
    private String prdctnYr;

    /**
     *  등급확인자
     *  */
    private String grdIdntyPrsn;

    /**
     * 비고
     * */
    private String rmrk;

    /**
     *  입고수량
     *  */
    private int wrhsQntt;

    /**
     * 입고중량
     * */
    private double wrhsWght;

    /**
     *  투입수량
     *  */
    private int inptQntt;

    /**
     * 투입중량
     * */
    private double inptWght;

    /**
     *  재고수량
     *  */
    private int invntrQntt;

    /**
     * 재고중량
     * */
    private double invntrWght;

    /**
     *  재고변경사유코드
     *  */
    private String invntrChgRsnCd;

    /**
     * 이송수량
     * */
    private int trnsfQntt;

    /**
     *  이송중량
     *  */
    private double trnsfWght;

    /**
     * 투입진행수량
     * */
    private int inptPrgrsQntt;

    /**
     *  투입진행중량
     *  */
    private double inptPrgrsWght;

    /**
     * 처리수량
     * */
    private int prcsQntt;

    /**
     * 처리중량
     * */
    private double prcsWght;

    /**
     *  처리번호
     *  */
    private String prcsNo;

    /**
     * 처리유형
     * */
    private String prcsType;

    /**
     *  재고상태코드
     *  */
    private String invntrSttsCd;

    /**
     * 저장위치코드
     * */
    private String strgLoctnCd;

    /**
     *  검수자
     *  */
    private String chckr;

    /**
     * 규격코드
     * */
    private String spcfctCd;

    /**
     *  원산지코드
     *  */
    private String plorCd;

    /**
     * 대표 생산자명
     */
    private String rprsPrdcrNm;

    /**
     * 생산자명
     */
    private String prdcrNm;

    /**
     * 품목명
     */
    private String itemNm;

    /**
     * 품종명
     */
    private String vrtyNm;

    /**
     * 규격명
     */
    private String spcfctNm;

    /**
     * 등급명
     */
    private String grdNm;

    /**
     * 창고명
     */
    private String warehouseSeNm;

    /**
     * 상품명
     */
    private String gdsNm;

    /**
     * 입고수량
     */
    private int qntt;

    /**
     * 입고중량
     */
    private double wght;

    /**
     * 폐기 수량
     */
    private int dscdQntt;

    /**
     * 폐기 중량
     */
    private double dscdWght ;

    /**
     * 폐기일자
     */
    private String dscdYmd;

    /**
     * 폐기시작일자
     */
    private String dscdYmdFrom;

    /**
     * 폐기종료일자
     */
    private String dscdYmdTo;

    /**
     * 폐기순번
     */
    private int dscdSn;

    /**
     * 상세일련번호
     */
    private String dtlSn;

    /**
     * 재고구분코드
     */
    private String invntrSeCd;

    /**
     * 재고구분코드값명
     */
    private String invntrSeCdNm;

    /**
     * 재고번호
     */
    private String invntrno;

    /**
     * 재고순번
     */
    private int invntrSn;

    /**
     * 출하포장단위코드
     */
    private String spmtPckgUnitCd;

    /**
     * 폐기사유
     */
    private String dscdRsn;

    /**
     * 포장번호
     */
    private String pckgno;

    /**
     * 포장일자
     */
    private String pckgYmd;

    /**
     * 설비코드
     */
    private String fcltCd;

    /**
     * 대표생산자코드
     */
    private String rprsPrdcrCd;

    /**
     * 상품등급
     */
    private String gdsGrd;

    /**
     * 포장구분코드
     */
    private String pckgSeCd;

    /**
     * 상품코드
     */
    private String gdsCd;

    /**
     * 포장순번
     */
    private int pckgSn;

    /**
     * 포장수량
     */
    private int pckgQntt;

    /**
     * 포장중량
     */
    private int pckgWght;

    /**
     * 출하수량
     */
    private int spmtQntt;

    /**
     * 출하중량
     */
    private int spmtWght;

    /**
     * 매입처명
     */
    private String prchsptNm;

    /**
     * 반품수량
     */
    private int rtnGdsQntt;

    /**
     * 반품중량
     */
    private int rtnGdsWght;

    /**
     * 처리순번
     */
    private int prcsSn;

    /**
     * 포장선별번호
     */
    private String pckgSortNo;

    /**
     * 포장선별순번
     */
    private int pckgSortSn;

    /**
     * 거래처코드
     */
    private String cnptCd;

    /**
     * 입수
     */
    private int bxGdsQntt;

    /**
     * 선별번호
     */
    private String sortno;

    /**
     * 투입일자
     */
    private String inptYmd;

    /**
     * 선별순번
     */
    private int sortSn;

    /**
     * 선별수량
     */
    private int sortQntt;

    /**
     * 선별중량
     */
    private double sortWght;

    /**
     * 포장여부
     */
    private String pckgYn;

    /**
     * 선별번호+선별순번
     */
    private String sortnoSn;

    /**
     * 선별일자
     */
    private String sortYmd;

    /**
     * 포장번호+포장순번
     */
    private String pckgnoSn;

}
