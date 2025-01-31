package com.at.apcss.co.mail.service.impl;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.mail.mapper.ApcMailMapper;
import com.at.apcss.co.mail.service.ApcMailService;
import com.at.apcss.co.mail.vo.ApcMailVO;
import com.at.apcss.co.mail.vo.AttachFileVO;
import com.at.apcss.co.mail.vo.EmlLogVO;
import com.at.apcss.co.mail.vo.EmsMailVO;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import org.hsqldb.lib.StringUtil;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.*;
import javax.ws.rs.HttpMethod;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.ProtocolException;
import java.net.URL;
import java.net.URLConnection;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.*;

@Service("apcMailService")
public class ApcMailServiceImpl extends BaseServiceImpl implements ApcMailService {

    @Autowired
    ApcMailMapper apcMailMapper;


    @Value("${spring.server.type}")
    private String serverType;

    @Value("${mail.smtp.host}")
    private String smtpHost;

    @Value("${mail.smtp.port}")
    private String smtpPort;

    @Value("${mail.smtp.auth}")
    private String smtpAuth;

    @Value("${mail.smtp.ssl.enable}")
    private String smtpSslEnable;

    @Value("${mail.smtp.ssl.trust}")
    private String smtpSslTrust;

    @Value("${mail.smtp.ssl.protocols}")
    private String smtpSslProtocols;

    @Value("${mail.user.address}")
    private String userAddress;

    @Value("${mail.user.password}")
    private String userPassword;

    @Value("${mail.report.url}")
    private String emsReportURL;

    @Value("${mail.ems.url}")
    private String emsServerUrl;

    @Value("${apcss.filepath.root}")
    private String filepathRoot;


    @Override
    public HashMap<String, Object> sendMail(ApcMailVO apcMailVO) throws Exception {
        logger.debug("start");
        logger.debug("apcMailVO {}", apcMailVO);
        logger.debug("apcMailVO {}", apcMailVO.toString());
        // 메일 송신
        // 외부 SMTP 서버 정보 설정
        // 외부 SMTP 서버의 호스트명, 포트번호, ssl 혹은 tls 사용여부 확인 필요
        Properties prop = new Properties();
        prop.put("mail.smtp.host", smtpHost);
        prop.put("mail.smtp.port", smtpPort);
        prop.put("mail.smtp.auth", smtpAuth);
        prop.put("mail.smtp.ssl.enable", smtpSslEnable);
        prop.put("mail.smtp.ssl.trust", smtpSslTrust);
        prop.put("mail.smtp.ssl.protocols", smtpSslProtocols);

        // 네이버 로그인(세션 생성)
        Session session = Session.getInstance(prop, new javax.mail.Authenticator(){
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(userAddress, userPassword);
            }
        });

        String charset = ComUtil.nullToDefault(apcMailVO.getCharset(), "UTF-8");

        // 메일을 보낼 수 있는 MimeMessage 객체 생성
        MimeMessage message = new MimeMessage(session);

        // MimeMessage 객체에 보내는사람 세팅
        message.setFrom(new InternetAddress(userAddress));
        //message.setFrom(new InternetAddress(apcMailVO.getMailFrom()));

        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(apcMailVO.getRecipientsTo()));

        // MimeMessage 객체에 제목 세팅
        message.setSubject(apcMailVO.getSubject());

        List<AttachFileVO> attachFileList = apcMailVO.getAttatchFileList();

        // MimeMultipart 객체 생성 (BODY 전체 담기 위함)
        MimeMultipart mimeMultipart = new MimeMultipart();

        // MimeBodyPart 객체 생성 후 MimeMultipart 에 담기 (내용을 담기 위함)
        MimeBodyPart contentBodyPart = new MimeBodyPart();
        String contentType = "text/html;charset=" + charset;
        contentBodyPart.setContent(apcMailVO.getContent(), contentType);
        mimeMultipart.addBodyPart(contentBodyPart);

        if (attachFileList != null && !attachFileList.isEmpty()) {
            String fileEncoding = "B";
            for ( AttachFileVO attachFileVO : attachFileList ) {

                if (!StringUtils.hasText(attachFileVO.getFileName())) {
                    return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "첨부파일명");
                }

                if (!StringUtils.hasText(attachFileVO.getOrgnlFileName())) {
                    attachFileVO.setOrgnlFileName(attachFileVO.getFileName());
                }

                String attachFileName = attachFileVO.getOrgnlFileName();

                File file = new File(attachFileVO.getFilePath());

                // MimeBodyPart 객체 생성 후 MimeMultipart 에 담기 (첨부파일을 담기 위함)
                MimeBodyPart fileBodyPart = new MimeBodyPart();
                fileBodyPart.attachFile(file.getAbsoluteFile());
                fileBodyPart.setFileName(MimeUtility.encodeText(attachFileName, charset, fileEncoding));

                String fileDescription = attachFileName.split("\\.")[0];

                // Content-Type 셋팅.. 파일 MIME Type 지정..
                Path path = Paths.get(file.getCanonicalPath());
                String mimeType = Files.probeContentType(path);
                fileBodyPart.setHeader("Content-Type", mimeType);
                fileBodyPart.setDescription(fileDescription, charset);
                mimeMultipart.addBodyPart(fileBodyPart);
            }
        }

        // MimeMessage 객체에 모든 BODY 담은 MimeMultipart 세팅
        message.setContent(mimeMultipart);
        // MimeMessage 객체에 날짜 세팅

        message.setSentDate(new java.util.Date());
        Transport.send(message);


        if (attachFileList != null && !attachFileList.isEmpty()) {
            for (AttachFileVO attachFileVO : attachFileList) {
                if (attachFileVO.isTemporaryFile()) {
                    File file = new File(attachFileVO.getFilePath());
                    file.delete();
                }
            }
        }

        return null;
    }

    @Override
    public HashMap<String, Object> sendMail(ApcMailVO apcMailVO, List<MultipartFile> multipartFiles) throws Exception {
        if (multipartFiles != null && !multipartFiles.isEmpty()) {
            List<AttachFileVO> attachFileList = new ArrayList<>();
            for ( MultipartFile multipartFile : multipartFiles ) {

                String orgnlFileName = multipartFile.getOriginalFilename();
                long fileSize = multipartFile.getSize();

                String fileExtn = "";
                if (StringUtils.hasText(orgnlFileName) && orgnlFileName.contains(".")) {
                    fileExtn = orgnlFileName.substring(orgnlFileName.lastIndexOf("."));
                }

                String uuid = UUID.randomUUID().toString().replaceAll("\\-", "");

                String rootPath = filepathRoot + "report/uploadTemp/";
                String nowYmd = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy/MM/dd"));
                String dirPath = nowYmd.replace("/", File.separator);
                File tempDir = new File(rootPath, dirPath);

                if (!tempDir.exists()) {
                    boolean successMkdirs = tempDir.mkdirs();
                    if (!successMkdirs) {
                        return ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "디렉토리생성오류");
                    }
                }

                String tempFileFullPath = rootPath + File.separator + dirPath + File.separator + uuid;
                Path savePath = Paths.get(tempFileFullPath);
                try {
                    multipartFile.transferTo(savePath);
                } catch (IOException e) {
                    return ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "파일저장오류");
                }

                AttachFileVO attachFileVO = new AttachFileVO();
                attachFileVO.setFileName(uuid);
                attachFileVO.setFilePath(tempFileFullPath);
                attachFileVO.setOrgnlFileName(orgnlFileName);
                attachFileVO.setFileExtn(fileExtn);
                attachFileVO.setFileSize(fileSize);
                attachFileVO.setTemporaryFile(true);

                attachFileList.add(attachFileVO);
            }

            apcMailVO.setAttatchFileList(attachFileList);
        }

        return sendMail(apcMailVO);
    }

    @Override
    public HashMap<String, Object> sendMailSimple(ApcMailVO apcMailVO) throws Exception {
        HashMap<String, Object> rtnObj = null;
        if (ComConstants.SERVER_TYPE_PRD.equals(this.serverType)) {
            EmsMailVO emsMailVO = new EmsMailVO();
            emsMailVO.setTitle(ComUtil.nullToDefault(apcMailVO.getSubject(), "[제목없음]"));   // 메일 발송 제목
            emsMailVO.setContent(apcMailVO.getContent());          // 메일 발송 내용
            emsMailVO.setSendInfo(apcMailVO.getMailFrom());        // 발송자 정보 : (이메일주소 이름) 이메일 주소와 이름 띄어쓰기로 구분
            emsMailVO.setRcvInfo(apcMailVO.getRecipientsTo());     // 수신자 정보 : (이메일주소 이름) 이메일 주소와 이름 띄어쓰기로 구분
            emsMailVO.setSendType("D");             // D : 즉시전송(기본값), R : 예약전송
            rtnObj = sendEmsMailSimple(emsMailVO);
        } else {
            rtnObj = sendMail(apcMailVO);
        }

        return rtnObj;
    }

    @Override
    public HashMap<String, Object> sendEmsMail(EmsMailVO emsMailVO) throws Exception {

        if (!StringUtils.hasText(emsServerUrl)) {
            return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "EMS 서버");
        }

        String emsURL = emsServerUrl.concat("api/sendMail.do");

        String defaultCategoryNm = "APC";
        String defaultLinkNm = "APC";

        List<AttachFileVO> fileList = emsMailVO.getFileList();

        Map<String, String> emsMap = new HashMap<>();
        emsMap.put("title", emsMailVO.getTitle());              // 메일 발송 제목
        emsMap.put("content", emsMailVO.getContent());          // 메일 발송 내용
        emsMap.put("sendInfo", emsMailVO.getSendInfo());        // 발송자 정보 : (이메일주소 이름) 이메일 주소와 이름 띄어쓰기로 구분
        emsMap.put("rcvInfo", emsMailVO.getRcvInfo());          // 수신자 정보 : (이메일주소 이름) 이메일 주소와 이름 띄어쓰기로 구분
        emsMap.put("sendDate", emsMailVO.getSendDate());        // 메일 전송 시간(YYYYMMDDHH24MISS), 기본값 : 현재시간
        emsMap.put("sendType", emsMailVO.getSendType());        // D : 즉시전송(기본값), R : 예약전송
        emsMap.put("categoryNm", ComUtil.nullToDefault(emsMailVO.getCategoryNm(), defaultCategoryNm));  // 메일의 분류 값 : APC
        emsMap.put("linkNm", ComUtil.nullToDefault(emsMailVO.getLinkNm(), defaultLinkNm));              // 각 시스템별 고유 구분 값(연계시스템 코드) : APC
        emsMap.put("memo", emsMailVO.getMemo());                // 메모 : 사용자 지정값

        String fileYn = fileList != null && !fileList.isEmpty() ? ComConstants.CON_YES : ComConstants.CON_NONE;
        if (ComConstants.CON_YES.equals(fileYn)) {
            if (fileList.size() > 5) {
                return ComUtil.getResultMap(ComConstants.MSGCD_GREATER_THAN, "첨부파일수||5");
            }
            emsURL = emsServerUrl.concat("api/sendMailFile.do");

            emsMap.put("fileYn", fileYn);          // 파일첨부여부

        } else {
            emsURL = emsServerUrl.concat("api/sendMail.do");
        }

        URL url = new URL(emsURL); //URL 객체 생성
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestProperty("Content-Type", "multipart/form-data;charset=utf-8;boundary=" + ComConstants.PART_BOUNDARY);
        connection.setRequestMethod(HttpMethod.POST);
        connection.setDoInput(true);
        connection.setDoOutput(true);
        connection.setUseCaches(false);
        connection.setConnectTimeout(15000);

        String emsResult = "";

        OutputStream outputStream;
        PrintWriter writer;

        outputStream = connection.getOutputStream();
        writer = new PrintWriter(new OutputStreamWriter(outputStream, StandardCharsets.UTF_8), true);

        /** Body에 데이터를 넣어줘야 할경우 없으면 Pass **/
        writer.append("--").append(ComConstants.PART_BOUNDARY).append(System.lineSeparator());
        Set<String> emsParamKeys = emsMap.keySet();
        for ( String key : emsParamKeys ) {
            String value = emsMap.getOrDefault(key, ComConstants.CON_BLANK);
            writer.append("Content-Disposition: form-data; name=").append("\"").append(key).append("\"").append(System.lineSeparator());
            writer.append("Content-Type: text/plain; charset=").append("UTF-8").append(System.lineSeparator());
            writer.append(System.lineSeparator());
            writer.append(value).append(System.lineSeparator());
        }
        writer.flush();

        if (ComConstants.CON_YES.equals(fileYn)) {
            int counter = 0;
            BufferedInputStream inputStream = null;
            for ( AttachFileVO fileVO : fileList ) {
                String nameField = "file" + ComUtil.toString(counter);
                String fileName = ComUtil.nullToDefault(fileVO.getOrgnlFileName(), fileVO.getFileName());
                if (!StringUtils.hasText(fileName)) {
                    return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "첨부파일명");
                }
                File file = new File("");// fileVO.getAttachFile();
                if (file == null) {
                    return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "첨부파일");
                }

                /** 파일 데이터를 넣는 부분**/
                writer.append("--").append(ComConstants.PART_BOUNDARY).append(System.lineSeparator());
                writer.append("Content-Disposition: form-data; name=\"").append(nameField).append("\"; filename=\"").append(fileName).append("\"").append(System.lineSeparator());
                writer.append("Content-Type: ").append(URLConnection.guessContentTypeFromName(file.getName())).append(System.lineSeparator());
                writer.append(System.lineSeparator());
                writer.flush();
                try {
                    FileInputStream fileInputStream = new FileInputStream(file);
                    byte[] emsBuffer = new byte[(int)file.length()];
                    int bytesRead = -1;
                    while ((bytesRead = fileInputStream.read(emsBuffer)) != -1) {
                        outputStream.write(emsBuffer, 0, bytesRead);
                    }
                    outputStream.flush();
                    fileInputStream.close();
                    writer.append(System.lineSeparator());
                    writer.flush();
                } catch( Exception e) {
                    return ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "파일첨부 실패");
                }

            }
        }

        writer.append("--").append(ComConstants.PART_BOUNDARY).append("--").append(System.lineSeparator());
        writer.close();

        int emsResponseCode = connection.getResponseCode();
        if (emsResponseCode == HttpURLConnection.HTTP_OK || emsResponseCode == HttpURLConnection.HTTP_CREATED) {
            try {
                BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
                String inputLine;
                StringBuilder stringBuilder = new StringBuilder();
                while ((inputLine = in.readLine()) != null) {
                    stringBuilder.append(inputLine);
                }
                in.close();

                JSONParser jsonParser = new JSONParser();
                Object objRoot = jsonParser.parse(stringBuilder.toString());
                JSONObject jsonRoot = (JSONObject) objRoot;
                if (jsonRoot != null) {
                    Object objTop = jsonRoot.get("result");
                    JSONObject jsonTop = (JSONObject) objTop;
                    if (jsonTop != null) {
                        Object objResult = jsonTop.get("result");
                        JSONObject jsonResult = (JSONObject) objResult;
                        if (jsonResult != null) {
                            emsResult = (String)jsonResult.get("result");
                        }
                    }
                }
            } catch( Exception e) {
                return ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "EMS 송신 후 응답 없음");
            }
        } else {
            return ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "EMS 전송 실패");
        }

        if (!"SUCCESS".equals(emsResult)) {
            return ComUtil.getResultMap(ComConstants.MSGCD_ERR_PARAM_ONE, "EMS 송신");
        }

        return null;
    }

    @Override
    public HashMap<String, Object> sendEmsMailSimple(EmsMailVO emsMailVO) throws Exception {

        if (!StringUtils.hasText(emsServerUrl)) {
            return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "EMS 서버");
        }

        String emsURL = emsServerUrl.concat("api/sendMail.do");

        JSONParser jsonParser = new JSONParser();

        String defaultCategoryNm = "APC";
        String defaultLinkNm = "APC";

        JSONObject data = new JSONObject();
        data.put("title", emsMailVO.getTitle());              // 메일 발송 제목
        data.put("content", emsMailVO.getContent());          // 메일 발송 내용
        data.put("sendInfo", emsMailVO.getSendInfo());        // 발송자 정보 : (이메일주소 이름) 이메일 주소와 이름 띄어쓰기로 구분
        data.put("rcvInfo", emsMailVO.getRcvInfo());          // 수신자 정보 : (이메일주소 이름) 이메일 주소와 이름 띄어쓰기로 구분
        data.put("sendDate", emsMailVO.getSendDate());        // 메일 전송 시간(YYYYMMDDHH24MISS), 기본값 : 현재시간
        data.put("sendType", emsMailVO.getSendType());        // D : 즉시전송(기본값), R : 예약전송
        data.put("categoryNm", ComUtil.nullToDefault(emsMailVO.getCategoryNm(), defaultCategoryNm));  // 메일의 분류 값 : APC
        data.put("linkNm", ComUtil.nullToDefault(emsMailVO.getLinkNm(), defaultLinkNm));              // 각 시스템별 고유 구분 값(연계시스템 코드) : APC
        data.put("memo", emsMailVO.getMemo());                // 메모 : 사용자 지정값

        JSONObject body = new JSONObject();
        body.put("data", data);

        emsURL = emsServerUrl.concat("api/sendMail.do");

        JSONObject jsonRoot = new JSONObject();
        String emsResult = "";

        try {
            URL url = new URL(emsURL); //URL 객체 생성
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod(HttpMethod.POST);
            connection.setRequestProperty("Content-Type", "application/json; utf-8");
            connection.setRequestProperty("Accept", "application/json");
            connection.setDoOutput(true);

            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(connection.getOutputStream()));
            bw.write(body.toString());
            bw.flush();
            bw.close();

            BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream())); //, StandardCharsets.UTF_8
            String inputLine;
            StringBuilder stringBuilder = new StringBuilder();
            while ((inputLine = br.readLine()) != null) {
                stringBuilder.append(inputLine);
            }
            br.close();

            Object objResp  = jsonParser.parse(stringBuilder.toString());
            jsonRoot = (JSONObject) objResp;

            int emsResponseCode = connection.getResponseCode();
            String errorMessage = "";
            switch (emsResponseCode) {

                case HttpURLConnection.HTTP_OK:
                case HttpURLConnection.HTTP_CREATED:
                    errorMessage = "";
                    break;

                case HttpURLConnection.HTTP_BAD_REQUEST:
                    errorMessage = "EMS 파라미터 오류";
                    break;
                case HttpURLConnection.HTTP_INTERNAL_ERROR:
                    errorMessage = "EMS 처리 오류";
                    break;

                default:
                    errorMessage = "EMS 응답오류";
                    break;
            }

            if (StringUtils.hasText(errorMessage)) {
                return ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, errorMessage);
            }

            if (jsonRoot != null) {
                Object objTop = jsonRoot.get("result");
                JSONObject jsonTop = (JSONObject) objTop;
                if (jsonTop != null) {
                    Object objResult = jsonTop.get("result");
                    JSONObject jsonResult = (JSONObject) objResult;
                    if (jsonResult != null) {
                        emsResult = (String)jsonResult.get("result");
                    }
                }
            }

            if (!"SUCCESS".equals(emsResult)) {
                return ComUtil.getResultMap(ComConstants.MSGCD_ERR_PARAM_ONE, "EMS 송신");
            }

        } catch (ProtocolException e){
            logger.error(e.getLocalizedMessage());
            return ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, e.getLocalizedMessage());
        } catch (IOException e) {
            return ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, e.getLocalizedMessage());
        }

        return null;
    }

    @Override
    public List<EmlLogVO> selectComEmlLogListForSndng(EmlLogVO emlLogVO) throws Exception {
        return null;
    }


    @Override
    public HashMap<String, Object> updateComEmlLogForStandby() throws Exception {

        EmlLogVO paramVO = new EmlLogVO();
        paramVO.setFetchSize(1000);
        List<EmlLogVO> standbyList = apcMailMapper.selectComEmlLogListForSndng(paramVO);

        if (standbyList != null && !standbyList.isEmpty()) {

            for ( EmlLogVO eml : standbyList ) {
                ApcMailVO apcMailVO = new ApcMailVO(
                        eml.getSndptyEml(),         // mailFrom,
                        eml.getRcvrEml(),           // recipientsTo,
                        ComConstants.CON_BLANK,     // recipientsCc,
                        ComConstants.CON_BLANK,     // recipientsBcc,
                        eml.getSbjt(),              // subject,
                        eml.getConts(),             // content,
                        ComConstants.CON_BLANK      // charset
                );

                eml.setSndngYn(ComConstants.CON_YES);

                try  {
                    HashMap<String, Object> rtnObj = sendMailSimple(apcMailVO);
                    if (rtnObj != null) {
                        eml.setSndngYn(ComConstants.CON_X);
                    }
                } catch (Exception e) {
                    eml.setSndngYn(ComConstants.CON_X);
                } finally {
                    eml.setSysLastChgUserId(ComConstants.DEFAULT_ERR_USER);
                    eml.setSysLastChgPrgrmId(ComConstants.DEFAULT_ERR_PRGRM);
                    apcMailMapper.updateComEmlLogSndng(eml);
                }
            }
        }

        return null;
    }

}
