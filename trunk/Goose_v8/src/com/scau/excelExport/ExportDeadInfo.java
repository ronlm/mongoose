package com.scau.excelExport;

import java.util.List;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;

import com.scau.vo.goose.DeadInfo;

/**导出农场死亡信息统计的excel报表
 * @author jianhao
 *
 */
public class ExportDeadInfo extends ExcelTemplate<DeadInfo>{

	public ExportDeadInfo(String fileName, List<DeadInfo> contents) {
		super(fileName, contents);
		this.titles = new String[]{"序号","农户姓名","电话","农场名","死亡数量"};
	}

	@Override
	public void printContent() {
		int totalRowNum = contents.size() + 1;
		this.workbook.setSheetName(0, fileName);
		for (int rowIndex = 1; rowIndex < totalRowNum; rowIndex++) {
			Row row = super.sheet.createRow(rowIndex);
			// 打印表内容行，第一列是序号
			for (int cellNum = 0; cellNum < titles.length + 1; cellNum++) {
				// 主要修改此处，调整每列打印的数据类型，匹配相应的标题
				Cell cell = row.createCell(cellNum);
				switch (cellNum) {
				case 0:
					cell.setCellValue(rowIndex);
					break;
				case 1:
					cell.setCellValue(contents.get(rowIndex - 1).getFarmer()
							.getName());
					break;
				case 2:
					cell.setCellValue(contents.get(rowIndex - 1).getFarmer()
							.getPhone());
					break;
				case 3:
					cell.setCellValue(contents.get(rowIndex - 1).getFarm()
							.getName());
					break;
				case 4:
					cell.setCellValue(contents.get(rowIndex - 1).getDeadNum());
					break;
				default:
					cell.setCellValue("");
					break;
				}
			}
		}
	}
}
