package com.at.apcss.am.asst.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AsstMtrVO extends ComVO{

	/**
	APC코드
	**/
	private String apcCd;
	/**
	상품코드
	**/
	private String gdsCd;
	/**
	등급코드
	**/
	private String grdCd;
	/**
	품목코드
	**/
	private String itemCd;
	/**
	재료코드
	**/
	private String mtrlCd;
	/**
	재료그룹ID
	**/
	private String mtrlGroupId;
	/**
	재료명
	**/
	private String mtrlNm;
	/**
	재료유형
	**/
	private String mtrlType;
	/**
	규격코드
	**/
	private String spcfctCd;
	/**
	포장단위코드
	**/
	private String spmtPckgUnitCd;
	/**
	단위
	**/
	private String unitCd;
	/**
	단위무게
	**/
	private double unitWght;
	/**
	사용여부
	**/
	private String useYn;
	/**
	품종코드
	**/
	private String vrtyCd;

	/**
	구분
	**/
	private String gubun;

	/**
	상태
	**/
	private String status;

	/**
	품목명
	**/
	private String itemNm;

	/**
	품종명
	**/
	private String vrtyNm;

	/**
	구성일련번호
	**/
	private String cmpstnSn;

	/**
	구성구분코드
	**/
	private String cmpstnSeCd;

	/**
	구성명
	**/
	private String cmpstnNm;

	/**
	요소자재코드
	**/
	private String elmtMtrlCd;

	/**
	요소자재그룹ID
	**/
	private String elmtMtrlGroupId;

	/**
	기본수량
	**/
	private String bscQntt;

	/**
	기본무게
	**/
	private String bscWght;

	/**
	기본단위
	**/
	private String bscUnitCd;



	/**
	순번
	**/
	private String sn;

	/**
	비고
	**/
	private String rmrk;


	/**
	부자재코드
	**/
	private String asstMtrCd;

	/**
	부자재번호
	**/
	private String asstMtrNo;

	/**
	재고수량
	**/
	private double invntrQntt;

	/**
	재고무게
	**/
	private double invntrWght;

	/**
	입고수량
	**/
	private double wrhsQntt;

	/**
	입고무게
	**/
	private double wrhsWght;

	/**
	입고일자
	**/
	private String wrhsYmd;
	/**
	입고일자From
	**/
	private String wrhsYmdFrom;
	/**
	입고일자To
	**/
	private String wrhsYmdTo;
	/**
	출고수량
	**/
	private double spmtQntt;

	/**
	출고무게
	**/
	private double spmtWght;

	/**
	출고일자
	**/
	private String spmtYmd;
	/**
	출고일자From
	**/
	private String spmtYmdFrom;
	/**
	출고일자To
	**/
	private String spmtYmdTo;

}
