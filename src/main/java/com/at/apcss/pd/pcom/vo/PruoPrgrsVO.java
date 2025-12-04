package com.at.apcss.pd.pcom.vo;

import com.at.apcss.am.dscd.vo.DscdCrtrVO;
import com.at.apcss.co.sys.vo.ComVO;
import com.at.apcss.pd.aom.vo.GpcVO;
import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
public class PruoPrgrsVO extends ComVO {
    /**
     * 기준연도
     */
    private String crtrYr;

    /**
     * 프로그램아이디
     */
    private String prgrmId;

    /**
     * 프로그램명
     */
    private String prgrmNm;

    /**
     * 필수여부
     */
    private String esntlYn;

    /**
     * 단계순서
     */
    private int stpSeq;

    /**
     * 메뉴아이디
     */
    private String menuId;

    /**
     * 사용여부
     */
    private String useYn;

    /**
     * 삭제여부
     */
    private String delYn;

    /**
     * 우선프로그램아이디
     */
    private String prrPrgrmId;

    /**
     * 산지유통조직코드
     */
    private String apoCd;

    /**
     * 진행단계코드
     */
    private String prgrsStpCd;

    /**
     * 작성사용자아이디
     */
    private String wrtUserId;

    /**
     * 작성일시
     */
    private String wrtDt;

    /**
     * 완료여부
     */
    private String cmptnYn;

    /**
     * 완료일시
     */
    private String cmptnDt;

    /**
     * 임시저장여부
     */
    private String tmprStrgYn;


    /**
     * 법인체마감여부
     */
    private String corpDdlnYn;

    /**
     * 법인체마감여부
     */
    private String lastSbmsnYn;

    /**
     * 산지유통구분
     */
    private String apoSe;

    /**
     * 산지유통구분
     */
    private String apoSeNm;

    /**
     * 법인명
     */
    private String corpNm;

    /**
     * 법인번호
     */
    private String crno;

    /**
     * 사업자번호
     */
    private String brno;

    /**
     * 상위 법인명
     */
    private String uoCorpNm;

    /**
     * 상위 사업자번호
     */
    private String uoBrno;

    /**
     * 법인체마감구분코드(Y/N)
     */
    private String corpDdlnSeCd;

    /**
     * 우선순위 프로그램 완료여부
     */
    private String prordCmptnYn;

    /**
     * 작성프로그램명
     */
    private String wrtPrgrmId;

    /**
     * 실적법인체마감구분코드(Y/N)
     */
    private String prfmncCorpDdlnYn;

    /**
     * 진행
     */
    private String prgrs1;
    private String prgrs2;
    private String prgrs3;
    private String prgrs4;
    private String prgrs5;
    private String prgrs6;
    private String prgrs7;
    private String prgrs8;
    private String prgrs9;
    private String prgrs10;

    private String rtnCd;
    private String rtnMsg;

    /**
     * 품목리스트
     */
    private List<GpcVO> gpcList;

    public List<GpcVO> getGpcList() {
        return gpcList == null ? null : new ArrayList<>(gpcList);
    }

    public void setGpcList(List<GpcVO> gpcList) {
        this.gpcList = gpcList == null ? null : new ArrayList<>(gpcList);
    }

}
