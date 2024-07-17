package com.at.apcss.am.cmns.web;

import java.nio.file.Path;
import java.nio.file.Paths;

import javax.annotation.Resource;

import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.at.apcss.am.cmns.service.ComAtchflService;
import com.at.apcss.am.cmns.vo.ComAtchflVO;
import com.at.apcss.co.sys.controller.BaseController;
/**
 * @Class Name : ComAtchflController.java
 * @Description : 첨부파일 에 대한 Controller 클래스
 * @author 김호
 * @since 2024.07.15
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.07.15  김호        최초 생성
 * </pre>
 */
@Controller
public class ComAtchflController extends BaseController{

	@Resource(name = "comAtchflService")
	private ComAtchflService comAtchflService;

	@PostMapping(value = "/am/cmns/getImage.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
    public ResponseEntity<org.springframework.core.io.Resource> getImage(@RequestBody ComAtchflVO comAtchflVO) throws Exception {
        try {

        	ComAtchflVO resultVO = comAtchflService.selectComAtchfl(comAtchflVO);

        	Path imageLocation = Paths.get(resultVO.getAtchflPath()); 	// 이미지 파일이 저장된 디렉토리

            Path file = imageLocation.resolve(resultVO.getAtchflNm()).normalize();
            org.springframework.core.io.Resource resource = new UrlResource(file.toUri());

            if (resource.exists() || resource.isReadable()) {
                return ResponseEntity.ok()
                        .header(HttpHeaders.CONTENT_TYPE, comAtchflVO.getAtchflExtnType()) // 이미지 타입에 맞게 조정
                        .body(resource);
            } else {
                return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
            }
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

}
