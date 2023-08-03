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
	
	public final static String RESULT_CODE_DEFAULT = "E0002";
	
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
	
	
	
	
}
