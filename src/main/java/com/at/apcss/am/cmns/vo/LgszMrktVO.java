package com.at.apcss.am.cmns.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : CnptVO.java
 * @Description : 대형마켓에 대한 VO 클래스
 * @author 정희운
 * @since 2023.08.10
 * @version 1.0
 * @see
 *
 *      <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.08.10  정희운        최초 생성
 *      </pre>
 */
@Getter
@Setter
@EqualsAndHashCode(callSuper = false)
public class LgszMrktVO extends ComVO {

	private String apcCd;
	private String lgszMrktCd;
	private String lgszMrktNm;
	private String outordrInfoUrl;
	private String userId;
	private String pswd;
	private String useYn;
	private String lastPrcsDt;
	private String sysFrstInptDt;
	private String sysFrstInptUserId;
	private String sysFrstInptPrgrmId;
	private String sysLastChgDt;
	private String sysLastChgUserId;
	private String sysLastChgPrgrmId;

}
