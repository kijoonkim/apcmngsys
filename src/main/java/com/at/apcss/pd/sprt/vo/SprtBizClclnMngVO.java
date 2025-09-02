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
    private long atchFileSn;

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

    /**
     * 정산순서
     */
    private int clclnSeq;

    /**
     * 문서순서
     */
    private int docSeq;

    /**
     * 문서종류
     */
    private String docKnd;

    /**
     * 문서코드
     */
    private String docCd;

    /**
     * 문서비고
     */
    private String docRmrk;

    /**
     * 교부결정서 1차 - 정산순번
     */
    private String clclnSeqFirst;

    /**
     * 교부결정서 1차 - 문서순번
     */
    private String docSeqFirst;

    /**
     * 교부결정서 1차 - 첨부파일 일련번호
     */
    private String atchFileSnFirst;


    /**
     * 교부결정서 1차 - 원본파일명
     */
    private String lgcFileNmFirst;


    /**
     * 교부결정서 2차 - 정산순번
     */
    private String clclnSeqSecond;

    /**
     * 교부결정서 2차 - 문서순번
     */
    private String docSeqSecond;

    /**
     * 교부결정서 2차 - 첨부파일 일련번호
     */
    private String atchFileSnSecond;


    /**
     * 교부결정서 2차 - 원본파일명
     */
    private String lgcFileNmSecond;

    /**
     * 교부결정액 1차
     */
    private Long dtbnDcsnAmtFirst;

    /**
     * 교부결정액 2차
     */
    private Long dtbnDcsnAmtSecond;

    /**
     * 정산가능액1차
     */
    private int clclnPsbltyAmt;

    /**
     * 정산가능액1차
     */
    private int clclnPsbltyAmtFirst;

    /**
     * 정산가능액2차
     */
    private int clclnPsbltyAmtSecond;

    /**
     * 정산신청금액
     */
    private int clclnAplyAmt;

    /**
     * 정산신청비고
     */
    private String clclnAplyRmrk;

    /**
     * 정산승인금액
     */
    private int clclnAprvAmt;

    /**
     * 정산기각금액
     */
    private int clclnRjctAmt;

    /**
     * 1차 승인여부
     */
    private String aprvYnFirst;

    /**
     * 1차 변경여부
     */
    private String chgYnFirst;


    /**
     * 2차 승인여부
     */
    private String aprvYnSecond;

    /**
     * 2차 변경여부
     */
    private String chgYnSecond;


    /**
     * 주요항목 구분
     */
    private String artclKnd;

    /**
     * 주요항목 코드
     */
    private String majorArtclCd;

    /**
     * 주요항목 명칭
     */
    private String majorArtclNm;

    /**
     * 주요항목 사용 여부
     */
    private String majorArtclUseYn;

    /**
     * 주요항목 표시 순서
     */
    private int majorArtclIndctSeq;

    /**
     * 주요항목 속성 코드
     */
    private String majorAtrbCd;

    /**
     * 세부항목 코드
     */
    private String dtlArtclCd;

    /**
     * 세부항목 명칭
     */
    private String dtlArtclNm;

    /**
     * 세부항목 사용 여부
     */
    private String dtlArtclUseYn;

    /**
     * 세부항목 표시 순서
     */
    private int dtlArtclIndctSeq;

    /**
     * 세부항목 속성 코드
     */
    private String dtlAtrbCd;

    /**
     * 증빙항목 구분
     */
    private String prufArtclKnd;

    /**
     * 증빙항목 코드
     */
    private String prufArtclCd;

    /**
     * 증빙항목 표시 순서
     */
    private int prufIndctSeq;

    /**
     * 증빙항목 명칭
     */
    private String prufIndctNm;

    /**
     * 정산요청서 - 문서순번
     */
    private int aplyDocSeq;

    /**
     * 정산요청서 - 첨부파일일련번호
     */
    private String aplyAtchFileSn;

    /**
     * 정산요청서 - 승인여부
     */
    private String aplyAprvYn;

    /**
     * 정산요청서 - 변경여부
     */
    private String aplyChgYn;

    /**
     * 정산요청서 파일 - 논리파일명
     */
    private String aplyLgcFileNm;

    /**
     * 정산요청서 파일 - 확장자
     */
    private String aplyFileExtnNm;

    /**
     * 정산요청서 파일 - 확장자
     */
    private String aplyRegDt;

    /**
     * 정산요청서 파일 - 확인시간
     */
    private String aplyIdfrDt;


    /**
     * 엑셀 세부내역서 - 문서순번
     */
    private int excelDocSeq;

    /**
     * 엑셀 세부내역서 - 첨부파일일련번호
     */
    private String excelAtchFileSn;

    /**
     * 엑셀 세부내역서 - 승인여부
     */
    private String excelAprvYn;

    /**
     * 엑셀 세부내역서 - 변경여부
     */
    private String excelChgYn;

    /**
     * 엑셀 세부내역서 파일 - 논리파일명
     */
    private String excelLgcFileNm;

    /**
     * 엑셀 세부내역서 파일  - 확장자
     */
    private String excelFileExtnNm;

    /**
     * 엑셀 세부내역서 파일 - 확장자
     */
    private String excelRegDt;

    /**
     * 엑셀 세부내역서 파일 - 확인시간
     */
    private String excelIdfrDt;


    /**
     * 체크리스트 - 문서순번
     */
    private int chkDocSeq;

    /**
     * 체크리스트 - 첨부파일일련번호
     */
    private String chkAtchFileSn;

    /**
     * 체크리스트 - 승인여부
     */
    private String chkAprvYn;

    /**
     * 체크리스트 - 변경여부
     */
    private String chkChgYn;

    /**
     * 체크리스트 - 논리파일명
     */
    private String chkLgcFileNm;

    /**
     * 체크리스트  - 확장자
     */
    private String chkFileExtnNm;

    /**
     * 체크리스트 - 확장자
     */
    private String chkRegDt;

    /**
     * 체크리스트 - 확인시간
     */
    private String chkIdfrDt;

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

    /**
     * 교부결정서 파일
     */
    private List<MultipartFile> dtbnDscnDocFiles;

    public List<MultipartFile> getDtbnDscnDocFiles(){
        return dtbnDscnDocFiles == null ? null : new ArrayList<>(dtbnDscnDocFiles);
    }

    public void setDtbnDscnDocFiles(List<MultipartFile> dtbnDscnDocFiles) {
        this.dtbnDscnDocFiles = dtbnDscnDocFiles == null ? null : new ArrayList<>(dtbnDscnDocFiles);
    }

    /**
     * 정산요청서 파일
     */
    private List<MultipartFile> clclnAplyDocFiles;

    public List<MultipartFile> getclclnAplyDocFiles(){
        return clclnAplyDocFiles == null ? null : new ArrayList<>(clclnAplyDocFiles);
    }

    public void setclclnAplyDocFiles(List<MultipartFile> clclnAplyDocFiles) {
        this.clclnAplyDocFiles = clclnAplyDocFiles == null ? null : new ArrayList<>(clclnAplyDocFiles);
    }

    /**
     * 엑셀 세부내역서
     */
    private List<MultipartFile> excelDsctnDocFiles;

    public List<MultipartFile> getExcelDsctnDocFiles(){
        return excelDsctnDocFiles == null ? null : new ArrayList<>(excelDsctnDocFiles);
    }

    public void setExcelDsctnDocFiles(List<MultipartFile> excelDsctnDocFiles) {
        this.excelDsctnDocFiles = excelDsctnDocFiles == null ? null : new ArrayList<>(excelDsctnDocFiles);
    }

    /**
     * 증빙서류 체크리스트
     */
    private List<MultipartFile> clclnCheckListDocFiles;

    public List<MultipartFile> getClclnCheckListDocFiles(){
        return clclnCheckListDocFiles == null ? null : new ArrayList<>(clclnCheckListDocFiles);
    }

    public void setClclnCheckListDocFiles(List<MultipartFile> clclnCheckListDocFiles) {
        this.clclnCheckListDocFiles = clclnCheckListDocFiles == null ? null : new ArrayList<>(clclnCheckListDocFiles);
    }
}
