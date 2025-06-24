package com.at.apcss.am.wrhs.vo;

import com.at.apcss.co.sys.vo.ComVO;
import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : StdgVO.java
 * @Description : 법정동정보에 대한 VO 클래스
 * @author 최지호
 * @since 2025.06.20
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2025.06.20  최 지 호      최초 생성
 * </pre>
 */

@Getter
@Setter
public class StdgVO extends ComVO {
    /**
     * 법정동코드
     */
    private String stdgCd;

    /**
     * 법정동명
     */
    private String stdg;

    /**
     * 법정동시도명
     */
    private String stdgCtpv;

    /**
     * 법정동시군구명
     */
    private String stdgSgg;

    /**
     * 법정동읍면동명
     */
    private String stdgEmd;

    /**
     * 법정동동리명
     */
    private String stdgLi;
}
