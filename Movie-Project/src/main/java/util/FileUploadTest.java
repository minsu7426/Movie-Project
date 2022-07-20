package util;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.springframework.web.multipart.MultipartFile;

//https://zero-gravity.tistory.com/332
public class FileUploadTest {

    // 파일업로드
    public static void upload(List<MultipartFile> multipartFileList) throws Exception {
        try {
            for (MultipartFile multipartFile : multipartFileList) {
                String fileName = getFileNameServer(multipartFile);
                File uploadPath = new File("D:\\someFolder\\upload" + "/" + fileName);

                // *** 파일 업로드
                FileUtils.writeByteArrayToFile(uploadPath, multipartFile.getBytes());
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("파일 업로드 중 에러가 발생했습니다.");
        }
    }

    // 서버에 올라갈 파일명 반환(확장자 포함)
    private static String getFileNameServer(MultipartFile multipartFile) {
        // 파일 확장자 추출
        int pos = multipartFile.getOriginalFilename().lastIndexOf(".");
        String ext = multipartFile.getOriginalFilename().substring(pos + 1);

        // 서버에 올라갈 파일명 반환
        return makeFileName() + "." + ext;
    }

    // 파일명 랜덤 생성
    public static String makeFileName() {
        Date now = new Date();
        String today = new SimpleDateFormat("yyyyMMddHHmmss").format(now);

        String random = "";
        for (int i = 1; i <= 10; i++) {
            char ch = (char) ((Math.random() * 26) + 97);
            random += ch;
        }
        String result = today + random;

        return result;
    }

}