package com.at.apcss.am.clcln.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : ClclnApcUntprcVO.java
 * @Description : APC정산단가에 대한 VO 클래스
 * @author 신정철
 * @since 2023.10.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.10.21  신정철        최초 생성
 * </pre>
 */
@Getter
@Setter
public class ClclnNowInvntrVO extends ComVO {

	private String apcCd;
	private String crtrYmd;
	private int wrhsQntt;
	private int spmtQntt;
	private int totInvntrQntt;
	private int nowInvntrQntt;
	private int lastWkndQntt;
	private int lsQntt;
	}
