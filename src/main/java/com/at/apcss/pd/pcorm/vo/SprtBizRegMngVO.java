package com.at.apcss.pd.pcorm.vo;

import com.at.apcss.am.invntr.vo.RawMtrInvntrVO;
import com.at.apcss.co.sys.vo.ComVO;
import lombok.Getter;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;

/**
 * @Class Name : SprtBizRegMngVO.java
 * @Description : 산지조직지원신청에 대한 VO 클래스
 * @author 유민지
 * @since 2025.06.09
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2025.06.09  유민지        최초 생성
 * </pre>
 */
@Getter
@Setter
public class SprtBizRegMngVO extends ComVO {

    /**
     * 연도
     */
    private String yr;

    /**
     * 산지유통조직구분
     */
    private String apoSe;

    /**
     * 숭인육성형구분
     */
    private String aprv;

    /**
     * 숭인육성형구분명
     */
    private String aprvNm;

    /**
     * 신청일
     */
    private String aplyDay;

    /**
     * 산지유통조직코드
     */
    private String apoCd;

    /**
     * 법인명
     */
    private String corpNm;

    /**
     * 지원사업연도
     */
    private String sprtBizYr;

    /**
     * 지원사업코드
     */
    private String sprtBizCd;

    /**
     * 지원사업명
     */
    private String sprtBizNm;

    /**
     * 지원사업내용
     */
    private String sprtBizExpln;

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
     * 신청문서코드
     */
    private String aplyDocCd;

    /**
     * 첨부파일일련번호
     */
    private int atchFileSn;

    /**
     * 첨부파일일련번호 - 신청서
     */
    private int bizAplyAtchflSn;

    /**
     * 첨부파일일련번호 - 사업계획서
     */
    private int bizPlanAtchflSn;

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
     * 법인번호
     */
    private String crno;

    /**
     * 사업자번호
     */
    private String brno;

    /**
     * 상위사업자번호
     */
    private String upBrno;

    /**
     * 사업자조직코드
     */
    private String bizOgnzCd;

    /**
     * 상위사업자조직코드
     */
    private String upBizOgnzCd;

    /**
     * 사업신청서 첨부파일일련번호
     */
    private int bizAplyAtchFileSn;

    /**
     * 사업신청서 제출여부
     */
    private String bizAplySbmsnYn;

    /**
     * 사업신청서 승연여부
     */
    private String bizAplyAprvYn;

    /**
     * 사업계획서 첨부파일일련번호
     */
    private int bizPlanAtchFileSn;

    /**
     * 사업계획서 제출여부
     */
    private String bizPlanSbmsnYn;

    /**
     * 사업계획서 승연여부
     */
    private String bizPlanAprvYn;

    /**
     * 사업신청서 첨부확인
     */
    private String chkAply;

    /**
     * 사업계획서 첨부확인
     */
    private String chkPlan;

    /**
     * 신청서 파일경로명
     */
    private String bizAplyFilePathNm;

    /**
     * 신청서 원본파일명
     */
    private String bizAplyLgcFileNm;

    /**
     * 신청서 물리파일명
     */
    private String bizAplyPhysFileNm;

    /**
     * 신청서 파일확장자명
     */
    private String bizAplyFileExtnNm;

    /**
     * 사업계획서 파일경로명
     */
    private String bizPlanFilePathNm;

    /**
     * 사업계획서 원본파일명
     */
    private String bizPlanLgcFileNm;

    /**
     * 사업계획서 물리파일명
     */
    private String bizPlanPhysFileNm;

    /**
     * 사업계획서 파일확장자명
     */
    private String bizPlanFileExtnNm;

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
     * 파일크기
     */
    private long fileSz;

    /**
     * 파일확장자명
     */
    private String fileExtnNm;

    /**
     * 조회수
     */
    private int inqCnt;

    /**
     * 다운로드수
     */
    private int dwnldCnt;

    /**
     * 다운로드수
     */
    private String lastUldDt;

    /**
     * 프로시저 실패 리턴 결과
     */
    private String rtnCd;

    /**
     * 프로시저 실패 리턴 메시지
     */
    private String rtnMsg;

    /**
     * 프로시저 리턴 조직아이디
     */
    private String rtnSprtOgnzId;

    private String superUserYn;
    private String untyOgnzCd;

    /**
     * 사업신청서 변경여부
     */
    private String bizAplyChgYn;

    /**
     * 사업계획서 변경여부
     */
    private String bizPlanChgYn;

    /**
     * 신청서 파일
     */
    private List<MultipartFile> sprtAplyFiles;

    /**
     * 사업계획서 파일
     */
    private List<MultipartFile> sprtBizPlanFiles;

    public List<MultipartFile> getSprtAplyFiles() {
        return sprtAplyFiles == null ? null : new ArrayList<>(sprtAplyFiles);
    }
    public void setSprtAplyFiles(List<MultipartFile> sprtAplyFiles) {
        this.sprtAplyFiles = sprtAplyFiles == null ? null : new ArrayList<>(sprtAplyFiles);
    }

    public List<MultipartFile> getSprtBizPlanFiles() {
        return sprtBizPlanFiles == null ? null : new ArrayList<>(sprtBizPlanFiles);
    }

    public void setSprtBizPlanFiles(List<MultipartFile> sprtBizPlanFiles) {
        this.sprtBizPlanFiles = sprtBizPlanFiles == null ? null : new ArrayList<>(sprtBizPlanFiles);
    }
}
