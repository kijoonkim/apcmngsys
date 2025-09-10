package com.at.apcss.am.sort.vo;

import com.at.apcss.co.sys.vo.ComVO;
import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : SortInvntrRtVO.java
 * @Description : 정렬재고비율에 대한 VO 클래스
 * @author 최지호
 * @since 2025.09.09
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2025.09.09  최지호        최초 생성
 * </pre>
 */

@Getter
@Setter
public class SortInvntrRtVO extends ComVO {
    /**
     * APC코드
     */
    private String apcCd;

    /**
     * 선별번호
     */
    private String sortno;

    /**
     * 정렬일련번호
     */
    private int sortSn;

    /**
     * 정렬비율종류
     */
    private String sortRtKnd;

    /**
     * 정렬비율수치
     */
    private int sortRtNv;

    /**
     * 정렬비율수량
     */
    private int sortRtQntt;

    /**
     * 정렬비율중량
     */
    private int sortRtWght;

    private String delYn;
}
