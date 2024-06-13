<%--
  Created by IntelliJ IDEA.
  User: huno
  Date: 24. 5. 10.
  Time: 오전 9:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String domain = request.getServerName();

	String key = "";

	if ("133.186.212.16".equals(domain)) {
		key = "NCfYZTYs0sp6X1s0lh5U";
	} else if ("localhost".equals(domain)) {
		key = "8AuulPFHOftqyHEmTdQK";
	} else if ("apcss.smartapc.or.kr".equals(domain)) {
		key = "NmdiNXbWcIWRYCX9O7jd";
	}

%>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>title : 팜맵데이터</title>
    <script src="https://agis.epis.or.kr/ASD/js/lib/openlayers/OpenLayers.js"></script>
    <script src="https://agis.epis.or.kr/ASD/js/lib/proj4js/proj4.js"></script>
    <script src="https://agis.epis.or.kr/ASD/farmmapApi/farmapApi.do?apiKey=<%=key%>&domain=<%=domain%>"></script>
    <script>
        var map1;
        var reqUrl;
        var domain = '<%=domain%>';
        var apiKey = '<%=key%>';
        var stdgCd = "";

        function getButton(ids) {
            var menuId = ids.split(",")[0];
            var buttonId = ids.split(",")[1];

            var menuDivs = $("div[id^='menu']");
            for (var i = 0; i < menuDivs.length; i++) {
                if (menuDivs[i].id == menuId) {
                    $(menuDivs[i]).css("background", "#60caae");
                    $(menuDivs[i]).css("color", "#ffffff");
                } else {
                    $(menuDivs[i]).css("background", "");
                    $(menuDivs[i]).css("color", "");
                }
            }
            var buttonDivs = $("div[id^='form']");
            for (var i = 0; i < buttonDivs.length; i++) {
                if (buttonDivs[i].id == buttonId) {
                    $(buttonDivs[i]).show();
                } else {
                    $(buttonDivs[i]).hide();
                }
            }
        }

        function init() {
            map1 = farmmapObj.init("mapDiv1");
            reqUrl = farmmapObj.rootUri;
            getButton('menuFarmmapDataSeachBjdAndLandCode,formFarmmapDataSeachBjdAndLandCode');
        }

        const getFarmmapDataSeachBjdAndLandCode = async function(){
            $('#info').val(''); // info 초기화
            stdgCd = SBUxMethod.get("framld-inp-stdgCd");
            console.log(' getFarmmapDataSeachBjdAndLandCode stdgCd', stdgCd);
            var params = {};
            params.bjdCd = stdgCd;
            params.landCd = '02';
            params.mapType = $("#mapType4").val();
            params.columnType = $("#columnType4").val();
            params.apiKey = apiKey;
            params.domain = domain;
            console.log('params', params);

            $.ajax({
                url: reqUrl + "farmmapApi/getFarmmapDataSeachBjdAndLandCode.do",
                dataType: "jsonp",
                jsonpCallback: "searchCallback",
                async: true,
                type: "GET",
                cache: false,
                data: params,
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                }
            });
        }

        const searchCallback = async function(data) {
            console.log('searchCallback(data) is data = ', data);
            returnjson = data;
            console.log('JSON.stringify(data, null, 4)', JSON.stringify(data, null, 4));
            $("#info").val(JSON.stringify(data, null, 4));

            if (layer != null) {
                farmmapObj.removeLayer("vectorLayer", map1);
            }
            var layer = farmmapObj.getObject("layer", "vectorLayer", map1);

            await addVector();
        }

        const vectorSelect2 = function(feature, flag) {
            if (!flag) {
                vectorUnselect2(farmmapObj.getObject("layer", "vectorLayer", map1).features[0]);
            }

            if (feature.id != farmmapObj.getObject("layer", "vectorLayer", map1).features[0].id) {
                console.log('feature,id != farmmapObj.getObject');
                feature.style.display = 'none';
                feature.layer.redraw();
            }
            console.log('vectorSelect2 if 다 통과함');

            feature.style.fillColor = "#0505f5";
            feature.style.strokeColor = "yellow";
            feature.style.strokeWidth = 5;
            feature.style.display = '';
            feature.layer.redraw();

            if (Object.keys(feature.data).length > 0) {
                var data = feature.data;
                var keys = Object.keys(data);
                var text = "";
                for (var i = 0; i < keys.length; i++) {
                    var searchData = data[keys[i]];
                    text += keys[i] + " : " + data[keys[i]] + "\r\n";
                    ;
                }
                $("#vectorClickInfo").val(text);
                $("#vectorClickDiv").show();
            }
        }

        const vectorUnselect2 = function(feature) {
            if (feature.id.indexOf("source_") != -1) {
                feature.style.fillColor = "#FFFFFF";
                feature.style.strokeColor = "#FFFFFF";
            } else {
                feature.style.fillColor = "black";
                feature.style.strokeColor = "#ff0000";
                feature.style.strokeWidth = 2;
            }
            feature.layer.redraw();

            $("#vectorClickDiv").hide();
        }

        const addVector = async function() {
            var data = returnjson;
            console.log(data, 'data');
            if (returnjson == null) return;

            var layerName = "vectorLayer";
            var layerOption = {
                hover: false,
                multiple: false,
                toggle: true,
                onSelect: vectorSelect2,
                onUnselect: vectorUnselect2
            }
            farmmapObj.addVectorLayer(layerName, layerOption, map1);


            var farmmapData;
            if (data.output.farmmapData != null) {
                farmmapData = data.output.farmmapData;
                for (var k = 0; k < farmmapData.data.length; k++) {

                    if (k > 300) break;

                    var feature = farmmapData.data[k];
                    var xy = feature.geometry[0].xy;

                    var id = "";
                    var label = "";

                    if (data.input.mapType == "base") {
                        if (data.input.columnType.toUpperCase() == "KOR") {
                            id = feature.필지고유번호;
                            label = feature.필지고유번호;
                        } else {
                            id = feature.pnu;
                            label = feature.pnu;
                        }
                    } else {
                        if (data.input.columnType.toUpperCase() == "KOR") {
                            id = feature.팜맵ID;
                            label = feature.팜맵ID;
                        } else {
                            id = feature.id;
                            label = feature.id;
                        }
                    }

                    vectorOptions = {
                        id: id.toString()
                        , type: "polygon"
                        , xy: xy
                        , data: feature
                        , style: {
                            fillColor: "black",
                            fillOpacity: 0.5,
                            strokeWidth: 2,
                            strokeColor: "#ff0000",
                            strokeLinecap: "round",
                            fontSize: "12px",
                            fontColor: "black",
                            fontWeight: "bold",
                            // label: label.toString(),
                            // labelOutlineColor: "#ffffff",
                            // labelOutlineWidth: 3
                        }
                    }
                    farmmapObj.addVector("vectorLayer", vectorOptions, map1);
                }
            }

            var sourceData;
            if (data.output.source != null) {
                sourceData = data.output.source;
                for (var k = 0; k < sourceData.data.length; k++) {

                    var feature = sourceData.data[k];
                    var xy = feature.geometry[0].xy;

                    var label = "";

                    if (data.input.mapType == "base") {
                        if (data.input.columnType.toUpperCase() == "KOR") {
                            label = feature.필지고유번호;
                        } else {
                            label = feature.pnu;
                        }
                    } else {
                        if (data.input.columnType.toUpperCase() == "KOR") {
                            label = feature.대표PNU;
                        } else {
                            label = feature.pnu;
                        }
                    }

                    vectorOptions = {
                        id: ("source_" + k).toString()
                        , type: "polygon"
                        , xy: xy
                        , data: feature
                        , style: {
                            fillColor: "#FFFFFF",
                            fillOpacity: 0.5,
                            strokeWidth: 5,
                            strokeColor: "#FFFFFF"
                            , fontSize: "12px",
                            fontColor: "black",
                            fontWeight: "bold",
                            label: label.toString(),
                            labelOutlineColor: "#ffffff",
                            labelOutlineWidth: 3
                        }
                    }
                    farmmapObj.addVector("vectorLayer", vectorOptions, map1);
                }
                sourceData = null;
            }

            var targetData;
            if (data.output.target != null) {
                targetData = data.output.target;
                for (var k = 0; k < targetData.data.length; k++) {

                    var feature = targetData.data[k];
                    var xy = feature.geometry[0].xy;

                    vectorOptions = {
                        id: "target_" + feature.rank_label.toString()
                        , type: "polygon"
                        , xy: xy
                        , data: feature
                        , style: {
                            fillColor: "black",
                            fillOpacity: 0.001,
                            strokeWidth: 2,
                            strokeColor: "#ff0000",
                            strokeLinecap: "round",
                            fontSize: "12px",
                            fontColor: "yellow",
                            fontWeight: "bold",
                            label: feature.rank_label.toString(),
                            labelOutlineColor: "blue",
                            labelOutlineWidth: 3
                        }
                    }
                    farmmapObj.addVector("vectorLayer", vectorOptions, map1);
                }
                targetData = null;
            }

            if (farmmapObj.getObject("layer", "vectorLayer", map1).features.length > 0) {
                map1.zoomToExtent(farmmapObj.getObject("layer", "vectorLayer", map1).features[0].geometry.getBounds());
                map1.zoomTo(11);
            }
        }

    </script>
</head>
<body oncontextmenu="return false" onload="init()">
<section>
    <div class="box box-solid">
        <div class="box-header" style="display:flex; justify-content: flex-start;" >
            <div>
                <p>
                    <span style="font-weight:bold;">팜맵데이터 출력</span>
                </p>
                <p>
                    <span style="color:black; font-weight:bold;"></span>
                </p>
            </div>
            <div style="margin-left: auto;">
                <sbux-button id="btnSearchCnpt" name="btnSearchCnpt" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="getFarmmapDataSeachBjdAndLandCode();"></sbux-button>
                <sbux-button id="btnEndCnpt" name="btnEndCnpt" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="gfn_closeModal('modal-framldMap')"></sbux-button>
            </div>
        </div>
        <div class="box-body">
            <!--[pp] 검색 -->
            <table class="table table-bordered tbl_row tbl_fixed">
                <caption>검색 조건 설정</caption>
                <colgroup>
                    <col style="width: 12%">
                    <col style="width: 24%">
                    <col style="width: 12%">
                    <col style="width: 24%">
                    <col style="width: auto">
                </colgroup>
                <tbody>
                <textarea id="info" name="info" style="width:100%"></textarea>
                <tr>
                    <th scope="row">APC명</th>
                    <th>
                        <sbux-input id="framld-inp-apcNm" name="framld-inp-apcNm" uitype="text" class="form-control input-sm" disabled></sbux-input>
                    </th>
                    <th scope="row"></th>
                    <th class="td_input">
                        <sbux-input id="framld-inp-stdgCd" name="framld-inp-stdgCd" uitype="text" class="form-control input-sm"></sbux-input>
                    </th>
                    <th>&nbsp;</th>
                </tr>
                </tbody>
            </table>
            <!--[pp] //검색 -->
            <!--[pp] 검색결과 -->
            <div class="ad_section_top">
                <div id="menuFarmmapDataSeachBjdAndLandCode"></div>
                <div id="formFarmmapDataSeachBjdAndLandCode"></div>
                <div id="mapDiv1" style="width:100%;height:300px;"></div>
            </div>
            <!--[pp] //검색결과 -->
        </div>
    </div>
</section>
</body>
<script type="text/javascript">

    /**
     * @description
     */
    const popFramldMap = {
        prgrmId: 'FramldMapPopup',
        modalId: 'modal-framldMap',
        gridId: 'grdFramldMapPop',
        jsonId: 'jsonFramldMapPop',
        areaId: "sb-area-grdFramldMapPop",
        prvApcCd: "",
        objGrid: null,
        gridJson: [],
        callbackFnc: function() {},
        init: async function(_apcCd, _stdgCd) {
            console.log('popFramldMap init');
            SBUxMethod.set("framld-inp-apcNm", gv_selectedApcNm);
            console.log('popFramldMap apcNm', gv_selectedApcNm);
            console.log('popFramldMap _stdgCd', _stdgCd);
            SBUxMethod.set("framld-inp-stdgCd", _stdgCd);
        }
    }

</script>
</html>