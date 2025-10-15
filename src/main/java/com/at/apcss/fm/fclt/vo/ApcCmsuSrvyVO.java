package com.at.apcss.fm.fclt.vo;

import com.at.apcss.am.invntr.vo.GdsStdGrdVO;
import com.at.apcss.co.sys.vo.ComVO;
import lombok.Getter;
import lombok.Setter;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @Class Name : ApcCmsuSrvyVO.java
 * @Description : APC전수조사 설문조사 정보에 대한 VO 클래스
 * @author 유민지
 * @since 2025.10.13
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2025.10.13  유민지        최초 생성
 * </pre>
 */
@Getter
@Setter
public class ApcCmsuSrvyVO extends ComVO {
    /**
     * 설문번호
     */
    private String srvyNo;

    /**
     * 설문명
     */
    private String srvyNm;

    /**
     * 설문연도
     */
    private String srvyYr;

    /**
     * 설문내용
     */
    private String srvyCn;

    /**
     * 설문작성안내내용
     */
    private String srvyWrtGdCn;

    /**
     * 설문시작일자
     */
    private String srvyBgngYmd;

    /**
     * 설문종료일자
     */
    private String srvyEndYmd;

    /**
     * 사용여부
     */
    private String useYn;

    /**
     * 설문문항번호
     */
    private String srvyQitemNo;

    /**
     * 설문문항내용
     */
    private String srvyQitemCn;

    /**
     * 설문설명
     */
    private String srvyExpln;

    /**
     * 출력순서
     */
    private int otptSeq;

    /**
     * APC코드
     */
    private String apcCd;

    /**
     * 연도
     */
    private String crtrYr;

    /**
     * 답변여부
     */
    private String ansYn;

    /**
     * 진척도 갱신 여부
     */
    private String prgrsYn;

    /**
     * 임시저장 여부
     */
    private String tmprStrgYn;

    private List<ApcCmsuSrvyRsltVO> srvyApcRsltDtlList;

    public List<ApcCmsuSrvyRsltVO> getSrvyApcRsltDtlList() {
        return srvyApcRsltDtlList == null ? null : srvyApcRsltDtlList.stream().collect(Collectors.toList());
    }

    public void setSrvyApcRsltDtlList(List<ApcCmsuSrvyRsltVO> srvyApcRsltDtlList) {
        this.srvyApcRsltDtlList = srvyApcRsltDtlList == null ? null : srvyApcRsltDtlList.stream().collect(Collectors.toList());
    }

}
