package com.at.apcss.co.mng.vo;

import com.at.apcss.co.sys.vo.ComVO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ComUserVO extends ComVO {

    /**
     * 사용자 아이디
     */
    private String userId;

    /**
     * 유형코드
     */
    private String typeCd;

    /**
     * 통합조직코드
     */
    private String untyOgnzCd;

    /**
     * 시도
     */
    private String ctpv;

    /**
     * 시군구
     */
    private String sgg;

    /**
     * 회원수 카운트
     */
    private int cntUser;

    /**
     * 신규회원수
     */
    private int cntNewUser;

    /**
     * 현월 조회
     */
    private String yyyyMm;

    /**
     * 종료일자
     */
    private String ymdTo;

    private String yM;

}
