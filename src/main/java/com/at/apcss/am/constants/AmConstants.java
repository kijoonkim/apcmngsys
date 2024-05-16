package com.at.apcss.am.constants;

public class AmConstants {

	/* 업무별 발번용 TASK ID */
	public final static String TASK_ID_WGH 			= "WT";
	public final static String TASK_ID_WRHS 		= "RT";
	public final static String TASK_ID_WRHS_PRCS	= "RR";		// 원물재처리
	public final static String TASK_ID_WRHS_PLAN	= "RP";
	public final static String TASK_ID_BFFA_WRHS 	= "BR";		// 사전입고
	
	public final static String TASK_ID_SORT 		= "ST";
	public final static String TASK_ID_SORT_CMND 	= "SO";
	public final static String TASK_ID_PCKG 		= "PK";
	public final static String TASK_ID_PCKG_CMND 	= "PO";
	public final static String TASK_ID_SPMT 		= "DT";
	public final static String TASK_ID_SPMT_CMND 	= "DO";
	public final static String TASK_ID_OUTORDR 		= "OD";


	public final static String PROP_VRTY_LIST		= "vrtyList";
	
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
     * 입고등급
     */
    public final static String CON_CD_ID_WRHS_GRD = "WRHS_GRD";
    
    
    
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
     * 재고변경사유코드 : P1 처리
     */
    public final static String CON_INVNTR_CHG_RSN_CD_P3 = "P3";
    /**
     * 재고변경사유코드 : P2 처리취소
     */
    public final static String CON_INVNTR_CHG_RSN_CD_P4 = "P4";
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

    /**
     * 처리구분 : RR 원물재처리
     */
    public final static String CON_PRCS_TYPE_RAW_MTR_REPRCS = "RR";
    
    
    /**
     * 표준등급유형 : RT 비율(%)
     */
    public final static String CON_STD_GRD_TYPE_RT = "RT";
    /**
     * 표준등급유형 : WT 중량(kg)
     */
    public final static String CON_STD_GRD_TYPE_WT = "WT";
    /**
     * 표준등급유형 : VL 등록 값
     */
    public final static String CON_STD_GRD_TYPE_VL = "VL";
    
    /**
     * 표준등급 EMPTY
     */
    public final static String CON_STD_GRD_CD_EMPTY = "*";
    
    
    /**
     * 처리구분코드: S 성공
     */
    public final static String CON_PRCS_SE_CD_SUCCESS = "S";
    
    /**
     * 처리구분코드: P 미결
     */
    public final static String CON_PRCS_SE_CD_PENDING = "P";
    
    /**
     * 처리구분코드: E 오류
     */
    public final static String CON_PRCS_SE_CD_ERROR = "E";
    
    /**
     * 발주유형: 1 일반
     */
    public final static String CON_OUTORDR_TYPE_NORMAL = "1";
    /**
     * 발주유형: 2 온라인
     */
    public final static String CON_OUTORDR_TYPE_ONLINE = "2";
    /**
     * 발주유형: 3 대형마트
     */
    public final static String CON_OUTORDR_TYPE_MART = "3";

    /**
     * 대형마트 코드: 11	이마트
     */
    public final static String CON_LGSZ_MRKT_CD_EMART = "11";
    /**
     * 대형마트 코드: 21	홈플러스
     */
    public final static String CON_LGSZ_MRKT_CD_HOMEPLUS = "21";
    /**
     * 대형마트 코드: 31	롯데마트
     */
    public final static String CON_LGSZ_MRKT_CD_LOTTEMART = "31";
    /**
     * 대형마트 코드: 41	GS리테일
     */
    public final static String CON_LGSZ_MRKT_CD_GSRETAIL = "41";

    /**
     * 상품구분코드 기본:
     */
    public final static String CON_GDS_SE_CD_DEFAULT = "1";
    public final static String CON_GDS_SE_CD_NORMAL = "1";
    public final static String CON_GDS_SE_CD_GAP = "2";
    public final static String CON_GDS_SE_CD_PESTICIDE_FREE = "3";
    public final static String CON_GDS_SE_CD_ORGANIC = "4";
    public final static String CON_GDS_SE_CD_LOW_CARBON = "5";
    
    public final static String CON_WRHS_SE_CD_DEFAULT = "3";
    public final static String CON_WRHS_SE_CD_PURCHASE = "1";
    public final static String CON_WRHS_SE_CD_CONSIGNMENT = "2";
    public final static String CON_WRHS_SE_CD_ENSURE_MINIMUM = "3";
    public final static String CON_WRHS_SE_CD_GOODS = "4";

    public final static String CON_TRSPRT_SE_CD_DEFAULT = "3";
    public final static String CON_TRSPRT_SE_CD_SELF = "1";
    public final static String CON_TRSPRT_SE_CD_SERVICE = "2";
    public final static String CON_TRSPRT_SE_CD_ETC = "3";
    
    
    public final static String CON_WRHS_SPMT_SE_CD_WRHS = "1";
    public final static String CON_WRHS_SPMT_SE_CD_SPMT = "2";
    
    public final static String CON_WRHS_SPMT_TYPE_WRHS = "RT";
    public final static String CON_WRHS_SPMT_TYPE_SPMT = "DT";
    public final static String CON_WRHS_SPMT_TYPE_TRFT = "TF";
    
    public final static String CON_INVNTR_VL_MNG_TYPE_QNTT = "QNTT";
    
    
    /* 전송기기상태코드 */
    public final static String CON_TRSM_MAT_STTS_CD_STANDBY = "S0";
    public final static String CON_TRSM_MAT_STTS_CD_PROCESS = "P0";
    public final static String CON_TRSM_MAT_STTS_CD_NONE = "E0";
    public final static String CON_TRSM_MAT_STTS_CD_DISCONNECT = "E1";


    /* 연계 종류 (LINK_KND) */
    /**
     * 연계 종류: W:계량
     */
    public final static String CON_LINK_KND_WGH = "W";
    /**
     * 연계 종류: R:입고
     */
    public final static String CON_LINK_KND_RCPT = "R";
    /**
     * 연계 종류: S:선별
     */
    public final static String CON_LINK_KND_SORT = "S";
    /**
     * 연계 종류: P:포장
     */
    public final static String CON_LINK_KND_PCKG = "P";
    /**
     * 연계 종류: D:출하
     */
    public final static String CON_LINK_KND_SPMT = "D";
    
    
    /* 연계 상태 (LINK_STTS) 
     * R0:요청완료, R9:요청취소
     * S0:송신완료, S1:송신진행, S9:송신취소
     * P0:처리완료, P1:처리진행, P9:처리취소
     * */
    public final static String CON_LINK_STTS_REQ_DONE = "R0";
    public final static String CON_LINK_STTS_REQ_CNCL = "R9";
    
    public final static String CON_LINK_STTS_SND_DONE = "S0";
    public final static String CON_LINK_STTS_SND_ONGOING = "S1";
    public final static String CON_LINK_STTS_SND_CNCL = "S9";
    
    public final static String CON_LINK_STTS_PRCS_DONE = "P0";
    public final static String CON_LINK_STTS_PRCS_ONGOING = "P1";
    public final static String CON_LINK_STTS_PRCS_CNCL = "P9";
    
    public final static String CON_INVNTR_STTS_CD_FRCS_SPMT = "D1";		// 출하 강제 생성
    public final static String CON_INVNTR_STTS_CD_FRCS_PCKG = "P1";		// 포장 강제 생성
    public final static String CON_INVNTR_STTS_CD_FRCS_SORT = "S1";		// 선별 강제 생성
    public final static String CON_INVNTR_STTS_CD_CHNG_SPMT = "D2";		// 출하 변경

}
