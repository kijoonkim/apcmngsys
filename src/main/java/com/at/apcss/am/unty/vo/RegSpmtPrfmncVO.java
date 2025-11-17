package com.at.apcss.am.unty.vo;

import com.at.apcss.am.invntr.vo.PltWrhsSpmtVO;
import com.at.apcss.am.pckg.vo.PckgInptVO;
import com.at.apcss.am.pckg.vo.PckgPrfmncVO;
import com.at.apcss.am.sort.vo.SortInptPrfmncVO;
import com.at.apcss.am.sort.vo.SortPrfmncAtrbVO;
import com.at.apcss.am.sort.vo.SortPrfmncVO;
import com.at.apcss.am.spmt.vo.SpmtPrfmncVO;
import com.at.apcss.am.wgh.vo.WghPrfmncVO;
import com.at.apcss.am.wrhs.vo.RawMtrWrhsVO;
import com.at.apcss.co.sys.vo.ComVO;
import lombok.Getter;
import lombok.Setter;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @Class Name : UntyPrfmncVO.java
 * @Description : 통합 실적에 대한 VO 클래스
 * @author 김호
 * @since 2025.08.18
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2025.08.18  김호        최초 생성
 * </pre>
 */
@Getter
@Setter
public class RegSpmtPrfmncVO extends ComVO {
	/**
	 * APC코드/명
	 * */
	private String apcCd;
	private String apcNm;
	/**
	 * 입고번호
	 * */
	private String wrhsno;
	private String wrhsno1;
	private String wrhsno2;
	private String wrhsno3;
	private String wrhsno4;

	/**
	 * 팔레트번호
	 * */
	private String pltno;
	private String pltno1;
	private String pltno2;
	private String pltno3;
	private String pltno4;

	/**
	 * 입고일자
	 * */
	private String wrhsYmd;
	private String wrhsYmd1;
	private String wrhsYmd2;
	private String wrhsYmd3;
	private String wrhsYmd4;
	private String wrhsYmdFrom;
	private String wrhsYmdTo;

	/**
	* 품종별입고수량
	* */
	private int vrtyQntt;
	private int vrtyQntt1;
	private int vrtyQntt2;
	private int vrtyQntt3;
	private int vrtyQntt4;
	/**
	 * 품종별입고중량
	 * */
	private double vrtyWght;
	private double vrtyWght1;
	private double vrtyWght2;
	private double vrtyWght3;
	private double vrtyWght4;

	/**
	 * 생산자코드/명
	 * */
	private String prdcrCd;
	private String prdcrNm;

	/**
	 * 선별번호
	 * */
	private String sortno;
	private String sortno1;
	private String sortno2;
	private String sortno3;
	private String sortno4;

	/**
	 * 포장번호
	 * */
	private String pckgno;
	private String pckgno1;
	private String pckgno2;
	private String pckgno3;
	private String pckgno4;
	/**
	 * 출하번호
	 * */
	private String spmtno;
	private String spmtno1;
	private String spmtno2;
	private String spmtno3;
	private String spmtno4;
	/**
	 * 품종코드
	 * */
	private String vrtyCd;
	private String vrtyCd1;
	private String vrtyCd2;
	private String vrtyCd3;
	private String vrtyCd4;

	/**
	 * 품목코드/명
	 * */
	private String itemCd;
	private String itemNm;
	/**
	 * 출하일자
	 * */
	private String spmtYmd;
	private String spmtYmd1;
	private String spmtYmd2;
	private String spmtYmd3;
	private String spmtYmd4;
	/**
	 * 출고포장단위코드
	 * */
	private String spmtPckgUnitCd;
	private String spmtPckgUnitCd1;
	private String spmtPckgUnitCd2;
	private String spmtPckgUnitCd3;
	private String spmtPckgUnitCd4;
	/**
	 * 거래처코드/명
	 * */
	private String cnptCd;
	private String cnptNm;
	/**
	 * 거래처&상품명
	 * */
	private String gdsNm;
	/**
	 * 토탈수량/중량
	 * */
	private int totQntt;
	private double totWght;

	/**
	 * 비고
	 * */
	private String rmrk;

}
