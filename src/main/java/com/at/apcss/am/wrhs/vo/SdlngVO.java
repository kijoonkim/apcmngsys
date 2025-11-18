package com.at.apcss.am.wrhs.vo;

import com.at.apcss.co.sys.vo.ComVO;
import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : SdlngVO.java
 * @Description : 육묘장 정보에 대한 VO 클래스
 * @author 최지호
 * @since 2025.09.12
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2025.09.12  최지호        최초 생성
 * </pre>
 */

@Getter
@Setter
public class SdlngVO extends ComVO {
    /**
     * APC코드
     */
    private String apcCd;

    /**
     * 육묘번호
     */
    private String sdlngNo;

    /**
     * 육묘코드
     */
    private String sdlngCd;

    /**
     * 육묘명
     */
    private String sdlngNm;

    /**
     * 육묘일수
     */
    private int sdlngDayCnt;

    /**
     * 파종일자
     */
    private String sdngYmd;

    /**
     * 파종시작일자
     */
    private String sdngYmdFrom;

    /**
     * 파종종료일자
     */
    private String sdngYmdTo;

    /**
     * 정식예상일자
     */
    private String plntngExpctYmd;

    /**
     * 정식예상시작일자
     */
    private String plntngExpctYmdFrom;

    /**
     * 정식예상종료일자
     */
    private String plntngExpctYmdTo;

    /**
     * 정식일자
     */
    private String plntngYmd;

    /**
     * 정식시작일자
     */
    private String plntngYmdFrom;

    /**
     * 정식종료일자
     */
    private String plntngYmdTo;

    /**
     * 계량일자
     */
    private String wghYmd;

    /**
     * 계량시작일자
     */
    private String wghYmdFrom;

    /**
     * 계량종료일자
     */
    private String wghYmdTo;

    /**
     * 계량순서
     */
    private int wghSeq;

    /**
     * 계량무게
     */
    private double wghWght;

    /**
     * 실제무게
     */
    private double actlWght;

    /**
     * 포장번호
     */
    private String pckgno;

    /**
     * 포장순번
     */
    private int pckgSn;

    /**
     * 포장수량
     */
    private int pckgQntt;

    /**
     * 포장무게
     */
    private double pckgWght;

    /**
     * 수량합계
     */
    private int totalQntt;

    /**
     * 무게합계
     */
    private double totalWght;

    /**
     * 포장수량합계
     */
    private int totalPckgQntt;

    /**
     * 포장무게합계
     */
    private double totalPckgWght;

    /**
     * 출하포장단위코드
     */
    private String spmtPckgUnitCd;

    /**
     * 품목코드
     */
    private String itemCd;

    /**
     * 품종코드
     */
    private String vrtyCd;

    /**
     * 시설아이디
     */
    private String fcltId;

    /**
     * 시설명
     */
    private String fcltNm;

    /**
     * 시설유형
     */
    private String fcltType;

    /**
     * 시설기준유형
     */
    private String fcltCrtrType;

    /**
     * 시설기준코드
     */
    private String fcltCrtrCd;

    /**
     * 시설구역아이디
     */
    private String fcltZoneId;
    private String sdlngFcltZoneId;
    private String cltvtnFcltZoneId;
    private String sdlngZone;
    private String cltvtnZone;

    /**
     * 시설구역코드
     */
    private String fcltZoneCd;

    /**
     * 시설구역구분코드
     */
    private String fcltZoneSeCd;

    /**
     * 시설구역순서
     */
    private int fcltZoneSeq;

    /**
     * 표시명
     */
    private String indctNm;

    /**
     * 구분명
     */
    private String seNm;

    /**
     * 구역명
     */
    private String zoneNm;

    /**
     * 표시순서
     */
    private int indctSeq;

    /**
     * 기준수치
     */
    private int crtrNv;

    /**
     * 박스수량
     */
    private int bxQntt;

    /**
     * 단위수량
     */
    private double unitQntt;

    /**
     * 육묘수량
     */
    private int sdngQntt;

    /**
     * 재고수량
     */
    private int invntrQntt;
    private int sdlngInvntrQntt;
    private int cltvtnInvntrQntt;

    /**
     * 정식수량
     */
    private int plntngQntt;
    private int sdlngPlntngQntt;
    private int cltvtnPlntngQntt;

    /**
     * 정식번호
     */
    private String plntngNo;
    private String cltvtnPlntngNo;
    private String wghPlntngNo;

    /**
     * 출고번호
     */
    private String spmtno;

    /**
     * 출고순번
     */
    private int spmtSn;

    /**
     * 출고일자
     */
    private String spmtYmd;

    /**
     * 출고시작일자
     */
    private String spmtYmdFrom;

    /**
     * 출고종료일자
     */
    private String spmtYmdTo;

    /**
     * 출고수량
     */
    private int spmtQntt;

    /**
     * 출고중량
     */
    private int spmtWght;

    /**
     * 수확일자
     */
    private String hrvstYmd;

    /**
     * 거래처코드
     */
    private String cnptCd;

    /**
     * 입고일자
     */
    private String wrhsYmd;

    /**
     * 입고시간코드
     */
    private String wrhsHmCd;

    /**
     * 상세코드
     */
    private String dtlCd;

    /**
     * 수량
     */
    private int qntt;

    /**
     * 무게
     */
    private double wght;

    /**
     * 비고
     */
    private String rmrk;
    private String sdlngRmrk;
    private String cltvtnRmrk;

    /**
     * 사용여부
     */
    private String useYn;

    /**
     * 삭제유무
     */
    private String delYn;
}
