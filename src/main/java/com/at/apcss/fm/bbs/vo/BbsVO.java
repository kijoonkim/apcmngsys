package com.at.apcss.fm.bbs.vo;

import java.util.List;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BbsVO extends ComVO{

	private String msgKey;
	private String msgCn;
	private String msgKnd;
	private String msgKndNm;
	private String rmrk;
	private String bbsNo;
	private String bbsTtl;
	private String bbsSeCd;
	private String bbsSeCdNm;
	private String bbsSbjt;
	private String sysFrstInptUserIdNm;
	private String sysLastChgUserIdNm;
	private String sysFrstInptDtYmd;
	private String sysLastChgDtYmd;

	private String attCnt;
	private List<BbsFileVO> attaches ;      /*첨부파일 리스트    */
	private int[] delAtchNos;             /*삭제를 위한 글 번호  */
}
