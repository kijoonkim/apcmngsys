package com.at.apcss.co.mail.vo;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Getter
@Setter
public class ApcMailVO {

    private String mailFrom;
    private String recipientsTo;

    private String recipientsCc;

    private String recipientsBcc;

    private String subject;

    private String content;

    private String charset;

    @Builder
    public ApcMailVO(
            String mailFrom,
            String recipientsTo,
            String recipientsCc,
            String recipientsBcc,
            String subject,
            String content,
            String charset) {
        this.mailFrom = mailFrom;
        this.recipientsTo = recipientsTo;
        this.recipientsCc = recipientsCc;
        this.recipientsBcc = recipientsBcc;
        this.subject = subject;
        this.content = content;
        this.charset = charset;
    }


    private List<AttachFileVO> attatchFileList;

    public List<AttachFileVO> getAttatchFileList() {
        return attatchFileList == null ? null : new ArrayList<>(attatchFileList);
    }

    public void setAttatchFileList(List<AttachFileVO> attatchFileList) {
        this.attatchFileList = attatchFileList == null ? null : new ArrayList<>(attatchFileList);;
    }

    @Override
    public String toString() {
        return "ApcMailVO{" +
                "mailFrom='" + mailFrom + '\'' +
                ", recipientsTo='" + recipientsTo + '\'' +
                ", recipientsCc='" + recipientsCc + '\'' +
                ", recipientsBcc='" + recipientsBcc + '\'' +
                ", subject='" + subject + '\'' +
                ", content='" + content + '\'' +
                ", charset='" + charset + '\'' +
                '}';
    }
}
