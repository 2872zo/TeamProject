package com.phoenix.mvc.web.user;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpHost;
import org.apache.http.HttpResponse;
import org.apache.http.auth.AuthScope;
import org.apache.http.auth.UsernamePasswordCredentials;
import org.apache.http.client.AuthCache;
import org.apache.http.client.CredentialsProvider;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.protocol.HttpClientContext;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.auth.BasicScheme;
import org.apache.http.impl.client.BasicAuthCache;
import org.apache.http.impl.client.BasicCredentialsProvider;
import org.apache.http.impl.client.DefaultHttpClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.domain.Account;
import com.phoenix.mvc.service.domain.Cafe;
import com.phoenix.mvc.service.domain.User;
import com.phoenix.mvc.service.user.UserDao;
import com.phoenix.mvc.service.user.UserService;
import com.phoenix.mvc.service.user.impl.UserDaoImpl;

@RestController
@RequestMapping("/user/*")
public class UserRestController {
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	
	public UserRestController() {
		System.out.println(getClass().getName() + "default Constuctor");
	}
	
	User user = new User();
	
	/*@GetMapping("/user/{userId}")
	public User getUserById(@PathVariable String userId) throws Exception {

		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(5);
		
		return userService.getUser(userId);
	}*/
	
	@PostMapping(value = "/json/checkUserNicknameDuplication")
	public boolean checkUserNicknameDuplication(@RequestBody User user)throws Exception{
		
		System.out.println("/user/json/checkUserNicknameDuplication : POST");
		
		boolean result = userService.checkUserNicknameDuplication(user.getUserNickname());

		System.out.println("이상하ㄴ네."+result);
		
		return result;
		
	}

	
	@PostMapping(value = "/json/checkUserIdDuplication")
	public boolean checkUserIdDuplication(@RequestBody User user)throws Exception{
		
		System.out.println("/user/json/checkUserIdDuplication : POST");
		
		boolean result = userService.checkUserIdDuplication(user.getUserId());

		System.out.println("이상하ㄴ네."+result);
		
		return result;
		
	}
	
	@PostMapping(value = "/json/checkUserPwDuplication")
	public boolean checkUserPwDuplication(@RequestBody User user)throws Exception{
		
		System.out.println("/user/json/checkUserIdDuplication : POST");
		
		boolean result = userService.checkUserIdDuplication(user.getPassword());

		System.out.println("이상하ㄴ네."+result);
		
		return result;
		
	}

	@PostMapping( value="/json/login")
	public boolean login(@RequestBody User user, HttpSession session ) throws Exception{
		
		System.out.println("/user/login:REST : POST");
		
		//Business Logic
		
		User dbUser=userService.getUser(user.getUserId());
		
		System.out.println("REST@@!!!!!!!!!!!!!!!!!!!"+user.getUserId());
		
		System.out.println("REST@@!!!!!!!!!!!!!!!!!!!"+user.getPassword());
		
		boolean result = false;
		//= userService.checkUserPwDuplication(user.getUserId());
		
		if( dbUser != null && user.getPassword().equals(dbUser.getPassword())){
			session.setAttribute("user", dbUser);
			
			result = true;
		}
		
		return result;
	}
	
	@RequestMapping(value= "json/sendSms", method=RequestMethod.POST ) 
	public Map<String,Object> sendSms(String receiver)throws Exception { 
	
		Map<String,Object> map = new HashMap<String,Object>();
		
		System.out.println("뜨냐?");
		
		System.out.println(receiver+"번호 뭐 들왔냐?");
		
		int rand = (int) (Math.random() * 899999) + 100000; 
		System.out.println(rand+"랜덤번호 머냐");
		  String hostname = "api.bluehouselab.com";
	        String url = "https://"+hostname+"/smscenter/v1.0/sendsms";

	        CredentialsProvider credsProvider = new BasicCredentialsProvider();
	        credsProvider.setCredentials(
	            new AuthScope(hostname, 443, AuthScope.ANY_REALM),
	            new UsernamePasswordCredentials(Config.appid, Config.apikey));
	        
	        // Create AuthCache instance
	        AuthCache authCache = new BasicAuthCache();
	        authCache.put(new HttpHost(hostname, 443, "https"), new BasicScheme());

	        // Add AuthCache to the exe.put(new Hecution context
	        HttpClientContext context = HttpClientContext.create();
	        context.setCredentialsProvider(credsProvider);
	        context.setAuthCache(authCache);
	    
	        DefaultHttpClient client = new DefaultHttpClient();

	        try {
	            HttpPost httpPost = new HttpPost(url);
	            httpPost.setHeader("Content-type", "application/json; charset=UTF-8");
	            String json = "{\"sender\":\""+Config.sender+"\",\"receivers\":[\""+receiver+"\"],\"content\":\""+rand+"\"}";
	            
	            StringEntity se = new StringEntity(json, "UTF-8");
	            httpPost.setEntity(se);
	       
	            HttpResponse httpResponse = client.execute(httpPost, context);
	         
	            System.out.println(httpResponse.getStatusLine().getStatusCode());
	       
	            InputStream inputStream = httpResponse.getEntity().getContent();
	            if(inputStream != null) {
	                BufferedReader bufferedReader = new BufferedReader( new InputStreamReader(inputStream));
	                String line = "";
	                while((line = bufferedReader.readLine()) != null)
	                inputStream.close();
	            }
	        } catch (Exception e) {
	            System.err.println("Error: "+e.getLocalizedMessage());
	        } finally {
	            client.getConnectionManager().shutdown();
	        }
	        
	        map.put("rand", String.valueOf(rand));
	        
	        return map;
	}  
	
	@RequestMapping("json/deleteAccount")
	public boolean deleteMailAccount(@RequestBody Account account, HttpServletRequest req) {
		account.setUserNo(((User)req.getSession().getAttribute("user")).getUserNo());
		
		System.out.println("[addMailAccount] account : " + account);
		
		return userService.deleteAccount(account);
	}
	
}
