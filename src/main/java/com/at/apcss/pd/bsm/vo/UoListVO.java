package com.at.apcss.pd.bsm.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UoListVO extends ComVO{
	private String apoCd;			//산지유통조직코드

	private String uoApoCd;			//산지유통조직코드(통합조직)
	private String uoApoSe;			//산지유통조직구분(통합조직)
	private String uoCorpNm;		//법인명(통합조직)
	private String uoBrno;			//사업자번호(통합조직)
	private String uoCrno;			//법인등록번호(통합조직)
	private String isoApoCd;		//산지유통조직코드(출자출하조직)
	private String isoApoSe;		//산지유통조직구분(출자출하조직)
	private String isoCorpNm;		//법인명(출자출하조직)
	private String isoBrno;			//사업자번호(출자출하조직)
	private String isoCrno;			//법인등록번호(출자출하조직)
	private String rmrk;			//비고

	private String brno;			//사업자번호


	private String sysFrstInptUserNm;		//시스템최초입력사용자이름
	private String sysFrstInptDtYmd;		//시스템최초입력일시ymd

	private String sysLastChgUserNm;		//시스템최종변경사용자이름
	private String sysLastChgDtYmd;			//시스템최종변경일시ymd

}
