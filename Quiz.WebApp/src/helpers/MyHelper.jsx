import * as XLSX from 'xlsx';
import { saveAs } from "file-saver-es";


function excelDate(date) {
  var d = new Date(date),
    day = '' + d.getDate(),
    month = '' + (d.getMonth() + 1),
    year = d.getFullYear();

  if (day.length < 2) day = '0' + day;
  if (month.length < 2) month = '0' + month;

  return [day, month, year].join('/');
}

function downloadExcel(data, fileName) {
  if (data.length <= 0) {
    return;
  }
  const worksheet = XLSX.utils.json_to_sheet(data);
  const workbook = { Sheets: { Report: worksheet }, SheetNames: ['Report'] };
  const buffer = XLSX.write(workbook, { bookType: 'xlsx', type: 'buffer' });

  const blob = new Blob([buffer], {
    type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=UTF-8',
  });

  saveAs(blob, fileName + '_' + excelDate(new Date()) + '.xlsx');
}

function tableToExcel(id, fileName) {

  var tbl = document.getElementById(id);
  const worksheet = XLSX.utils.table_to_sheet(tbl);
  const workbook = { Sheets: { Report: worksheet }, SheetNames: ['Report'] };
  const buffer = XLSX.write(workbook, { bookType: 'xlsx', type: 'buffer' });

  const blob = new Blob([buffer], {
    type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=UTF-8',
  });

  saveAs(blob, fileName + '_' + excelDate(new Date()) + '.xlsx');
}


export { excelDate, downloadExcel, tableToExcel }