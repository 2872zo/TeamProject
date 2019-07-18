package com.phoenix.mvc.web.chatting;

import org.springframework.stereotype.Repository;

import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.client.MongoDatabase;


public class MongoDB {
	
	//public static MongoDatabase database;
	
	public MongoDB() {
		System.out.println(getClass().getName() + "default Constuctor");
	}
	
	String id = "tiger";
	String pwd = "scott";
	String source = "admin";
	String ip = "127.168.0.78";
	String connectionUri = "mongodb://"+id+":"+pwd+"@"+ip+"/?authSource="+source;
	
	MongoClientURI uri = new MongoClientURI(connectionUri);
	MongoClient mongoClient = new MongoClient(uri);
	
	private String DBName = "chat" ;
    
    //database = mongoClient.getDatabase(DBName);
}
