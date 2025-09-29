// jQuery는 externals 처리됨
import 'jquery-mousewheel';
import 'malihu-custom-scrollbar-plugin';

// luckysheet 기본/플러그인 스타일
import 'luckysheet/dist/css/luckysheet.css';
import 'luckysheet/dist/plugins/css/pluginsCss.css';

// luckysheet 플러그인 스크립트
import 'luckysheet/dist/plugins/js/plugin.js';

// luckysheet 본체 UMD 번들
import luckysheet from 'luckysheet';
window.luckysheet = luckysheet;
import LuckyExcel from 'luckyexcel';
window.LuckyExcel = LuckyExcel;

import XlsxPopulate from 'xlsx-populate/browser/xlsx-populate.js';

import * as XLSX from 'xlsx-js-style';
import { saveAs } from 'file-saver';
window.XLSX = XLSX;
window.saveAs = saveAs;
window.XlsxPopulate = XlsxPopulate;
import ExcelJS from "exceljs";

window.ExcelJS = ExcelJS;

// ⚠️ 실제 실행은 JSP에서 (이 index.js는 setup만 담당)
