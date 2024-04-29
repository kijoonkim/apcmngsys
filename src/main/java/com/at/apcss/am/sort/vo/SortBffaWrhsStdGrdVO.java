package com.at.apcss.am.sort.vo;

import com.at.apcss.co.sys.vo.ComVO;
import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : SortPrfmncVO.java
 * @Description : 육안선별에 대한 VO 클래스
 * @author 손민성
 * @since 2024.04.22
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.04.22  손민성        최초 생성
 * </pre>
 */
@Getter
@Setter
public class SortBffaWrhsStdGrdVO extends ComVO {
    /**
     * APC코드
     */
    private String apcCd;
    /**
     * 사전입고번호
     */
    private String bffaWrhsno;
    /**
     * 사전등급유형형
     */
    private String bffaGrdType;
    /**
     * 품목
     */
    private String itemCd;
    /**
     * 등급종류
     */
    private String grdKnd;
    /**
     * 등급코드
     */
    private String grdCd;
    /**
     * 등급수치
     */
    private String grdNv;
    /**
     * 등급수량
     */
    private String grdQntt;
    /**
     * 등급중량
     */
    private String grdWght;
    /**
     * checkbox index
     */
    private String checkIndex;
}
