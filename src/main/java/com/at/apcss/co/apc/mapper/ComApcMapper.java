package com.at.apcss.co.apc.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.at.apcss.co.apc.vo.ComApcVO;

@Mapper
public interface ComApcMapper {

	ComApcVO selectApcInfo(ComApcVO comApcVO) throws Exception;

}
