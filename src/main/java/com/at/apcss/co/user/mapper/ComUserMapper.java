package com.at.apcss.co.user.mapper;


import org.apache.ibatis.annotations.Mapper;
import com.at.apcss.co.user.vo.ComUserVO;

@Mapper
public interface ComUserMapper {
	
	/**
	 * 사용자정보 조회
	 * @param comUserVO
	 * @return
	 */
	public ComUserVO selectComUser(ComUserVO comUserVO);
}
