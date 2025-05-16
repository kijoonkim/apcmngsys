package com.at.apcss.fm.fclt.vo;

import com.at.apcss.co.sys.vo.ComVO;
import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : ApcSurveyMstVO.java
 * @Description : APC전수조사 마스터 정보에 대한 VO 클래스
 * @author 신정철
 * @since 2025.05.12
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2025.05.12  신정철        최초 생성
 * </pre>
 */
@Getter
@Setter
public class ApcSurveyMstVO extends ComVO {
    /**
     * 기준연도
     */
    private String crtrYr;
    /**
     * 표시명
     */
    private String indctNm;
    /**
     * 완료여부
     */
    private String cmptnYn;
    /**
     * 마감상태코드
     */
    private String ddlnSttsCd;
    /**
     * 시작일자
     */
    private String bgngYmd;
    /**
     * 종료일자
     */
    private String endYmd;

    /**
     * 확인일자
     */
    private String chkYmd;
    
    /**
     * 반환코드
     */
    private String rtnCd;

    /**
     * 반환메시지
     */
    private String rtnMsg;

}
