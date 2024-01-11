<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%
	//request.setCharacterEncoding("UTF-8");		//한글이 깨지면 주석 제거(UTF-8일 경우)
	String encodingType = "UTF-8";				//UTF-8일 경우 주석 제거

	//request.setCharacterEncoding("EUC-KR");		//한글이 깨지면 주석 제거(EUC-KR일 경우)
	//String encodingType = "EUC-KR";				//EUC-KR일 경우 주석 제거

	/*
	도로명주소 팝업API 승인키
	'승인되지 않은 KEY 입니다.' 메시지 출력 시
	주소기반산업지원서비스 홈페이지 - 기술제공 - API신청 - API 신청하기에서
	신청내역 클릭 후 승인키 발급받은 본인이 본인인증하여 승인키 확인
	*/
	String confmKey = "U01TX0FVVEgyMDIzMTEwOTEwMzQxOTExNDI1Nzc="; //도로명주소 팝업 API 승인키 입력

	/*
	검색결과 화면 출력유형
	1 : 도로명
	2 : 도로명+지번
	3 : 도로명+상세건물명
	4 : 도로명+지번+상세건물명 (기본)
	*/
	String resultType = "4";

	//상세주소 사용 유무(Y, N)
	String useDetailAddr = "N";

	/*
	사용할 css 경로(회사로고, 배경화면, 색상테마)
	주소기반산업지원서비스 홈페이지 - 기술제공 - API신청 - API 신청하기에서
	CSS 파일 경로 - 샘플소스 다운로드하여 사용
	사용하지 않을 경우 공란("")
	*/
	String cssUrl = "";

	//http, https 체크
	String protocol = request.isSecure() ? "https" : "http";
	//request.setCharacterEncoding("UTF-8");  //한글깨지면 주석제거
		//request.setCharacterEncoding("EUC-KR");  //해당시스템의 인코딩타입이 EUC-KR일경우에
	String inputYn = request.getParameter("inputYn");
	String roadFullAddr = request.getParameter("roadFullAddr");
	String roadAddrPart1 = request.getParameter("roadAddrPart1");
	String roadAddrPart2 = request.getParameter("roadAddrPart2");
	String engAddr = request.getParameter("engAddr");
	String jibunAddr = request.getParameter("jibunAddr");
	String zipNo = request.getParameter("zipNo");
	String addrDetail = request.getParameter("addrDetail");
	String admCd    = request.getParameter("admCd");
	String rnMgtSn = request.getParameter("rnMgtSn");
	String bdMgtSn  = request.getParameter("bdMgtSn");
	String detBdNmList  = request.getParameter("detBdNmList");
	/** 2017년 2월 추가제공 **/
	String bdNm  = request.getParameter("bdNm");
	String bdKdcd  = request.getParameter("bdKdcd");
	String siNm  = request.getParameter("siNm");
	String sggNm  = request.getParameter("sggNm");
	String emdNm  = request.getParameter("emdNm");
	String liNm  = request.getParameter("liNm");
	String rn  = request.getParameter("rn");
	String udrtYn  = request.getParameter("udrtYn");
	String buldMnnm  = request.getParameter("buldMnnm");
	String buldSlno  = request.getParameter("buldSlno");
	String mtYn  = request.getParameter("mtYn");
	String lnbrMnnm  = request.getParameter("lnbrMnnm");
	String lnbrSlno  = request.getParameter("lnbrSlno");
	/** 2017년 3월 추가제공 **/
	String emdNo  = request.getParameter("emdNo");
%>

<script type="text/javascript" src="<%=protocol%>://business.juso.go.kr/juso_support_center/assets/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="<%=protocol%>://business.juso.go.kr/juso_support_center/assets/js/popup/roadPopupApi.js?confmKey=<%=confmKey%>&resultType=<%=resultType%>&useDetailAddr=<%=useDetailAddr%>&encodingType=<%=encodingType%>&cssUrl=<%=cssUrl%>"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>주소정보연계 | 도로명주소 안내시스템</title>
<script language="javascript">

//IE에서 opener관련 오류가 발생하는 경우, window에 이름을 명시해줍니다.
//window.name="jusoPopup";
 function init(){
	 console.log("============init================");
	 var url = location.href;
	 var confmKey = "U01TX0FVVEgyMDIzMTEwOTEwMzQxOTExNDI1Nzc="; //211.56.6.117 운영서버
	 var resultType = "4"; // 도로명주소 검색결과 화면 출력내용, 1 : 도로명, 2 : 도로명+지번+상세보기(관련지번, 관할주민센터), 3 : 도로명+상세보기(상세건물명), 4 : 도로명+지번+상세보기(관련지번, 관할주민센터, 상세건물명)
	 var inputYn= "<%=inputYn%>";
	 console.log("inputYn = "+inputYn);
	 if(inputYn != "Y"){
		document.form.confmKey.value = confmKey;
		document.form.returnUrl.value = url;
		document.form.resultType.value = resultType;
		document.form.action="https://business.juso.go.kr/addrlink/addrLinkUrl.do"; //인터넷망
		//document.form.action="https://business.juso.go.kr/addrlink/addrMobileLinkUrl.do"; //모바일 웹인 경우, 인터넷망
		document.form.submit();
	 }else{
		 opener.jusoCallBack("<%=roadFullAddr%>","<%=roadAddrPart1%>","<%=addrDetail%>","<%=roadAddrPart2%>","<%=engAddr%>","<%=jibunAddr%>","<%=zipNo%>", "<%=admCd%>", "<%=rnMgtSn%>", "<%=bdMgtSn%>", "<%=detBdNmList%>", "<%=bdNm%>", "<%=bdKdcd%>", "<%=siNm%>", "<%=sggNm%>", "<%=emdNm%>", "<%=liNm%>", "<%=rn%>", "<%=udrtYn%>", "<%=buldMnnm%>", "<%=buldSlno%>", "<%=mtYn%>", "<%=lnbrMnnm%>", "<%=lnbrSlno%>", "<%=emdNo%>");
		 window.close();
	 }

 }
</script>

</head>
<body onload="init();" class ="visualSection">
</body>
</html>
