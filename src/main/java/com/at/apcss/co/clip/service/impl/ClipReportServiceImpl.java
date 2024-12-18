package com.at.apcss.co.clip.service.impl;

import com.at.apcss.co.clip.service.ClipReportService;
import com.at.apcss.co.clip.vo.ClipReportVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.*;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.HttpMethod;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.*;

@Service("clipReportService")
public class ClipReportServiceImpl extends BaseServiceImpl implements ClipReportService {


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

    public HashMap<String, Object> sendMailForPdfByJson(Map<String, Object> params, HttpServletRequest request, ClipReportVO clipReportVO) throws Exception {

        logger.debug("test start");

        Map<String, String> dataParam = new HashMap<>();

        logger.debug("1");
        Set<String> keySet = params.keySet();
        for ( String key : keySet ) {
            String value = (String)params.getOrDefault(key, ComConstants.CON_BLANK);
            dataParam.put(key, value);
            //logger.debug("key {},  value  {}", key, value);
        }
        logger.debug("2");
        String reportUrl = clipReportVO.getReportUrl();
        String clipURL = reportUrl + ComConstants.REPORT_JSP_EXPORT_PDF_JSON;
        logger.debug("3");
        String filename = (String)params.get("pdfFileName");
        logger.debug("4");
        String jsessionId = request.getSession().getId();
        //String jsessionId = request.getSession().getAttribute("JSESSIONID").toString();
        logger.debug("5");
        logger.debug("filename {}", filename);
        logger.debug("jsessionId {}", jsessionId);

        try {
            Connection.Response reportResponse = Jsoup.connect(clipURL)
                    .timeout(10000)
                    .header("Origin", reportUrl)
                    .header("Referer", reportUrl)
                    .header("Accept", "application/json, text/javascript, */*; q=0.01")
                    .header("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8")
                    .header("Accept-Encoding", "gzip, deflate, br")
                    .header("Accept-Language", "ko-KR,ko;q=0.8,en-US;q=0.6,en;q=0.4")
                    .header("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36")
                    .cookie("JSESSIONID", jsessionId)
                    .followRedirects(true)
                    .ignoreContentType(true)
                    .data(dataParam)
                    .method(Connection.Method.POST)
                    .execute();

            String rootPath = clipReportVO.getFilePathRoot() + "report/";
            String str = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy/MM/dd"));
            String folderPath = str.replace("/", File.separator);

            File uploadPathFolder = new File(rootPath, folderPath);
            logger.debug("6");
            logger.debug("getAbsolutePath {}", uploadPathFolder.getAbsolutePath());
            logger.debug("uploadPathFolder {}", uploadPathFolder.getPath());

            if (!uploadPathFolder.exists()) {
                boolean successMkdirs = uploadPathFolder.mkdirs();
                if (!successMkdirs) {
                    return ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "디렉토리생성오류");
                }
            }
            logger.debug("7");

            String saveName = rootPath + File.separator + folderPath + File.separator + filename;

            //File file = new File(folderPath, filename);
            File file = new File(saveName);

            logger.debug("file getAbsolutePath {}", file.getAbsolutePath());
            logger.debug("file getPath {}", file.getPath());
            if (!file.exists()) {
                boolean successNewFile = file.createNewFile();
                if (!successNewFile) {
                    return ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "파일생성오류");
                }
            }
            logger.debug("8");
            BufferedInputStream inputStream = reportResponse.bodyStream();
            FileOutputStream fos = new FileOutputStream(file);
            byte[] buffer = new byte[1024];
            int len;
            while ((len = inputStream.read(buffer)) != -1) {
                fos.write(buffer, 0, len);
            }
            inputStream.close();
            fos.close();

            // 파일저장완료

            // 개발계 경우
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

            // 메일을 보낼 수 있는 MimeMessage 객체 생성
            MimeMessage message = new MimeMessage(session);

            // MimeMessage 객체에 보내는사람 세팅
            message.setFrom(new InternetAddress(userAddress));

            String mailTo = "john@finevt.com,dlgkfn4@finevt.com,jeochu@gmail.com";
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(mailTo));

            // MimeMessage 객체에 제목 세팅
            message.setSubject("테스트");

            // MimeMultipart 객체 생성 (BODY 전체 담기 위함)
            MimeMultipart mimeMultipart = new MimeMultipart();

            // MimeBodyPart 객체 생성 후 MimeMultipart에 담기 (내용을 담기 위함)
            MimeBodyPart contentBodyPart = new MimeBodyPart();
            contentBodyPart.setContent("(개발)리포트 첨부 테스트 입니다.", "text/html;charset=UTF-8");
            mimeMultipart.addBodyPart(contentBodyPart);

            // MimeBodyPart 객체 생성 후 MimeMultipart에 담기 (첨부파일을 담기 위함)
            MimeBodyPart fileBodyPart = new MimeBodyPart();
            fileBodyPart.attachFile(file.getAbsoluteFile());
            fileBodyPart.setFileName(MimeUtility.encodeText("테스트.pdf", "UTF-8", "B"));

            // Content-Type 셋팅.. 파일 MIME Type 지정..

            Path path = Paths.get(file.getCanonicalPath());
            String mimeType = Files.probeContentType(path);
            fileBodyPart.setHeader("Content-Type", mimeType);
            fileBodyPart.setDescription("테스트.pdf".split("\\.")[0], "UTF-8");

            mimeMultipart.addBodyPart(fileBodyPart);
            // MimeMessage 객체에 모든 BODY 담은 MimeMultipart 세팅
            message.setContent(mimeMultipart);
            // MimeMessage 객체에 날짜 세팅
            message.setSentDate(new java.util.Date());
            Transport.send(message);

        } catch( Exception e) {
            return ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, e.getMessage());
        }

        return null;
    }

    @Override
    public HashMap<String, Object> sendEmsMailForPdfByJson(Map<String, Object> params, HttpServletRequest request, ClipReportVO clipReportVO) throws Exception {
        logger.debug("test start");

        Map<String, String> dataParam = new HashMap<>();

        logger.debug("1");
        Set<String> keySet = params.keySet();
        for ( String key : keySet ) {
            String value = (String)params.getOrDefault(key, ComConstants.CON_BLANK);
            dataParam.put(key, value);
            //logger.debug("key {},  value  {}", key, value);
        }

        logger.debug("2");
        String reportUrl = clipReportVO.getReportUrl();
        String clipURL = emsReportURL + ComConstants.REPORT_JSP_EXPORT_PDF_JSON;

        logger.debug("3");
        String filename = (String)params.get("pdfFileName");
        logger.debug("4");
        String jsessionId = request.getSession().getId();
        //String jsessionId = request.getSession().getAttribute("JSESSIONID").toString();
        logger.debug("5");
        logger.debug("filename {}", filename);
        logger.debug("jsessionId {}", jsessionId);

        JSONParser jsonParser = new JSONParser();
        JSONObject emsResult = null;
        String boundary = "------=_Part_123456_789012345.1710102030";
        String LINE_FEED = "\r\n";
        String charset = "UTF-8";
        OutputStream outputStream;
        PrintWriter writer;

        try {

            /*
            URL downloadUrl = new URL(clipURL);

            StringBuilder postData = new StringBuilder();
            for ( Map.Entry<String, Object> param : params.entrySet() ) {
                if (postData.length() != 0) {
                    postData.append("&");
                }
                postData.append(URLEncoder.encode(param.getKey(), charset));
                postData.append("=");
                postData.append(URLEncoder.encode(String.valueOf(param.getValue()), charset));
            }


            byte[] postDataBytes = postData.toString().getBytes(charset);

            HttpURLConnection downloadConn = (HttpURLConnection) downloadUrl.openConnection();
            downloadConn.setRequestMethod(HttpMethod.POST);
            downloadConn.setRequestProperty("Content-Type", "application/json"); //JSON 형태로 데이터 전송
            downloadConn.setRequestProperty("Content-Length", String.valueOf(postDataBytes.length));
            downloadConn.setDoOutput(true);
            downloadConn.setUseCaches(false);
            downloadConn.setConnectTimeout(15000);

            conn.getOutputStream().write(postDataBytes);

            OutputStreamWriter outputStreamWriter = new OutputStreamWriter(downloadConn.getOutputStream());
            writer = new PrintWriter(new OutputStreamWriter(outputStream, charset), true);

            writer.append("--" + boundary).append(LINE_FEED);
            //writer.append("Content-Disposition: form-data; name=\"데이터 키값\"").append(LINE_FEED);
            writer.append("Content-Disposition: form-data;");
            Set<String> dataParamKeys = dataParam.keySet();
            for ( String key : dataParamKeys ) {
                String value = (String)dataParam.getOrDefault(key, ComConstants.CON_BLANK);
                writer.append("Content-Disposition: form-data; name=").append("\"").append(key).append("\"").append(LINE_FEED);
                writer.append("Content-Type: text/plain; charset=").append(charset).append(LINE_FEED);
                writer.append(LINE_FEED);
                writer.append(value).append(LINE_FEED);
            }

            writer.flush();
            writer.append("--").append(boundary).append("--").append(LINE_FEED);
            writer.close();

            FileInputStream fileInputStream = new FileInputStream(file);
            byte[] emsBuffer = new byte[(int)file.length()];
            int bytesRead = -1;
            while ((bytesRead = inputStream.read(emsBuffer)) != -1) {
                outputStream.write(emsBuffer, 0, bytesRead);
            }
            outputStream.flush();
            inputStream.close();
            writer.append(LINE_FEED);
            writer.flush();
            writer.append("--").append(boundary).append("--").append(LINE_FEED);
            writer.close();
            */

            Connection.Response reportResponse = Jsoup.connect(clipURL)
                    .timeout(10000)
                    .header("Origin", reportUrl)
                    .header("Referer", reportUrl)
                    .header("Accept", "application/json, text/javascript, */*; q=0.01")
                    .header("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8")
                    .header("Accept-Encoding", "gzip, deflate, br")
                    .header("Accept-Language", "ko-KR,ko;q=0.8,en-US;q=0.6,en;q=0.4")
                    .header("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36")
                    .cookie("JSESSIONID", jsessionId)
                    .followRedirects(true)
                    .ignoreContentType(true)
                    .data(dataParam)
                    .method(Connection.Method.POST)
                    .execute();

            String rootPath = clipReportVO.getFilePathRoot() + "report/";
            String str = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy/MM/dd"));
            String folderPath = str.replace("/", File.separator);

            File uploadPathFolder = new File(rootPath, folderPath);
            logger.debug("6");
            logger.debug("getAbsolutePath {}", uploadPathFolder.getAbsolutePath());
            logger.debug("uploadPathFolder {}", uploadPathFolder.getPath());

            if (!uploadPathFolder.exists()) {
                boolean successMkdirs = uploadPathFolder.mkdirs();
                if (!successMkdirs) {
                    return ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "디렉토리생성오류");
                }
            }
            logger.debug("7");

            String saveName = rootPath + File.separator + folderPath + File.separator + filename;

            //File file = new File(folderPath, filename);
            File file = new File(saveName);

            logger.debug("file getAbsolutePath {}", file.getAbsolutePath());
            logger.debug("file getPath {}", file.getPath());
            if (!file.exists()) {
                boolean successNewFile = file.createNewFile();
                if (!successNewFile) {
                    return ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "파일생성오류");
                }
            }
            logger.debug("8");
            BufferedInputStream inputStream = reportResponse.bodyStream();
            FileOutputStream fos = new FileOutputStream(file);
            byte[] buffer = new byte[1024];
            int len;
            while ((len = inputStream.read(buffer)) != -1) {
                fos.write(buffer, 0, len);
            }
            inputStream.close();
            fos.close();

            // 파일저장완료


            String emsURL = "http://172.16.10.10/sendMailFile.do";

            Map<String, String> emsMap = new HashMap<>();
            emsMap.put("title", "ems파일전송");                         // 메일 발송 제목
            emsMap.put("content", "ems파일전송테스트입니다.");            // 메일 발송 내용
            emsMap.put("sendInfo", "john@finevt.com 신정철");          // 발송자 정보 : (이메일주소 이름) 이메일 주소와 이름 띄어쓰기로 구분
            emsMap.put("rcvInfo", "john@finevt.com 신정철,jeochu@gmail.com 존촬스");  // 수신자 정보 : (이메일주소 이름) 이메일 주소와 이름 띄어쓰기로 구분
            //emsMap.put("sendDate", nowDate.); // 메일 전송 시간(YYYYMMDDHH24MISS), 기본값 : 현재시간
            //emsMap.put("sendType", "");       // D : 즉시전송(기본값), R : 예약전송
            emsMap.put("categoryNm", "APC");    // 메일의 분류 값
            emsMap.put("linkNm", "APC");        // 각 시스템별 고유 구분 값(연계시스템 코드)
            emsMap.put("memo", "TEST");         //
            emsMap.put("fileYn", "Y");          // 파일첨부여부

            URL url = new URL(emsURL); //URL 객체 생성
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestProperty("Content-Type", "multipart/form-data;charset=utf-8;boundary=" + boundary);
            connection.setRequestMethod(HttpMethod.PUT);
            connection.setDoInput(true);
            connection.setDoOutput(true);
            connection.setUseCaches(false);
            connection.setConnectTimeout(15000);
            outputStream = connection.getOutputStream();
            writer = new PrintWriter(new OutputStreamWriter(outputStream, charset), true);

            /** Body에 데이터를 넣어줘야 할경우 없으면 Pass **/
            writer.append("--" + boundary).append(LINE_FEED);
            //writer.append("Content-Disposition: form-data; name=\"데이터 키값\"").append(LINE_FEED);
            writer.append("Content-Disposition: form-data;");
            Set<String> emsParamKeys = params.keySet();
            for ( String key : emsParamKeys ) {
                String value = (String)emsMap.getOrDefault(key, ComConstants.CON_BLANK);
                writer.append("Content-Disposition: form-data; name=").append("\"").append(key).append("\"").append(LINE_FEED);
                writer.append("Content-Type: text/plain; charset=").append(charset).append(LINE_FEED);
                writer.append(LINE_FEED);
                writer.append(value).append(LINE_FEED);
            }

            writer.flush();

            /** 파일 데이터를 넣는 부분**/
            writer.append("--").append(boundary).append(LINE_FEED);
            writer.append("Content-Disposition: form-data; name=\"file0\"; filename=\"").append(filename).append("\"").append(LINE_FEED);
            writer.append("Content-Type: ").append(URLConnection.guessContentTypeFromName(file.getName())).append(LINE_FEED);
            writer.append("Content-Transfer-Encoding: binary").append(LINE_FEED);
            writer.append(LINE_FEED);
            writer.flush();

            FileInputStream fileInputStream = new FileInputStream(file);
            byte[] emsBuffer = new byte[(int)file.length()];
            int bytesRead = -1;
            while ((bytesRead = inputStream.read(emsBuffer)) != -1) {
                outputStream.write(emsBuffer, 0, bytesRead);
            }
            outputStream.flush();
            inputStream.close();
            writer.append(LINE_FEED);
            writer.flush();
            writer.append("--").append(boundary).append("--").append(LINE_FEED);
            writer.close();

            int emsResponseCode = connection.getResponseCode();
            if (emsResponseCode == HttpURLConnection.HTTP_OK || emsResponseCode == HttpURLConnection.HTTP_CREATED) {
                BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
                String inputLine;
                StringBuilder stringBuilder = new StringBuilder();
                while ((inputLine = in.readLine()) != null) {
                    stringBuilder.append(inputLine);
                }
                in.close();

                try {
                    Object obj = jsonParser.parse(stringBuilder.toString());
                    emsResult = (JSONObject) obj;
                } catch( Exception e) {
                    return ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, e.getMessage());
                }
            } else {
                return ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "EMS전송오류");
            }
        } catch( Exception e) {
            return ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, e.getMessage());
        }

        return null;
    }
}
