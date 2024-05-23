package com.at.apcss.pd.pcorm.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BizPlanRegFileVO extends ComVO{
	private String brno;	//사업자번호
	private String dcmntKnd;	//사업자번호

	private String fileSn;	//파일 일련번호
	private String filePathNm;	//파일 경로
	private String orgFileNm;	//원본파일명
	private String srvrFileNm;	//서버파일명
	private long fileSz;	//파일 사이즈
	private String fileExtnNm;	//확장자
	private String dwnldCnt;	//다운로드 횟수

}
