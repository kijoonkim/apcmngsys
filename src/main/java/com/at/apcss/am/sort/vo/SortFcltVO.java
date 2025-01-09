package com.at.apcss.am.sort.vo;

import com.at.apcss.co.sys.vo.ComVO;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

/**
 * @Class Name : SortPrfmncVO.java
 * @Description : 선별설비정보에 대한 VO 클래스
 * @author 박승진
 * @since 2024.09.03
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.09.03  박승진        최초 생성
 * </pre>
 */
@Getter
@Setter
public class SortFcltVO extends ComVO {
	 /**
	APC코드
	**/
	private String apcCd;
	 /**
	시설유형
	**/
	private String fcltType;
	 /**
	시설코드
	**/
	private String fcltCd;
	 /**
	시설명
	**/
	private String fcltNm;
	 /**
	시설설명
	**/
	private String fcltExpln;
	 /**
	가동시간
	**/
	private String oprtngHr;
	 /**
	비가동시간
	**/
	private String nOprtngHr;
	 /**
	시간단위
	**/
	private String hrUnit;
	 /**
	시설용량
	**/
	private String fcltCpct;
	 /**
	용량단위
	**/
	private String cpctUnit;
	 /**
	무게최소
	**/
	private String wghtMin;
	 /**
	무게최대
	**/
	private String wghtMax;
	 /**
	무게단위
	**/
	private String wghtUnit;
	 /**
	처리횟수
	**/
	private String prcsNmtm;
	 /**
	시작일자
	**/
	private String bgngYmd;
	 /**
	종료일자
	**/
	private String endYmd;
	 /**
	시설비고
	**/
	private String fcltRmrk;
	 /**
	속성유형
	**/
	private String fcltAtrbType;
	 /**
	표시순서
	**/
	private String indctSeq;
	 /**
	속성코드
	**/
	private String atrbCd;
	 /**
	속성값
	**/
	private String atrbVl;
	 /**
	속성표시명
	**/
	private String atrbIndctNm;
	 /**
	시설상세유형
	**/
	private String fcltDtlType;
	 /**
	상세순번
	**/
	private String dtlSn;
	 /**
	상세코드
	**/
	private String dtlCd;
	 /**
	상세값
	**/
	private String dtlVl;
	 /**
	상세표시명
	**/
	private String dtlIndctNm;

	/**
	대표품목
	**/
	private String rprsItem;

	/**
	대표품종
	**/
	private String rprsVrty;

	/**
	대표품종
	**/
	private String itemVrtyCd;

	/**
	규격코드
	**/
	private String spcfctCd;


	/**
	단위
	**/
	private String unit;

	/**
	순번
	**/
	private String sn;

	/**
	상태
	**/
	private String status;

	/**
	가동시작일자
	**/
	private String oprtngBgngDt;

	/**
	가동종료일자
	**/
	private String oprtngEndDt;

	/**
	기존가동시작일자
	**/
	private String orgOprtngBgngDt;

	/**
	기존가동시작일자
	**/
	private String orgOprtngEndDt;

	/**
	계획상세코드
	**/
	private String planDtlCd;

	/**
	투입수량
	**/
	private String inptQntt;

	/**
	투입중량
	**/
	private String inptWght;

	/**
	계획수량
	**/
	private String planQntt;

	/**
	계획중량
	**/
	private String planWght;

	/**
	결과수량
	**/
	private String rsltQntt;

	/**
	결과중량
	**/
	private String rsltWght;


	/**
	계획비고
	**/
	private String planRmrk;

	/**
	외부연계코드
	**/
	private String extrnlLnkgCd;

	/**
	가동순번
	**/
	private String oprtngSn;
	/**
	가동상세코드
	**/
	private String oprtngDtlCd;
	/**
	가동수량
	**/
	private String oprtngQntt;
	/**
	가동중량
	**/
	private String oprtngWght;
	/**
	가동비고
	**/
	private String oprtngRmrk;

	/**
	구분
	**/
	private String gubun;

	/**
	계획연월
	**/
	private String planYm;

}
