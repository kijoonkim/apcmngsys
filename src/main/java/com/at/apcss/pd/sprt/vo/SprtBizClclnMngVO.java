package com.at.apcss.pd.sprt.vo;

import com.at.apcss.co.sys.vo.ComVO;
import lombok.Getter;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
public class SprtBizClclnMngVO extends ComVO {

    /**
     * 기준연도
     */
    private String crtrYr;

    /**
     * 법인번호
     */
    private String crno;

    /**
     * 사업자번호
     */
    private String brno;

    /**
     * 산지유통조직코드
     */
    private String apoCd;

    /**
     * 사업자번호
     */
    private String corpNm;

    /**
     * 사업조직코드
     */
    private String bizOgnzCd;

    /**
     * 상위사업조직코드
     */
    private String upBizOgnzCd;

    /**
     * 지원사업연도
     */
    private String sprtBizYr;

    /**
     * 지원사업코드
     */
    private String sprtBizCd;

    /**
     * 지원조직아이디
     */
    private String sprtOgnzId;

    /**
     * 신청액국비
     */
    private int aplyAmtNe;

    /**
     * 신청액본인
     */
    private int aplyAmtSlf;

    /**
     * 신청비고
     */
    private String aplyRmrk;

    /**
     * 배상액국비
     */
    private int rpnAmtNe;

    /**
     * 배상액본인
     */
    private int rpnAmtSlf;

    /**
     * 적합여부
     */
    private String stbltYn;

    /**
     * 승인여부
     */
    private String aprvYn;

    /**
     * 사유코드
     */
    private String rsnCd;

    /**
     * 사유비고
     */
    private String rsnRmrk;

    /**
     * 삭제유무
     */
    private String delYn;

    /**
     * 교부결정금액
     */
    private int dtbnDcsnAmt;

    /**
     * 교부비고
     */
    private String dtbnRmrk;

    /**
     * 첨부파일일련번호
     */
    private int atchFileSn;

    /**
     * 신청문서코드
     */
    private String aplyDocCd;

    /**
     * 등록자
     */
    private String rgtr;

    /**
     * 등록자아이디
     */
    private String rgtrId;

    /**
     * 등록일시
     */
    private String regDt;

    /**
     * 확인자
     */
    private String idfr;

    /**
     * 확인자아이디
     */
    private String idfrId;

    /**
     * 확인일시
     */
    private String idfrDt;

    /**
     * 확인비고
     */
    private String idfrRmrk;

    /**
     * 변경여부
     */
    private String chgYn;

    /**
     * 파일경로명
     */
    private String filePathNm;

    /**
     * 원본파일명
     */
    private String lgcFileNm;

    /**
     * 물리파일명
     */
    private String physFileNm;

    /**
     * 파일경로명
     */
    private long fileSz;

    /**
     * 파일확장자명
     */
    private String fileExtnNm;

    private String superUserYn;
    private String untyOgnzCd;

    /**
     * 교부신청서 파일
     */
    private List<MultipartFile> dtbnAplyFiles;

    public List<MultipartFile> getDtbnAplyFiles(){
        return dtbnAplyFiles == null ? null : new ArrayList<>(dtbnAplyFiles);
    }

    public void setDtbnAplyFiles(List<MultipartFile> dtbnAplyFiles) {
        this.dtbnAplyFiles = dtbnAplyFiles == null ? null : new ArrayList<>(dtbnAplyFiles);
    }
}
