package com.projectMatrix.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("download")
public class DownloadController {

	@Autowired
	ServletContext context;

	@RequestMapping("excel")
	public void downloader(HttpServletRequest request,
			HttpServletResponse response,
			@PathVariable("JobsExcelFormat") String JobsExcelFormat) {

		String downloadFolder = context.getRealPath("/WEB-INF/");
		Path file = Paths.get(downloadFolder, JobsExcelFormat);

		if (Files.exists(file)) {
			// set content type
			response.setContentType("application/xlsx");
			// add response header
			response.addHeader("Content-Disposition", "attachment; filename="
					+ JobsExcelFormat);
			try {
				// copies all bytes from a file to an output stream
				Files.copy(file, response.getOutputStream());
				// flushes output stream
				response.getOutputStream().flush();
			} catch (IOException e) {
				System.out.println("Error :- " + e.getMessage());
			}
		} else {
			System.out.println("Sorry File not found!!!!");
		}
	}
}
