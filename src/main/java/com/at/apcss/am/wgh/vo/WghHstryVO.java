package com.at.apcss.am.wgh.vo;

import com.at.apcss.co.sys.vo.ComVO;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class WghHstryVO extends ComVO {
    /** APC 코드 */
    private String apcCd;

    /** 계량 번호 */
    private String wghno;

    /** 계량 순서 */
    private int wghSeq;

    /** 차량 번호 */
    private String vhclno;

    /** 계량 구분 코드 */
    private String wghSeCd;

    /** 계량 무게 */
    private int wghWght;

    /** 계량 시각 */
    private String wghDt;

    /** 처리 업무 코드 */
    private String prcsTaskCd;

    /** 처리 완료 일시 */
    private String prcsCmptnDt;

    /** 처리 완료 여부 */
    private String prcsCmptnYn;

    /** 계량 비고 */
    private String wghRmrk;

    /** 설비코드 **/
    private String fcltCd;
}
