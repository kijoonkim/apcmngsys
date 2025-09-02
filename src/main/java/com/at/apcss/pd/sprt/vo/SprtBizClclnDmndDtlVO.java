package com.at.apcss.pd.sprt.vo;

import com.at.apcss.co.sys.vo.ComVO;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SprtBizClclnDmndDtlVO extends ComVO {

    /**
     * 파일이름
     */
    private String fileName;

    /**
     * 기존 파일이름
     */
    private String originalFileName;

    /**
     * 파일유형
     */
    private String fileType;
    
    /**
     * 파일식별자
     */
    private String fileId;

    /**
     * 파일사이즈
     */
    private String fileSize;

    /**
     * 요청순서
     */
    private int dmndSeq;

    /**
     * 요청금액
     */
    private int dmndAmt;

    /**
     * 요청항목종류
     */
    private String dmndArtclKnd;

    /**
     * 요청항목코드
     */
    private String dmndArtclCd;

    /**
     * 요청내용
     */
    private String dmndCn;

    /**
     * 요청비고
     */
    private String dmndRmrk;

    /**
     * 삭제유무
     */
    private String delYn;

    /**
     * 문서순서
     */
    private int docSeq;

    /**
     * 문서종류
     */
    private String docKnd;

    /**
     * 문서코드
     */
    private String docCd;

    /**
     * 문서비고
     */
    private String docRmrk;

    /**
     * 첨부파일일련번호
     */
    private long atchFileSn;

    /**
     * 등록자
     */
    private String rgtr;

    /**
     * 등록자아이디
     */
    private String rgtrId;

    /**
     * 등록일시
     */
    private String regDt;

    /**
     * 확인자
     */
    private String idfr;

    /**
     * 확인자아이디
     */
    private String idfrId;

    /**
     * 확인일시
     */
    private String idfrDt;

    /**
     * 확인비고
     */
    private String idfrRmrk;

    /**
     * 승인여부
     */
    private String aprvYn;

    /**
     * 변경여부
     */
    private String chgYn;

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
     * 정산순서
     */
    private int clclnSeq;

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
     * 순번
     */
    private int seq;

    /**
     * 주요항목명
     */
    private String dmndArtclKndNm;

    /**
     * 세부항목명
     */
    private String dmndArtclCdNm;

    /**
     * 문서명
     */
    private String docNm;

}
