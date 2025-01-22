package com.at.apcss.co.mail.service;

import com.at.apcss.co.mail.vo.ApcMailVO;
import com.at.apcss.co.mail.vo.EmsMailVO;
import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.List;


/**
 * APC 메일 전송 Service 인터페이스
 * @author 신정철
 * @since 2024.09.20
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.09.20  신정철       최초 생성
 * </pre>
 */
public interface ApcMailService {

    public HashMap<String, Object> sendMail(ApcMailVO apcMailVO) throws Exception;

    public HashMap<String, Object> sendMail(ApcMailVO apcMailVO, List<MultipartFile> multipartFiles) throws Exception;


    public HashMap<String, Object> sendEmsMail(EmsMailVO emsMailVO) throws Exception;


}
