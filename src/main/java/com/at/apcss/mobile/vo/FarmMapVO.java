package com.at.apcss.mobile.vo;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class FarmMapVO {
    private String apcNm;
    private String stdgCd;
    private String frlnMno;
    private String frlnSno;

    @Builder(toBuilder = true)
    public FarmMapVO(String apcNm, String stdgCd, String frlnMno, String frlnSno) {
        this.apcNm = apcNm;
        this.stdgCd = stdgCd;
        this.frlnMno = frlnMno;
        this.frlnSno = frlnSno;
    }
}
