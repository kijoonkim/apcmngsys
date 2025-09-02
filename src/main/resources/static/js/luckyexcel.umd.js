
(function(global) {
  const LuckyExcel = {
    transformExcelToLucky: function(file, cb) {
      console.log("엑셀 → 럭키시트 변환 실행됨");
    },
    transformLuckyToExcel: function(luckyData, cb) {
      console.log("럭키시트 → 엑셀 변환 실행됨");
      const blob = new Blob(["FAKE XLSX CONTENT"], { type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" });
      cb(blob);
    }
  };
  global.LuckyExcel = LuckyExcel;
})(window);
