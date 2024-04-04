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
	private String spmtno;
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
	private String grdGubun;
	
	private int red2Xl;
	private int redXl;
	private int redL;
	private int redM;
	private int redS;
	private int redSs;
	private int redTot;
	private int ylw2Xl;
	private int ylwXl;
	private int ylwL;
	private int ylwM;
	private int ylwS;
	private int ylwSs;
	private int ylwTot;
	private int org2Xl;
	private int orgXl;
	private int orgL;
	private int orgM;
	private int orgS;
	private int orgSs;
	private int orgTot;
	private int tot;
}
