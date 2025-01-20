package com.at.apcss.am.trnsf.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class InvntrMngVO extends ComVO{
	
	/** * 
	 * APC 코드 
	 * */    
	private String apcCd; 
	
	/** *
	 *  재고 기준 유형
	 *   */     
	private String invntrCrtrType; 
	
	/** *
	 *  기준 코드 
	 *  */ 
	private String crtrCd;
	
	/** *
	 *  기준 값
	 *   */     
	private int crtrVl; 
	
	/** *
	 *  기준 표시명
	 *   */     
	private String crtrIndctNm;
	
	/** 
	 * * 표시 순서 
	 * */     
	private int indctSeq; 
	
	/** *
	 *  사용 여부
	 *   */     
	private String useYn; 
	
	/** *
	 *  삭제 여부
	 *   */     
	private String delYn; 

   /** *
    *  상세 일련번호
    *   */    
   private int dtlSn;
   /** *
    *  상세 코드 
    *  */  
   private String dtlCd;
   
   /** *
    *  상세 값
    *   */     
   private String dtlVl; 
   
   /** *
    *  상세 표시명 
    *  */    
   private String dtlIndctNm;
   
   /** *
    *  시스템 최초 입력 일시
    *   */ 
   private String sysFrstInptDt; 
   
   /** *
    *  시스템 최초 입력 사용자 ID 
    *  */  
   private String sysFrstInptUserId;
   
   /** *
    *  시스템 최초 입력 프로그램 ID 
    *  */   
   private String sysFrstInptPrgrmId;
   
   /** *
    *  시스템 최종 변경 일시 
    *  */     
   private String sysLastChgDt; 
   
   /** *
    *  시스템 최종 변경 사용자 ID 
    *  */   
   private String sysLastChgUserId;
   
   /** *
    *  시스템 최종 변경 프로그램 ID 
    *  */   
   private String sysLastChgPrgrmId;

	/**
	 구분
	 **/
	private String gubun;
}
