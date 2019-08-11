package com.phoenix.mvc.web.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.phoenix.mvc.service.chatting.ChattingService;
import com.phoenix.mvc.service.domain.Chat;

@Controller
public class FileController {

	@Value("${uploadDir}")
	private String uploadDir;

	@Value("${targetDir}")
	private String targetDir;
	
	@Autowired
	@Qualifier("chattingServiceImpl")
	private ChattingService chattingService;

	public FileController() {
		System.out.println(getClass().getName() + "default Constuctor");
	}

	@PostMapping("/fileUpload")
	public void fileUpload(HttpServletRequest request, HttpServletResponse response, MultipartFile upload)
			throws Exception {
		System.out.println("\nCommunityController:::fileUpload() 시작:::");
		UUID uid = UUID.randomUUID();
		JSONObject json = new JSONObject();
		OutputStream out = null;
		PrintWriter printWriter = null;
//		String Path = request.getSession().getServletContext().getRealPath("/upload");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		try {
			String originFileName = upload.getOriginalFilename();
			byte[] bytes = upload.getBytes();
			String uploadPath = uploadDir + "/" + uid + "_" + originFileName;
			// 폴더 없으면 만들어줌
//			if(!destD.exists()) {
//        		destD.mkdirs();
//        	}
			out = new FileOutputStream(new File(uploadPath));
			out.write(bytes);
			out.flush();// out에 저장된 데이터 전송하고 초기화

			printWriter = response.getWriter();
			response.setContentType("text/html");
			String fileUrl = "/images/uploadfiles/" + uid + "_" + originFileName;
			System.out.println("fileUrl = " + fileUrl);

			fileCopy(uploadPath, targetDir + "/" + uid + "_" + originFileName);
			
			int timeCount = 0;
			while (!isExists("http://localhost:8080" + fileUrl) && timeCount < 20) {
				System.out.println(">>>>>>>>>>>>>>>>>> " + fileUrl + " 파일 로딩중");
				Thread.sleep(500);
				timeCount++;
			}

			json.put("uploaded", 1);
			json.put("fileName", uid + "_" + originFileName);
			json.put("url", fileUrl);
//            json.put("message", "입력");
			printWriter.println(json);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (out != null) {
				out.close();
			}
			if (printWriter != null) {
				printWriter.close();
			}
		}
		System.out.println("\nfileUpload() 끝:::");
	}// end of fileUpload

	@PostMapping("/chat/fileUpload")
	@ResponseBody
	public List<Chat> chatFileUpload(@ModelAttribute Chat chat, MultipartHttpServletRequest multiRequest) throws InterruptedException {

		List<Chat> chattings = new ArrayList<Chat>();
		System.out.println("/chat/fileUpload");

		String chatDir = uploadDir + "/chatFiles/";
		File upFile = new File(chatDir);
		if (upFile.isDirectory()) {
			upFile.mkdir();
		}
		
		String lastFileName = "";

		// 파일 태그명을 다 검색하는 기능 여러칸일 경우에 유용
		Iterator<String> fileTagNames = multiRequest.getFileNames();
		while (fileTagNames.hasNext()) {
			String uploadFileTag = fileTagNames.next();
			List<MultipartFile> files = multiRequest.getFiles(uploadFileTag);
			for (MultipartFile multipartFile : files) {
				String fileName = multipartFile.getOriginalFilename();

				try {
					Date rightNow = new Date();
					fileName = rightNow.getTime() + fileName;
					//File fileto = new File(chatDir + fileName);
					lastFileName = fileName;
					
					multipartFile.transferTo(new File(chatDir + fileName));
					fileCopy(chatDir + fileName, targetDir + "/" + fileName);
					
					/*
					 * FileInputStream fis = new FileInputStream(fileto);
					 * 
					 * FileOutputStream fos = new FileOutputStream(
					 * "C:\\Users\\user\\git\\TeamProject\\Phoenix\\target\\classes\\static\\images\\uploadfiles\\chatFiles"
					 * +fileName);
					 * 
					 * int data = 0; while((data=fis.read())!=-1) { fos.write(data); }
					 * 
					 * 
					 * fos.close();
					 */
					
					chat.setRegDate(rightNow);
					chat.setChatMsg(fileName);
					chattingService.addChat(chat);
					Chat returnChat = new Chat();
					returnChat.setChatMsg(chat.getChatMsg());
					returnChat.setChatRoomId(chat.getChatRoomId());
					returnChat.setChatType(chat.getChatType());
					returnChat.setId(chat.getId());
					returnChat.setProfileImg(chat.getProfileImg());
					returnChat.setRegDate(chat.getRegDate());
					returnChat.setUserNickname(chat.getUserNickname());
					returnChat.setUserNo(chat.getUserNo());
					chattings.add(returnChat);
					chat.setId(null);
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			}

		}
		
		int timeCount = 0;
		while (!isExists("http://localhost:8080/images/uploadfiles/chatFiles/" + lastFileName)
				&& timeCount < 20) {
			System.out.println(">>>>>>>>>>>>>>>>>> " + lastFileName + " 파일 로딩중");
			Thread.sleep(500);
			timeCount++;
		}
		
		return chattings;
	}

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
	
	// 파일을 복사하는 메소드
	public static void fileCopy(String inFileName, String outFileName) {
		try {
			FileInputStream fis = new FileInputStream(inFileName);
			FileOutputStream fos = new FileOutputStream(outFileName);

			int data = 0;
			while ((data = fis.read()) != -1) {
				fos.write(data);
			}
			fis.close();
			fos.close();

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
