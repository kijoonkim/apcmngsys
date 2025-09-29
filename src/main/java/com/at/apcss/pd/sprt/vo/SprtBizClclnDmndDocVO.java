package com.at.apcss.pd.sprt.vo;

import com.at.apcss.co.sys.vo.ComVO;
import lombok.Getter;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Getter
@Setter
public class SprtBizClclnDmndDocVO extends ComVO {

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
     * 정산순서
     */
    private int clclnSeq;

    /**
     * 공통증빙서류파일
     */
    private List<MultipartFile> prufFileList;

    public List<MultipartFile> getPrufFileList(){
        return prufFileList == null ? null : new ArrayList<>(prufFileList);
    }

    public void setPrufFileList(List<MultipartFile> prufFileList) {
        this.prufFileList = prufFileList == null ? null : new ArrayList<>(prufFileList);
    }


    /**
     * 공통증빙서류파일
     */
    private List<MultipartFile> prufDocBscFileList;

    public List<MultipartFile> getPrufDocBscFileList(){
        return prufDocBscFileList == null ? null : new ArrayList<>(prufDocBscFileList);
    }

    public void setPrufDocBscFileList(List<MultipartFile> prufDocBscFileList) {
        this.prufDocBscFileList = prufDocBscFileList == null ? null : new ArrayList<>(prufDocBscFileList);
    }

    /**
     * 세부증빙서류파일
     */
    private List<MultipartFile> prufDocFileList;

    public List<MultipartFile> getPrufDocFileList(){
        return prufDocFileList == null ? null : new ArrayList<>(prufDocFileList);
    }

    public void setPrufDocFileList(List<MultipartFile> prufDocFileList) {
        this.prufDocFileList = prufDocFileList == null ? null : new ArrayList<>(prufDocFileList);
    }

    /**
     * 증빙서류파일 정보목록
     */
    private List<SprtBizClclnDmndDtlVO> clclnFileInfoList;

    public List<SprtBizClclnDmndDtlVO> getClclnFileInfoList(){
        return clclnFileInfoList == null ? null : clclnFileInfoList.stream().collect(Collectors.toList());
    }

    public void setClclnFileInfoList(List<SprtBizClclnDmndDtlVO> clclnFileInfoList) {
        this.clclnFileInfoList = clclnFileInfoList == null ? null : clclnFileInfoList.stream().collect(Collectors.toList());
    }

    /**
     * 정산요청 정보 목록
     */
    private List<SprtBizClclnDmndDtlVO> clclnDInfoList;

    public List<SprtBizClclnDmndDtlVO> getClclnDInfoList(){
        return clclnDInfoList == null ? null : clclnDInfoList.stream().collect(Collectors.toList());
    }

    public void setClclnDInfoList(List<SprtBizClclnDmndDtlVO> clclnDInfoList) {
        this.clclnDInfoList = clclnDInfoList == null ? null : clclnDInfoList.stream().collect(Collectors.toList());
    }


}
