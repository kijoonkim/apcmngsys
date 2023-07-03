package com.at.apcss.am.apc.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.at.apcss.am.apc.vo.ApcEvrmntStngVO;



@Mapper
public interface ApcEvrmntStngMapper {

	ApcEvrmntStngVO selectApcInfo(ApcEvrmntStngVO comApcVO) throws Exception;

}
