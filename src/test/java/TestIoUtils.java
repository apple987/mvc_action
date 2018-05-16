import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.apache.commons.io.LineIterator;
import org.apache.commons.io.input.BOMInputStream;

public class TestIoUtils {
	public static void main(String[] args) throws IOException {
		List<String> arr=IOUtils.readLines(new BOMInputStream(FileUtils.openInputStream(new File("D://private_key.txt"))));
		 LineIterator line= IOUtils.lineIterator(new BOMInputStream(FileUtils.openInputStream(new File("D://data.txt"))), "UTF-8");
		 //MAP来执行去除重复/manage_name/certificate_code 联合去重复,必须去掉UTF-8文件开头的BOM标志
		/* while(line.hasNext()){//得到一行数据
			 String row=line.next();
			 if(!isEmpty(row)){
				 String[] arr=row.split(",");
				 String key=arr[0].trim()+"_"+arr[1].trim();
				 if(checkFormat(row)&&!temp.containsKey(key)){
					List<Map<String,Object>> areas= featurePeoplesDao.checkAreaName(arr[0].trim());
					if(areas.size()==1){
						arr[0]=(String) areas.get(0).get("ID");
						temp.put(key, arr);
					}
				 }
			 }
		 }*/
	}
}
