<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>레포트뷰어</title>
    <%@ include file="../frame/inc/headerMeta.jsp" %>
    <%@ include file="../frame/inc/headerScript.jsp" %>
    <%@ include file="../frame/inc/clipreport.jsp" %>
<style>
    .container {
        position: relative;
        width: 100vw;
        height: 100vh;
    }

    .input-container {
        position: absolute;
        inset: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        gap: 1rem;  /* 요소들 사이 간격 */
    }


    #certKey {
        padding: 0.5rem 1rem;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    #btn-reportView {
        padding: 0.5rem 1rem;
        background-color: #3b82f6;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    #btn-reportView:hover {
        background-color: #2563eb;
    }

    #div-rpt-clipReportJSON {
        position: absolute;
        inset: 0;
        width: 100vw;
        height: 100vh;
    }

    /* 모바일 스타일 */
    @media (max-width: 768px) {
        .input-container {
            flex-direction: column;
        }

        #certKey {
            width: 80vw;
            height: 15vh;
        }
        #certKey::placeholder {
			font-size: x-large;
        }
        
	    #btn-reportView {
	        width:  80vw;
			height: 15vh;
			font-size: x-large;
			
	    }        
    }
</style>    
</head>
<body oncontextmenu="return false">
<c:set scope="request" var="uuid" value="${uuid}"></c:set>
<c:set scope="request" var="certYn" value="${certYn}"></c:set>
<div class="container">
    <div class="input-container">
        <input type="hidden" id="uuid" name="uuid" value="<c:out value='${uuid}'></c:out>" />
        <input type="hidden" id="certYn" name="certYn" value="<c:out value='${certYn}'></c:out>" />
        <c:choose>
            <c:when test="${certYn != null && certYn == 'Y'}">
                <input type="password" id="certKey" name="certKey" value="" placeholder="인증번호를 입력하세요."/>
            </c:when>
            <c:otherwise>
            </c:otherwise>
        </c:choose>
        <button id="btn-reportView">보고서 출력</button>
    </div>
    <div id="div-rpt-clipReportJSON" style="display: none;"></div>
</div>

</body>
<script type="text/javascript">
    const lnkgRpt = {
        lnkgUnqId: "",
        taskId: "",
        taskSeCd: "",
        rptDocFilePath: "",
        prgrmNm: "",
        prgrmUrl: "",
        prgrmPrcsType: "",
        prcsRsltNocs: "",
        prmtrData: "",
        lnkgCertKey: "",
        lnkgOpenYmd: "",
        lnkgExpryYn: "",
    }
    
    const fn_init = async function() {
        document.getElementById("btn-reportView").addEventListener('click', fn_viewReport);
    }

    const fn_viewReport = async function() {
        const uuid = document.querySelector("#uuid").value;
        const certYn = document.querySelector("#certYn").value;
        let certKey = "";

        if (_.isEqual("Y", certYn)) {
            certKey = document.querySelector("#certKey").value;
        }

        try {
            const postJsonPromise = gfn_postJSON("/link/selectLnkgData", {
                lnkgUnqId: uuid,
                lnkgCertKey : certKey
            });
            const data = await postJsonPromise;
            if (_.isEqual("S", data.resultStatus)) {

                const item = data.resultMap;

                lnkgRpt.lnkgUnqId	    = item.lnkgUnqId;
                lnkgRpt.taskId	        = item.taskId;
                lnkgRpt.taskSeCd	    = item.taskSeCd;
                lnkgRpt.rptDocFilePath	= item.rptDocFilePath;
                lnkgRpt.prgrmNm	        = item.prgrmNm;
                lnkgRpt.prgrmUrl	    = item.prgrmUrl;
                lnkgRpt.prgrmPrcsType	= item.prgrmPrcsType;
                lnkgRpt.prcsRsltNocs	= item.prcsRsltNocs;
                lnkgRpt.prmtrData	    = item.prmtrData;
                lnkgRpt.lnkgCertKey	    = item.lnkgCertKey;
                lnkgRpt.lnkgOpenYmd	    = item.lnkgOpenYmd;
                lnkgRpt.lnkgExpryYn	    = item.lnkgExpryYn;

                const reportData = await fn_getReportData(lnkgRpt);
                if (reportData == null) {
                    gfn_comAlert("E0003", "보고서정보 조회");
                    return;
                }
                const conn = await gfnma_convertDataForReport(reportData);
                //gfn_popClipReportPost
                fn_drawClipReport(lnkgRpt.rptDocFilePath, conn);
                //gfn_popClipReportPost("근태현황", "ma/RPT_HRP2436_Q_WORK.crf", null, conn );

            } else {
                gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
            }


        } catch(e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }



    window.addEventListener('DOMContentLoaded', function(e) {
// 		$('#div-rpt-clipReportJSON').css('display', 'none');
        fn_init();
        //fn_drawClipReport();
    });


    const score = {
        "root":[
            {"Data Structures":"B0","Database":"","ExamType":"1학기 중간","ID":1,"Introduction to Computer Science":"C+","JAVA Programing":"D0","Operating System":"A0","Software Engineering":"B+","StudentID":1},{"Data Structures":"A0","Database":"B0","ExamType":"1학기 기말","ID":2,"Introduction to Computer Science":"B+","JAVA Programing":"C+","Operating System":"B+","Software Engineering":"B+","StudentID":1},{"Data Structures":"B0","Database":"A0","ExamType":"2학기 중간","ID":3,"Introduction to Computer Science":"B0","JAVA Programing":"B+","Operating System":"C+","Software Engineering":"A+","StudentID":1},{"Data Structures":"D0","Database":"C+","ExamType":"2학기 기말","ID":4,"Introduction to Computer Science":"D0","JAVA Programing":"B0","Operating System":"C+","Software Engineering":"A+","StudentID":1},{"Data Structures":"B+","Database":"C+","ExamType":"1학기 중간","ID":5,"Introduction to Computer Science":"C+","JAVA Programing":"B0","Operating System":"C+","Software Engineering":"D+","StudentID":2},{"Data Structures":"D+","Database":"C+","ExamType":"1학기 기말","ID":6,"Introduction to Computer Science":"C+","JAVA Programing":"A+","Operating System":"A+","Software Engineering":"C+","StudentID":2},{"Data Structures":"D0","Database":"B0","ExamType":"2학기 중간","ID":7,"Introduction to Computer Science":"B+","JAVA Programing":"B0","Operating System":"A0","Software Engineering":"A0","StudentID":2},{"Data Structures":"D+","Database":"B0","ExamType":"2학기 기말","ID":8,"Introduction to Computer Science":"C+","JAVA Programing":"A+","Operating System":"C+","Software Engineering":"C+","StudentID":2},{"Data Structures":"B+","Database":"B0","ExamType":"1학기 중간","ID":9,"Introduction to Computer Science":"C+","JAVA Programing":"A0","Operating System":"D+","Software Engineering":"C+","StudentID":3},{"Data Structures":"A0","Database":"B0","ExamType":"1학기 기말","ID":10,"Introduction to Computer Science":"C+","JAVA Programing":"B+","Operating System":"C+","Software Engineering":"D+","StudentID":3},{"Data Structures":"C+","Database":"D+","ExamType":"2학기 중간","ID":11,"Introduction to Computer Science":"C+","JAVA Programing":"D0","Operating System":"C+","Software Engineering":"D+","StudentID":3},{"Data Structures":"B0","Database":"B+","ExamType":"2학기 기말","ID":12,"Introduction to Computer Science":"C+","JAVA Programing":"A0","Operating System":"A+","Software Engineering":"C+","StudentID":3},{"Data Structures":"D+","Database":"A0","ExamType":"1학기 중간","ID":13,"Introduction to Computer Science":"C+","JAVA Programing":"D+","Operating System":"A0","Software Engineering":"C+","StudentID":4},{"Data Structures":"C+","Database":"A0","ExamType":"1학기 기말","ID":14,"Introduction to Computer Science":"D+","JAVA Programing":"D0","Operating System":"D+","Software Engineering":"A0","StudentID":4},{"Data Structures":"B0","Database":"C+","ExamType":"2학기 중간","ID":15,"Introduction to Computer Science":"C+","JAVA Programing":"D+","Operating System":"B+","Software Engineering":"B0","StudentID":4},{"Data Structures":"B0","Database":"C+","ExamType":"2학기 기말","ID":16,"Introduction to Computer Science":"C+","JAVA Programing":"D+","Operating System":"A0","Software Engineering":"D+","StudentID":4},{"Data Structures":"B0","Database":"B+","ExamType":"1학기 중간","ID":17,"Introduction to Computer Science":"C+","JAVA Programing":"A0","Operating System":"C+","Software Engineering":"D+","StudentID":5},{"Data Structures":"D+","Database":"D+","ExamType":"1학기 기말","ID":18,"Introduction to Computer Science":"A0","JAVA Programing":"D0","Operating System":"A0","Software Engineering":"D+","StudentID":5},{"Data Structures":"C+","Database":"B0","ExamType":"2학기 중간","ID":19,"Introduction to Computer Science":"D+","JAVA Programing":"A0","Operating System":"A+","Software Engineering":"C+","StudentID":5},{"Data Structures":"D+","Database":"B+","ExamType":"2학기 기말","ID":20,"Introduction to Computer Science":"C+","JAVA Programing":"C+","Operating System":"C+","Software Engineering":"D+","StudentID":5},{"Data Structures":"D+","Database":"B0","ExamType":"1학기 중간","ID":21,"Introduction to Computer Science":"D+","JAVA Programing":"A0","Operating System":"A0","Software Engineering":"B0","StudentID":6},{"Data Structures":"B0","Database":"D+","ExamType":"1학기 기말","ID":22,"Introduction to Computer Science":"D+","JAVA Programing":"A0","Operating System":"A+","Software Engineering":"D0","StudentID":6},{"Data Structures":"C+","Database":"B0","ExamType":"2학기 중간","ID":23,"Introduction to Computer Science":"A+","JAVA Programing":"D+","Operating System":"D+","Software Engineering":"B0","StudentID":6},{"Data Structures":"C+","Database":"C+","ExamType":"2학기 기말","ID":24,"Introduction to Computer Science":"A+","JAVA Programing":"A0","Operating System":"B+","Software Engineering":"C+","StudentID":6},{"Data Structures":"C+","Database":"C+","ExamType":"1학기 중간","ID":25,"Introduction to Computer Science":"B+","JAVA Programing":"B+","Operating System":"C+","Software Engineering":"C+","StudentID":7},{"Data Structures":"A+","Database":"D0","ExamType":"1학기 기말","ID":26,"Introduction to Computer Science":"C+","JAVA Programing":"A+","Operating System":"D0","Software Engineering":"C+","StudentID":7},{"Data Structures":"C+","Database":"B+","ExamType":"2학기 중간","ID":27,"Introduction to Computer Science":"C+","JAVA Programing":"A0","Operating System":"C+","Software Engineering":"C+","StudentID":7},{"Data Structures":"B+","Database":"A+","ExamType":"2학기 기말","ID":28,"Introduction to Computer Science":"C+","JAVA Programing":"C+","Operating System":"C+","Software Engineering":"B+","StudentID":7},{"Data Structures":"A+","Database":"B0","ExamType":"1학기 중간","ID":29,"Introduction to Computer Science":"C+","JAVA Programing":"C+","Operating System":"B+","Software Engineering":"B0","StudentID":8},{"Data Structures":"A0","Database":"B+","ExamType":"1학기 기말","ID":30,"Introduction to Computer Science":"B+","JAVA Programing":"A0","Operating System":"D0","Software Engineering":"C+","StudentID":8},{"Data Structures":"A+","Database":"A0","ExamType":"2학기 중간","ID":31,"Introduction to Computer Science":"C+","JAVA Programing":"C+","Operating System":"B+","Software Engineering":"B0","StudentID":8},{"Data Structures":"D0","Database":"C+","ExamType":"2학기 기말","ID":32,"Introduction to Computer Science":"B+","JAVA Programing":"D0","Operating System":"C+","Software Engineering":"B+","StudentID":8},{"Data Structures":"A+","Database":"B+","ExamType":"1학기 중간","ID":33,"Introduction to Computer Science":"C+","JAVA Programing":"B+","Operating System":"B+","Software Engineering":"C+","StudentID":9},{"Data Structures":"C+","Database":"A0","ExamType":"1학기 기말","ID":34,"Introduction to Computer Science":"B+","JAVA Programing":"B+","Operating System":"B0","Software Engineering":"C+","StudentID":9},{"Data Structures":"A+","Database":"B+","ExamType":"2학기 중간","ID":35,"Introduction to Computer Science":"C+","JAVA Programing":"B+","Operating System":"C+","Software Engineering":"C+","StudentID":9},{"Data Structures":"C+","Database":"A0","ExamType":"2학기 기말","ID":36,"Introduction to Computer Science":"C+","JAVA Programing":"D0","Operating System":"B0","Software Engineering":"B+","StudentID":9},{"Data Structures":"C+","Database":"C+","ExamType":"1학기 중간","ID":37,"Introduction to Computer Science":"C+","JAVA Programing":"B0","Operating System":"F","Software Engineering":"C+","StudentID":10},{"Data Structures":"B+","Database":"A0","ExamType":"1학기 기말","ID":38,"Introduction to Computer Science":"D+","JAVA Programing":"C+","Operating System":"C+","Software Engineering":"C+","StudentID":10},{"Data Structures":"C+","Database":"D+","ExamType":"2학기 중간","ID":39,"Introduction to Computer Science":"D0","JAVA Programing":"C+","Operating System":"B0","Software Engineering":"D0","StudentID":10},{"Data Structures":"D+","Database":"A0","ExamType":"2학기 기말","ID":40,"Introduction to Computer Science":"C+","JAVA Programing":"B0","Operating System":"C+","Software Engineering":"C+","StudentID":10},{"Data Structures":"C+","Database":"A0","ExamType":"1학기 중간","ID":41,"Introduction to Computer Science":"C+","JAVA Programing":"B+","Operating System":"B+","Software Engineering":"D+","StudentID":11},{"Data Structures":"D0","Database":"C+","ExamType":"1학기 기말","ID":42,"Introduction to Computer Science":"C+","JAVA Programing":"B0","Operating System":"D+","Software Engineering":"D0","StudentID":11},{"Data Structures":"C+","Database":"B+","ExamType":"2학기 중간","ID":43,"Introduction to Computer Science":"C+","JAVA Programing":"B0","Operating System":"C+","Software Engineering":"A0","StudentID":11},{"Data Structures":"B0","Database":"C+","ExamType":"2학기 기말","ID":44,"Introduction to Computer Science":"C+","JAVA Programing":"C+","Operating System":"B0","Software Engineering":"B0","StudentID":11},{"Data Structures":"C+","Database":"A+","ExamType":"1학기 중간","ID":45,"Introduction to Computer Science":"B0","JAVA Programing":"C+","Operating System":"B0","Software Engineering":"A0","StudentID":12},{"Data Structures":"B+","Database":"B0","ExamType":"1학기 기말","ID":46,"Introduction to Computer Science":"C+","JAVA Programing":"B+","Operating System":"B0","Software Engineering":"A0","StudentID":12},{"Data Structures":"C+","Database":"A0","ExamType":"2학기 중간","ID":47,"Introduction to Computer Science":"C+","JAVA Programing":"B0","Operating System":"C+","Software Engineering":"B0","StudentID":12},{"Data Structures":"B0","Database":"D0","ExamType":"2학기 기말","ID":48,"Introduction to Computer Science":"B0","JAVA Programing":"B0","Operating System":"D0","Software Engineering":"B0","StudentID":12},{"Data Structures":"B+","Database":"A+","ExamType":"1학기 중간","ID":49,"Introduction to Computer Science":"B0","JAVA Programing":"B+","Operating System":"B0","Software Engineering":"A+","StudentID":13},{"Data Structures":"B0","Database":"C+","ExamType":"1학기 기말","ID":50,"Introduction to Computer Science":"B0","JAVA Programing":"A+","Operating System":"C+","Software Engineering":"A+","StudentID":13},{"Data Structures":"B0","Database":"D0","ExamType":"2학기 중간","ID":51,"Introduction to Computer Science":"B+","JAVA Programing":"B+","Operating System":"D0","Software Engineering":"B+","StudentID":13},{"Data Structures":"C+","Database":"A0","ExamType":"2학기 기말","ID":52,"Introduction to Computer Science":"C+","JAVA Programing":"B+","Operating System":"B+","Software Engineering":"C+","StudentID":13},{"Data Structures":"A0","Database":"B+","ExamType":"1학기 중간","ID":53,"Introduction to Computer Science":"C+","JAVA Programing":"C+","Operating System":"A0","Software Engineering":"B+","StudentID":14},{"Data Structures":"C+","Database":"A0","ExamType":"1학기 기말","ID":54,"Introduction to Computer Science":"B+","JAVA Programing":"D0","Operating System":"C+","Software Engineering":"B0","StudentID":14},{"Data Structures":"D0","Database":"C+","ExamType":"2학기 중간","ID":55,"Introduction to Computer Science":"B+","JAVA Programing":"A0","Operating System":"C+","Software Engineering":"B0","StudentID":14},{"Data Structures":"C+","Database":"B+","ExamType":"2학기 기말","ID":56,"Introduction to Computer Science":"A0","JAVA Programing":"C+","Operating System":"C+","Software Engineering":"B+","StudentID":14},{"Data Structures":"B0","Database":"D0","ExamType":"1학기 중간","ID":57,"Introduction to Computer Science":"D0","JAVA Programing":"A0","Operating System":"B0","Software Engineering":"B0","StudentID":15},{"Data Structures":"C+","Database":"D0","ExamType":"1학기 기말","ID":58,"Introduction to Computer Science":"C+","JAVA Programing":"B+","Operating System":"B+","Software Engineering":"C+","StudentID":15},{"Data Structures":"B0","Database":"A0","ExamType":"2학기 중간","ID":59,"Introduction to Computer Science":"C+","JAVA Programing":"A0","Operating System":"B+","Software Engineering":"B0","StudentID":15},{"Data Structures":"A+","Database":"D0","ExamType":"2학기 기말","ID":60,"Introduction to Computer Science":"C+","JAVA Programing":"B+","Operating System":"B+","Software Engineering":"B0","StudentID":15}
        ]
    };
    const students = {
        "root":[
            {"_Name":"권우창","Address":"서울특별시 강남구 테헤란로2길 8","Birth":19850403,"Gender":"남","ID":1},{"_Name":"김병성","Address":"서울특별시 강남구 대치동 131번지 0호 2 은마- 219","Birth":19780608,"Gender":"남","ID":2},{"_Name":"손경석","Address":"서울특별시 강남구 역삼동 730번지 5호","Birth":19840820,"Gender":"남","ID":3},{"_Name":"이래우","Address":"서울특별시 양천구 목동 121번지 4호 지상 5층","Birth":19780417,"Gender":"남","ID":4},{"_Name":"이민정","Address":"서울특별시 강남구 개포동 1218번지 27호","Birth":19791212,"Gender":"여","ID":5},{"_Name":"이수우","Address":"서울특별시 서대문구 대현동 60번지 60호","Birth":19841026,"Gender":"여","ID":6},{"_Name":"김영우","Address":"서울특별시 서대문구 남가좌동 291번지 26호","Birth":19881010,"Gender":"남","ID":7},{"_Name":"이승건","Address":"서울특별시 서대문구 대현동 37번지 75호","Birth":19820531,"Gender":"남","ID":8},{"_Name":"전주철","Address":"서울특별시 양천구 목동 929번지 한청상가 7,8호","Birth":19810707,"Gender":"남","ID":9},{"_Name":"홍일석","Address":"서울특별시 용산구 이태원동 59번지 4호 에덴빌딩 지상6층","Birth":19750922,"Gender":"남","ID":10},{"_Name":"김기정","Address":"서울특별시 은평구 불광동 168번지 1호 1층","Birth":19910818,"Gender":"남","ID":11},{"_Name":"김숙현","Address":"서울특별시 은평구 응암동 590번지 32호 1층","Birth":19910104,"Gender":"여","ID":12},{"_Name":"남성주","Address":"서울특별시 중구 신당동 292번지 74호 1층","Birth":19850327,"Gender":"여","ID":13},{"_Name":"성해진","Address":"서울특별시 중랑구 묵동 159번지 27호\r\n 서울특별시 중랑구 묵동 159번지 27호","Birth":19730208,"Gender":"여","ID":14},{"_Name":"손선실","Address":"서울특별시 송파구 가락동 79번지 3호 대동빌딩 지하1층 101호","Birth":19760704,"Gender":"여","ID":15}
        ]
    };

    const fn_getReportData = async function(param) {

        const url = param.prgrmUrl;
        const workType = param.prgrmPrcsType;
        const cvCount = param.prcsRsltNocs;
        const params = param.prmtrData;
        const paramList = params.split('∥');
        try {
            const postJsonPromise = gfn_postJSON(
                url, {
                    getType: 'json',
                    workType: workType,
                    userId: paramList[paramList.length -2],
                    cv_count: cvCount,
                    params: params
            });
            const data = await postJsonPromise;
            if (_.isEqual("S", data.resultStatus)) {
                return data;
            } else {
                return null;
            }

        } catch(e) {
            return null;
        }
    }

    const fn_drawClipReport = async function(fileName, conn) {
        //const fileName = "am/jsonSample.crf";
        const exePrintYn = "N";
        const param = {};
        //const conn = [];
        conn.push({data: score},{data: students});
        //const reportKey = await gfn_getReportKey(fileName, param);
        const reportKey = await gfn_getReportKeyByJson(fileName, param, conn);
        const check = {
            exePrintYn : exePrintYn
        }
        gfn_drawClipReportLink("div-rpt-clipReportJSON", reportKey, check);
        $('#div-rpt-clipReportJSON').css('display', '');
        $('.input-container').css('display', 'none');
    }

    /*
    const fn_drawClipReport = async function() {
        const fileName = "am/jsonSample.crf";
        const exePrintYn = "N";
        const param = {};
        const conn = [];
        conn.push({data: score},{data: students});
        //const reportKey = await gfn_getReportKey(fileName, param);
        const reportKey = await gfn_getReportKeyByJson(fileName, param, conn);
        const check = {
            exePrintYn : exePrintYn
        }

        gfn_drawClipReportLink("div-rpt-clipReportJSON", reportKey, check);

    }
     */


</script>
</html>