package com.at.apcss.mobile.vo;

import java.util.Arrays;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class FacilityMngVO extends ComVO{
	
	/**
	 * 설비관리번호
	 */
	private String empno;
	/**
	 * 설비명
	 */
	private String name;
	/**
	 * 원자재규격
	 */
	private String standard;
	/**
	 * 구입처
	 */
	private String buyName;
	/**
	 * 수량
	 */
	private String qtt;
	/**
	 * 중량
	 */
	private String wet;
	/**
	 * 운송구분
	 */
	private String tpc;
	/**
	 * 입고창고
	 */
	private String warehouse;
	/**
	 * 조회값
	 */
	private String searchValue;
}
