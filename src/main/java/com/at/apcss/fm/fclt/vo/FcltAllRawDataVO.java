package com.at.apcss.fm.fclt.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class FcltAllRawDataVO extends ComVO{

	/* 운영자개요 */
	private String crtrYr;
	private String apcCd;
	private String apcNm;
	private String apcBrno;
	private String apcCrno;

	private String operOgnzNm;
	private String rprsv;
	private String operOgnzBrno;
	private String operOgnzCrno;

	private String loctn;
	private String loctnDtl;

	private String operOgnzAdmCd;
	private String ctpvCd;
	private String ctpvNm;
	private String sigunCd;
	private String sigunNm;

	private String operOgnzZip;
	private String operOgnzBmno;
	private String operOgnzSlno;
	private String operOgnzRoadNmCd;

	private String apcLoctn;
	private String apcLoctnDtl;

	private String apcAdmCd;
	private String apcCtpvCd;
	private String apcCtpvNm;
	private String apcSigunCd;
	private String apcSigunNm;

	private String apcZip;
	private String apcBmno;
	private String apcSlno;
	private String apcRoadNmCd;

	private String ognzType;
	private String ognzTypeCd;

	/* 품목 리스트 */
	private String ognzItemCd1;
	private String ognzItemNm1;
	private String ognzItemCd2;
	private String ognzItemNm2;
	private String ognzItemCd3;
	private String ognzItemNm3;
	private String ognzEtcItemNm;
	private String ognzEtcCtgryNm;

	private String apcItemCd1;
	private String apcItemNm1;
	private String apcItemCd2;
	private String apcItemNm2;
	private String apcItemCd3;
	private String apcItemNm3;
	private String apcEtcItemNm;
	private String apcEtcCtgryNm;

	/* 3.1 시설 장비 인력 현황 */
	private String cspTotArea;
	private String cspTotRmrk;
	private String cspCfppArea;
	private String cspCfppRmrk;
	private String cspClnOprtngPrcsArea;
	private String cspClnOprtngPrcsRmrk;
	private String cspNgdsFcltArea;
	private String cspNgdsFcltRmrk;
	private String cspDtpArea;
	private String cspDtpRmrk;
	private String strgPlcPrcPlcArea;
	private String strgPlcPrcPlcRmrk;
	private String strgPlcLwtpStrgArea;
	private String strgPlcLwtpStrgRmrk;
	private String strgPlcCaStrgPlcArea;
	private String strgPlcCaStrgPlcRmrk;
	private String strgPlcCurnArea;
	private String strgPlcCurnRmrk;
	private String strgPlcGnrlStrgArea;
	private String strgPlcGnrlStrgRmrk;
	private String strgPlcEtcArea;
	private String strgPlcEtcRmrk;

	/* 3.2 상품화설비현황 */
	private String sortMchnHoldYnFsd1;
	private String sortMchnSpcfct1;
	private String mkrNm1;
	private String sortBrckMchn1;
	private String colorSort1;
	private String shapSort1;
	private String mnfcMchn1;

	private String sortMchnHoldYnFsd2;
	private String sortMchnSpcfct2;
	private String mkrNm2;
	private String sortBrckMchn2;
	private String colorSort2;
	private String shapSort2;
	private String mnfcMchn2;

	private String sortMchnHoldYnFsd3;
	private String sortMchnSpcfct3;
	private String mkrNm3;
	private String sortBrckMchn3;
	private String colorSort3;
	private String shapSort3;
	private String mnfcMchn3;

	private String sortMchnHoldYnFsd4;
	private String sortMchnSpcfct4;
	private String mkrNm4;
	private String sortBrckMchn4;
	private String colorSort4;
	private String shapSort4;
	private String mnfcMchn4;

	/* 3.3 선별기운영 */
	private String sortMchnHoldYnOasm1;
	private String sortPrcsAblt1;
	private String sortPrcsPrfmnc1;
	private String sortOprtngHr1;
	private String sortAvgOprtngDcnt1;

	private String sortMchnHoldYnOasm2;
	private String sortPrcsAblt2;
	private String sortPrcsPrfmnc2;
	private String sortOprtngHr2;
	private String sortAvgOprtngDcnt2;

	private String sortMchnHoldYnOasm3;
	private String sortPrcsAblt3;
	private String sortPrcsPrfmnc3;
	private String sortOprtngHr3;
	private String sortAvgOprtngDcnt3;

	private String sortMchnHoldYnOasm4;
	private String sortPrcsAblt4;
	private String sortPrcsPrfmnc4;
	private String sortOprtngHr4;
	private String sortAvgOprtngDcnt4;

	/* 3.4 선별기운영기간 */
	private String operYnSn1;
	private String operPeriodYn101;
	private String operPeriodYn102;
	private String operPeriodYn103;
	private String operPeriodYn104;
	private String operPeriodYn105;
	private String operPeriodYn106;
	private String operPeriodYn107;
	private String operPeriodYn108;
	private String operPeriodYn109;
	private String operPeriodYn110;
	private String operPeriodYn111;
	private String operPeriodYn112;

	private String operYnSn2;
	private String operPeriodYn201;
	private String operPeriodYn202;
	private String operPeriodYn203;
	private String operPeriodYn204;
	private String operPeriodYn205;
	private String operPeriodYn206;
	private String operPeriodYn207;
	private String operPeriodYn208;
	private String operPeriodYn209;
	private String operPeriodYn210;
	private String operPeriodYn211;
	private String operPeriodYn212;

	private String operYnSn3;
	private String operPeriodYn301;
	private String operPeriodYn302;
	private String operPeriodYn303;
	private String operPeriodYn304;
	private String operPeriodYn305;
	private String operPeriodYn306;
	private String operPeriodYn307;
	private String operPeriodYn308;
	private String operPeriodYn309;
	private String operPeriodYn310;
	private String operPeriodYn311;
	private String operPeriodYn312;

	private String operYnSn4;
	private String operPeriodYn401;
	private String operPeriodYn402;
	private String operPeriodYn403;
	private String operPeriodYn404;
	private String operPeriodYn405;
	private String operPeriodYn406;
	private String operPeriodYn407;
	private String operPeriodYn408;
	private String operPeriodYn409;
	private String operPeriodYn410;
	private String operPeriodYn411;
	private String operPeriodYn412;

	/* 3.5 저온저장고운영 - 상세 */
	private String lwtpStrgPlcHldYn;
	private String strgPlcStrgAblt;
	private String strgPlcStrmStrgAblt;
	private String strgPlcLtrmStrgAblt;
	private String strgPlcOprtngRt;

	/* 3.5 저온저장고운영 - 운영기간 */
	private String operYn;
	private String operPeriodYn1;
	private String operPeriodYn2;
	private String operPeriodYn3;
	private String operPeriodYn4;
	private String operPeriodYn5;
	private String operPeriodYn6;
	private String operPeriodYn7;
	private String operPeriodYn8;
	private String operPeriodYn9;
	private String operPeriodYn10;
	private String operPeriodYn11;
	private String operPeriodYn12;

	/* 3.6 고용인력 */
	private String hireRgllbrOfc;
	private String hireRgllbrSpt;
	private String hireTmprWgTotSum;
	private String hireTmprAvgWg;
	private String hireTmprMin;
	private String hireTmprMax;
	private String hireFrgnrMin;
	private String hireFrgnrMax;
	private String hireFrgnrAvg;
	private String hireFrgnrTaskCn;

	/* 4.1 스마트자동화현황 */
	private String wbg1;
	private String wrhsBrQr1;
	private String kskTblt1;
	private String dptz1;
	private String apm1;
	private String elctrnWghtSortMchn1;
	private String ndstBrckSortMchn1;
	private String grdRawMtrAtmtcTrnsfMchn1;
	private String dshbrd1;
	private String emptBxAtmtcExhstMchn1;
	private String atmtcBxPckgMchn1;
	private String atmtcSsMchn1;
	private String atmtcWrapMchn1;
	private String atmtcWghtChckMchn1;
	private String ptz1;
	private String spmtBrQr1;
	private String thAc1;
	private String spcfctCnt1;
	private String spcfctGrp1;
	private String spcfctGrd1;

	private String wbg2;
	private String wrhsBrQr2;
	private String kskTblt2;
	private String dptz2;
	private String apm2;
	private String elctrnWghtSortMchn2;
	private String ndstBrckSortMchn2;
	private String grdRawMtrAtmtcTrnsfMchn2;
	private String dshbrd2;
	private String emptBxAtmtcExhstMchn2;
	private String atmtcBxPckgMchn2;
	private String atmtcSsMchn2;
	private String atmtcWrapMchn2;
	private String atmtcWghtChckMchn2;
	private String ptz2;
	private String spmtBrQr2;
	private String thAc2;
	private String spcfctCnt2;
	private String spcfctGrp2;
	private String spcfctGrd2;

	private String wbg3;
	private String wrhsBrQr3;
	private String kskTblt3;
	private String dptz3;
	private String apm3;
	private String elctrnWghtSortMchn3;
	private String ndstBrckSortMchn3;
	private String grdRawMtrAtmtcTrnsfMchn3;
	private String dshbrd3;
	private String emptBxAtmtcExhstMchn3;
	private String atmtcBxPckgMchn3;
	private String atmtcSsMchn3;
	private String atmtcWrapMchn3;
	private String atmtcWghtChckMchn3;
	private String ptz3;
	private String spmtBrQr3;
	private String thAc3;
	private String spcfctCnt3;
	private String spcfctGrp3;
	private String spcfctGrd3;

	/* 4.2 작업단계별 데이터 관리현황 */
	private String prdctnInfoMngMthd;
	private String wrhsInfoMngMthd;
	private String sortInfoMngMthd;
	private String strgInfoMngMthd;
	private String pckgInfoMngMthd;
	private String jobInfoMngMthd;
	private String spmtInfoMngMthd;

	private String prdctnDtlList;
	private String wrhsDtlList;
	private String sortDtlList;
	private String strgDtlList;
	private String pckgDtlList;
	private String jobDtlList;
	private String spmtDtlList;

	/* 4.3 통합관리시스템 활용현황 */
	private String umsYn; //활용 여부
	private String umsPrdctnInfo;
	private String umsWghInfo;
	private String umsWrhsInfo;
	private String umsSortInfo;
	private String umsStrgInfo;
	private String umsPckgInfo;
	private String umsSpmtInfo;
	private String umsClclnInfo;

	/* 5.1 유통조직 처리실적 */
	private String rtlOgnzTotTrmtAmt1;
	private String rtlOgnzGnrlSum1;
	private String rtlOgnzGnrlSmplTrst1;
	private String rtlOgnzGnrlSmplEmspap1;
	private String rtlOgnzOGnzSum1;
	private String rtlOgnzOgnzCprtnSortTrst1;
	private String rtlOgnzOgnzCtrtEmspap1;
	private String rtlOgnzTotTrmtVlm1;

	private String rtlOgnzTotTrmtAmt2;
	private String rtlOgnzGnrlSum2;
	private String rtlOgnzGnrlSmplTrst2;
	private String rtlOgnzGnrlSmplEmspap2;
	private String rtlOgnzOGnzSum2;
	private String rtlOgnzOgnzCprtnSortTrst2;
	private String rtlOgnzOgnzCtrtEmspap2;
	private String rtlOgnzTotTrmtVlm2;

	private String rtlOgnzTotTrmtAmt3;
	private String rtlOgnzGnrlSum3;
	private String rtlOgnzGnrlSmplTrst3;
	private String rtlOgnzGnrlSmplEmspap3;
	private String rtlOgnzOGnzSum3;
	private String rtlOgnzOgnzCprtnSortTrst3;
	private String rtlOgnzOgnzCtrtEmspap3;
	private String rtlOgnzTotTrmtVlm3;

	private String rtlOgnzTotTrmtAmt4;
	private String rtlOgnzGnrlSum4;
	private String rtlOgnzGnrlSmplTrst4;
	private String rtlOgnzGnrlSmplEmspap4;
	private String rtlOgnzOGnzSum4;
	private String rtlOgnzOgnzCprtnSortTrst4;
	private String rtlOgnzOgnzCtrtEmspap4;
	private String rtlOgnzTotTrmtVlm4;

	/* 5.2 APC 처리실적 */
	private String apcGnrlTrmtAmt1;
	private String apcOgnzCprtnSortTrst1;
	private String apcCtrtEmspap1;
	private String apcTrmtAmt1;
	private String apcTrmtVlm1;
	private String tmSpmtAmt1;
	private String tmSpmtRt1;

	private String apcGnrlTrmtAmt2;
	private String apcOgnzCprtnSortTrst2;
	private String apcCtrtEmspap2;
	private String apcTrmtAmt2;
	private String apcTrmtVlm2;
	private String tmSpmtAmt2;
	private String tmSpmtRt2;

	private String apcGnrlTrmtAmt3;
	private String apcOgnzCprtnSortTrst3;
	private String apcCtrtEmspap3;
	private String apcTrmtAmt3;
	private String apcTrmtVlm3;
	private String tmSpmtAmt3;
	private String tmSpmtRt3;

	private String apcGnrlTrmtAmt4;
	private String apcOgnzCprtnSortTrst4;
	private String apcCtrtEmspap4;
	private String apcTrmtAmt4;
	private String apcTrmtVlm4;
	private String tmSpmtAmt4;
	private String tmSpmtRt4;

	/* 5.3 APC 처리상품 주요판매처 */
	private String apcNtslAmtLgszRtl;
	private String apcNtslAmtFoodMtrl;
	private String apcNtslAmtWhlslMrkt;
	private String apcNtslAmtOnlnWhlslMrkt;
	private String apcNtslAmtBzenty;
	private String apcNtslAmtExprt;
	private String apcNtslAmtHmsp;
	private String apcNtslAmtOnlnB2b;
	private String apcNtslAmtOnlnB2c;
	private String apcNtslAmtEtc;

	/* 전체 진척도 관리 */
	private String prgrsLast;
	private String prgrs1;
	private String prgrs2;
	private String prgrs3;
	private String prgrs4;
	private String prgrs5;
	private String prgrs6;
	private String prgrs7;
	private String prgrs8;
	private String prgrs9;
	private String prgrs10;
	private String prgrs11;
	private String prgrs12;
	private String prgrs13;
	private String prgrs14;

	private String aprvCtpvStts;	//승인상태 지자체(시도)
	private String aprvCtpvUserId;	//승인자 아이디 지자체(시도)
	private String aprvCtpvDt;		//승일일자 지자체(시도)

	private String aprvSggStts;		//승인상태 지자체(시군구)
	private String aprvSggUserId;	//승인자 아이디 지자체(시군구)
	private String aprvSggDt;		//승일일자 지자체(시군구)

	private String userType;
	private String userId;

}











