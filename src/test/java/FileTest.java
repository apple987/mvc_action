import java.io.File;
import java.util.ArrayList;

import org.apache.commons.io.FilenameUtils;



public class FileTest {
	public static ArrayList<String> filelist = new ArrayList<String>();

	public static void main(String[] args) throws Exception {
		System.err.println(FilenameUtils.getBaseName("D:/360Downloads/Apk"));
		System.err.println(FilenameUtils.getExtension("D:/360Downloads/Apk/data.txt"));
		System.err.println(FilenameUtils.getPrefix("D:/360Downloads/Apk/data.txt"));
		System.err.println(org.apache.tools.ant.util.FileUtils.getRelativePath(new File("D:/360Downloads"), new File("D:/antetype/data.txt")) );
		String filePath = "D:/360Downloads/Apk";
		File root = new File(filePath);
		System.err.println(root.getAbsolutePath());
		System.err.println(root.getCanonicalFile());
		System.err.println(root.getFreeSpace());
		System.err.println(root.getName());
		System.err.println(root.getParent());
		System.err.println(root.getParentFile());
		System.err.println(root.getPath());
		
		
		
		
		
		
		getFiles(filePath);
		System.err.println(filelist);
	}

	/*
	 * 通过递归得到某一路径下所有的目录及其文件
	 */
	public static void getFiles(String filePath) {
		File root = new File(filePath);
		File[] files = root.listFiles();
		for (File file : files) {
			if (file.isDirectory()) {
				/*
				 * 递归调用
				 */
				getFiles(file.getAbsolutePath());
				//filelist.add(file.getAbsolutePath());
				System.out.println("显示" + filePath + "下所有子目录及其文件" + file.getAbsolutePath());
				System.out.println("show" + filePath + "下所有子目录及其文件" + file.getParent());
			} else {
				System.out.println("显示" + filePath + "下所有子目录" + file.getAbsolutePath());
				System.out.println("show" + filePath + "下所有子目录及其文件" + file.getParent());
				filelist.add(file.getAbsolutePath());
			}
		}
	}
}