package com.at.apcss.co.mail.vo;

import egovframework.com.cmm.service.FileVO;
import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
public class EmsMailVO {

    private String title;
    private String content;
    private String sendInfo;
    private String rcvInfo;
    private String sendDate;
    private String sendType;
    private String categoryNm;
    private String linkNm;
    private String memo;
    private String fileYn;
    private List<AttachFileVO> fileList;
    public List<AttachFileVO> getFileList() {
        return fileList == null ? null : new ArrayList<>(fileList);
    }
    public void setFileList(List<AttachFileVO> fileList) {
        this.fileList = fileList == null ? null : new ArrayList<>(fileList);;
    }

}
