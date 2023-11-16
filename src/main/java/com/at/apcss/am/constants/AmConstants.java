package com.at.apcss.am.constants;

public class AmConstants {

	/* 업무별 발번용 TASK ID */
	public final static String TASK_ID_WGH 			= "WT";
	public final static String TASK_ID_WRHS 		= "RT";
	public final static String TASK_ID_WRHS_PLAN	= "RP";
	public final static String TASK_ID_SORT 		= "ST";
	public final static String TASK_ID_SORT_CMND 	= "SO";
	public final static String TASK_ID_PCKG 		= "PK";
	public final static String TASK_ID_PCKG_CMND 	= "PO";
	public final static String TASK_ID_SPMT 		= "DT";
	public final static String TASK_ID_SPMT_CMND 	= "DO";
	public final static String TASK_ID_OUTORDR 		= "OD";


    /**
     *  팔레트/박스 구분 - P:팔레트
     */
    public final static String CON_PLT_BX_SE_CD_PLT = "P";
    /**
     * 팔레트/박스 구분 - B:박스
     */
    public final static String CON_PLT_BX_SE_CD_BX = "B";

    /**
     * APC 구분코드 : 1 농협
     */
    public final static String CON_APC_SE_CD_AGCO = "1";
    /**
     * APC 구분코드 : 2 농업법인
     */
    public final static String CON_APC_SE_CD_CORP = "2";

    /**
     * 정산기준 : 1 원물입고완료
     */
    public final static String CON_CLCLN_CRTR_WRHS = "1";
    /**
     * 정산기준 : 2 선별완료
     */
    public final static String CON_CLCLN_CRTR_SORT = "2";
    /**
     * 정산기준 : 3 포장완료
     */
    public final static String CON_CLCLN_CRTR_PCKG = "3";
    /**
     * 정산기준 : 4 출하완료
     */
    public final static String CON_CLCLN_CRTR_SPMT = "4";

    /**
     * APC 공통코드 : 선별기 SORT_FCLT_CD
     */
    public final static String CON_CD_ID_SORT_FCLT_CD = "SORT_FCLT_CD";
    /**
     * APC 공통코드 : 포장기 PCKG_FCLT_CD
     */
    public final static String CON_CD_ID_PCKG_FCLT_CD = "PCKG_FCLT_CD";
    /**
     * APC 공통코드 : 창고 WAREHOUSE_SE_CD
     */
    public final static String CON_CD_ID_WAREHOUSE_SE_CD = "WAREHOUSE_SE_CD";
    /**
     * APC 공통코드 : 입고구분 WRHS_SE_CD
     */
    public final static String CON_CD_ID_WRHS_SE_CD = "WRHS_SE_CD";
    /**
     * APC 공통코드 : 상품구분 GDS_SE_CD
     */
    public final static String CON_CD_ID_GDS_SE_CD = "GDS_SE_CD";
    /**
     * APC 공통코드 : 대형마켓코드 LGSZ_MRKT_CD
     */
    public final static String CON_CD_ID_LGSZ_MRKT_CD = "LGSZ_MRKT_CD";

    
    
    /**
     * 등급구분코드 : 입고등급 01
     */
    public final static String CON_CD_ID_GRD_SE_CD_WRHS = "01";
    /**
     * 등급구분코드 : 선별등급 02
     */
    public final static String CON_CD_ID_GRD_SE_CD_SORT = "02";
    /**
     * 등급구분코드 : 상품등급 03
     */
    public final static String CON_CD_ID_GRD_SE_CD_GDS = "03";


    /**
     * 상품등급
     */
    public final static String CON_CD_ID_GDS_GRD = "GDS_GRD";

    /**
     * 표준등급
     */
    public final static String CON_CD_ID_STD_GRD = "STD_GRD";

    /**
     * 선별등급
     */
    public final static String CON_CD_ID_SORT_GRD = "SORT_GRD";
    
    /**
     * 재고변경사유코드 : C1 재고보정
     */
    public final static String CON_INVNTR_CHG_RSN_CD_C1 = "C1";
    /**
     * 재고변경사유코드 : P1 투입
     */
    public final static String CON_INVNTR_CHG_RSN_CD_P1 = "P1";
    /**
     * 재고변경사유코드 : P2 투입취소
     */
    public final static String CON_INVNTR_CHG_RSN_CD_P2 = "P2";
    /**
     * 재고변경사유코드 : S1 출고
     */
    public final static String CON_INVNTR_CHG_RSN_CD_S1 = "S1";
    /**
     * 재고변경사유코드 : S2 출고취소
     */
    public final static String CON_INVNTR_CHG_RSN_CD_S2 = "S2";
    /**
     * 재고변경사유코드 : R1 반품
     */
    public final static String CON_INVNTR_CHG_RSN_CD_R1 = "R1";
    /**
     * 재고변경사유코드 : R2 반품취소
     */
    public final static String CON_INVNTR_CHG_RSN_CD_R2 = "R2";
    /**
     * 재고변경사유코드 : T1 이송
     */
    public final static String CON_INVNTR_CHG_RSN_CD_T1 = "T1";
    /**
     * 재고변경사유코드 : X1 폐기
     */
    public final static String CON_INVNTR_CHG_RSN_CD_X1 = "X1";


}
