function ValidationCheck(tableName, colum, valueColum, value, handleData){
	var paramData = {tableName:tableName, colum:colum, valueColum:valueColum, value:value };
	var jsonData = JSON.stringify(paramData);
	
	$.ajax({
		url:"/util/json/validationCheck",
		method:"POST",
		data : jsonData,
		dataType : "text",
		headers : {
			"Accept" : "application/json",
			"Content-Type" : "application/json"
		},
		error : function(status,code,errorText){
			alert("error : " + status.status + " " + errorText);
		},
		success : function(textData, status){
			handleData(textData);
		}
	});
}

//중복체크 자바스크립트 예제
//$(function() {
//	$("input:text[name=userId]").keyup(function(){
//		var tableName = "users";		//사용할 테이블
//		var colum = "user_id";			//데이터를 확인할 컬럼
//		var valueColum = "user_id";		//조건식을 비교할 컬럼
//		var value = $(this).val();		//조건식에 넣을 데이터
//		var obj = $("#helpBlock");		
//		
//		if(CheckSpace(value) == false && CheckSpecial(value) == false){

////////////////////////////////////////중복체크 부분////////////////////////////////
//			ValidationCheck(tableName,colum,valueColum,value,function(output){
////					alert("output : " + output + " " + typeof(output));
//				if(output == "true"){				
//					obj.css("color","green").text("사용가능");
//				}else{
//					obj.css("color","red").text("사용불가 : 이미 존재하는 ID");
//				}
//			});
//////////////////////////////////////////////////////////////////////////////////

//		}else{
//			obj.css("color","red").text("사용불가 : 잘못된 형식");
//		}
//	});
//});	