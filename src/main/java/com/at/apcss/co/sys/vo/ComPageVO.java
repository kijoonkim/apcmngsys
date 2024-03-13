package com.at.apcss.co.sys.vo;

import lombok.Getter;
import lombok.Setter;
/**
 * 공통 VO
 * @author FINEVT 개발팀 신정철
 * @since 2023.05.30
 * @version 1.0
 * @see
 *
 * <pre>
 * 공통
 *
 *  수정일      	수정자      	수정내용
 *  ----------  --------	---------------------------
 *  2023.05.30  신정철       	최초 생성
 *
 *  </pre>
 */
@Getter
@Setter
public class ComPageVO {
	private String pagingYn;			// 페이징 여부
	private int rowSeq;					// 레코드 순번
	private int currentPageNo;			// 현재 페이지 번호
	private int recordCountPerPage;		// 한 페이지당 레코드 건수
	private int pageSize;				// 페이지 리스트 표시 페이지 건수
	private int totalRecordCount;		// 전체 레코드 건수
	private int totalPageCount;			// 전체 페이지 건수
	private int firstPageNoOnPageList;	// 페이지 리스트 첫 페이지 번호
	private int lastPageNoOnPageList;	// 페이지 리스트 끝 페이지 번호
	private int firstRecordIndex;		// 현재 페이지 첫 레코드 index
	private int lastRecordIndex;		// 현재 페이지 끝 레코드 index
}
