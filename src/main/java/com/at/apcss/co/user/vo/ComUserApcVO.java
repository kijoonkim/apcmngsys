package com.at.apcss.co.user.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : UserApcVO.java
 * @Description : 사용자APC에 대한 VO 클래스
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
public class ComUserApcVO  extends ComVO {

	private String userId;
	private String apcCd;
	private String apcNm;
	
	private String aprvYn;
	private String aprvDt;
	private String aprvRmrk;
	
	private String aplyYn;
	private String aplyDt;
	private String aplyRmrk;
	
	private String aprvPrgrsCd;
	
	private String chkOgnzYn;

	private String sysIdAmYn;
	private String sysIdFmYn;
	private String sysIdMaYn;
	private String prdctnMngUseYn;
	private String admstMngUseYn;
	private String frmhsMngUseYn;

	private String apcMngrYn;

	private String rtnCd;
	private String rtnMsg;

}
