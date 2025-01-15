package com.at.apcss.pd.aom.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class LoanVO extends ComVO{
	private String yr;			//등록년도
	private String ctpvNm;		//시도명
	private String sggNm;		//시군구명
	private String corpNm;		//법인명
	private String ognzSeNm;	//조직구분
	private String brno;		//사업자번호
	private String ognzTypeNm;	//조직유형
	private String aclnAmt;		//실대출액
	private String unlnAmt;		//미대출액
	private String lnndngBlnc;	//대출 기말잔액
	private String exprpymntAmt;//상환예정액
	private String uam;			//기사용액
	private String lnSrc;		//대출처
	private String uoBrno;		//통합조직 사업자번호
	private String lnChkYn;		//대출잔액 현황 확인여부
}

