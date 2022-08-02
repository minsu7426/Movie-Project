package util;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dto.MovieDto;

public class FileUpload {

	public static MovieDto upload(HttpServletRequest request) throws IOException {
		String filename = "";
		String realPath = request.getSession().getServletContext().getRealPath("resources/images/movie/");
		Integer maxSize = 10 * 1024 * 1024;
		String encType = "utf8";
		MovieDto movie = new MovieDto();
		
		request.setCharacterEncoding("utf-8");

		MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, encType,
				new DefaultFileRenamePolicy());
		
		String flag = multi.getParameter("flag");
		if(flag != null && flag.equals("true")) {
			movie.setMovie_flag(true);
		} else if(flag != null && flag.equals("false")) {
			movie.setMovie_flag(false);
		} 
		
		String code = multi.getParameter("movie_code");
		int code1;
		if(code != null) {
			code1 = Integer.parseInt(code);
			movie.setMovie_code(code1);
		}
		
		movie.setMovie_title(multi.getParameter("movie_title"));
		movie.setMovie_date(multi.getParameter("movie_date"));
		movie.setMovie_genre(multi.getParameter("movie_genre"));
		movie.setMovie_grade(Integer.parseInt(multi.getParameter("movie_grade")));
		movie.setMovie_director(multi.getParameter("movie_director"));
		movie.setMovie_actor(multi.getParameter("movie_actor"));
		movie.setMovie_time(Integer.parseInt(multi.getParameter("movie_time")));
		movie.setMovie_board(multi.getParameter("movie_board"));
		
		
		Enumeration files = multi.getFileNames();
		String fname = (String) files.nextElement();
		filename = multi.getFilesystemName(fname);
		movie.setMovie_img(filename);
		return movie;
	}

}
