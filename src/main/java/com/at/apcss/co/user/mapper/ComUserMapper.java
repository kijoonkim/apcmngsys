package com.at.apcss.co.user.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import com.at.apcss.co.user.vo.ComUserVO;

@Mapper
public interface ComUserMapper {
	
	/**
	 * 사용자정보 조회
	 * @param comUserVO
	 * @return ComUserVO
	 */
	public ComUserVO selectComUser(ComUserVO comUserVO);
	
	/**
	 * 사용자정보 목록 조회
	 * @param comUserVO
	 * @return List<>
	 */
	public List<ComUserVO> selectComUserList(ComUserVO comUserVO);
	
}
