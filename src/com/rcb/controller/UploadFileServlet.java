package com.rcb.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/upload")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
		maxFileSize = 1024 * 1024 * 10, // 10MB
		maxRequestSize = 1024 * 1024 * 50)
public class UploadFileServlet extends HttpServlet {
	private static final String SAVE_DIR = "uploads";

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String savePath = "D:" + File.separator + SAVE_DIR;
		File fileSaveDir = new File(savePath);
		if (!fileSaveDir.exists()) {
			fileSaveDir.mkdir();
		}
		String firstName = request.getParameter("firstname");
		String lastName = request.getParameter("lastname");
		Part part = request.getPart("file");
		String fileName = extractFileName(part);
		System.out.println("zzzzzz");

		part.write(savePath + File.separator + fileName);

		// Class.forName("com.mysql.jdbc.Driver");
		// Connection con =
		// DriverManager.getConnection("jdbc:mysql://localhost:3306/UploadFile", "root",
		// "root");
		// String query = "INSERT INTO customerDetail (first_name, last_name, file)
		// values (?, ?, ?)";
		//
		// PreparedStatement pst;
		// pst = con.prepareStatement(query);
		// pst.setString(1, firstName);
		// pst.setString(2, lastName);
		String filePath = savePath + File.separator + fileName;
		System.out.println(filePath);
		// pst.setString(3, filePath);
		// pst.executeUpdate();
	}

	// file name of the upload file is included in content-disposition header like
	// this:
	// form-data; name="dataFile"; filename="PHOTO.JPG"
	private String extractFileName(Part part) {
		String contentDisp = part.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for (String s : items) {
			if (s.trim().startsWith("filename")) {
				return s.substring(s.indexOf("=") + 2, s.length() - 1);
			}
		}
		return "";
	}

}
