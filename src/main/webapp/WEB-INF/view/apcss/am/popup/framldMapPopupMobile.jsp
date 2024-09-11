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

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>title : 팜맵데이터</title>
    <script src="../../src/jquery/js/jquery-3.3.1.min.js"></script>
    <script src="https://agis.epis.or.kr/ASD/js/lib/openlayers/OpenLayers.js"></script>
    <script src="https://agis.epis.or.kr/ASD/js/lib/proj4js/proj4.js"></script>
    <script src="https://agis.epis.or.kr/ASD/farmmapApi/farmapApi.do?apiKey=${key}&domain=${domain}"></script>
    <script>
        var map1 = null;
        var reqUrl  = null;
        var domain = '${domain}';
        var apiKey = '${key}';

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

            $("#framld-inp-stdgCd").val("${stdgCd}");
            $("#framld-inp-frlnMno").val("${frlnMno}");
            $("#framld-inp-frlnSno").val("${frlnSno}");
            getFarmmapDataSeachPnu();
        }

        /**
         * @name fn_setFrlnInput
         * @description 재배이력 지도(보기) 이벤트 팜맵 팝업 연결
         * @param1 (number) number
         * @param2 (number) length
         * @result (String) pnu
         */
    	const fn_zeroPad = function (number, length) {
    		return String(number).length >= length ? String(number) : String(number).padStart(length, '0');
    	}

        const getFarmmapDataSeachPnu = async function(){
            await clearData(); // info 초기화
            var params = {};
            /*
            var stdgCd = $("#framld-inp-stdgCd").val();
            var frlnMno = $("#framld-inp-frlnMno").val();
            var frlnSno = $("#framld-inp-frlnSno").val();
            */
            var stdgCd = "${stdgCd}";
            var frlnMno = "${frlnMno}";
            var frlnSno = "${frlnSno}";
            params.pnu = stdgCd + "1" + fn_zeroPad(frlnMno, 4) + fn_zeroPad(frlnSno, 4);
            params.mapType = $("#mapType1").val();
            params.columnType = $("#columnType1").val();
            params.apiKey = apiKey;
            params.domain = domain;

            $.ajax({
                url: reqUrl + "farmmapApi/getFarmmapDataSeachPnu.do",
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
            returnjson = data;
            if(data.output.farmmapData.count === 0){
                gfn_comAlert("W0005", "검색결과");
                return;
            }
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
                feature.style.display = 'none';
                feature.layer.redraw();
            }
            feature.style.fillColor = "#8F9DE9";
            feature.style.strokeColor = "#94CDDA";
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
                feature.style.fillColor = "#A5E0D9";
                feature.style.strokeColor = "#8DFFEF";
                feature.style.strokeWidth = 1;
            }
            feature.layer.redraw();

            $("#vectorClickDiv").hide();
        }

        const addVector = async function() {
            var data = returnjson;
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
                            fillColor: "#A5E0D9",
                            fillOpacity: 0.5,
                            strokeWidth: 2,
                            strokeColor: "#8DFFEF",
                            strokeLinecap: "round",
                            // fontSize: "12px",
                            // fontColor: "black",
                            // fontWeight: "bold",
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
                            fillColor: "#A5E0D9",
                            fillOpacity: 0.001,
                            strokeWidth: 2,
                            strokeColor: "#8DFFEF",
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

        const clearData = async function() {
            $('#info').val('');

            $('#vectorClickDiv').hide();

            returnjson = null;

            var layer = farmmapObj.getObject("layer", "vectorLayer", map1);

            if (layer != null) {
                farmmapObj.removeLayer("vectorLayer", map1);
            }
        }

    </script>
</head>
<body oncontextmenu="return false">
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
                <button id="btnSearchCnpt" name="btnSearchCnpt" class="btn btn-sm btn-outline-danger" onclick="getFarmmapDataSeachPnu();">조회</button>
                <button id="btnEndCnpt" name="btnEndCnpt" class="btn btn-sm btn-outline-danger" onclick="window.close();">종료</button>
            </div>
        </div>
        <div class="box-body">
            <!--[pp] 검색 -->
            <table class="table table-bordered tbl_row tbl_fixed">
                <caption>검색 조건 설정</caption>
                <colgroup>
                    <col style="width: 12%">
                    <col style="width: 24%">
                    <col style="width: 10%">
                    <col style="width: 12%">
                    <col style="width: 10%">
                    <col style="width: 12%">
                    <col style="width: 10%">
                    <col style="width: 12%">
                    <col style="width: auto">
                </colgroup>
                <tbody>
                <textarea id="info" name="info" style="width:100%; display: none;"></textarea>
                <tr>
                    <th scope="row">APC명</th>
                    <th>
                        <input id="framld-inp-apcNm" name="framld-inp-apcNm" uitype="text" class="form-control input-sm" disabled></input>
                    </th>
                    <th scope="row">법정동코드</th>
                    <th class="td_input">
                        <input id="framld-inp-stdgCd" name="framld-inp-stdgCd" uitype="text" class="form-control input-sm"></input>
                    </th>
                    <th scope="row">본번</th>
                    <th class="td_input">
                        <input id="framld-inp-frlnMno" name="framld-inp-frlnMno" uitype="text" class="form-control input-sm"></input>
                    </th>
                    <th scope="row">부번</th>
                    <th class="td_input">
                        <input id="framld-inp-frlnSno" name="framld-inp-frlnSno" uitype="text" class="form-control input-sm"></input>
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
                <div id="mapDiv1" style="width:1028px;height:400px;"></div>
            </div>
            <!--[pp] //검색결과 -->
        </div>
    </div>
</section>
</body>
<script type="text/javascript">
    $(document).ready(function () {
        init();
    });
</script>
</html>