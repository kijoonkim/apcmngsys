
package com.at.apcss.pd.hisPopup.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OgnzVO extends ComVO{
	//조직 정보
	private String apoCd;
	private String apoSe;
	private String apoSeNm;
	private String brno;
	private String crno;
	private String corpNm;
	private String aprv;
	private String yr;

	private String uoBrno;
	private String uoApoCd;
	private String uoCorpNm;

	private String mngNo;
	private String indctSeq;

	private String frmhsCnt;
	private String stbltYnNm;
}
