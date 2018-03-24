package com.rcb.services;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.Part;

public class FileUpload {
	private static final String SAVE_DIR = "uploads";

	public void saveFile(String firstName, String lastName, String filename, Part part) throws IOException {

		String savePath = "D:" + File.separator + SAVE_DIR;
		File fileSaveDir = new File(savePath);

		if (!fileSaveDir.exists()) {
			fileSaveDir.mkdir();
		}

		String fileName = filename;
		part.write(savePath + File.separator + fileName);

		String filePath = savePath + File.separator + fileName;
		System.out.println(filePath);
		System.out.println("sucessfully upload");

	}

}
