package com.at.apcss.co.mail.vo;

import egovframework.com.cmm.service.FileVO;
import lombok.Getter;
import lombok.Setter;

import java.io.File;
import java.io.Serializable;

@Getter
@Setter
public class AttachFileVO  {

    private String fileName;

    private String filePath;

    private String orgnlFileName;

    private String fileExtn;

    private long fileSize;

    private boolean temporaryFile;

}
