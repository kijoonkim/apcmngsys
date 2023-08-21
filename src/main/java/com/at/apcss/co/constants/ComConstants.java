package com.at.apcss.co.constants;

public class ComConstants {

	public final static String PROP_SYS_PRGRM_ID = "sysPrgrmId";

	public final static String PAGINATION_MAP = "paginationMap";

	/* RESULT */
	public final static String PROP_RESULT_STATUS = "resultStatus";
	public final static String PROP_RESULT_CODE = "resultCode";
	public final static String PROP_RESULT_MESSAGE = "resultMessage";
	public final static String PROP_RESULT_MAP = "resultMap";
	public final static String PROP_RESULT_LIST = "resultList";

	public final static String PROP_INSERTED_CNT = "insertedCnt";
	public final static String PROP_UPDATED_CNT = "updatedCnt";
	public final static String PROP_DELETED_CNT = "deletedCnt";

	/* audit column name */
	public final static String PROP_SYS_FRST_INPT_DT = "sysFrstInptDt";
	public final static String PROP_SYS_FRST_INPT_USER_ID = "sysFrstInptUserId";
	public final static String PROP_SYS_FRST_INPT_PRGRM_ID = "sysFrstInptPrgrmId";
	public final static String PROP_SYS_LAST_CHG_DT = "sysLastChgDt";
	public final static String PROP_SYS_LAST_CHG_USER_ID = "sysLastChgUserId";
	public final static String PROP_SYS_LAST_CHG_PRGRM_ID = "sysLastChgPrgrmId";

	/* properties column name */
	public final static String PROP_COL_AUTHRT_ID = "authrtId";


	public final static String RESULT_STATUS_OK = "S";
	public final static String RESULT_STATUS_ERROR = "E";

	public final static String RESULT_CODE_DEFAULT = "E0000";

	public final static String CON_BLANK = "";
	public final static String CON_SPACE = " ";
	public final static String CON_UNDERLINE = "_";
	public final static String CON_DASH = "-";

	public final static String CON_YES = "Y";
	public final static String CON_NONE = "N";

	/* CODE 정보 */

	/* 권한유형 */
	public final static String CON_AUTHRT_TYPE_SYS = "00";
	public final static String CON_AUTHRT_TYPE_AT = "10";
	public final static String CON_AUTHRT_TYPE_ADMIN = "20";
	public final static String CON_AUTHRT_TYPE_USER = "21";

	/* 사용자 유형 */
	public final static String CON_USER_TYPE_SYS = "00";
	public final static String CON_USER_TYPE_AT = "01";
	public final static String CON_USER_TYPE_ADMIN = "10";
	public final static String CON_USER_TYPE_USER = "11";

	/* 사용자 상태 */
	public final static String CON_USER_STTS_STANDBY = "00";
	public final static String CON_USER_STTS_VALID = "01";
	public final static String CON_USER_STTS_LOCKED = "02";
	public final static String CON_USER_STTS_UNUSE = "03";

	public final static String ROW_STS_INSERT = "I";
	public final static String ROW_STS_UPDATE = "U";
	public final static String ROW_STS_DELETE = "D";


	public final static String[] MENU_ID_WGH 						= {"AM_001_001"};				// 계량정보관리
	public final static String[] MENU_ID_WGH_MBL 					= {"AM_001_007"};				// 계량테블릿
	public final static String[] MENU_ID_WGH_IDNTY_DOC_PBLCN 		= {};							// 계량확인서발행

	public final static String[] MENU_ID_RAW_MTR_WRHS 				= {"AM_001_002", "AM_001_003"};	// 원물입고
	public final static String[] MENU_ID_RAW_MTR_WRHS_MBL 			= {"AM_001_008"};				// 원물입고테블릿
	public final static String[] MENU_ID_RAW_MTR_IDENT_TAG_PBLCN 	= {};							// 원물인식표발행

	public final static String[] MENU_ID_PLT_BX						= {"AM_001_004"};				// 팔레트박스

	public final static String[] MENU_ID_RAW_MTR_WRHS_PLAN			= {"AM_001_001"};				// 원물입고계획

	public final static String[] MENU_ID_GDS_WRHS 					= {"AM_001_006"};				// 상품입고

	public final static String[] MENU_ID_SORT_CMND 					= {"AM_002_001", "AM_002_002"};	// 선별지시
	public final static String[] MENU_ID_SORT_CMND_DOC_PBLCN		= {};							// 선별지시서발행

	public final static String[] MENU_ID_PCKG_CMND 					= {"AM_002_003", "AM_002_004"};	// 포장지시
	public final static String[] MENU_ID_PCKG_CMND_DOC_PBLCN 		= {};							// 포장지시서발행

	public final static String[] MENU_ID_SORT 						= {"AM_003_001", "AM_003_002"};	// 선별관리
	public final static String[] MENU_ID_SORT_MBL 					= {"AM_003_003"};				// 선별테블릿
	public final static String[] MENU_ID_SORT_LABEL_PBLCN 			= {};							// 선별라벨발행
	public final static String[] MENU_ID_SORT_IDNTY_DOC_PBLCN 		= {};							// 선별확인서발행

	public final static String[] MENU_ID_PCKG 						= {"AM_004_001", "AM_004_002"};	// 포장관리
	public final static String[] MENU_ID_PCKG_MBL 					= {"AM_004_003"};				// 포장태블릿
	public final static String[] MENU_ID_GDS_LBL_PBLCN 				= {};							// 상품라벨발행

	public final static String[] MENU_ID_SPMT_CMND 					= {"AM_002_005", "AM_002_006"};	// 출하지시
	public final static String[] MENU_ID_SPMT_CMND_DOC_PBLCN		= {};							// 출하지시서발행
	public final static String[] MENU_ID_SPMT						= {"AM_005_003", "AM_005_005"};	// 출하관리
	public final static String[] MENU_ID_SPMT_MBL					= {"AM_005_004"};				// 출하태블릿
	public final static String[] MENU_ID_SPMT_DOC_PBLCN				= {};							// 송품장발행

	public final static String[] MENU_ID_CLCLN						= {"AM_008_001", "AM_008_002"};	// 정산관리

	public final static String[] MENU_ID_OUTORDR					= {"AM_007_001", "AM_007_002"};	// 발주정보관리
	public final static String[] MENU_ID_OUTORDR_PCKG_CMND_LNKG		= {};							// 발주정보포장지시연결
	public final static String[] MENU_ID_TRSM						= {};							// 전송관리
	public final static String[] MENU_ID_SORT_DATA_TRSM				= {};							// 선별정보전송
	public final static String[] MENU_ID_CLCLN_DATA_TRSM			= {};							// 정산자료전송

	public final static String[] MENU_ID_OPRTR						= {"AM_003_004"};				// 생산작업자
	public final static String[] MENU_ID_OPRTR_SORT_PRFMNC_TRSM		= {};							// 생산작업자선별실적전송
	public final static String[] MENU_ID_OPRTR_PCKG_PRFMNC_TRSM		= {};							// 생산작업자포장실적전송

}
