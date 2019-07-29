package com.phoenix.mvc.service.sns;

import java.util.Map;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.domain.TimeLine;

public interface SnsService {

	public Map<String, Object> getFaceBookTimeLineList(Search search);

}
