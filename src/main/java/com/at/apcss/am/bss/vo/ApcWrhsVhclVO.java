package com.at.apcss.am.bss.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : ApcWrhsVhclVO.java
 * @Description : APC 입고차량정보 대한 VO 클래스
 * @author 신정철
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21  신정철        최초 생성
 * </pre>
 */
@Getter
@Setter
public class ApcWrhsVhclVO extends ComVO {
	private String apcCd;
	private String vhclno;
	private String drvrNm;
	private String bankCd;
	private String actno;
	private String dpstr;
	private String rmrk;
	private String delYn;
	private String sysFrstInptDt;
	private String sysFrstInptUserId;
	private String sysFrstInptPrgrmId;
	private String sysLastChgDt;
	private String sysLastChgUserId;
	private String sysLastChgPrgrmId;
}
