package com.phoenix.mvc.web.file;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class FileController {

	@Value("${uploadDir}")
	private String uploadDir;
	
	public FileController() {
		System.out.println(getClass().getName() + "default Constuctor");
	}
	
	@PostMapping("/fileUpload")
	public void fileUpload(HttpServletRequest request, HttpServletResponse response, MultipartFile upload)throws Exception{
		System.out.println("\nCommunityController:::fileUpload() 시작:::");
		UUID uid = UUID.randomUUID();
		JSONObject json = new JSONObject();
		OutputStream out = null;
		PrintWriter printWriter = null;
//		String Path = request.getSession().getServletContext().getRealPath("/upload");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		try{
			String originFileName = upload.getOriginalFilename();
			byte[] bytes = upload.getBytes();
			String uploadPath = uploadDir + "/"+uid+"_"+originFileName;
			//폴더 없으면 만들어줌
//			if(!destD.exists()) {
//        		destD.mkdirs();
//        	}
			out = new FileOutputStream(new File(uploadPath));
            out.write(bytes);
            out.flush();//out에 저장된 데이터 전송하고 초기화

            printWriter = response.getWriter();
            response.setContentType("text/html");
            String fileUrl = "/images/uploadfiles/"+uid+"_"+originFileName;
            System.out.println("fileUrl = "+fileUrl);
            
            int timeCount = 0;
            while(!isExists("http://localhost:8080"+fileUrl) && timeCount < 20) {
            	System.out.println(">>>>>>>>>>>>>>>>>> " + fileUrl + " 파일 로딩중");
            	Thread.sleep(500);
            	timeCount++;
            }
            
            json.put("uploaded", 1);
            json.put("fileName", uid+"_"+originFileName);
            json.put("url", fileUrl);
//            json.put("message", "입력");
            printWriter.println(json);
        }catch(IOException e){
            e.printStackTrace();
        }finally{
            if(out != null){out.close();}
            if(printWriter != null){
            	printWriter.close();
            }		
		}
		System.out.println("\nfileUpload() 끝:::");
	}//end of fileUpload
	
	
	private boolean isExists(String URLName) {
		try {

			// Sets whether HTTP redirects (requests with response code 3xx)
			// should be automatically followed by this class. True by default.
			HttpURLConnection.setFollowRedirects(false);

			/**
			 * HTTP 요청 메소드 SET 본 예제는 파일의 존재여부만 확인하려니 간단히 HEAD 요청을 보냄 HEAD요청에 대해 웹서버는 수정된 시간이
			 * 포함된 리소스의 해더 정보를 간단히 리턴 GET,POST,HEAD,OPTIONS,PUT,DELETE,TRACE 값등이 올 수 있다.
			 * 디폴트는 GET
			 **/
			HttpURLConnection con = (HttpURLConnection) new URL(URLName).openConnection();
			con.setRequestMethod("HEAD");

			// FILE이 있는 경우 HTTP_OK 200
			if (con.getResponseCode() == HttpURLConnection.HTTP_OK) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
}
