package com.at.apcss.pd.pcorm.vo;

import com.at.apcss.co.sys.vo.ComVO;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SprtBizRegFileVO extends ComVO {

    /**
     * 지원사업연도
     */
    private String sprtBizYr;

    /**
     * 지원사업코드
     */
    private String sprtBizCd;

    /**
     * 지원조직아이디
     */
    private String sprtOgnzId;

    /**
     * 첨부파일일련번호
     */
    private long atchFileSn;

    /**
     * 파일경로명
     */
    private String filePathNm;

    /**
     * 원본파일명
     */
    private String lgcFileNm;

    /**
     * 물리파일명
     */
    private String physFileNm;

    /**
     * 파일크기
     */
    private long fileSz;

    /**
     * 파일확장자명
     */
    private String fileExtnNm;

    /**
     * 조회수
     */
    private int inqCnt;

    /**
     * 다운로드수
     */
    private int dwnldCnt;

    /**
     * 삭제유무
     */
    private String delYn;

    /**
     * 신청문서코드
     */
    private String aplyDocCd;

    /**
     * 사업자번호
     */
    private String brno;

    /**
     * 법인번호
     */
    private String crno;

    /**
     * 프로시저 실패 리턴 결과
     */
    private String rtnCd;

    /**
     * 프로시저 실패 리턴 메시지
     */
    private String rtnMsg;

    /**
     * 프로시저 리턴 조직아이디
     */
    private String rtnSprtOgnzId;

    /**
     * 사업신청서 변경여부
     */
    private String bizAplyChgYn;

    /**
     * 사업계획서 변경여부
     */
    private String bizPlanChgYn;

    /**
     * 변경여부
     */
    private String chgYn;

    /**
     * 승인여부
     */
    private String aprvYn;

    /**
     * 법인명
     */
    private String corpNm;


}
