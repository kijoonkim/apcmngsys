package com.at.apcss.am.vrty.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * 품종정보
 * @author FINEVT 개발팀 김현호
 * @since 2023.09.7
 * @version 1.0
 * @see
 *
 * <pre>
 * 공통코드
 *
 *  수정일      수정자      수정내용
 *  -------     --------    ---------------------------
 *  2023.09.18  김현호       최초 생성
 *
 *  </pre>
 */
	@Getter
	@Setter
public class VrtyVO extends ComVO {
		
	private String apcCd;
	private String apcNm;
	private String itemCd;
	private String itemNm;
	private String vrtyCd;
	private String vrtyNm;
		
}
