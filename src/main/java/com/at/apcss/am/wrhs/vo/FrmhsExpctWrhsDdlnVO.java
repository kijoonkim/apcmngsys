package com.at.apcss.am.wrhs.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;
/**
 * @Class Name : FrmhsExpctWrhsDdlnVO.java
 * @Description : 농가예상입고마감에 대한 VO 클래스
 * @author 김  호
 * @since 2024.11.26
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.11.26  김  호        최초 생성
 * </pre>
 */
@Getter
@Setter
public class FrmhsExpctWrhsDdlnVO extends ComVO {

	/*
	 * APC코드
	 * */
	private String apcCd;
	/*
	 * 마감일자
	 * */
	private String ymd;
	/*
	 * 연도
	 * */
	private String yr;
	/*
	 * 사용유무
	 * */
	private String useYn;

}
