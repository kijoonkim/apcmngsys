package com.at.apcss.mobile.vo;


/*******************************************************************
// ElementFile.java
// EssueCMS
//
// Revision 정보
// 2015. 9. 4. 김기준 	최초 릴리즈
// 
*******************************************************************/
public class ElementFile {

	private static final long serialVersionUID = 1L;

	private String originalFileName;
	private String uniqueOriFileName;
	private long fileSize;
	private String contentType;
	private String savedFileName;
	
	public String getOriginalFileName() {
		return originalFileName;
	}
	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}
	public String getUniqueOriFileName() {
		return uniqueOriFileName;
	}
	public void setUniqueOriFileName(String uniqueOriFileName) {
		this.uniqueOriFileName = uniqueOriFileName;
	}
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	public String getContentType() {
		return contentType;
	}
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}
	public String getSavedFileName() {
		return savedFileName;
	}
	public void setSavedFileName(String savedFileName) {
		this.savedFileName = savedFileName;
	}
}