package com.dev.doodle.util;

import java.io.File;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FilePart;
import com.oreilly.servlet.multipart.FileRenamePolicy;
import com.oreilly.servlet.multipart.MultipartParser;
import com.oreilly.servlet.multipart.ParamPart;
import com.oreilly.servlet.multipart.Part;

public class CustomMultipartRequest {
	private Hashtable<String, String> parameters;
	private List<String> fileNames;
	
	private FileRenamePolicy renamePolicy;

	public String getParameter(String name) {
		return parameters.get(name);
	}

	public List<String> getFileNames() {
		return fileNames;
	}

	public CustomMultipartRequest(HttpServletRequest request, String path,
			int size) {
		
		parameters = new Hashtable<String, String>();
		fileNames = new ArrayList<>();
		renamePolicy = new DefaultFileRenamePolicy();
		
		try {
			MultipartParser parser = new MultipartParser(request,size); /* file limit size of 1GB */
			parser.setEncoding("UTF-8");
			Part part;
			while ((part = parser.readNextPart()) != null) {

				if (part.isFile()) {
					FilePart fPart = (FilePart) part; // get some info about the
					fPart.setRenamePolicy(renamePolicy);									// file
					String name = fPart.getFileName();

					if (name != null) {

						long fileSize = fPart.writeTo(new File(path));
						
						fileNames.add(fPart.getFileName());
					}
				} else {

					ParamPart param = (ParamPart) part;
					parameters.put(param.getName(), param.getStringValue());
				}
			}// end while
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
