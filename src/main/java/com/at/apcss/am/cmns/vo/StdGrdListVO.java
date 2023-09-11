package com.at.apcss.am.cmns.vo;

import java.util.List;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class StdGrdListVO extends ComVO {

	private List<StdGrdVO> stdGrdList;
	private List<StdGrdDtlVO> stdGrdDtlList;
	private List<StdGrdJgmtVO> stdGrdJgmtList;

}
