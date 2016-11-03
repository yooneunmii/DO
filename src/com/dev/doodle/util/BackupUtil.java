package com.dev.doodle.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

public class BackupUtil {
	
	public static boolean backup(String source,String target) {
		
		boolean result = false;
		
		FileInputStream fis = null;
		
		FileOutputStream fos = null;
		
		try {
			
			File f = new File(source);
			
			fis = new FileInputStream(f);
			
			String name = f.getName();
			
			File s = new File(target+File.separator+name);
			
			fos = new FileOutputStream(s);
			
			byte[] datas = new byte[4096];
			
			int size = 0;
			
			while((size=fis.read(datas))!=-1) {
				
				fos.write(datas, 0,size);
				
			}
			
			result = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				
				if(fis!=null) fis.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
			try {
				
				if(fos!=null) fos.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
		
		return result;
	}

}
