package com.at.apcss.am.spmt.vo;

import java.util.List;
import java.util.stream.Collectors;

import com.at.apcss.am.invntr.vo.RawMtrStdGrdVO;
import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : SpmtDsctnTotVO.java
 * @Description : 출하실적에 대한 VO 클래스
 * @author 김호
 * @since 2024.04.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.04.01  김  호        최초 생성
 * </pre>
 */
@Getter
@Setter
public class SpmtDsctnTotVO extends ComVO{

	private String apcCd;
	private String itemCd;
	private String prdcrCd;
	private String inptYmd;
	private String inptYmdFrom;
	private String inptYmdTo;
	private String spmtYmd;
	private String spmtYmdFrom;
	private String spmtYmdTo;
	private String cnptCd;
	private String cnptNm;

	private String grd;
	private String prdcrNm;
	private String red2Xl;
	private String redXl;
	private String redL;
	private String redM;
	private String redS;
	private String redSs;
	private String redTot;
	private String ylw2Xl;
	private String ylwXl;
	private String ylwL;
	private String ylwM;
	private String ylwS;
	private String ylwSs;
	private String ylwTot;
	private String org2Xl;
	private String orgXl;
	private String orgL;
	private String orgM;
	private String orgS;
	private String orgSs;
	private String orgTot;
	private String tot;
	private String grdGubun;
}
