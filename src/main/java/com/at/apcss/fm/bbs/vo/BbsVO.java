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
	private String bbsTitle;
	private String bbsSeCd;
	private String bbsSeCdNm;
	private String bbsSbjt;

	private String sysFrstInptUserIdNm;
	private String sysLastChgUserIdNm;
	private String sysFrstInptDtYmd;
	private String sysLastChgDtYmd;

	private String bbsEditChk;
	private String bbsUserNm;
	private String userId;
	private String userType;

	private String attCnt;
	private List<BbsFileVO> attaches ;      /*첨부파일 리스트    */
	private int[] delAtchNos;             /*삭제를 위한 글 번호  */

	//20241031 답변,비밀글 컬럼 추가
	private String ansSbjt;		//답변 내용
	private String ansStts;		//답변 상태
	private String ansSttsNm;	//답변 상태
	private String ansUserId;	//답변자 아이디
	private String ansUserNm;	//답변자 이름
	private String ansDt;		//답변일시

	private String prvtPstYn;	//게시글 비공개 여부
}
