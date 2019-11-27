package com.next.utils;



import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.net.URLEncoder;
import java.util.*;


/**
 * poi 导入导出工具类
 */
public class ExcelUtils {

    private static final String XML ="xls";
    private static final String XLSX ="xlsx";

    /**
     * @description: //todo 下载Excel (样式为通用样式,sheet页是一个)
     * @param resp response返回
     * @param fileName 文件名 不需要后缀 默认是xlsx
     * @param datas 数据
     * @param titles 表头
     * */
    public static void exportExcel(HttpServletResponse resp, String fileName,
                                   Collection<?> datas, List<String> titles)throws Exception{
        resp.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        resp.addHeader("Content-Disposition", "attachment;filename="+URLEncoder.encode(fileName, "utf-8")+ ".xlsx");
        exportExcel(resp.getOutputStream(),datas,titles);
    }

    /**
     * @description: //todo Excel 写入OutputStream
     * @param out 输出流
     * @param datas 数据
     * @param titles 表头
     * */
    public static void exportExcel(OutputStream out,Collection<?> datas, List<String> titles){
        XSSFWorkbook wb = new XSSFWorkbook();
        try {
            XSSFSheet sheet = wb.createSheet("new sheet");
            writeDataToExcel(wb,sheet,datas,titles);
            wb.write(out);
        }catch (IOException ioe){
            ioe.printStackTrace();
        }
    }

    /**
     * @description: // todo 读取上传的Excel文件
     * @param file 上传的文件
     * @param startRow  开始行 0开始
     * @param startCell 开始列 0开始
     * */
    public static List<String[]> readExcel(MultipartFile file, int startRow, int startCell)throws Exception{
        checkFile(file);
        String fileName = file.getOriginalFilename();
        Workbook workbook = getWorkBook(file,fileName);
        List<String []> list = new ArrayList<>();
        if(workbook != null){
            for(int sheetNum = 0;sheetNum < workbook.getNumberOfSheets();sheetNum++){
                Sheet sheet = workbook.getSheetAt(sheetNum);
                if(sheet == null){
                    continue;
                }
                int firstRowNum  = sheet.getFirstRowNum();
                int lastRowNum = sheet.getLastRowNum();
                for(int rowNum = firstRowNum+startRow;rowNum <= lastRowNum;rowNum++){
                    Row row = sheet.getRow(rowNum);
                    if(row == null){
                        continue;
                    }
                    int firstCellNum = row.getFirstCellNum();
                    int lastCellNum = row.getLastCellNum()+1;
                    String[] cells = new String[lastCellNum];
                    for(int cellNum = firstCellNum + startCell; cellNum < lastCellNum;cellNum++){
                        Cell cell = row.getCell(cellNum);
                        cells[cellNum] = getCellValue(cell);
                    }
                    list.add(cells);
                }
            }
        }
        return list;
    }

    /**
     * @description: //todo 写Excel
     * @param workbook 工作区
     * @param sheet sheet
     * @param datas 数据
     * @param titles 表头
     * */
    private static void writeDataToExcel(XSSFWorkbook workbook,Sheet sheet, Collection<?> datas, List<String> titles){
        int cellIndex =writeTitleToExcel(workbook, sheet, titles);
        writeDataToExcel(workbook, sheet, datas);
        autoSizeColumns(sheet,cellIndex);
    }

    /**
     * @description: //todo 写标题到Excel
     * @param workbook 工作区
     * @param sheet sheet
     * @param titles 表头
     * */
    private static int writeTitleToExcel(XSSFWorkbook workbook,Sheet sheet,List<String> titles){
        int colIndex=0;
        Font titleFont = workbook.createFont();
        titleFont.setFontName("simsun");
        titleFont.setFontHeightInPoints((short) 14);
        XSSFCellStyle titleStyle = workbook.createCellStyle();
        titleStyle.setAlignment(HorizontalAlignment.CENTER);
        titleStyle.setVerticalAlignment(VerticalAlignment.CENTER);
        titleStyle.setFont(titleFont);
        Row titleRow = sheet.createRow(0);
        titleRow.setHeightInPoints(25);
        for (String title : titles) {
            Cell cell = titleRow.createCell(colIndex);
            cell.setCellValue(title);
            cell.setCellStyle(titleStyle);
            colIndex++;
        }
        return colIndex;
    }

    /**
     * @description: //todo 写内容到Excel
     * @param workbook 工作区
     * @param sheet sheet
     * @param datas 数据
     * */
    private static void writeDataToExcel(XSSFWorkbook workbook,Sheet sheet,Collection<?> datas){
        int rowIndex = 1;
        Font dataFont = workbook.createFont();
        dataFont.setFontName("simsun");
        dataFont.setColor(IndexedColors.BLACK.index);
        XSSFCellStyle dataStyle = workbook.createCellStyle();
        dataStyle.setAlignment(HorizontalAlignment.CENTER);
        dataStyle.setVerticalAlignment(VerticalAlignment.CENTER);
        dataStyle.setFont(dataFont);
        Iterator<?> iterator = datas.iterator();
        while (iterator.hasNext()){
            Row dataRow = sheet.createRow(rowIndex);
            Object data = iterator.next();
            Class clazz = data.getClass();
            Field [] fields = clazz.getDeclaredFields();
            int cellIndex = 0;
            for (Field field: fields){
                Cell cell = dataRow.createCell(cellIndex);
                cell.setCellStyle(dataStyle);
                String fieldName = field.getName();
                String methodName = "get"+fieldName.substring(0,1).toUpperCase()+fieldName.substring(1);
                Method method;
                Object value = null;
                try {
                    method = clazz.getMethod(methodName,new Class[] {});
                    value = method.invoke(data,new Object[] {});
                }catch (Exception e){
                    e.printStackTrace();
                }
                cell.setCellValue(value+"");
                cellIndex ++;
            }
            rowIndex++;
        }
    }

    /**
     * @description: //todo 设置行宽度自适应 列不会设置
     * @param sheet sheet
     * @param columnNumber  结束列
     * */
    private static void autoSizeColumns(Sheet sheet, int columnNumber) {
        for (int i = 0; i < columnNumber; i++) {
            int oldWidth = sheet.getColumnWidth(i);
            sheet.autoSizeColumn(i, true);
            int newWidth = (int) (sheet.getColumnWidth(i) + 100);
            if (newWidth > oldWidth) {
                sheet.setColumnWidth(i, newWidth);
            } else {
                sheet.setColumnWidth(i, oldWidth);
            }
        }
    }


    /***
     * //todo 校验文件是否正常
     * @param file 上传的文件
     * @throws Exception
     */
    private static void checkFile(MultipartFile file)throws Exception{
        if (Objects.isNull(file))
            throw new FileNotFoundException("上传文件是空");
        String fileName = file.getOriginalFilename();
        if(!fileName.endsWith(XML) && !fileName.endsWith(XLSX))
            throw new IOException(fileName + "不是excel文件");
    }

    /**
     * @description: // todo 获取单元格的值
     * @param cell 单元格
     * @return String
     */
    private static String getCellValue(Cell cell){
        String cellValue = "";
        if(cell == null){
            return cellValue;
        }
        //把数字当成String来读，避免出现1读成1.0的情况
        if(cell.getCellType() == CellType.NUMERIC){
            cell.setCellType(CellType.STRING);
        }
        //判断数据的类型
        switch (cell.getCellType()){
            case NUMERIC: //数字
                cellValue = String.valueOf(cell.getNumericCellValue());
                break;
            case STRING: //字符串
                cellValue = String.valueOf(cell.getStringCellValue());
                break;
            case BOOLEAN: //Boolean
                cellValue = String.valueOf(cell.getBooleanCellValue());
                break;
            case FORMULA: //公式
                cellValue = String.valueOf(cell.getCellFormula());
                break;
            case BLANK: //空值
                cellValue = "";
                break;
            case ERROR: //故障
                cellValue = "非法字符";
                break;
            default:
                cellValue = "未知类型";
                break;
        }
        return cellValue;
    }

    /**
     * @description: //todo 获取上传文件的工作区
     * @param file 上传的文件
     * @param fileName 文件名字
     * @return Workbook
     */
    private static Workbook getWorkBook(MultipartFile file,String fileName) {
        Workbook workbook = null;
        try {
            InputStream is = file.getInputStream();
            if(fileName.endsWith(XML)){
                //2003
                workbook = new HSSFWorkbook(is);
            }else if(fileName.endsWith(XLSX)){
                //2007
                workbook = new XSSFWorkbook(is);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return workbook;
    }

    /**
     * @description: //todo 获取上传文件的工作区
     * @param file 读取到的文件
     * @return Workbook
     */
    private static Workbook getWorkBook(File file) {
        Workbook workbook = null;
        try {
            InputStream is = new FileInputStream(file);
            if(file.getName().endsWith(XML)){
                //2003
                workbook = new HSSFWorkbook(is);
            }else if(file.getName().endsWith(XLSX)){
                //2007
                workbook = new XSSFWorkbook(is);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return workbook;
    }
}