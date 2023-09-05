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
}
