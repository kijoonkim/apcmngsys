package com.at.apcss.am.spmt.vo;

import com.at.apcss.am.clcln.vo.ClclnCrtrVO;
import com.at.apcss.co.sys.vo.ComVO;
import lombok.Getter;
import lombok.Setter;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @Class Name : SpmtCmndVO.java
 * @Description : 반품기준 관리에대한 VO 클래스
 * @author 손민성
 * @since 2025.01.04
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2025.01.04  손민성        최초 생성
 * </pre>
 */
@Getter
@Setter
public class ShpgotApcCrtrVO extends ComVO {
    /**
     * APC코드
     */
    private String apcCd;

    /**
     * 반출기준유형
     */
    private String shpgotCrtrType;

    /**
     * 기준코드
     */
    private String crtrCd;

    /**
     * 기준값
     */
    private String crtrVl;

    /**
     * 기준표시명
     */
    private String crtrIndctNm;

    /**
     * 사용여부
     */
    private String useYn;

    /**
     * 비고
     */
    private String rmrk;

    /**
     * 상세 List
     */
    private List<ShpgotApcCrtrDtlVO> dtlList;

    public List<ShpgotApcCrtrDtlVO> getDtlList() {
        return dtlList == null ? null : dtlList.stream().collect(Collectors.toList());
    }

    public void setDtlList(List<ShpgotApcCrtrDtlVO> dtlList) {
        this.dtlList = dtlList == null ? null : dtlList.stream().collect(Collectors.toList());
    }
}
