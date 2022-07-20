package util;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class FileUpload {

	public static String upload(HttpServletRequest request) throws IOException {
		String filename = "";
		String realPath = request.getSession().getServletContext().getRealPath("resources/images/movie/");
		Integer maxSize = 5 * 1024 * 1024;
		String encType = "utf8";
		
		request.setCharacterEncoding("utf-8");

		MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, encType,
				new DefaultFileRenamePolicy());

		Enumeration files = multi.getFileNames();
		String fname = (String) files.nextElement();
		filename = multi.getFilesystemName(fname);

		return filename;
	}

}
