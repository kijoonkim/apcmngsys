package com.at.apcss.co.cd.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * 공통코드 VO
 * @author FINEVT 개발팀 김호
 * @since 2023.05.18
 * @version 1.0
 * @see
 *
 * <pre>
 * 공통코드
 *
 *  수정일      수정자      수정내용
 *  -------            --------        ---------------------------
 *  2023.05.18  김호       최초 생성
 *
 *  </pre>
 */
@Getter
@Setter
public class ComCdVO extends ComVO {

	private String cdId;
	private String cdNm;
	private String cdExpln;
	private String cdVl;
	private String cdVlNm;
	private String cdVlExpln;
    private String indctSeq;
	private String delYn;
	private String apcCd;

}
