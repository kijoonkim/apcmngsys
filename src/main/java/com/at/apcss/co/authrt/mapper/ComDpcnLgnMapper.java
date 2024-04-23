package com.at.apcss.co.authrt.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.co.authrt.vo.ComDpcnLgnVO;

@Mapper
public interface ComDpcnLgnMapper {

	/**
	 * 로그인중복관리 목록 조회
	 * @param ComDpcnLgnVO
	 * @return List<ComDpcnLgnVO>
	 * @throws Exception
	 */
	public List<ComDpcnLgnVO> selectComDpcnLgnList(ComDpcnLgnVO comDpcnLgnVO) throws Exception;	
	/**
	 * 로그인중복관리 목록 조회
	 * @param ComDpcnLgnVO
	 * @return List<ComDpcnLgnVO>
	 * @throws Exception
	 */
	public String selectUserIdComDpcnLgn(ComDpcnLgnVO comDpcnLgnVO) throws Exception;	
	/**
	 * 로그인중복관리 정보 업데이트
	 * @param ComDpcnLgnVO
	 * @return List<ComDpcnLgnVO>
	 * @throws Exception
	 */
	public int updateDpcnLgn(ComDpcnLgnVO comDpcnLgnVO) throws Exception;	
	/**
	 * 로그인중복관리 정보 입력
	 * @param ComDpcnLgnVO
	 * @return List<ComDpcnLgnVO>
	 * @throws Exception
	 */
	public int insertDpcnLgn(ComDpcnLgnVO comDpcnLgnVO) throws Exception;	
}
