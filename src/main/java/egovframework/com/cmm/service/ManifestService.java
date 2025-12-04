package egovframework.com.cmm.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import java.io.IOException;
import java.util.*;

@Service
public class ManifestService {
    private Map<String, Object> manifest;

    @PostConstruct
    public void loadManifest() throws IOException {
        ObjectMapper mapper = new ObjectMapper();
        ClassPathResource resource = new ClassPathResource("static/bundles/.vite/manifest.json");
        this.manifest = mapper.readValue(resource.getInputStream(), Map.class);

        System.out.println("✅ Manifest 로드 완료 (총 " + manifest.size() + "개 엔트리)");
    }

    public String getJsFile(String jspPath) {
        String entryKey = "src/entries/" + jspPath + ".tsx";

        System.out.println("=== getJsFile ===");
        System.out.println("요청: " + jspPath);
        System.out.println("찾는 키: " + entryKey);

        Map<String, Object> entryData = (Map<String, Object>) manifest.get(entryKey);

        if (entryData != null) {
            String file = (String) entryData.get("file");
            System.out.println("✅ 찾음: " + file);
            return file;
        }

        System.out.println("❌ 못 찾음!");
        return null;
    }

    /**
     * ✅ 메인 CSS + imports의 CSS까지 모두 수집
     */
    public List<String> getCssFiles(String jspPath) {
        String entryKey = "src/entries/" + jspPath + ".tsx";
        Map<String, Object> entryData = (Map<String, Object>) manifest.get(entryKey);

        if (entryData == null) {
            return Collections.emptyList();
        }

        Set<String> allCssFiles = new LinkedHashSet<>();

        // 1. 메인 엔트리의 CSS
        List<String> mainCss = (List<String>) entryData.get("css");
        if (mainCss != null) {
            allCssFiles.addAll(mainCss);
        }

        // 2. imports의 CSS 재귀적으로 수집
        List<String> imports = (List<String>) entryData.get("imports");
        if (imports != null) {
            collectImportCss(imports, allCssFiles, new HashSet<>());
        }

        System.out.println("=== CSS 수집 완료 ===");
        System.out.println("엔트리: " + jspPath);
        System.out.println("CSS 파일들: " + allCssFiles);

        return new ArrayList<>(allCssFiles);
    }

    /**
     * imports를 재귀적으로 탐색하여 CSS 수집
     */
    private void collectImportCss(List<String> imports, Set<String> cssFiles, Set<String> visited) {
        for (String importFile : imports) {
            if (visited.contains(importFile)) {
                continue;  // 순환 참조 방지
            }
            visited.add(importFile);

            // manifest에서 해당 import 찾기
            Map<String, Object> importData = (Map<String, Object>) manifest.get(importFile);
            if (importData != null) {
                // 이 import의 CSS 추가
                List<String> css = (List<String>) importData.get("css");
                if (css != null) {
                    cssFiles.addAll(css);
                }

                // 이 import의 하위 imports도 재귀 탐색
                List<String> subImports = (List<String>) importData.get("imports");
                if (subImports != null) {
                    collectImportCss(subImports, cssFiles, visited);
                }
            }
        }
    }
}