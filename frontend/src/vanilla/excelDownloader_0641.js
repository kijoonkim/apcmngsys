// src/vanilla/excelDownloader.js
import ExcelJS from 'exceljs';

const downloadExcel = async (jsonData, columns, fileName = '데이터.xlsx', sheetName = 'Sheet1') => {
  const workbook = new ExcelJS.Workbook();
  const worksheet = workbook.addWorksheet(sheetName);

  worksheet.columns = columns;

  jsonData.forEach((item) => {
    worksheet.addRow(item);
  });

  worksheet.getRow(1).font = { bold: true };
  worksheet.getRow(1).fill = {
    type: 'pattern',
    pattern: 'solid',
    fgColor: { argb: 'FFE0E0E0' },
  };

  const buffer = await workbook.xlsx.writeBuffer();
  const blob = new Blob([buffer], {
    type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
  });

  const url = window.URL.createObjectURL(blob);
  const link = document.createElement('a');
  link.href = url;
  link.download = fileName;
  link.click();
  window.URL.revokeObjectURL(url);
};

// ✅ 전역에 직접 할당
window.ExcelDownloader = {
  downloadExcel,
};

// 또는 export도 같이
export { downloadExcel };
