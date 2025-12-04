package com.apcmngsys.apcss.fm.fclt.vo;

import com.apcmngsys.apcss.co.sys.vo.ComVO;
import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : ApcCmsuSrvyRsltVO.java
 * @Description : APC전수조사 설문조사 결과에 대한 VO 클래스
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
public class ApcCmsuSrvyRsltVO extends ComVO {
    /**
     * APC코드
     */
    private String apcCd;

    /**
     * 설문번호
     */
    private String srvyNo;

    /**
     * 답변여부
     */
    private String ansYn;

    /**
     * 답변등록일시
     */
    private String ansRegDt;

    /**
     * 답변수정일시
     */
    private String ansMdfcnDt;

    /**
     * 답변서제출일자
     */
    private String ansdocSbmsnYmd;

    /**
     * 설문문항번호
     */
    private String srvyQitemNo;

    /**
     * 답변내용
     */
    private String ansCn;

    /**
     * 답변상세내용
     */
    private String ansDtlCn;

    /**
     * 진척도 갱신 여부
     */
    private String prgrsYn;

    /**
     * 임시저장 여부
     */
    private String tmprStrgYn;

}
