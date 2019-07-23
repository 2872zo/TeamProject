package com.phoenix.mvc.service.sns;

import java.util.Map;

import com.phoenix.mvc.service.domain.FaceBook;

public interface SnsService {

	public Map<String, Object> getFaceBookTimeLineList(FaceBook faceBook);
	

}
