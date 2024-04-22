package com.at.apcss.co.authrt.service;

import java.util.List;

import com.at.apcss.co.authrt.vo.ComDpcnLgnVO;

public interface ComDpcnLgnService {

	/**
	 * 로그인중복관리 목록 조회
	 * @param ComDpcnLgnVO
	 * @return List<ComDpcnLgnVO>
	 * @throws Exception
	 */
	public List<ComDpcnLgnVO> selectComDpcnLgnList(ComDpcnLgnVO comDpcnLgnVO) throws Exception;
	/**
	 * 로그인중복관리 업데이트 목록
	 * @param List<ComDpcnLgnVO>
	 * @return integer
	 * @throws Exception
	 */
	public int saveDpcnLgnList(List<ComDpcnLgnVO> comDpcnLgnList) throws Exception;
	/**
	 * 로그인중복관리 업데이트
	 * @param List<ComDpcnLgnVO>
	 * @return integer
	 * @throws Exception
	 */
	public int updateDpcnLgn(ComDpcnLgnVO comDpcnLgnVO) throws Exception;
	/**
	 * 로그인중복관리 입력
	 * @param List<ComDpcnLgnVO>
	 * @return integer
	 * @throws Exception
	 */
	public int insertDpcnLgn(ComDpcnLgnVO comDpcnLgnVO) throws Exception;

}
