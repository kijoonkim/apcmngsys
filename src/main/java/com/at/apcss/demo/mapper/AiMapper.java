package com.at.apcss.demo.mapper;

import org.apache.ibatis.annotations.MapKey;
import org.apache.ibatis.annotations.Param;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * AI 관련 질의 RAG
 * @author 손민성
 * @since 2025.10.23
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2025.10.23  손민성        최초 생성
 * </pre>
 */
@Mapper
public interface AiMapper {
    List<HashMap<String, String>> findByName(@Param("name") String name) throws Exception;

    List<HashMap<String, Object>> getPerformance(@Param("apcCd") String apcCd, @Param("type") List<String> type, @Param("start") String start, @Param("end") String end) throws Exception;
}
