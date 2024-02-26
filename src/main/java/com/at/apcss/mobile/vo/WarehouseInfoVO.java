package com.at.apcss.mobile.vo;

import java.util.Arrays;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

import com.at.apcss.am.wrhs.vo.RawMtrWrhsVO;

@Getter
@Setter
public class WarehouseInfoVO extends RawMtrWrhsVO{
	
	/**
	 * 업로드이미지
	 */
	private List<MultipartFile> uploadFiles = Arrays.asList();
	/**
	 * 설명
	 */
	private String description;
	/**
	 * 업로드 파일명
	 */
	private String attachFile;
	/**
	 * 업로드 파일 데이터
	 */
	private byte[] attachFileData;
	/**
	 * 자재위치
	 */
	private String mtAddress;
	
	/**
	 * 조회값
	 */
	private String searchValue;
}
