import java.io.File;
import java.io.IOException;

import org.aspectj.util.FileUtil;

public class TestFileUtil {
	public static void main(String[] args) throws IOException {
		//拷贝文件
        //FileUtils.copyFile(new File("D://data.txt"), new File("E:data.txt"));
        //拷贝文件夹
        //FileUtils.copyDirectory(new File("D://antetype"), new File("E://data"),true);
		//删除某个文件夹
		//FileUtils.cleanDirectory(new File("E://data"));
		//拷贝文件到文件夹
        //FileUtils.copyFileToDirectory(new File("D://data.txt"), new File("D://antetype//file"));
	    //输入流拷贝文件
		//FileUtils.copyInputStreamToFile(FileUtils.openInputStream(new File("D://data.txt")), new File("D://antetype//file.txt"));
	    //输入流拷贝文件
		//FileUtils.copyToFile(FileUtils.openInputStream(new File("D://data.txt")), new File("D://antetype//file.txt"));
	    //拷贝网络文件到文件
//    	FileUtils.copyURLToFile(new URL("http://localhost/qdone/html/index.html"), new File("D://antetype//test.html"));
	    String[] arr=  FileUtil.listFiles(new File("D://antetype"));
	    for (int i = 0; i < arr.length; i++) {
			System.err.println(arr[i]);
		}
	}
}
