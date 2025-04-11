package com.at.apcss.co.mng.vo;

import com.at.apcss.co.sys.vo.ComVO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ComMenuLogHstryVO extends ComVO {

    /**
     * 메뉴 아이디
     */
    private String menuId;

    /**
     * 메뉴명
     */
    private String menuNm;

    /**
     * 사용자 아이디
     */
    private String userId;

    /**
     * 사용자명
     */
    private String userNm;

    /**
     * 사용자유형
     */
    private String userType;

    /**
     * 활성 회원수
     */
    private int cntUser;

    /**
     * 총 방문자
     */
    private int cnt;

    /**
     * 페이지뷰(PV) 카운트
     */
    private int pageViewCnt;

    /**
     * 사용자수 시작일자
     */
    private String ymdFrom;

    /**
     * 사용자수 종료일자
     */
    private String ymdTo;

    /**
     * 로그인성공여부
     */
    private String lgnScsYn;

    /**
     * 열람유형
     */
    private String prslType;

    /**
     * 이력일련번호
     */
    private int HstrySn;

    /**
     * APC코드
     */
    private String apcCd;

    /**
     * 수행업무구분코드
     */
    private String flfmtTaskSeCd;

    private String yM;
}
