package com.kh.common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePoliy implements FileRenamePolicy {

	@Override
	public File rename(File originFile) {
		
		String originName = originFile.getName();
		
		
		String currentTime = new SimpleDateFormat("yyyyMMddmmss").format(new Date());
		
		int  ranNum = (int)(Math.random() * 90000 + 10000);
		
		String ext = originName.substring(originName.lastIndexOf(".")); // .jpg
	
		String changName = currentTime + ranNum + ext;
		
		return new File(originFile.getParent(), changName);
	}

}
