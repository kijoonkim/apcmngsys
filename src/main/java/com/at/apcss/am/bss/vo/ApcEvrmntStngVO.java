package com.at.apcss.am.bss.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : ApcEvrmntStngVO.java
 * @Description : APC 환경설정에 대한 VO 클래스
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
public class ApcEvrmntStngVO extends ComVO {
	
	/**
	 * APC코드
	 */
	private String apcCd;
	/**
	 * APC명
	 */
	private String apcNm;
	/**
	 * 주소
	 */
	private String addr;
	/**
	 * 전화번호
	 */
	private String telNo;
	/**
	 * FAX번호
	 */
	private String fxNo;
	/**
	 * 사업자등록번호
	 */
	private String brno;
	/**
	 * APC구분코드
	 */
	private String apcSeCd;
	/**
	 * 정산기준
	 */
	private String clclnCrtr;
	/**
	 * 계량정보관리유무
	 */
	private String wghMngYn;
	/**
	 * 계량테블릿사용유무
	 */
	private String wghMblUseYn;
	/**
	 * 계량확인서발행유무
	 */
	private String wghIdntyDocPblcnYn;
	/**
	 * 원물입고관리유무
	 */
	private String rawMtrWrhsMngYn;
	/**
	 * 원물입고테블릿사용유무
	 */
	private String rawMtrWrhsMblUseYn;
	/**
	 * 원물인식표발행유무
	 */
	private String rawMtrIdentTagPblcnYn;
	/**
	 * 팔레트/박스 관리유무
	 */
	private String pltBxMngYn;
	/**
	 * 원물입고계획관리유무
	 */
	private String rawMtrWrhsPlanMngYn;
	/**
	 * 상품입고관리유무
	 */
	private String gdsWrhsMngYn;
	/**
	 * 선별지시관리유무
	 */
	private String sortCmndMngYn;
	/**
	 * 선별지시서발행유무
	 */
	private String sortCmndDocPblcnYn;
	/**
	 * 포장지시관리유무
	 */
	private String pckgCmndMngYn;
	/**
	 * 포장지시서발행유무
	 */
	private String pckgCmndDocPblcnYn;
	/**
	 * 선별관리유무
	 */
	private String sortMngYn;
	/**
	 * 선별테블릿사용유무
	 */
	private String sortMblUseYn;
	/**
	 * 선별라벨발행유무
	 */
	private String sortLblPblcnYn;
	/**
	 * 선별확인서발행유무
	 */
	private String sortIdntyDocPblcnYn;
	/**
	 * 포장관리유무
	 */
	private String pckgMngYn;
	/**
	 * 포장테블릿사용유무
	 */
	private String pckgMblUseYn;
	/**
	 * 상품라벨발행유무
	 */
	private String gdsLblPblcnYn;
	/**
	 * 출하지시관리유무
	 */
	private String spmtCmndMngYn;
	/**
	 * 출하지시서발행유무
	 */
	private String spmtCmndDocPblcnYn;
	/**
	 * 출하관리유무
	 */
	private String spmtMngYn;
	/**
	 * 출하테블릿사용유무
	 */
	private String spmtMblUseYn;
	/**
	 * 송품장발행유무
	 */
	private String spmtDocPblcnYn;
	/**
	 * 정산관리유무
	 */
	private String clclnMngYn;
	/**
	 * 발주정보관리유무
	 */
	private String ordrMngYn;
	/**
	 * 발주정보포장지시연결유무
	 */
	private String ordrPckgCmndLnkgYn;
	/**
	 * 전송관리유무
	 */
	private String trsmMngYn;
	/**
	 * 선별자료전송유무
	 */
	private String sortDataTrsmYn;
	/**
	 * 정산자료전송유무
	 */
	private String clclnDataTrsmYn;
}
