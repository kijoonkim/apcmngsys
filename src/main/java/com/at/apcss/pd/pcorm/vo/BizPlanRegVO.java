package com.at.apcss.pd.pcorm.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BizPlanRegVO extends ComVO{
	private String yr;
	private String seq;//순번
	private String brno;
	private String corpNm;

}
