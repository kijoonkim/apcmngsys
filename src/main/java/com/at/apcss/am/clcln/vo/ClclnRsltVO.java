package com.at.apcss.am.clcln.vo;

import java.util.List;
import java.util.stream.Collectors;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : ClclnRsltVO.java
 * @Description : APC정산실적에 대한 VO 클래스
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
public class ClclnRsltVO extends ComVO {

	private String apcCd;
	private String clclnYr;
	private int clclnSn;

	private String clclnTrprType;
	private String clclnCrtrType;
	private String crtrCd;
	private String dtlCd;
	private String wrhsSeCd;
	private String gdsSeCd;
	private String itemCd;
	private String itemVrtyCd;
	private String grdCd;
	private String clclnSeCd;
	private String clclnClsf;

	private String clclnSeNm;
	private String clclnClsfNm;

	private String itemNm;
	private String vrtyNm;

	private double clclnUntprc;
	private int clclnQntt;
	private double clclnWght;
	private double clclnAmt;
	private double cfmtnAmt;
	private String cfmtnYn;
	private String dtlExtraCd;


	// 농가정보
	private String prdcrCd;
	private String prdcrNm;
	private String telno;
	private String frmhsTelno;
	private String frmhsAddr;
	private String ctpv;
	private String ctpvNm;
	private String frmhsCtpv;
	private String plorCd;
	private String ctrtArea;
	private String ctrtAreaM;
	private String ctrtar;
	private String ctrtarM;
	private String plntngArea;

	// 추가지급금
	private double extraUntprc;
	private double extraAmt;
	// 계약금
	private double ctrtSdPymt;	// 종자대금
	private double ctrtCash;	// 현금
	private double ctrtAmt;

	// 적자금
	private double acmlFund1;
	private double acmlFund2;
	private double acmlFund3;
	private double acmlFund4;
	private double acmlFund5;
	private double acmlFund;

	// 농자재대금
	private double ddcMtrlPymt;
	// 운반비
	private double ddcTrsprtCst;
	// 작업비
	private double ddcJobCst;
	// 백대여
	private double ddcRntlCrg;
	// 의무자조금
	private double ddcDtyVlntrlEndw;
	// 자조금
	private double ddcVlntrlEndw;
	// 미반납공제
	private double ddcNRtnDdc;
	// 미반납수량
	private int ddcNRtnDdcQntt;
	
	// 중도금
	private double ddcPrtpay;

	private double ddcAmt;

	// 선금
	double advncSdPymt;		// 종자대금(선금)
	double advncPrvpyAmt;	// 가지불(선금
	double advncAmt;		// 선금

	// 지급금
	private double giveAmt;
	
	// 정산비고
	private String clclnRmrk;

	// 종자
	private double seedClclnUntprc1;
	private int seedClclnQntt1;
	private double seedClclnAmt1;
	private double seedClclnUntprc2;
	private int seedClclnQntt2;
	private double seedClclnAmt2;
	private double seedClclnUntprc3;
	private int seedClclnQntt3;
	private double seedClclnAmt3;
	private double seedClclnUntprc4;
	private int seedClclnQntt4;
	private double seedClclnAmt4;
	private double seedClclnUntprc5;
	private int seedClclnQntt5;
	private double seedClclnAmt5;
	private double seedClclnUntprc6;
	private int seedClclnQntt6;
	private double seedClclnAmt6;
	private double seedClclnUntprc7;
	private int seedClclnQntt7;
	private double seedClclnAmt7;
	private double seedClclnUntprc8;
	private int seedClclnQntt8;
	private double seedClclnAmt8;
	private double seedClclnUntprc9;
	private int seedClclnQntt9;
	private double seedClclnAmt9;
	private double seedClclnUntprc10;
	private int seedClclnQntt10;
	private double seedClclnAmt10;
	private double wrhsClclnUntprc1;
	private int wrhsClclnQntt1;
	private double wrhsClclnWght1;
	private double wrhsClclnAmt1;
	private double wrhsCfmtnAmt1;
	private double wrhsClclnUntprc2;
	private int wrhsClclnQntt2;
	private double wrhsClclnWght2;
	private double wrhsClclnAmt2;
	private double wrhsCfmtnAmt2;
	private double wrhsClclnUntprc3;
	private int wrhsClclnQntt3;
	private double wrhsClclnWght3;
	private double wrhsClclnAmt3;
	private double wrhsCfmtnAmt3;
	private double wrhsClclnUntprc4;
	private int wrhsClclnQntt4;
	private double wrhsClclnWght4;
	private double wrhsClclnAmt4;
	private double wrhsCfmtnAmt4;
	private double wrhsClclnUntprc5;
	private int wrhsClclnQntt5;
	private double wrhsClclnWght5;
	private double wrhsClclnAmt5;
	private double wrhsCfmtnAmt5;
	private double wrhsClclnUntprc6;
	private int wrhsClclnQntt6;
	private double wrhsClclnWght6;
	private double wrhsClclnAmt6;
	private double wrhsCfmtnAmt6;
	private double wrhsClclnUntprc7;
	private int wrhsClclnQntt7;
	private double wrhsClclnWght7;
	private double wrhsClclnAmt7;
	private double wrhsCfmtnAmt7;
	private double wrhsClclnUntprc8;
	private int wrhsClclnQntt8;
	private double wrhsClclnWght8;
	private double wrhsClclnAmt8;
	private double wrhsCfmtnAmt8;
	private double wrhsClclnUntprc9;
	private int wrhsClclnQntt9;
	private double wrhsClclnWght9;
	private double wrhsClclnAmt9;
	private double wrhsCfmtnAmt9;
	private double wrhsClclnUntprc10;
	private int wrhsClclnQntt10;
	private double wrhsClclnWght10;
	private double wrhsClclnAmt10;
	private double wrhsCfmtnAmt10;
	private double sortClclnUntprc1;
	private int sortClclnQntt1;
	private double sortClclnWght1;
	private double sortClclnAmt1;
	private double sortCfmtnAmt1;
	private double sortClclnUntprc2;
	private int sortClclnQntt2;
	private double sortClclnWght2;
	private double sortClclnAmt2;
	private double sortCfmtnAmt2;
	private double sortClclnUntprc3;
	private int sortClclnQntt3;
	private double sortClclnWght3;
	private double sortClclnAmt3;
	private double sortCfmtnAmt3;
	private double sortClclnUntprc4;
	private int sortClclnQntt4;
	private double sortClclnWght4;
	private double sortClclnAmt4;
	private double sortCfmtnAmt4;
	private double sortClclnUntprc5;
	private int sortClclnQntt5;
	private double sortClclnWght5;
	private double sortClclnAmt5;
	private double sortCfmtnAmt5;
	private double sortClclnUntprc6;
	private int sortClclnQntt6;
	private double sortClclnWght6;
	private double sortClclnAmt6;
	private double sortCfmtnAmt6;
	private double sortClclnUntprc7;
	private int sortClclnQntt7;
	private double sortClclnWght7;
	private double sortClclnAmt7;
	private double sortCfmtnAmt7;
	private double sortClclnUntprc8;
	private int sortClclnQntt8;
	private double sortClclnWght8;
	private double sortClclnAmt8;
	private double sortCfmtnAmt8;
	private double sortClclnUntprc9;
	private int sortClclnQntt9;
	private double sortClclnWght9;
	private double sortClclnAmt9;
	private double sortCfmtnAmt9;
	private double sortClclnUntprc10;
	private int sortClclnQntt10;
	private double sortClclnWght10;
	private double sortClclnAmt10;
	private double sortCfmtnAmt10;
	private double gdsClclnUntprc1;
	private int gdsClclnQntt1;
	private double gdsClclnWght1;
	private double gdsClclnAmt1;
	private double gdsCfmtnAmt1;
	private double gdsClclnUntprc2;
	private int gdsClclnQntt2;
	private double gdsClclnWght2;
	private double gdsClclnAmt2;
	private double gdsCfmtnAmt2;
	private double gdsClclnUntprc3;
	private int gdsClclnQntt3;
	private double gdsClclnWght3;
	private double gdsClclnAmt3;
	private double gdsCfmtnAmt3;
	private double gdsClclnUntprc4;
	private int gdsClclnQntt4;
	private double gdsClclnWght4;
	private double gdsClclnAmt4;
	private double gdsCfmtnAmt4;
	private double gdsClclnUntprc5;
	private int gdsClclnQntt5;
	private double gdsClclnWght5;
	private double gdsClclnAmt5;
	private double gdsCfmtnAmt5;
	private double gdsClclnUntprc6;
	private int gdsClclnQntt6;
	private double gdsClclnWght6;
	private double gdsClclnAmt6;
	private double gdsCfmtnAmt6;
	private double gdsClclnUntprc7;
	private int gdsClclnQntt7;
	private double gdsClclnWght7;
	private double gdsClclnAmt7;
	private double gdsCfmtnAmt7;
	private double gdsClclnUntprc8;
	private int gdsClclnQntt8;
	private double gdsClclnWght8;
	private double gdsClclnAmt8;
	private double gdsCfmtnAmt8;
	private double gdsClclnUntprc9;
	private int gdsClclnQntt9;
	private double gdsClclnWght9;
	private double gdsClclnAmt9;
	private double gdsCfmtnAmt9;
	private double gdsClclnUntprc10;
	private int gdsClclnQntt10;
	private double gdsClclnWght10;
	private double gdsClclnAmt10;
	private double gdsCfmtnAmt10;

	private String bankCd;
	private String bankNm;
	private String actno;

	private List<ClclnRsltDtlVO> clclnRsltDtlList;

	public List<ClclnRsltDtlVO> getClclnRsltDtlList() {
		return clclnRsltDtlList == null ? null : clclnRsltDtlList.stream().collect(Collectors.toList());
	}

	public void setClclnRsltDtlList(List<ClclnRsltDtlVO> clclnRsltDtlList) {
		this.clclnRsltDtlList = clclnRsltDtlList == null ? null : clclnRsltDtlList.stream().collect(Collectors.toList());
	}
}
