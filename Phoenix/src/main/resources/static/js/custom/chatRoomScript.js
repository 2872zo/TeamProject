function getFormatDate(date){ 
	//var year = date.getYear();//yy 
	var year = date.getFullYear();//yyyy 
	year = String(year).substring(2,4);
	var month = (1 + date.getMonth()); //M 
	month = month >= 10 ? month : '0' + month; //month두자리로 저장 
	var day = date.getDate(); //d 
	day = day >= 10 ? day : '0' + day; //day 두자리로 저장
	var hour = date.getHours();
	var minute = date.getMinutes();
	minute = minute >= 10 ? minute : '0' + minute; //분도 두자리로 지정
	return year + '-' + month + '-' + day+' '+hour+':'+minute; 
	}

function tagRemover(inputText){
	inputText = inputText.replace(/(<([^>]+)>)/ig,"");
}

//alert("일단 아무거나 넣어봄");


$('[data-toggle="popover"]').popover({
    container: 'body'
});
$("#emoticon").on("click" , function() {
	//alert("이모티콘입니다.");
	//$(this).attr("data-content","<img src='/images/uploadfiles/profileimg/6.jpg'class='rounded' style='width: 32px; height: 32px'>");
});